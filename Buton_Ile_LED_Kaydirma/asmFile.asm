;C0 pinine bagli butona basinca PORTB'deki degeri saga, C1 
;pinine bagli butona basinca PORTB'deki degeri saga kaydiran program

#include <p16f877A.inc>
    
    G1 EQU 0X20
    G2 EQU 0X21
    G3 EQU 0X22
    
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	MOVLW 0XFF
	MOVWF TRISC
	BANKSEL PORTB
	CLRF PORTB
	
	MOVLW 0X01
	MOVWF PORTB
	
	BCF STATUS,C
	
	GOTO MAIN
	
    MAIN
	BTFSC PORTC,0
	CALL SAGA_KAY
	BTFSC PORTC,1
	CALL SOLA_KAY
	CALL GECIKME
	GOTO MAIN
	
    SAGA_KAY
	RRF PORTB,1
	RETURN
	
    SOLA_KAY
	RLF PORTB,1
	RETURN
	
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
