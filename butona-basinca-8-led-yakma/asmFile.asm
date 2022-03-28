;PORTB'ye bagli 8 LED'i PORTC'nin 5. bitine bagli butonla yakan program
    
    #include <p16f877A.inc>
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	MOVLW 0XFF
	MOVWF TRISC
	BANKSEL PORTB
	CLRF PORTB
	
	GOTO MAIN
	
    MAIN
	BTFSC PORTC,5
	CALL YAK
	GOTO MAIN
	
    YAK
	MOVLW 0XFF
	MOVWF PORTB
	RETURN
	
    END	


