/obj/item/mod/module/suit_item_holder // reusable abstract type to make your own item holders
	name = "MOD nothing holder!"
	desc = "Holds NOTHING!  Also you shouldn't see this ingame."
	icon = 'modular_skyrat/modules/modsuit_modular/icons/mod_modules_skyrat.dmi'
	icon_state = "engi_harness"
	complexity = 1
	use_power_cost = 0
	incompatible_modules = list(/obj/item/mod/module/magnetic_harness)
	/// Items we allow.
	var/list/suit_items_allowed = list() // add here
	/// items that were allowed before this module was added.
	var/list/suit_items_allowed_before = list() // no touching



/obj/item/mod/module/suit_item_holder/on_install()
	suit_items_allowed_before = mod.chestplate.allowed
	mod.chestplate.allowed |= suit_items_allowed

/obj/item/mod/module/suit_item_holder/on_uninstall(deleting = FALSE)
	if(deleting)
		return
	mod.chestplate.allowed -= (suit_items_allowed - suit_items_allowed_before) // Hopefully doesn't cause bugs

/obj/item/mod/module/suit_item_holder/jetpack
	name = "MOD jetpack harness module"
	desc = "A simple set of straps that allow jetpacks to fit into the suit slot that normally holds air tanks."
	icon_state = "engi_harness"
	complexity = 3 // Someone suggested I was trying to powergame module complexity with this PR so here you go
	use_power_cost = 0
	incompatible_modules = list(/obj/item/mod/module/suit_item_holder, /obj/item/mod/module/magnetic_harness)
	suit_items_allowed = list(/obj/item/tank/jetpack)
