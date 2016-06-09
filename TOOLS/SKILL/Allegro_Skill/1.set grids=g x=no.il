/****************************************************/
/*               Title :  set grids					*/
/*     Execute Command :  set_grids					*/
/*              Author :  Vivien Luo                */
/*       Creation Date :  2013-05-05                */
/*              Update :  2013-06-09				*/
/*            Web site :  www.allegro-skill.com     */
/****************************************************/

axlCmdRegister("g" 'set_grids ?cmdType "interactive")

procedure(set_grids(@optional (grids ""))
	;SetGridsVersion("2.1")
	if(grids != ""
		then
			gird_value = atof(grids)
			if(gird_value
				then
					SetGridsScriptCreate(gird_value)
				else
					axlUIWPrint(nil "Sorry,You enter the wrong grid.... Grid set failed...")
			)
		else
			axlUIWPrint(nil "Please Input argument...")
	);end if 
);end procedure
procedure(SetGridsScriptCreate(InGrid)
	SGScriptFile = outfile("./grids.scr")
	fprintf(SGScriptFile "scriptmode +i +n\n")
	fprintf(SGScriptFile "version 15.5\n")
	fprintf(SGScriptFile "setwindow pcb\n")
	fprintf(SGScriptFile "trapsize 15382\n")
	fprintf(SGScriptFile "define grid\n")
	fprintf(SGScriptFile "setwindow form.grid\n")
	fprintf(SGScriptFile "FORM grid non_etch non_etch_x_grids %n\n" InGrid)
	fprintf(SGScriptFile "FORM grid non_etch non_etch_y_grids %n\n" InGrid)
	fprintf(SGScriptFile "FORM grid all_etch all_etch_x_grids %n\n" InGrid)
	fprintf(SGScriptFile "FORM grid all_etch all_etch_y_grids %n\n" InGrid)
	fprintf(SGScriptFile "FORM grid done\n")
	fprintf(SGScriptFile "setwindow pcb\n")
	close(SGScriptFile)
	sprintf(runScript,"replay %s","./grids.scr")
	axlShell(strcat("replay " "./grids.scr"))
	;deleteFile("./grids.scr")
	axlVisibleUpdate(t)
	axlUIWPrint(nil "^_^ Set Grid Successful...")
);end procedure

procedure(SetGridsVersion(ver)
	axlUIWPrint(nil "= = = = = =      Set Grids Ver %s    = = = = = =" ver)
	axlUIWPrint(nil "= = = = = = By Vivien Luo  May 5,2013= = = = = =")
	axlUIWPrint(nil "= = = = = = Email:admin@allegro-skill.com  = = = = = =")
);end procedure
