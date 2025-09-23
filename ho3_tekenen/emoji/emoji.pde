//Background
size(400, 400);
strokeWeight(0);
fill(255, 220, 0);
ellipse(200, 200, 200, 200);

//Mouth
fill(74, 50, 23);
strokeWeight(0);
arc(200, 250, 50, 50, 0, PI, OPEN);
strokeWeight(0);
rect(175, 225, 50, 25);
strokeWeight(0);
line(175, 250, 175, 225);
line(225, 250, 225, 225);
arc(200, 225, 50, 50, 1*PI, 2*PI);

//hat
fill(0);
arc(200,110,100,100, 1*PI, 2*PI);
strokeWeight(8);
line(125, 110, 275, 110);



//Eyes
strokeWeight(0);
fill(255);
rotate(PI*0.2);
ellipse(240, 45, 50, 60);
rotate(PI/0.38);
ellipse(-110, -270, 50, 60);
