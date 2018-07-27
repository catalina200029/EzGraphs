void cont() {
   	background(c7);
    image(fundal1,0,0);
     float sc=scrollbarCont.decateori*scrollbarCont.h4;
	fill(-1);
	textSize(R*2);
	textAlign(CENTER,CENTER);
	text("BUN VENIT, " + CONTACTIV,0,height/8-sc,width,R*3);
	
	textSize(R);
    textAlign(LEFT,CENTER);
    text("Nume utilizator:",width/7,height/8+R*4-sc,width/5,R*2);
    text("Nume:",width/7,height/8+R*7-sc,width/5,R*2);
    text("Prenume:",width/7,height/8+R*10-sc,width/5,R*2);
    text("Email:",width/7,height/8+R*13-sc,width/5,R*2);
    text("Statut:",width/7,height/8+R*16-sc,width/5,R*2);
	text("ClasaID:",width/7,height/8+R*19-sc,width/5,R*2);
    if(compareStrings(nicknmUsr, "") || compareStrings(nmUsr, "") || compareStrings(surnmUsr, "") || compareStrings(emailUsr, "")){
    	if(!db.connect())dbConnect();
    	db.query("SELECT * FROM users WHERE userID = " + IDUSER);
		if(db.next()){
			IDUSER = db.getInt("userID");
			nmUsr = db.getString("name");
			surnmUsr = db.getString("surname");
			nicknmUsr = db.getString("nickname");
			emailUsr = db.getString("email");
			String temp = db.getString("pass");
			statutUsrCoded = db.getInt("isProfessor");

      boolean tempProf;
      if(statutUsrCoded==0) tempProf = false;
      else tempProf = true;

			if(statutUsrCoded==0){
				statutUsr = "Elev";
				clasa.s = "Conectare Clasa";
        //classConnect = new FlyingBox(new PVector(width, height/8 + R*28 + 3*R), color(63, 60, 71), 8*R, 0.2, tempProf, 1);
			}
			else {
				statutUsr = "Profesor";
				clasa.s = "Conectare Clasa";
        //classConnect = new FlyingBox(new PVector(width, height/8 + R*28 + 3*R), color(63, 60, 71), 8*R, 0.2, tempProf, 2);
			}
			clsUsr = db.getInt("classID");
			if(clsUsr>0){
				db.query("SELECT classID, classNAME FROM classes WHERE classID='"+clsUsr+"'");
				if(db.next()){
					clsNM = db.getString("classNAME");
					clasa_name.s = clsNM;
					clasa_pass.s = "";
				}
			}
		}
    }
    text(nicknmUsr,width/7 + width/5,height/8+R*4-sc,width/2,R*2);
    text(nmUsr,width/7 + width/5,height/8+R*7-sc,width/2,R*2);
    text(surnmUsr,width/7 + width/5,height/8+R*10-sc,width/2,R*2);
    text(emailUsr,width/7 + width/5,height/8+R*13-sc,width/2,R*2);
    text(statutUsr,width/7 + width/5,height/8+R*16-sc,width/2,R*2);
	  text(clsUsr + "",width/7 + width/5,height/8+R*19-sc,width/2,R*2);
    
	if(statutUsrCoded==0){
  		text("Nume clasa",width/7,height/8+R*22-sc,width/5,R*2);
  		text("Parola clasa:",width/7,height/8+R*25-sc,width/5,R*2);
  		clasa_name.display();
  		clasa_pass.display();

  		if( ((keyPressed && key==ENTER) || (isBetween(clasa.x,clasa.x+clasa.w,mouseX) && isBetween(clasa.y,clasa.y+clasa.h,mouseY+sc) && mousePressed)  ) && !compareStrings(clasa_name.s, "") && !compareStrings(clasa_pass.s, "") ) {
  			if(!db.connect())dbConnect();
  			db.query("SELECT classID, classPASS, classNAME FROM classes WHERE classNAME='"+clasa_name.s+"' AND classPASS='"+clasa_pass.s+"'");
  			if(db.next()){
  				int clsID = db.getInt("classID");
  				db.execute("UPDATE users SET classID="+clsID+" WHERE userID="+IDUSER);
  				clsUsr = clsID;
  				ERRCLS = false;
          succesConnectClass = true;
          
          menu2.tabs[0].sub = new SubMenu[3]; //myAcc
          menu2.tabs[0].sub[0] = new SubMenu(nmUsr, 8, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          menu2.tabs[0].sub[1] = new SubMenu("Clasa mea", 12, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          menu2.tabs[0].sub[2] = new SubMenu("Deconectare", 11, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          membriiClasa = new ClassMembers(clsUsr, IDUSER, statutUsrCoded, clsNM, nmUsr, surnmUsr);
  			}
  			else {
          ERRCLS = true;
          succesConnectClass = false;
        }
  		}
	}
	else{
  		text("Nume clasa",width/7,height/8+R*22-sc,width/5,R*2);
  		text("Parola clasa:",width/7,height/8+R*25-sc,width/5,R*2);
  		clasa_name.display();
  		clasa_pass.display();
  		if( ((keyPressed && key==ENTER) || (isBetween(clasa.x,clasa.x+clasa.w,mouseX) && isBetween(clasa.y,clasa.y+clasa.h,mouseY+sc) && mousePressed) ) && !compareStrings(clasa_name.s, "") && !compareStrings(clasa_pass.s, "")){
  			boolean OKKK = true, entered = false;
  			if(!db.connect())dbConnect();
  			db.query("SELECT classNAME, classPASS, classID FROM classes");
  			while(db.next()){
  				String tmpcls = db.getString("classNAME");
  				String tmppwdcls = db.getString("classPASS");
  				int tmpid = db.getInt("classID");
  				if(compareStrings(tmpcls, clasa_name.s)){
  					OKKK = false;
  					if(compareStrings(tmppwdcls, clasa_pass.s)){
  						db.execute("UPDATE users SET classID="+tmpid+" WHERE userID="+IDUSER);
  						clsUsr = tmpid;
              succesConnectClass = true;
  						clsNM = clasa_name.s;
  						entered = true;
  						ERRCLS = false;

              menu2.tabs[0].sub = new SubMenu[3]; //myAcc
              menu2.tabs[0].sub[0] = new SubMenu(nmUsr, 8, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
              menu2.tabs[0].sub[1] = new SubMenu("Clasa mea", 12, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
              menu2.tabs[0].sub[2] = new SubMenu("Deconectare", 11, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
              membriiClasa = new ClassMembers(clsUsr, IDUSER, statutUsrCoded, clsNM, nmUsr, surnmUsr);
  					}
  				}
  			}

  		}
      else{
        boolean OKKK = true, entered = true;
        if((isBetween(clasa2.x, clasa2.x+clasa2.w, mouseX) && isBetween(clasa2.y,clasa2.y+clasa2.h,mouseY+sc) && mousePressed) && clasa_name.s.length()>=1 && clasa_pass.s.length()>=1){
          db.execute("INSERT INTO classes VALUE (NULL, "+IDUSER+", '"+clasa_pass.s+"', '"+clasa_name.s+"')");
          db.query("SELECT classID, classNAME FROM classes WHERE classNAME='"+clasa_name.s+"'");
          if(db.next())clsUsr = db.getInt("classID");
          db.execute("UPDATE users SET classID="+clsUsr+" WHERE userID="+IDUSER);
          clsNM = clasa_name.s;
          ERRCLS = false;
          succesConnectClass = true;

          menu2.tabs[0].sub = new SubMenu[3]; //myAcc
          menu2.tabs[0].sub[0] = new SubMenu(nmUsr, 8, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          menu2.tabs[0].sub[1] = new SubMenu("Clasa mea", 12, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          menu2.tabs[0].sub[2] = new SubMenu("Deconectare", 11, menu2.tabs[0].seekPos, menu2.tabs[0].seekCol, menu2.tabs[0].seekSize, menu2.tabs[0].animSpd, menu2.tabs[0].seekW, 2*menu2.tabs[0].h/3);
          membriiClasa = new ClassMembers(clsUsr, IDUSER, statutUsrCoded, clsNM, nmUsr, surnmUsr);
        }
        else if(!entered){
          ERRCLS = true;
          succesConnectClass = false;
        }
      }
	}

	if(ERRCLS){
		textSize(R);
    textAlign(LEFT,CENTER);
		fill(255,97,0);
		text("Date introduse gresit!",width/7,height/8+R*28-sc,width,R*2);
	}
  if(succesConnectClass){
    textSize(R);
    textAlign(LEFT,CENTER);
    fill(116, 247, 37);
    text("CONNECTAT CU SUCCES",width/7,height/8+R*28-sc,width,R*2);
  }
    modifCont.display();
    note.display();
    clasa.display();
    if (statutUsrCoded==1)
      clasa2.display();
    scrollbarCont.display();
    //if(classConnect!=null){
      //classConnect.display();
      //classConnect.update();
    //}
}