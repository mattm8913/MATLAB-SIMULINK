#use "ES308_SBC.LIB"  // we do this in place of ES432_SBC.LIB

void main(void)
{

	int Vad;	  	// variable to store the A/D value (what the computer reads)
	float Vin_est; 	// variable to store the estimated voltage from the A/D
				// (our guess as to the actual voltage)

	ES308_Init();   	//sets up the board… always do this first    `

	while(1)           	//infinite loop
	{
		 Vad = Norm_Get_AD_Val( INSERT YOUR A/D INPUT CHANNEL-LOOK AT WIRES);  // reads the value
							       // on specified pin
		Vin_est = INSERT FORMULA FOR ESTIMATING VOLTAGE-BE CAREFUL WITH FLOAT VS INT;
		printf("A/D value = %d counts or %.4f volts\r", Vad, Vin_est);
        }
}


