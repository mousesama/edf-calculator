<script lang="ts">
    import { classSelected } from "./store.js";

    // Function to update the selected class
    function selectClass(className: string) {
        classSelected.set(className);
    }
</script>

<div class="text-center">
    <button on:click={() => selectClass("Ranger")}>Ranger</button>
    <button on:click={() => selectClass("Wing Diver")}>Wing Diver</button>
    <button on:click={() => selectClass("Fencer")}>Fencer</button>
    <button on:click={() => selectClass("Air Raider")}>Air Raider</button>
</div>

<style lang="postcss">
    button {
        @apply bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded m-1
    }
</style>
