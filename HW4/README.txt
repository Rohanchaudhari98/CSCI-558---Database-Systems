HW4 - Rohan Mahendra Chaudhari

Question 1 - Weka
Linear Regression Equation:
Here, class is MEDV.
class =
     -0.1084 * CRIM    +
      0.0458 * ZN      +
      2.7187 * CHAS=1  +
    -17.376  * NOX     +
      3.8016 * RM      +
     -1.4927 * DIS     +
      0.2996 * RAD     +
     -0.0118 * TAX     +
     -0.9465 * PTRATIO +
      0.0093 * B       +
     -0.5226 * LSTAT   +
     36.3411

The number of terms in the above equation is 12. The first 11 terms are weight * features and the last term is the intercept.


Due to the M5 attribute selection method that is being used here, we first build the equation on all the terms/descriptors. After which, the terms/descriptors with the smallest standardised regression coefficients are removes stepwise until no improvement can be observed in the estimate of the average prediction error given by the Akaike information criterion. In the above case, INDUS, AGE and CHAS = 0 are omitted as they do not affect the error value.


Question 2 - KNIME
Linear Regression Equation:
num_rings =
	sex=I          * -0.8248762648052554  +
	sex=M          * 0.057715674939701284 +
	length         * -0.45833541624125296 +
	diameter       * 11.075102542904558   +
	height         * 10.761536699123804   + 
	whole_weight   * 8.975444620485794    +
	shucked_weight * -19.7868668634496    +
	viscera_weight * -10.58182703416007   +
	shell_weight   * 8.74180579669353     +
	3.8946414238675753


Question 3 - RapidMiner
Linear Regression Equation:
num_rings =
	length	       *	 -11.932680954609358 +
	diameter	       *	 25.766147216231733  +
	height	       *	 20.358233950789312  +
	2.8364790622857248
