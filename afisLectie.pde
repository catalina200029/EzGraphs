//lectieProf l1;

void afisLectie() {
	//l1=new lectieProf(R*3,R*6,width-R*6,R*15, "adwfawfaw","Lectie1","autor1",3.3);
	int i;
    background(c7);
    image(fundal1,0,0);
    //l1.display();
    lectieCurentaprof.display();
    scrollbarLectie.display();
}

float lungimeLectie(String s) {
	int i;
    textSize(lectiiProf[0].w2*2/3);
	if (nLectii>=1) return lectiiProf[0].y+lectiiProf[0].h+R*3+textWidth(s)/(lectiiProf[0].w-lectiiProf[0].w2*4)*lectiiProf[0].w2;
    else return 0;
}