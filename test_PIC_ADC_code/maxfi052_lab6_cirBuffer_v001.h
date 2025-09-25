/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: header file that declares
 *   circular buffer C functions
 * References/Code Citations: David Orser
 */

#ifndef maxfi052_lab6_cirBuffer_v001_H
#define	maxfi052_lab6_cirBuffer_v001_H

#include <xc.h> // include processor files - each
                // processor file is guarded.  

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */
void initBuffer(void);
void putVal(int newValue);
int getAvg(void);
#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* maxfi052_lab6_cirBuffer_v001_H */
