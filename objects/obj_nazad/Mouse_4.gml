var pause_inst = instance_find(obj_pauze, 0);

if (pause_inst != noone)
{
    with (pause_inst)
    {
        event_user(0);
    }
}
