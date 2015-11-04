//You should implement your assign3 here.

void setup () {
  size(640, 480) ;

}

void draw() {

}
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;
boolean gamestart=false;
PImage map1,map2,fighter,enemy,hp,treasure;
PImage start1,start2,end1,end2;
int x,y,n,m,bx=-255,blood=200,blood1=blood/5,tx,ty;
int mx=480,by,my=215;
int speed,gameState,bs=0;
float case1;
final int GAME_START=0;
final int GAME_READY=1;
final int GAME_RUN=2;
final int GAME_OVER=3;
final int GAME_RESTART=4;



void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
      upPressed=true;break;
      case DOWN:
      downPressed=true;break;
      case LEFT:
      leftPressed=true;break;
      case RIGHT:
      rightPressed=true;break;}}}
void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case UP:
      upPressed=false;break;
      case DOWN:
      downPressed=false;break;
      case LEFT:
      leftPressed=false;break;
      case RIGHT:
      rightPressed=false;break;}}}


void setup(){
size(641,482);
map1 = loadImage("img/bg1.png");
map2 = loadImage("img/bg2.png");
fighter = loadImage("img/fighter.png");
enemy = loadImage("img/enemy.png");
hp = loadImage("img/hp.png");
start1=loadImage("img/start1.png");
start2=loadImage("img/start2.png");
end1=loadImage("img/end1.png");
end2=loadImage("img/end2.png");
treasure=loadImage("img/treasure.png");
n=floor(random(0,500));
m=floor(random(30,450));
by=floor(random(30,450));
tx= floor(random(20,590));
ty= floor(random(20,590));
gameState=GAME_START;
}

void draw(){
  if(upPressed){my-=6;}
  if(downPressed){my+=6;}
  if(leftPressed){mx-=6;}
  if(rightPressed){mx+=6;}
 switch(gameState){
  case GAME_START:
  image(start2,0,0);
   if(mouseX>=215 && mouseX<=440 && mouseY>=380 && mouseY<=410){
    image(start1,0,0);if(mousePressed){gameState=GAME_RUN;}}break;
  case GAME_RUN:
    image(map1,x,0);
    image(map2,y-641,0);
    image(map1,x-1282,0);
    rect(10,3,blood1,23,7);fill(#FF0000);
    image(hp,0,0);
    image(fighter,mx,my);
    image(treasure,tx,ty);
    for(int i=0;i<5;i+=1){
    bx=i*51;
    image(enemy,bx+bs,by);}
    if(bs<1){by=floor(random(30,450));}
    if(mx<0){mx=0;}
    if(mx>590){mx=590;}
    if(my<0){my=0;}
    if(my>430){my=430;}bs=bs+5;bs%=641;x=x+3;y=y+3;x %=1282;y %=1282;
    if(my>by){by=by+3;}else{by=by-3;}
    if(tx+41>=mx && mx+41>=tx && ty+41>=my && my+41>=ty){
     blood1+=20;if(blood1>200){blood1=200;}
      tx=floor(random(20,590));ty=floor(random(40,460));}
    //if(bx+51>=mx && mx+51>=bx && by+51>=my && my+51>=by){
    // blood1-=40;bx=0;by=floor(random(30,450));}
      if(blood1<=0){gameState=GAME_OVER;}break;
    case GAME_OVER:
    image(end2,0,0);
     if(mouseX>=215 && mouseX<=420 && mouseY>=310 && mouseY<=345){
      if(mousePressed){gameState=GAME_RUN;blood1=blood/5;}
        else{image(end1,0,0);}}break;
}}
