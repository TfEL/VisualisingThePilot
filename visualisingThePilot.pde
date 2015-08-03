import java.util.ArrayList;

ArrayList myQueries;

Query queryBeingDragged;

boolean hasMoved = false;

int dragX;
int dragY;

int tf = 184;
int t1 = 180;
int t2 = 366;
int t3 = 405;
int t4 = 591;
int t5 = 526;
int t6 = 518;
int t7 = 472;
int t8 = 585;
int t9 = 884;
int t10 = 187;
int t11 = 130;
int t12 = 1219;

int ttl = tf + t1 + t2 + t3 + t4 + t5 + t6+ t7 + t8 + t9 + t10 + t11 + t12;

String total = "Total participants: " + ttl + "\n(C) SA.GOV TfEL Pilot Data.";

void setup() {
  queryBeingDragged = null;
  myQueries = new ArrayList();
  
  // fullScreen(P2D, SPAN);

  size(displayWidth, displayHeight, P2D);
  
  smooth();
    
  int shrinkBy = (width / 550);

  myQueries.add( new Query("Foundation\n" + tf, color(255, 255, 0), tf*0.2, tf*0.2, tf/shrinkBy, tf/shrinkBy));

  myQueries.add( new Query("Year 1\n" + t1, color(200, 255, 255), t1*0.2, t1*0.2, t1/shrinkBy, t1/shrinkBy));

  myQueries.add( new Query("Year 2\n" + t2, color(200, 200, 255), t2*0.2, t2*0.2, t2/shrinkBy, t2/shrinkBy));

  myQueries.add( new Query("Year 3\n" + t3, color(255, 200, 200), t3*0.2, t3*0.2, t3/shrinkBy, t3/shrinkBy));

  myQueries.add( new Query("Year 4\n" + t4, color(150, 150, 255), t4*0.2, t4*0.2, t4/shrinkBy, t4/shrinkBy));

  myQueries.add( new Query("Year 5\n" + t5, color(150, 150, 150), t5*0.2, t5*0.2, t5/shrinkBy, t5/shrinkBy));

  myQueries.add( new Query("Year 6\n" + t6, color(100, 100, 200), t6*0.2, t6*0.2, t6/shrinkBy, t6/shrinkBy));

  myQueries.add( new Query("Year 7\n" + t7, color(200, 100, 100), t7*0.2, t7*0.2, t7/shrinkBy, t7/shrinkBy));

  myQueries.add( new Query("Year 8\n" + t8, color(50, 155, 75), t8*0.2, t8*0.2, t8/shrinkBy, t8/shrinkBy));

  myQueries.add( new Query("Year 9\n" + t9, color(165, 195, 50), t9*0.2, t9*0.2, t9/shrinkBy, t9/shrinkBy));

  myQueries.add( new Query("Year 10\n" + t10, color(25, 125, 125), t10*0.2, t10*0.2, t10/shrinkBy, t10/shrinkBy));

  myQueries.add( new Query("Year 11\n" + t11, color(50, 200, 50), t11*0.2, t11*0.2, t11/shrinkBy, t11/shrinkBy));

  myQueries.add( new Query("Year 12\n" + t12, color(200, 10, 10), t12*0.2, t12*0.2, t12/shrinkBy, t12/shrinkBy));
}

void draw() {
  background(255);
  textAlign(CENTER);

  for (int i = 0; i < myQueries.size (); i++) {
    Query myQuery1 = (Query)myQueries.get(i);
    myQuery1.display();
  }

  fill(0);
  String niceFrate = "\n" + frameRate + " FPS";
  text(total + niceFrate, width-90, 20);
  textSize(26);
  text("PILOT Student Voice by Year Level.", width/2, 30);
  textSize(12);
  
  if (hasMoved == false) {
    text("Drag the circles to begin.", width/2, height/2);
  }
}

void createNamedEllipse(String name, int ylVariable) {
  fill(200);
  ellipse(ylVariable/2*2, ylVariable/2*2, ylVariable/2, ylVariable/2);
  fill(0);
}

class Query {
  String name;

  color qc;
  float qx;
  float qy;
  int dQx;
  int dQy;

  Query(String name, color tempQc, float tempQx, float tempQy, int tempdQx, int tempdQy) {
    this.name = name;
    qc = tempQc;
    qx = tempQx;
    qy = tempQy;
    dQx = tempdQx;
    dQy = tempdQy;
  }

  void display() {
    stroke(0);
    fill(qc);
    //    rectMode(RADIUS);
    ellipse(qx, qy, dQx, dQy);
    fill(0);
    text(name, qx, qy);
  }

  boolean inQuery(int x, int y) {
    //changed to x > qx-dQx and y > qy-dQy

      if ((x > qx-dQx) & x < (qx+dQx)) {
      if ((y > qy-dQy)  & y < (qy+dQy)) {

        return true;
      }
    }
    return false;
  }
}  

void mousePressed() {
  for (int i = 0; i < myQueries.size (); i++) {    
    Query myQuery1 = (Query)myQueries.get(i);
    evaluateQuerySelection(myQuery1);
    hasMoved = true;
  }
  println("pressed");
}

void evaluateQuerySelection(Query myQuery1) { 

  if (myQuery1.inQuery(mouseX, mouseY) & queryBeingDragged==null) {    
    dragX = (int)myQuery1.qx - mouseX;
    dragY = (int)myQuery1.qy - mouseY;
    queryBeingDragged = myQuery1;
  }
}



void mouseReleased() {
  queryBeingDragged = null;
}

void mouseDragged() {
  if ( queryBeingDragged != null) {
    println("dragging " + queryBeingDragged.name);
    moveQueryByMouse(queryBeingDragged);
  }
}

void moveQueryByMouse(Query myQuery1) {
  myQuery1.qx = mouseX + dragX;
  myQuery1.qy = mouseY + dragY;
}
