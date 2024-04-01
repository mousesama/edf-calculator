<script lang="ts">
    import { classSelected, weaponStats } from "./store.js";

    let weaponHasDamageRange = false;

    export let id = 0;
    export let weapon: Weapon;

    // Subscribe to the classSelected store
    $: $classSelected;

    function updateWeaponStat(stat: keyof Weapon, value: number) {
        weaponStats.update((currentStats) => {
            currentStats[id][stat] = value;
            return currentStats;
        });
    }

    let localWeapon = { ...weapon };

    $: {
        weaponStats.update((stats) => {
            const updatedStats = [...stats];
            updatedStats[id] = { ...localWeapon };
            return updatedStats;
        });
    }
</script>

<div class="weapon-form p-4 bg-gray-800 shadow-lg rounded-lg">
    <h2 class="text-xl font-semibold mb-4 text-blue-400">{$classSelected} Weapon {id + 1} Stats</h2>
    <form class="space-y-3">
        <div class="flex items-center mb-2">
            <label class="inline-flex items-center">
                <input type="checkbox" class="form-checkbox h-5 w-5 text-blue-600" bind:checked={weaponHasDamageRange} />
                <span class="ml-2 text-gray-200">Damage Range</span>
            </label>
        </div>

        <div class="flex flex-wrap -mx-2 space-y-3 md:space-y-0">
            <div class="px-2 w-full md:w-1/2">
                <label class="block text-gray-200" for="damageMin">Damage Min:</label>
                <input class="form-input mt-1 block w-full border-gray-600 bg-gray-700 text-white rounded-md shadow-inner pl-3" id="damageMin" type="number" bind:value={localWeapon.damageMin} />
            </div>
            {#if weaponHasDamageRange}
            <div class="px-2 w-full md:w-1/2">
                <label class="block text-gray-200" for="damageMax">Damage Max:</label>
                <input class="form-input mt-1 block w-full border-gray-600 bg-gray-700 text-white rounded-md shadow-inner pl-3" id="damageMax" type="number" bind:value={localWeapon.damageMax} />
            </div>
            {/if}
        </div>

        <div class="flex flex-wrap -mx-2 space-y-3 md:space-y-0">
            <div class="px-2 w-full md:w-1/2">
                <label class="block text-gray-200" for="rateOfFire">Rate of Fire:</label>
                <input class="form-input mt-1 block w-full border-gray-600 bg-gray-700 text-white rounded-md shadow-inner pl-3" id="rateOfFire" type="number" bind:value={localWeapon.rateOfFire} />
            </div>
            <div class="px-2 w-full md:w-1/2">
                <label class="block text-gray-200" for="reloadTime">Reload Time:</label>
                <input class="form-input mt-1 block w-full border-gray-600 bg-gray-700 text-white rounded-md shadow-inner pl-3" id="reloadTime" type="number" bind:value={localWeapon.reloadTime} />
            </div>
        </div>

        <div class="px-2 w-full">
            <label class="block text-gray-200" for="magazineSize">Magazine Size:</label>
            <input class="form-input mt-1 block w-full border-gray-600 bg-gray-700 text-white rounded-md shadow-inner pl-3" id="magazineSize" type="number" bind:value={localWeapon.magazineSize} />
        </div>
    </form>
</div>
