class perecheButoane {
	float x,y,w,h,x2,y2;
	String s,s2;
	color c=c6,c_o=c8;
	int nr;
	int atribuire;

	perecheButoane(float xx,float yy,float xx2,float yy2,float ww,float hh,String ss,String ss2,int nrr) {
		x=xx;
		y=yy;
		x2=xx2;
		y2=yy2;
		w=ww;
		h=hh;
		s=ss;
		s2=ss2;
		nr=nrr;
	}

	void display() {
		if (atribuire==0) s="Anulare";
		else s="Atribuire";
		noStroke();
		if (isBetween(x,x+w,mouseX) && isBetween(y,y+h,mouseY)) {
			if (mousePressed && delay==0) {
				delay=DELAY;
				print(nr);
				if (atribuire==1) {
					atribuire=0;
					s="Anulare";/*
					if (alegeTemasauTest.selectat==0)
						//pui in db ca s a atribuit testul cu index nr
					else
						//pui in db ca s a atribuit tema cu index nr*/
				}
				else {
					atribuire=1;
					s="Atribuire";/*
					if (alegeTemasauTest.selectat==0)
						//pui in db ca s a anulat testul cu index nr
					else
						//pui in db ca s a anulat tema cu index nr*/
				}
			}
			fill(c_o);
		}
		else fill(c);
		rect(x,y,w,h);
		textSize(R*2/3);
		textAlign(CENTER,CENTER);
		fill(-1);
		text(s,x,y,w,h);

		noStroke();
		if (isBetween(x2,x2+w,mouseX) && isBetween(y2,y2+h,mouseY)) {
			if (mousePressed && delay==0) {
				delay=DELAY;
				//vizualizare
			}
			fill(c_o);
		}
		else fill(c);
		rect(x2,y2,w,h);
		textSize(R*2/3);
		textAlign(CENTER,CENTER);
		fill(-1);
		text(s2,x2,y2,w,h);
	}
}
