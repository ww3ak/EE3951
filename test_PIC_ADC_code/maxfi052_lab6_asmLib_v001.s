/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: assembly program with
 *   functions that are accessible in the
 *   main C program files
 * References/Code Citations: David Orser
 */
    
.include "xc.inc"

.text   ;BP (put the following data in ROM(program memory))

.global _lpm_delay1ms, _lpm_delay1us
    
_lpm_delay1ms:
    ; When called, causes a 1 ms delay
    repeat #15996
    nop
    return

_lpm_delay1us:
    ; When called, causes a 1 us delay
    repeat #12
    nop
    return



