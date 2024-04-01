<script lang="ts">
  import ClassTabSelector from "./lib/ClassTabSelector.svelte";
  import WeaponInputForm from "./lib/WeaponInputForm.svelte";
  import DPSComparison from "./lib/DPSComparison.svelte";

  import { classSelected, weaponStats } from "./lib/store.js";
</script>

<main class="bg-gray-900 text-white min-h-screen p-8">
  <h1 class="text-4x1 mb-6 text-center">EDF DPS Calculator</h1>
  Work in progress uwu

  <div class="card">
    <ClassTabSelector />
    <div class="flex flex-wrap justify-center gap-4 mt-4">
      {#each $weaponStats as weapon, index (index)}
        <div class="flex-1 min-w-0">
          <WeaponInputForm {...weapon} id={index} />
        </div>
      {/each}
    </div>
    <div class="mt-5">
      <DPSComparison />
    </div>
  </div>
</main>

<style>
</style>
