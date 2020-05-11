$start
$before
def_class Holzkiepe wood transport 1 {} {
$put

def_class Holzkiepe_ wood tool 1 {} {
	call scripts/misc/autodef.tcl
	class_defaultanim holzkiepe.standard

	obj_init {
		call scripts/misc/autodef.tcl
		set_anim this holzkiepe.standard 0 $ANIM_STILL

		set_attrib this weight 0.05
		set_attrib this hitpoints 0.5
	}
}


def_class Grosse_Holzkiepe_ wood tool 1 {} {
	call scripts/misc/autodef.tcl
	class_defaultanim big_holzkiepe.standard

	obj_init {
		call scripts/misc/autodef.tcl
		set_anim this big_holzkiepe.standard 0 $ANIM_STILL

		set_attrib this weight 0.05
		set_attrib this hitpoints 0.5
	}
}



$end


$start
$after
	method initiate {pos} {
		global color
		log "Initiate vom Schatzbuch wurde aufgerufen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		set_pos this $pos
		set_hoverable this 1
		set_physic this 1

$put
		set_storable this 1

$end
