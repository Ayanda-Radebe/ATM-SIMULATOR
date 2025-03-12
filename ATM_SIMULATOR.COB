      ******************************************************************
      * Author: Ayanda Radebe
      * Date: 10 March 2025
      * Purpose: ATM simulator for transactions, withdraws, deposits
      *          checks-balance.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATM-SIMULATOR.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 CARD-NUMBER PIC X(16).
       01 PIN PIC X(4).
       01 ACCOUNT-BALANCE PIC 9(10) VALUE 100000.
       01 TRANSACTION-AMOUNT PIC 9(10).
       01 USER-CHOICE PIC 9.
       01 TRANSFER PIC X(16).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Welcome to the ATM Simulator ".
            PERFORM AUTHENTICATE-USER.
            PERFORM DISPLAY-MENU.
            STOP RUN.

       AUTHENTICATE-USER.
           DISPLAY "Enter card number; ".
           ACCEPT CARD-NUMBER.
           DISPLAY "Enter PIN: ".
           ACCEPT PIN.
           IF CARD-NUMBER NOT = "1234567890123456" OR
               PIN NOT = "1234"
                DISPLAY "Invalid card number or PIN. Please try again."
                PERFORM AUTHENTICATE-USER
           END-IF.


       DISPLAY-MENU.
           DISPLAY "1. Withdraw".
           DISPLAY "2. Deposit".
           DISPLAY "3. Check Balance".
           DISPLAY "4. Exit".
           ACCEPT USER-CHOICE.
           PERFORM PROCESS-USER-CHOICE.


       PROCESS-USER-CHOICE.
           IF USER-CHOICE = 1 THEN
               PERFORM WITHDRAWAL
           ELSE
               IF USER-CHOICE = 2 THEN
               PERFORM DEPOSIT
           ELSE
               IF USER-CHOICE = 3 THEN
               PERFORM CHECK-BALANCE
           ELSE
               IF USER-CHOICE = 4 THEN
                   DISPLAY "Thank you for using the ATM Simulator!"
                   STOP RUN
           ELSE
               DISPLAY "Invalid choice, Please try again"
               PERFORM DISPLAY-MENU
           END-IF.


       WITHDRAWAL.
           DISPLAY "Enter withdrawal amount: "
           ACCEPT TRANSACTION-AMOUNT
           IF TRANSACTION-AMOUNT > ACCOUNT-BALANCE
               DISPLAY "Insufficient funds!"
           ELSE
               SUBTRACT TRANSACTION-AMOUNT FROM ACCOUNT-BALANCE
               DISPLAY "Withdrawal successful!"
               DISPLAY "New balance: " ACCOUNT-BALANCE
           END-IF.
           PERFORM DISPLAY-MENU.


       DEPOSIT.
           DISPLAY "Enter deposit amount:".
           ACCEPT TRANSACTION-AMOUNT.
           ADD TRANSACTION-AMOUNT TO ACCOUNT-BALANCE.
           DISPLAY "Deposit successful!".
               DISPLAY "New balance: " ACCOUNT-BALANCE.
           PERFORM DISPLAY-MENU.


       CHECK-BALANCE.
           DISPLAY "Your current balance is: " ACCOUNT-BALANCE.
           PERFORM DISPLAY-MENU.


       END PROGRAM ATM-SIMULATOR.
