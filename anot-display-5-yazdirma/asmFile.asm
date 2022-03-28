;7 segmentli ortak anotlu display'e 5 sayisini yazan uygulama
    
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
	MOVLW 0X92
	MOVWF PORTB
	GOTO MAIN
	
    END
    


