;PORTB'deki '00000001' degerini sola dogru kaydiran, 7. bite geldikten sonra
;tekrar 0. bite gelmesini saglayan program
    
    #include <p16f877A.inc>
    
    G1 EQU 0X20
    G2 EQU 0X21
    G3 EQU 0X22
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	
	MOVLW 0X03
	MOVWF PORTB
	
	BCF STATUS,C
	
	GOTO MAIN
	
    MAIN
	SD:
	CALL GECIKME
	RLF PORTB,1
	BTFSS PORTB,7
	GOTO SD
	DF:
	CALL GECIKME
	RRF PORTB,1
	BTFSS PORTB,0
	GOTO DF
	
	
	GOTO MAIN
	
    GECIKME
	MOVLW 0XFF
	MOVWF G1
	
	MOVLW 0XFF
	MOVWF G2
	
	MOVLW 0X01
	MOVWF G3
	
	AA:
	    DECFSZ G1,1
	    GOTO AA
	    
	    DECFSZ G2,1
	    GOTO AA
	    
	    DECFSZ G3,1
	    GOTO AA
	
	RETURN
	    
    END


