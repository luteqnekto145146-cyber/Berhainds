function beg_cod(){
if(hdir != 0){
   if(hdir > 0) {
	   sprite_index = spr_terrei_idet_v_pravo
   } else {
	   sprite_index = spr_terrei_idet_v_levo
   }

} else if(vdir !=0) {
	   if(vdir > 0) {
	   sprite_index = spr_terrei_idet_na_nas
   }else{
	   sprite_index = spr_beg_Terrei_idet_ot_nas
   }
} else {
	switch (sprite_index) {
		case spr_terrei_idet_v_pravo:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_terrei_idet_v_levo:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_terrei_idet_na_nas:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_beg_Terrei_idet_ot_nas:
		sprite_index = spr_terrei_bezdeistvie;
		break;
	}
  }
}