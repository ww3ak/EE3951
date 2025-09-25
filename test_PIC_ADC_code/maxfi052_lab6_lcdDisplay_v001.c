/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: C program with functions
 *   for the LCD Display that are accessible in the main
 *   C program file
 * References/Code Citations: David Orser
 */

#include "xc.h"
#include "maxfi052_lab6_lcdDisplay_v001.h"

#define LCDADDY 0b00111100 // Base address with SA0 line pulled low (7-bits)
#define LCDADDY_WRIT (LCDADDY << 1) & 0b11111110 // Address + R/nW (0)
#define LCDADDY_READ (LCDADDY << 1) | 0b00000001 // Address + R/nW (1)

#define CONTRAST 0x7A // makes contrast adjustable

void lcd_cmd(char command) {
    // Takes a single byte/char command and
    //  writes it out the I2C bus. The complete I2C
    //  transaction should consists of a START bit, an address
    //  with R/nW byte, a control byte, a command/data byte,
    //  and a STOP bit.
    //  command: given byte/char that will be written out
    //           the I2C bus to the lcd display
    toggleLED();
    I2C1CONbits.SEN = 1;
    while(I2C1CONbits.SEN);
    
    I2C1TRN = LCDADDY_WRIT; // 8-bits = the target address and the R/nW bit
                            // uses compiler definition
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);
    
    I2C1TRN = 0b00000000; // 8-bits = control byte, Co=0, D/nC=0
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);
    
    I2C1TRN = command; // 8-bits consisting of the data byte
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);

    I2C1CONbits.PEN = 1;
    while(I2C1CONbits.PEN);
    toggleLED();
}

void lcd_init() {
    // Implements lcd_cmd() writes to initialize the lcd
    //  display and configure the lcd display to 2 line
    //  double height mode, and then clears the display.
    lcd_cmd(0x3A);
    lcd_cmd(0x09);
    lcd_cmd(0x06);
    lcd_cmd(0x1E);
    lcd_cmd(0x39);
    lcd_cmd(0x1B);
    lcd_cmd(0x6E);
    lcd_cmd(0x56);
    lcd_cmd(CONTRAST); // uses compiler definition
    lcd_cmd(0x38);
    lcd_cmd(0x0F);
    
    // configure for 2 line double height mode
    lcd_cmd(0x3A);
    lcd_cmd(0x09);
    lcd_cmd(0x1A);
    lcd_cmd(0x3C);
    
    // clear display
    lcd_clearDisplay();
}

void lcd_clearDisplay(void) {
    // Implements an lcd_cmd() write to
    //  clear the lcd display.
    lcd_cmd(0x01);
}

void lcd_reset(void) {
    // Resets the lcd display (the LCD reset
    //  is connected to RB6).
    LATBbits.LATB6 = 0;
    delay(2);
    LATBbits.LATB6 = 1;
    delay(2);
}

void lcd_setCursor(char x, char y) {
    // Moves the cursor on the lcd display to row x,
    //  column y with a single lcd_cmd() statement
    //  with a masked and calculated command.
    //  x: row number to move cursor to as a char.
    //  y: column number to move cursor to as a char.
    unsigned char cursor_command = (0x20 * x) + y;
    cursor_command |= 0x80;
    lcd_cmd(cursor_command);
}

void lcd_printChar(char myChar) {
    // Prints the given character to the lcd display.
    //  myChar: character to print to the lcd display.
    toggleLED();
    I2C1CONbits.SEN = 1;
    while(_SEN);
    
    I2C1TRN = LCDADDY_WRIT; // 8-bits = the target address and the R/nW bit
                            // uses compiler definition
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);
    
    I2C1TRN = 0b01000000; // 8-bits = control byte, Co=0, D/nC=1
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);
    
    I2C1TRN = myChar; // 8-bits consisting of the data byte
    _MI2C1IF = 0;
    while(!_MI2C1IF || _TRSTAT || _ACKSTAT);

    I2C1CONbits.PEN = 1;
    while(I2C1CONbits.PEN);
    toggleLED();
}

void lcd_printStr(const char * str) {
    // Prints the given pointed to string by looping
    //  through the elements of str, calling
    //  lcd_printChar() until the null terminator
    //  of str is encountered.
    //  str: points to the string that will be printed
    //       to the lcd display.
    int i = 0;
    unsigned char currChar = str[i];
    while (currChar != '\0') {
        lcd_printChar(currChar);
        i++;
        currChar = str[i];
    }
}
