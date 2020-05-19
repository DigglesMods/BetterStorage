$start
$before
def_class Holzkiepe wood transport 1 {} {
$put

def_class Holzkiepe_ wood tool 1 {} {
	call scripts/misc/autodef.tcl
	class_defaultanim holzkiepe.standard

	method set_related_pannier {pannier} {
		if {[obj_valid $pannier] && [get_objclass $pannier] == "Holzkiepe"} {
			set related_pannier $pannier
		}
	}

	method get_related_pannier {} {
		if {![obj_valid $related_pannier] || $related_pannier == -1} {
			set related_pannier [new Holzkiepe]
		}
		return $related_pannier
	}

	obj_init {
		call scripts/misc/autodef.tcl
		set_anim this holzkiepe.standard 0 $ANIM_STILL

		set_attrib this weight 0.05
		set_attrib this hitpoints 0.5
		
		set related_pannier -1
	}
}


def_class Grosse_Holzkiepe_ wood tool 1 {} {
	call scripts/misc/autodef.tcl
	class_defaultanim big_holzkiepe.standard

	method set_related_pannier {pannier} {
		if {[obj_valid $pannier] && [get_objclass $pannier] == "Grosse_Holzkiepe"} {
			set related_pannier $pannier
		}
	}

	method get_related_pannier {} {
		if {![obj_valid $related_pannier] || $related_pannier == -1} {
			set related_pannier [new Grosse_Holzkiepe]
		}
		return $related_pannier
	}

	obj_init {
		call scripts/misc/autodef.tcl
		set_anim this big_holzkiepe.standard 0 $ANIM_STILL

		set_attrib this weight 0.05
		set_attrib this hitpoints 0.5
		
		set related_pannier -1
	}
}



$end


$if:mod:Recycling

$start
$after
def_class Holzkiepe_ wood tool 1 {} {

$put

	method recycle {user} {
		tasklist_add $user "recycle [call_method this get_related_pannier] [get_ref this]"
	}

$end

$start
$after
def_class Grosse_Holzkiepe_ wood tool 1 {} {

$put

	method recycle {user} {
		tasklist_add $user "recycle [call_method this get_related_pannier] [get_ref this]"
	}

$end

$ifend
