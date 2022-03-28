;PORTB'nin 0. pinine bagli butona basildiginda 
;PORTB'nin 4. pinine bagli LED'i yakan program

    #include <p16f877A.inc>
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	MOVLW 0X01
	MOVWF TRISB
	BANKSEL PORTB
	CLRF PORTB
	
	GOTO MAIN
	
    MAIN
	BTFSC PORTB,0
	BSF PORTB,4
	GOTO MAIN
	
    END

