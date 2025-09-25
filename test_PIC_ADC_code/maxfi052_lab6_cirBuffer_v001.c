/*
 * Date: 11/21/2024
 * Name: Lindsay Maxfield
 * Student ID number: 5833559
 * Course number: EE 2361
 * Term: Fall 2024
 * Lab/assignment number: Lab 6
 * Short Program Description: C program with functions
 *   for the circular buffer that are accessible in the
 *   main C program file
 * References/Code Citations: David Orser
 */

#include "xc.h"
#include "maxfi052_lab6_cirBuffer_v001.h"

#define BUFFERSIZE 256 // size of the buffer as a compiler definition

volatile unsigned int front; // Points to the next index of the circular buffer to write to.
volatile unsigned int back; // Points to index 0 of the circular buffer until at least 128 samples 
                            // have been added to the buffer. After 128 samples have been added,
                            // back points to the first index of the buffer to read so that only 128
                            // samples are read.
volatile unsigned long cirBuffer[BUFFERSIZE]; // Circular buffer, using a compiler definition to declare
                                              // the size of the buffer. The buffer will hold the last 256 
                                              // samples, but at most 128 will be read when taking the average.
volatile int over128Samples = 0; // Keeps track of whether or not over 128 samples
                                 // have been added to the circular buffer. Once
                                 // 128 samples have been added, over128Samples is 1
                                 // and will stay 1.

void initBuffer(void) {
    // Initializes the circular buffer
    //  so that the front and back pointers
    //  are set to zero and all of the values
    //  in the buffer are zero.
    front = 0;
    back = 0;
    for (int i = 0; i < BUFFERSIZE; i++) { // uses a compiler definition
        cirBuffer[i] = 0;
    }
}

void putVal(int newValue) {
    // Adds the given value to the circular buffer and updates
    //  the front pointer, keeping track of whether of not over 128
    //  values have been added to the buffer. If over 128 samples have
    //  been added to the buffer, the back pointer is also updated.
    //  newValue: The given value to be added to the circular buffer as an int.
    cirBuffer[front++] = newValue;
    front &= (BUFFERSIZE - 1); // uses a compiler definition
    if (front >= 128) {
        over128Samples = 1;
    }
    if (over128Samples) {
        back++;
        back &= (BUFFERSIZE - 1); // uses a compiler definition
    }
}

int getAvg(void) {
    // Gets the average of the last 128 samples that
    //  have been added to the circular buffer.
    unsigned int sum = 0; // the total of the last numElements
                          // elements in the circular buffer
    int numElements = 0; // number of elements in the circular buffer
                         // that have been added to the sum
    
    for (int i = back; i != (front - 1); (++i) & BUFFERSIZE - 1) { // uses a compiler definition
        numElements += 1;
        sum += cirBuffer[i];
    }
    
    return (sum / numElements); // average
}