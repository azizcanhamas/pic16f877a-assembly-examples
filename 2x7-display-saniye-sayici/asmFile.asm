;B portuna bagli 2x7 displayde 00-59 arasi saniye sayan uygulama
    
    #include <p16f877A.inc>
    
    SOL_SAYAC EQU 0X20
    SAG_SAYAC EQU 0X21
    
    G1 EQU 0X22
    G2 EQU 0X23
    G3 EQU 0X24
 
    ORG 0X00
    GOTO SETUP
    
    SETUP
	BANKSEL TRISB
	CLRF TRISB
	CLRF TRISC
	BANKSEL PORTB
	CLRF PORTB
	CLRF PORTC
	
	MOVLW .5
	MOVWF SOL_SAYAC
	
	MOVLW .9
	MOVWF SAG_SAYAC
	
	GOTO MAIN
	
    MAIN
	CALL DISPLAY_GORUNTULE
	CALL AZALT
	
	GOTO MAIN
	
    AZALT
	DECF SAG_SAYAC,1
	MOVFW SAG_SAYAC
	SUBLW 0XFF
	BTFSC STATUS,Z
	CALL SOL_AZALT
	RETURN
	
    SOL_AZALT
	DECF SOL_SAYAC,1
	MOVLW .9
	MOVWF SAG_SAYAC
	RETURN
	
    DISPLAY_GORUNTULE
	BSF PORTC,0
	BSF PORTC,1
	
	MOVFW SOL_SAYAC
	CALL LOOK_UP_TABLE
	MOVWF PORTB
	
	BSF PORTC,1
	BCF PORTC,0
	CALL GECIKME
	
	BSF PORTC,0
	BSF PORTC,1
	
	MOVFW SAG_SAYAC
	CALL LOOK_UP_TABLE
	MOVWF PORTB
	
	BSF PORTC,0
	BCF PORTC,1
	CALL GECIKME
	
	RETURN
	
    LOOK_UP_TABLE
	ADDWF PCL,1
	RETLW 0X3F
	RETLW 0X06
	RETLW 0X5B
	RETLW 0X4F
	RETLW 0X66
	RETLW 0X6D
	RETLW 0X7D
	RETLW 0X07
	RETLW 0X7F
	RETLW 0X6F
	
    GECIKME
	MOVLW 0XFF
	MOVWF G1
	
	MOVLW 0XFF
	MOVWF G2
	
	MOVLW 0X02
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

