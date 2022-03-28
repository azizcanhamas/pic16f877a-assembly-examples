#include <p16f877A.inc>
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	GOTO MAIN
	
    MAIN
	MOVLW 0Xa4
	MOVWF PORTB
	GOTO MAIN
	
    ASCII_LOOKUP
	ADDWF PCL,1
	RETLW 0XC0
	RETLW 0XF9
	RETLW 0XA4

	
    END


