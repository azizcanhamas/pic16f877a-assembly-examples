;7 segmentli ortak katotlu display'e 2 sayisini yazan program
    
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
	MOVLW 0X5B
	MOVWF PORTB
	GOTO MAIN
	
    END
    


