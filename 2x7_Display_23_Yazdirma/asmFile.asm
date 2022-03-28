;Enable girisleri RC0,RC1 olan PORTB'ye bagli 2x7 segmentli ortak anotlu
;display'e '23' sayisini yazan program
    
    #include <p16f877A.inc>
    
    G1 EQU 0X20
    G2 EQU 0X21
    G3 EQU 0X22
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	CLRF TRISC
	BANKSEL PORTB
	CLRF PORTB
	MOVLW 0XFF
	MOVWF PORTC
	
	GOTO MAIN
	
    MAIN
	BSF PORTC,0
	BSF PORTC,1
	
	MOVLW 0X5B
	MOVWF PORTB
	
	BSF PORTC,1
	BCF PORTC,0
	CALL GECIKME
	
	BSF PORTC,0
	BSF PORTC,1
	
	MOVLW 0X4F
	MOVWF PORTB
	
	BSF PORTC,0
	BCF PORTC,1
	CALL GECIKME
	
	GOTO MAIN
	
    GECIKME
	MOVLW 0XFF
	MOVWF G1
	
	MOVLW 0X1A
	MOVWF G2
	
	AA:
	    DECFSZ G1,1
	    GOTO AA
	    
	    DECFSZ G2,1
	    GOTO AA
	    
	RETURN
	
    END


