other.hp -= 35
if (other.hp <= 0) {
	other.is_dying = true
}
instance_destroy()