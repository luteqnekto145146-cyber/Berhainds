function beg_cod(){
if(hdir != 0){
   if(hdir > 0) {
	   sprite_index = spr_ANM_Beg_Terrei
   } else {
	   sprite_index = spr_ANM_Beg_TerrLEFT
   }

} else if(vdir !=0) {
	   if(vdir > 0) {
	   sprite_index = spr_terrei_bezdeitv
   }else{
	   sprite_index = spr_beg_Terrei_zad
   }
} else {
	switch (sprite_index) {
		case spr_ANM_Beg_Terrei:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_ANM_Beg_TerrLEFT:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_terrei_bezdeitv:
		sprite_index = spr_terrei_bezdeistvie;
		break;
		case spr_beg_Terrei_zad:
		sprite_index = spr_terrei_bezdeistvie;
		break;
	}
  }
}