
//void playgame(){


Ball ball;



Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;
String gamestate;
void setup() {
  size(600, 400);

  ball = new Ball();
  left = new Paddle(true);
  right = new Paddle(false);
//menu 
//gamestate="start";
}//
void draw() {
 
  //if (gamestate == "START") {
  //  startGame();
  //}
  
  
  background(0);

  ball.checkPaddleLeft(left);
  ball.checkPaddleRight(right);
  ball.checkPaddleLeft(left);

  left.show();
  right.show();
 
  left.update();
  right.update();

  ball.update();
  ball.edges();
  ball.show();
  fill(255);
  textSize(32);
  text(leftscore, 32, 40);
  text(rightscore, width-64, 40);


}

//void startGame() {

//  if (mousePressed == true) {
//    gamestate = "PLAY";
   
  







//}
