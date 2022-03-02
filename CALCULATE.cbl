       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATE.
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT CAL-REPORT ASSIGN TO "finalreport.dat".

       DATA DIVISION.

       FILE SECTION. 

        FD CAL-REPORT.
        01 CAL-PRINT-LINE   PIC X(132). 

       WORKING-STORAGE SECTION.
       01 numberOne      pic 9(2).
       01 numberTwo      pic 9(2).
       01 addResult      pic 9(3).
       01 subResult      pic 9(2).
       01 multResult     pic 9(4).
       01 divResult      pic 9(2)V99.

       01 CAL-HEADING1.
           05 FILLER     PIC X(2) VALUE SPACES.
           05 FILLER     PIC X(10) VALUE "1st Number".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(10) VALUE "2nd Number".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "add res".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "sub res".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "mul res".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "div res".
           05 FILLER     PIC X(57) VALUE SPACES.    
       
       01 CAL-HEADING2.
           05 FILLER     PIC X(2) VALUE SPACES.
           05 FILLER     PIC X(10) VALUE "----------".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(10) VALUE "----------".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "-------".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "-------".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "-------".
           05 FILLER     PIC X(5) VALUE SPACES.
           05 FILLER     PIC X(7) VALUE "-------".
           05 FILLER     PIC X(57) VALUE SPACES.

       01 CAL-DET-LINE.
           05 FILLER     PIC X(2) VALUE SPACES.
           05 DET-NUMONE PIC 9(4).
           05 FILLER     PIC X(11) VALUE SPACES.
           05 DET-NUMTWO PIC 9(4).
           05 FILLER     PIC X(11) VALUE SPACES.
           05 DET-ADDRES PIC 9(4).
           05 FILLER     PIC X(8) VALUE SPACES.
           05 DET-SUBRES PIC 9(4).
           05 FILLER     PIC X(8) VALUE SPACES.
           05 DET-MULRES PIC 9(4).
           05 FILLER     PIC X(8) VALUE SPACES.
           05 DET-DIVRES PIC 9(4)V99.
           05 FILLER     PIC X(60) VALUE SPACES. 

                

       PROCEDURE DIVISION.
       
       0100-WRITE-HEADING.
           OPEN OUTPUT CAL-REPORT.
           MOVE CAL-HEADING1 TO CAL-PRINT-LINE.
           WRITE CAL-PRINT-LINE AFTER ADVANCING 1 LINE.
           MOVE CAL-HEADING2 TO CAL-PRINT-LINE.
           WRITE CAL-PRINT-LINE AFTER ADVANCING 1 LINE.
           PERFORM 0110-INPUT-NUMBERS.
           PERFORM 0110-INPUT-NUMBERS.
           PERFORM 0110-INPUT-NUMBERS.
           PERFORM 0110-INPUT-NUMBERS.

       0110-INPUT-NUMBERS.
           DISPLAY "What do you want number 1 to be? ".
           ACCEPT numberOne.
           DISPLAY "What do you want number 2 to be? ".
           ACCEPT numberTwo.

           COMPUTE addResult = numberOne + numberTwo.
           DISPLAY "Addition result is ", addResult.

           COMPUTE subResult = numberOne - numberTwo.
           DISPLAY "Subtraction result is ", subResult.

           COMPUTE multResult = numberOne * numberTwo.
           DISPLAY "Multiplication result is ", multResult.

           COMPUTE divResult = numberOne / numberTwo.
           DISPLAY "Division result is ", divResult.

           MOVE numberOne TO DET-NUMONE.
           MOVE numberTwo TO DET-NUMTWO.
           MOVE addResult TO DET-ADDRES.
           MOVE subResult TO DET-SUBRES.
           MOVE multResult TO DET-MULRES.
           MOVE divResult TO DET-DIVRES.

           MOVE CAL-DET-LINE TO CAL-PRINT-LINE.
           WRITE  CAL-PRINT-LINE AFTER ADVANCING 1 LINE.


       0120-END-RUN.
           CLOSE CAL-REPORT.
           STOP RUN.
       END PROGRAM CALCULATE.