/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: header file that declares
 *   adc C functions
 * References/Code Citations: David Orser
 */

#ifndef maxfi052_lab6_adc_v001_H
#define	maxfi052_lab6_adc_v001_H

#include <xc.h> // include processor files - each
                // processor file is guarded.  

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */
void adc_init(void);
void adc_timer3init(void);
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* maxfi052_lab6_adc_v001_H */
