/*
/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: main C program with functions
 *   that use the lcdDisplay program files 
 * References/Code Citations: David Orser
 */

#include "xc.h"
#include "maxfi052_lab6_cirBuffer_v001.h"
#include "maxfi052_lab6_lcdDisplay_v001.h"
#include "maxfi052_lab6_adc_v001.h"
#include "maxfi052_lab6_asmLib_v001.h"

// CW1: FLASH CONFIGURATION WORD 1 (see PIC24 Family Reference Manual 24.1)
#pragma config ICS = PGx1          // Comm Channel Select (Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1)
#pragma config FWDTEN = OFF        // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config GWRP = OFF          // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF           // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF        // JTAG Port Enable (JTAG port is disabled)


// CW2: FLASH CONFIGURATION WORD 2 (see PIC24 Family Reference Manual 24.1)
#pragma config I2C1SEL = PRI       // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF       // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = ON       // Primary Oscillator I/O Function (CLKO/RC15 functions as I/O pin)
#pragma config FCKSM = CSECME      // Clock Switching and Monitor (Clock switching is enabled, 
                                       // Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL      // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))

volatile int lcdUpdate = 0; // keeps track of when the LCD display needs to be updated
                            // (every 100 ms it will be set to 1)
void setup_lcd(void) {
    // Sets up the PIC24 to communicate with the lcd display with I2C1.
    CLKDIVbits.RCDIV = 0; // 16 MHz instruction clock
    AD1PCFG |= 0b0000000001100000; // LATB5 and LATB6 are digital
    TRISBbits.TRISB5 = 0; // output
    TRISBbits.TRISB6 = 0; // output
    LATBbits.LATB5 = 0; // heart beat LED initialized to on
    lcd_reset(); // reset the lcd display
    I2C1CON = 0x0000; // initialize and configure I2C1
    I2C1STAT = 0x0000; // initialize I2C1
    _I2CEN = 0; // disable I2C1
    I2C1BRG = 157; // set baud rate of I2C1
    _I2CEN = 1; // enable I2C1
    _MI2C1IF = 0; // clear _MI2C1IF (interrupt flag)
}

void tester(void) {
    AD1PCFG |= 0b0000000010000000;
    TRISBbits.TRISB7 = 0; // output
    LATBbits.LATB7 = 0;
}

void timer2init(void) {
    // Initializes Timer 2 to have a 1:64 prescale
    //  and PR2 so that Timer 2 interrupts every 100 ms.
    //  Timer 2 controls when LCD Display is updated,
    //  which will be every 100 ms.
    T2CON = 0x0020;
    PR2 = 24999;
    TMR2 = 0;
    T2CONbits.TON = 1;
    IEC0bits.T2IE = 1;
}

void _ISR _T3Interrupt() {
    // Interrupt Service Routine for Timer 3
    //  that clears the interrupt flag.
    IFS0bits.T3IF = 0;
}

void _ISR _T2Interrupt() {
    // Interrupt Service Routine for Timer 2
    //  that clears the interrupt flag and 
    //  sets lcdUpdate to 1 so that the LCD
    //  display will be updated in main.
    IFS0bits.T2IF = 0;
    lcdUpdate = 1;
}

void _ISR _ADC1Interrupt() {
    // Will interrupt at the completion of every
    //  sample/convert sequence. Clears the interrupt
    //  flag and puts the value in ADC1BUF0, which is where
    //  the result of the last sample/convert sequence will
    //  be, in the circular buffer.
    IFS0bits.AD1IF = 0;
    //LATBbits.LATB7 = 1;
    putVal(ADC1BUF0);
    //LATBbits.LATB7 = 0;
}

void delay(int delay_in_ms) { 
    // Calls ASM function lpm_delay1ms() a variable
    //  number of times to cause a delay.
    //  delay_in_ms: int representing the number of ms
    //  to delay (and number of times to call lpm_delay1ms())
    int n = delay_in_ms; // copy of parameter delay_in_ms so that delay_in_ms is unmodified
    while (n > 0) {
        lpm_delay1ms();
        n = n - 1;
    }
}

void toggleLED(void) {
    // Toggles the heart beat LED, which is connected to RB5.
    //  Function is called at the beginning and end of lcd_cmd() and
    //  lcd_printChar(char myChar). This causes the LED to flicker
    //  between LCD updates.
    LATBbits.LATB5 = ~LATBbits.LATB5; // toggle heart beat LED
}

int main(void) {
    // setup and initialize all timers, the LCD display,
    //  the circular buffer, and the analog to digital conversion
    setup_lcd();
    lcd_init();
    lcd_setCursor(0,0);
    initBuffer();
    adc_init();
    adc_timer3init();
    timer2init();
    //tester();
    
    int average = 0; // will be the last average value from the circular buffer as an int
    
    while (1) { // forever loop
        if (lcdUpdate) { // will be set to 1 in Timer 2
                         // interrupt every 100 ms
            //LATBbits.LATB7 = 1;
            average = getAvg();
            char adStr[20];
            sprintf(adStr, "%6.4f V", (3.3 / 1024) * average); // convert floating point average
                                                           // to a string so it can be displayed
                                                           // on the LCD display
            lcd_clearDisplay();
            lcd_printStr(adStr);
            //LATBbits.LATB7 = 0;
            lcdUpdate = 0;
        }
    }
    
    return 0;
}
