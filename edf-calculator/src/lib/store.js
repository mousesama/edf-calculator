import { writable } from 'svelte/store';

export const classSelected = writable('Ranger'); // Default class

export const weaponStats = writable([
    { damageMin: 0, damageMax: 0, rateOfFire: 0, magazineSize: 0, reloadTime: 0}, // Weapon 1 stats
    { damageMin: 0, damageMax: 0, rateOfFire: 0, magazineSize: 0, reloadTime: 0}, // Weapon 2 stats
  ]);