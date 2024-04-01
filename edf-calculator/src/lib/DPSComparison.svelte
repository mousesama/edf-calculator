<script lang="ts">
    import { weaponStats } from "./store.js";

    // A simple DPS calculation function
    // Adjust this calculation based on actual game mechanics and stats
    function calculateDPS(weapon: Weapon): string {
        const damageMin = weapon.damageMin || 0;
        const damageMax = weapon.damageMax || damageMin;
        const rateOfFire = weapon.rateOfFire || 0;
        const magazineSize = weapon.magazineSize ?? Infinity;
        const reloadTime = weapon.reloadTime ?? 0;

        const calculateSingleDPS = (damage: number): number => {
            if (magazineSize === Infinity || rateOfFire === 0) {
                return damage * rateOfFire;
            }
            const totalDamage =
                damage * (magazineSize === Infinity ? 1 : magazineSize);
            const totalTime =
                magazineSize === Infinity
                    ? 1
                    : magazineSize / rateOfFire + reloadTime;
            return totalDamage / totalTime;
        };

        let dpsOutput: string;

        if (damageMax != null && damageMax > damageMin) {
            const minDPS = calculateSingleDPS(damageMin);
            const maxDPS = calculateSingleDPS(damageMax);
            dpsOutput = `${minDPS.toFixed(2)}~${maxDPS.toFixed(2)}`;
        } else {
            dpsOutput = calculateSingleDPS(damageMin).toFixed(2);
        }

        return dpsOutput;
    }

    // Reactive statement to recalculate DPS whenever weapon stats change
    $: dps = $weaponStats.map((weapon) => calculateDPS(weapon));
    $: maxDpsValue = Math.max(...dps.map(Number));

    function getDpsStyle(dpsValue: string): string {
        const dpsValues = dps.map(Number);
        const maxDpsValue = Math.max(...dpsValues);
        return Number(dpsValue) === maxDpsValue
            ? "text-green-500 font-bold"
            : "text-white";
    }
</script>

<div class="bg-gray-800 p-4 shadow-lg rounded-lg">
    <h2 class="text-xl font-semibold mb-4 text-blue-400 text-center">
        DPS Comparison
    </h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        {#each dps as dpsValue, index}
            <div class="text-center">
                <p class={`text-3x1 ${getDpsStyle(dpsValue)}`}>
                    Weapon {index + 1} DPS: {dpsValue}
                </p>
            </div>
        {/each}
    </div>
</div>
