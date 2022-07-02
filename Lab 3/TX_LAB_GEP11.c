#use "ES308_SBC.LIB"  	// we do this in place of ES432

void tx(int);  		// this is a function prototype.  It is required before main

void main(void)
{
	char ans[10];   	// a variable to store a user response
	int value, Vad;		// a numerical variable to transmit

	ES308_Init();   	//sets up the board… always do this first
   PWM_Init(1,2);

	// put in code to open the serial port at 9600 8-N-1 with no flow control
	serBopen(9600);		// Baudrate
   serBflowcontrolOff();
   serBdatabits(8);
   serBparity(PARAM_NOPARITY);

	while(1)           //infinite loop
	{
		Vad=Norm_Get_AD_Val(0);
		tx(Vad);			// calls the function tx with value
		printf("%d\n",Vad);			// new line
	}
   serBclose();
}

void tx(int num)
{
	int k;
   k = num & 0xFF;      		// What is this doing?
   serBputc(k);
	k = (num >> 8) & 0xFF;   	// What about this?
	serBputc(k);

}