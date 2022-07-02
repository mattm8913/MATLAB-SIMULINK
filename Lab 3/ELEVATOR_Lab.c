#use "ES308_SBC.LIB"
void tx(int);
const int Vad_floors[2]={2332,2475};
void MS_wait(unsigned long N)
	{
   while(MS_TIMER < N);
   return;
   }
void main(void)
{
	float mospeed, Vin_est, desired_voltage, error, k, T, integral_value;
	char s[32];		// character string read from keyboard
   int value, Vad, i, Vad_desired, Ki;
   unsigned long T_ms;                //declaring all variables
	mospeed=0.0;

	ES308_Init();  		// Inits all ES308 Rabbit I/O to default values
	MsDelay(10);

	PWM_Init(1, 2); 	// port 1 mode 2
				// Set up PWM channel port and mode to drive a DC motor
	MsDelay(10);

   serBopen(9600);		// Baudrate
   serBflowcontrolOff();
   serBdatabits(8);
   serBparity(PARAM_NOPARITY);
   T=0;
   T_ms=MS_TIMER;
   k=85;
   Ki=30;
   integral_value=0;
	while(1)
	{
      //Vad=Norm_Get_AD_Val(0);          //get Vad and send it to matlab
      //tx(Vad);
      //while(Vad<2475)                  //loop to lift elevator to
      //{                                //top floor
      //mospeed=45;                       //values used are for added weight
      //PWM_MotorSpeed(1,fabs(mospeed));
      //MsDelay(10);
      //ServoControl(1, 'F');
      //MsDelay(10);
      //Vad=Norm_Get_AD_Val(0);
      //tx(Vad);
      //}
      //for(i=0;i<100;i++)               //loop to hold elevator at top
      //{                                //for one second
      //mospeed=18;
      //PWM_MotorSpeed(1,fabs(mospeed));
      //MsDelay(10);
      //ServoControl(1, 'F');
      //Vad=Norm_Get_AD_Val(0);
      //tx(Vad);
      //}
      //while(Vad>2332)
      //{
      //mospeed=-5;                       //loop to descend elevator
      //PWM_MotorSpeed(1,fabs(mospeed));  //to bottom floor
      //MsDelay(10);
      //ServoControl(1, 'R');
      //MsDelay(10);
      //Vad=Norm_Get_AD_Val(0);
      //tx(Vad);
      //}
      //for(i=0;i<100;i++)                //loop to hold elevator at bottom
      //{                                 //floor
      //mospeed=20;
      //PWM_MotorSpeed(1,fabs(mospeed));
      //MsDelay(10);
      //ServoControl(1, 'F');
      //Vad=Norm_Get_AD_Val(0);
      //tx(Vad);
      //}

      if(T<4)                           //for first 4 seconds, work toward
      	{                              //bottom floor
      	Vad_desired=2332;
         printf("Vad_desired = %d\t",Vad_desired);
      	}
      else if(T<8)                      //for last 4 seconds, work toward top
      	{                              //floor
         Vad_desired=2475;
        printf("Vad_desired = %d\t",Vad_desired);
         }
      else
       	{
         T=0;
         }
      Vad=Norm_Get_AD_Val(0);              //read sensor
      tx(Vad);                             //send data to matlab
      Vin_est=(-10)+Vad*(20/(pow(2,12)-1));
      desired_voltage=(-10)+Vad_desired*(20/(pow(2,12)-1));
      error=desired_voltage-Vin_est;       //calculate difference between
      integral_value += error*0.03;        //sensor voltage and desired
      printf("error = %f\t",error);        //voltage
      mospeed=k*error+18+Ki*integral_value;  //adjust motor speed accordingly
      PWM_MotorSpeed(1,fabs(mospeed));

   	if(mospeed<=0)             //set proper direction of motor
      {
      ServoControl(1, 'F');
      }
      else
      {
      ServoControl(1, 'R');
      }
      T_ms=T_ms+10;            //continue timer
      MS_wait(T_ms);           //and reset value of time so that the counter
      T=T+0.03;                //increases in real time
      printf("T = %f    \r",T);
	}
   serBclose();                //close the port
}

void tx(int num)
{
	int k;
   k = num & 0xFF;      		// turns num into 8 bit number k
   serBputc(k);               //send k over port
	k = (num >> 8) & 0xFF;   	//take last 8 bits of num and send those
	serBputc(k);

}