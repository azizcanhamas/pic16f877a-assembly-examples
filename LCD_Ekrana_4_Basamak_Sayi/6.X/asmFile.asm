#include <p16f877A.inc>
    
    G1	    EQU 0X20
    VERI    EQU 0X21
    TMP	    EQU 0X22
	   
    BASAMAK_1 EQU 0X23
    BASAMAK_2 EQU 0X24
    BASAMAK_3 EQU 0X25
    BASAMAK_4 EQU 0X26
 
    SAYI_L EQU 0X27
    SAYI_H EQU 0X28
	    
    ORG 0X00
    GOTO BASLA
    
    LCD_AYAR
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	
	BCF PORTB,4
	
	MOVLW 0X02
	CALL GONDER
	
	MOVLW 0X28
	CALL GONDER
	
	MOVLW 0X01
	CALL GONDER
	
	MOVLW 0X10
	CALL GONDER
	
	MOVLW 0X06
	CALL GONDER
	
	MOVLW 0X0D
	CALL GONDER
	
	RETURN
	
    TETIKLEME
	BANKSEL PORTB
	BSF PORTB,5
	CALL GECIKME_200USN
	BCF PORTB,5
	RETURN
	
    GECIKME_200USN
	MOVLW 0XC8
	MOVWF G1
	AR:	
	    DECFSZ G1,1
	    GOTO AR
	RETURN
	
    GONDER
	MOVWF VERI
	SWAPF VERI,0
	ANDLW 0X0F
	MOVWF TMP
	MOVFW PORTB
	ANDLW 0XF0
	IORWF TMP,0
	MOVWF PORTB
	CALL TETIKLEME
	
	MOVFW VERI
	ANDLW 0X0F
	MOVWF TMP
	MOVFW PORTB
	ANDLW 0XF0
	IORWF TMP,0
	MOVWF PORTB
	CALL TETIKLEME
	
	RETURN
	
    CEVIR
	MOVF SAYI_H,F
	BTFSC STATUS,Z
	GOTO ATLA
	CALL CEVIR_2
	RETURN
	ATLA
	    CALL CEVIR_1
	RETURN
	
    CEVIR_2
	MOVFW SAYI_L
	MOVWF TMP
	T2
	    INCF BASAMAK_1,1
	    MOVLW .255
	    MOVWF SAYI_L
	    CALL CEVIR_1
	    DECFSZ SAYI_H,1
	    GOTO T2
	MOVFW TMP
	MOVWF SAYI_L
	CALL CEVIR_1
	RETURN
	    
	
    CEVIR_1
	MOVF SAYI_L,F
	BTFSC STATUS,Z
	RETURN
	
	DECF SAYI_L,1
	INCF BASAMAK_1,1
	MOVLW .10
	SUBWF BASAMAK_1,0
	BTFSS STATUS,Z
	GOTO CEVIR_1
	
	CLRF BASAMAK_1
	INCF BASAMAK_2,1
	MOVLW .10
	SUBWF BASAMAK_2,0
	BTFSS STATUS,Z
	GOTO CEVIR_1
	
	CLRF BASAMAK_2
	INCF BASAMAK_3,1
	MOVLW .10
	SUBWF BASAMAK_3,0
	BTFSS STATUS,Z
	GOTO CEVIR_1
	
	CLRF BASAMAK_3
	INCF BASAMAK_4,1
	MOVLW .10
	SUBWF BASAMAK_4,0
	BTFSS STATUS,Z
	GOTO CEVIR_1
	
	RETURN
    
    ASCII_LOOKUP
	ADDWF PCL,1
	RETLW 0X30
	RETLW 0X31
	RETLW 0X32
	RETLW 0X33
	RETLW 0X34
	RETLW 0X35
	RETLW 0X36
	RETLW 0X37
	RETLW 0X38
	RETLW 0X39
	
    BASLA
	CALL LCD_AYAR
	BSF PORTB,4
	
	MOVLW .3
	MOVWF SAYI_H
	
	MOVLW .255
	MOVWF SAYI_L
	CALL CEVIR
	
	MOVFW BASAMAK_4
	CALL ASCII_LOOKUP
	CALL GONDER
	
	MOVFW BASAMAK_3
	CALL ASCII_LOOKUP
	CALL GONDER
	
	MOVFW BASAMAK_2
	CALL ASCII_LOOKUP
	CALL GONDER
	
	MOVFW BASAMAK_1
	CALL ASCII_LOOKUP
	CALL GONDER
	
	
	GG
	    GOTO GG
	    
    END


