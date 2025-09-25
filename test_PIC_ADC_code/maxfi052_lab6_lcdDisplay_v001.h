/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: header file that declares
 *   lcd display C functions
 * References/Code Citations: David Orser
 */

#ifndef maxfi052_lab6_lcdDisplay_v001_H
#define	maxfi052_lab6_lcdDisplay_v001_H

#include <xc.h> // include processor files - each
                // processor file is guarded.  

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */
void lcd_cmd(char command);
void lcd_init(void);
void lcd_clearDisplay(void);
void lcd_reset(void);
void lcd_setCursor(char x, char y);
void lcd_printChar(char myChar);
void lcd_printStr(const char * str);
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* maxfi052_lab6_lcdDisplay_v001_H */
