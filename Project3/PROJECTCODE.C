#use ES432_SBC.Lib
// Simple code for sending Robot States to the Rabbit
void main(void)

{//open void
char dat;          // declaring variables
int i;
int rws;
int lws;
int num;
char sensor_data;
char cmd[20];
int x;
int clear;

x=100;

ES432_Init();
//Set up Serial Comms to MATLAB
serCopen(9600);		// Set up serial pots C and D
serCflowcontrolOff();		
serCdatabits(8);		
serCparity(PARAM_NOPARITY);	
					
					
serDopen(57600);		
serDflowcontrolOff();		
serDparity(PARAM_NOPARITY);	
serDdatabits(8);		

clear=serCrdFree();		//flush the buffer
serCrdFlush();

serDputc(128);
printf("Turning on... hit a key\n");		//keyboard keys must be pressed to start program
getchar();
serDputc(131);
printf("In SAFE mode... hit a key\n");
getchar();

rws = 0;					//starting speed = 0
lws = 0;

serDputc(145);   // move command
num = (rws >> 8);  // upper 8 bits
serDputc(num);     // of rws sent
num = (rws&0xFF);  // lower 8 bits
serDputc(num);     // of rws sent
num = (lws >> 8);  // upper 8 bits
serDputc(num);     // of rws sent
num = (lws&0xFF);  // lower 8 bits     // 0
serDputc(num);     // of rws sent
MsDelay(100);
printf("Recieving comands from MATLAB\n");

while(1)
{//open while(1)
   dat=serCgetc();
   //printf("dat= %d\n", dat);  	//notifies us what value we are getting for "dat"
   serDputc(142);			// if comment bars are removed
   serDputc(7);
   MsDelay(200);
   sensor_data = serDgetc();		//read the bump sensors 
//printf("Sensor Data is %d\n", sensor_data);

   if ((dat != 255)||(sensor_data!=0))
   {//open if we got data or bumper is bumped
      if ((((int)sensor_data & 0x2) > 0))
      { //if it bumped left
      	serCputc('L');
         printf("Report to MATLAB: Left Bumper has been hit\n");
         rws = -100;			// back up
   		lws = -100;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(1000);

               rws = 0;			//stop
	   lws = 0;
      serDputc(145);   // move command
	   num = (rws >> 8);  // upper 8 bits
	   serDputc(num);     // of rws sent
	   num = (rws&0xFF);  // lower 8 bits
	   serDputc(num);     // of rws sent
	   num = (lws >> 8);  // upper 8 bits
	   serDputc(num);     // of rws sent
	   num = (lws&0xFF);  // lower 8 bits     // 0
	   serDputc(num);     // of rws sent
      MsDelay(100);


      }//close if bumped   left
      if (((int)sensor_data & 0x1) > 0)
      {//open if bumped right
      	serCputc('R');
         printf("Report to MATLAB: Right Bumper has been hit\n");
         rws = -100;
   		lws = -100;		//back up

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(1000);

         rws = 0;			//stop
      	lws = 0;
	      serDputc(145);   // move command
	      num = (rws >> 8);  // upper 8 bits
	      serDputc(num);     // of rws sent
	      num = (rws&0xFF);  // lower 8 bits
	      serDputc(num);     // of rws sent
	      num = (lws >> 8);  // upper 8 bits
	      serDputc(num);     // of rws sent
	      num = (lws&0xFF);  // lower 8 bits     // 0
	      serDputc(num);     // of rws sent
         MsDelay(10);


      }//close if bunped right
      if (dat =='f')
      {//open if dat f
      	printf("MATLAB Says: Robot should Move Forward\n");



				//if "f" character is received, move forward
         rws = 400;		// indefinitely (will stop if bumper is hit or
   		lws = 400;	//another key is pressed)

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         dat=serCgetc();
         MsDelay(100);


      }//close if dat f
      if (dat =='b')
      {//open if dat b
      	printf("MATLAB Says: Robot should Move Backwards\n");
      	rws = -100;			//if "b" character is received, slowly
   		lws = -100;		//take a step backwards, then stop

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(2000);

         rws = 0;			
   		lws = 0;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(100);
      }//close if dat b
      if (dat =='r')
      {//open if dat r
      	printf("MATLAB Says: Robot should Turn Right\n");
      	rws = -300;		//if "r" character is received
   		lws = 300;	//rotate right 45 degrees, 
				//then stop
   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(375);

         rws = 0;
   		lws = 0;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(100);
      }//close if dat r
      if (dat =='R')
      { //open if dat R
      	printf("MATLAB Says: Robot should Spin 180\n");
      	rws = -300;		//if "R" character is received
   		lws = 300;	//rotate right 180 degrees
				//then stop
   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(1500);

         rws = 0;
   		lws = 0;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
      }//open if dat R
      if (dat =='l')
      {//open if dat l
      	printf("MATLAB Says: Robot should Turn Left\n");
      	rws = 300;		//if "l" character is received
   		lws = -300;	//rotate left 45 degrees
				//then stop
   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(375);
         rws = 0;
   		lws = 0;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(100);

      }//close if dat l
      if (dat =='F')
      { //open if dat F
      	printf("MATLAB Says: Robot should Step Forward\n");
      	rws = 400;		//if "F" character is received
   		lws = 400;	//surge forward, then stop

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
         MsDelay(1000);

         rws = 0;
   		lws = 0;

   		serDputc(145);   // move command
   		num = (rws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (rws&0xFF);  // lower 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws >> 8);  // upper 8 bits
   		serDputc(num);     // of rws sent
   		num = (lws&0xFF);  // lower 8 bits     // 0
   		serDputc(num);     // of rws sent
      } //close if dat F
      if ((dat =='a')||(dat=='A'))
      { //open if dat a
      	printf("MATLAB Says: Robot is Autonomous\n");
            while(dat!='m')
         	{//open while m	//if "a" or "A" character 
				//is received, enter autonomous
            dat=serCgetc();	//mode until "m" is received.
            x= x+10;		//begin spiralling by increasing
				//both wheel speeds while right 
            rws = x+120;	//wheel moves faster than left
	         lws = x;	//until both reach max speed

	         serDputc(145);   // move command
	         num = (rws >> 8);  // upper 8 bits
	         serDputc(num);     // of rws sent
	         num = (rws&0xFF);  // lower 8 bits
	         serDputc(num);     // of rws sent
	         num = (lws >> 8);  // upper 8 bits
	         serDputc(num);     // of rws sent
	         num = (lws&0xFF);  // lower 8 bits     // 0
	         serDputc(num);     // of rws sent

            MsDelay(1000);

            serDputc(142);
   			serDputc(7);
   			MsDelay(100);
            sensor_data = serDgetc();

            if ((((int)sensor_data & 0x1)> 0) || (((int)sensor_data & 0x2)> 0))
            {//open if bumped

               serCputc('S');			//if a bumper is bumped, then
               printf("Something Bumped\n");	//tell Matlab, back up, rotate
						//left 90 degrees, then go to
               rws = -300;			//top of while loop and continue 
            	lws = -300;			//spiralling or moving ahead at full
						//speed
	            serDputc(145);   // move command
	            num = (rws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (rws&0xFF);  // lower 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws&0xFF);  // lower 8 bits     // 0
	            serDputc(num);     // of rws sent
               MsDelay(1000);

               rws = 300;                          
            	lws = -300;

	            serDputc(145);   // move command
	            num = (rws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (rws&0xFF);  // lower 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws&0xFF);  // lower 8 bits     // 0
	            serDputc(num);     // of rws sent
               MsDelay(750);

               rws = 0;
            	lws = 0;

	            serDputc(145);   // move command
	            num = (rws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (rws&0xFF);  // lower 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws&0xFF);  // lower 8 bits     // 0
	            serDputc(num);     // of rws sent
               MsDelay(100);
         	} //close if bumped
      }// close while 'm'
      } //close if 'a'
      if((dat=='m'))
      {//open if m
               printf("Manual Overide\n");
               rws = 0;			//"m" character is the "manual
            	lws = 0;		//override" command to exit autonomous
					//mode, tell Matlab it was pressed
					//then stop rhoomba
	            serDputc(145);   // move command
	            num = (rws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (rws&0xFF);  // lower 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws&0xFF);  // lower 8 bits     // 0
	            serDputc(num);     // of rws sent
               MsDelay(100);
      }//close if m

      if (dat=='q')
      {//open if dat q
         printf("Program terminated\n");
         rws = 0;			//if "q" is received, stop rhoomba
            	lws = 0;		//and terminate program

	            serDputc(145);   // move command
	            num = (rws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (rws&0xFF);  // lower 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws >> 8);  // upper 8 bits
	            serDputc(num);     // of rws sent
	            num = (lws&0xFF);  // lower 8 bits     // 0
	            serDputc(num);     // of rws sent
               MsDelay(100);
         break;
      }//close if q

      }//close while dat != 255
   }//close while (1)
     }//close void main(void)


