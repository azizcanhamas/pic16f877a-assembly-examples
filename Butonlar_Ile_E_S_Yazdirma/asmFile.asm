; D0 pinine bagli butona basinca katot display'e 'E'
; D1 pinine bagli butona basinca katot display'e 'S' yazan uygulama
    
    #include <p16f877A.inc>
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	MOVLW 0XFF
	MOVWF TRISD
	BANKSEL PORTB
	CLRF PORTB
	GOTO MAIN
	
    MAIN
	BTFSC PORTC,0
	CALL E_YAZ
	BTFSC PORTC,1
	CALL S_YAZ
	MOVLW 0XFF

	GOTO MAIN
	
    E_YAZ
	MOVLW 0x79
	MOVWF PORTB
	RETURN
	
    S_YAZ
	MOVLW 0x6D
	MOVWF PORTB
	RETURN
	
    END


