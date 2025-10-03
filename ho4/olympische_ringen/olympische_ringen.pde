size(800, 400);
int grootte = 100;
noFill();
strokeWeight(10);
//blue
stroke(0, 0, 255);
ellipse(100, 100, grootte, grootte);
//black
stroke(0);
ellipse(220, 100, grootte, grootte);
//red
stroke(238, 51, 78);
ellipse(340, 100, grootte, grootte);
//yellow
stroke(252, 177, 49);
ellipse(160, 150, grootte, grootte);
//green
stroke(0, 166, 81);
ellipse(280, 150, grootte, grootte);
//arc blue
stroke(0, 0, 255);
arc(100, 100, grootte, grootte,PI, 2.25*PI);
//arc black 
stroke(0);
arc(220, 100, grootte, grootte, 0.5*PI, 0.75*PI);
arc(220, 100, grootte, grootte, PI*1.9, PI*2.1);
//arc red
stroke(238, 51, 78);
arc(340, 100, grootte, grootte, 0.5*PI, 0.75*PI);
