$start
$replace 
tasklist_add this "state_disable this; walk_action \"-target \{[get_pos $next_item]\} \" {state_enable this}"
$with
tasklist_add this "state_disable this; walk_action \"-target \{[get_posbottom $next_item]\} \" {state_enable this}"
$end



$start
$replace 
	tasklist_add this "call_method $store retrieve_item $slotidx $item; beamto_inv $item"
$with
	if {[get_objclass $item] == "Holzkiepe_" || [get_objclass $item] == "Grosse_Holzkiepe_"} {
		set pannier [call_method $item get_related_pannier]
		tasklist_add this "call_method $store retrieve_item $slotidx $item; set_visibility $item 0; del $item; beamto_inv $pannier"
	} elseif {[get_objclass $item] == "Schatzbuch"} {
		tasklist_add this "call_method $store retrieve_item $slotidx $item; beamto_inv $item; set_roty $item 0"
	} else {
		tasklist_add this "call_method $store retrieve_item $slotidx $item; beamto_inv $item"
	}
$end