/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: C program with functions for the
 *   analog to digital conversion that are accessible in the
 *   main C program file
 * References/Code Citations: David Orser
 */

#include "xc.h"
#include "maxfi052_lab6_adc_v001.h"
#include <stdio.h>

# define K 256 // Number of samples per second. 
               // Has to be greater than or equal to 16.

void adc_init(void) {
    // Initializes AD1 to not scan inputs, AN0 as positive input for AD1,
    //  auto-set SAMP bit, Timer3 compare ends sampling and starts conversion,
    //  TAD = 125 ns, AD1 is turned on, and ADC1Interrupt is enabled.
    AD1PCFG &= 0b1111111111111110; // AN0 to analog
    AD1CON1 = 0x0044; // SSRC = 010, ASAM = 1, all others are 0
    AD1CON2 = 0x0000;
    AD1CON3 = 0x1F01; // SAMC = 11111 = 31TAD(just incase),
                      // ADCS = 00000001 (TAD = 2*TCY = 125 ns)
    AD1CSSL = 0x0000; // not scanning inputs, so not used
    AD1CHS = 0x0000; // Channel 0 positive input is AN0
    AD1CON1bits.ADON = 1; // Turn on AD1
    IFS0bits.AD1IF = 0; // clear ADC1Interrupt flag
    IEC0bits.AD1IE = 1; // Enable ADC1Interrupt
}

void adc_timer3init(void) {
    // Initializes Timer 3 to have a 1:64 prescale
    //  and PR3 that is configured by the number
    //  of samples per second, which is the compiler definition, K.
    //  Timer 3 controls when to stop sampling and start converting.
    T3CON = 0x0020;
    PR3 = (15624 / (K / 16)) - 1; // uses a compiler definition
    TMR3 = 0;
    IFS0bits.T3IF = 0;
    T3CONbits.TON = 1;
    IEC0bits.T3IE = 1;
}

