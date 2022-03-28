;RB0 kesmesi gerceklestiginde C portuna bagli LED'leri yakan program
    
    #include <p16f877A.inc>
    
    ORG 0X00
    GOTO SETUP
    
    ORG 0X04
    GOTO KESME
    
    KESME
	BCF INTCON,INTF
	MOVLW 0XFF
	XORWF PORTC,1
	RETFIE
    
    SETUP
	BANKSEL TRISB
	MOVLW 0XFF
	MOVWF TRISB
	CLRF TRISC
	BANKSEL PORTB
	CLRF PORTC
	
	BSF INTCON,GIE
	BSF INTCON,INTE
	
	GOTO MAIN
	
    MAIN
	GOTO MAIN
	
    END


