;Deger1 (24) sayisi ile Deger2 (4) sayisini carpip sonucu PORTB'de gosteren uygulama
    
    #include <p16f877A.inc>
    
    D1 EQU 0X20
    D2 EQU 0X21
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	
	MOVLW .24
	MOVWF D1
	
	MOVLW .4
	MOVWF D2
	
	CLRW
	
	GOTO MAIN
	
    MAIN
	XX:
	    ADDWF D1,0
	    DECFSZ D2,1
	    GOTO XX
	
	MOVWF PORTB
	  
	GG
	    GOTO GG
	
	GOTO MAIN
	
    END


