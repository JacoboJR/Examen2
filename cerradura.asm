#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program
i EQU 0x20
j EQU 0x21
k EQU 0x30
m EQU 0x31
q EQU 0x34
mdp1 EQU 0x32
in1 EQU 0x33
in2 EQU 0x40
 ref EQU 0x41
 in3 EQU 0x42
 in4 EQU 0x43
 in5 EQU 0x51
 in6 EQU 0x52
 in7 EQU 0x53
 in8 EQU 0x54
 mdp2 EQU 0x44
 mdp3 EQU 0x45
 mdp4 EQU 0x46
 mdp5 EQU 0x47
 mdp6 EQU 0x48
 mdp7 EQU 0x49
 mdp8 EQU 0x50


 
START
 ;------------------------------------------------------------------------------------------------

    bsf STATUS, RP0 			;	select bank 1 
    movlw b'11110000' 			
    movwf TRISB 
    movlw b'000' 			
    movwf TRISE
    movlw b'11111000'
    movwf TRISD
    movlw 0x00					
    movwf TRISC					
    bcf STATUS, RP0 			;	select bank 0

	
;------------------------------------
pantala_bienvenida
	movlw ' '
	call imprimir2
	movlw 'M'
	call imprimir2
	movlw 'I'
	call imprimir2
	movlw 'C'
	call imprimir2
	movlw 'R'
	call imprimir2
	movlw 'O'
	call imprimir2
	movlw 'S'
	call imprimir2
	movlw '-'
	call imprimir2
	movlw '5'
	call imprimir2
	movlw '0'
	call imprimir2
	movlw '1'
	call imprimir2
	movlw 'C'
	call imprimir2
	movlw 'I'
	call imprimir2
	movlw 'B'
	call imprimir2
	call segundo
	call segundo
	call segundo
	call LCDRESET
	call LCDRESET
	call LCDRESET
;-----------------------------------------------------------------------------------------------------------------
test
	movlw 'C'
	call imprimir2
	movlw 'L'
	call imprimir2
	movlw 'A'
	call imprimir2
	movlw 'V'
	call imprimir2
	movlw 'E'
	call imprimir2
	movlw ':'
	call imprimir2
	
	
	movlw d'10'
	movwf ref
	movlw d'1'
	movwf mdp1
	movlw d'2'
	movwf mdp2
	movlw d'3'
	movwf mdp3
	movlw d'4'
	movwf mdp4
	movlw d'5'
	movwf mdp5
	movlw d'6'
	movwf mdp6
	movlw d'7'
	movwf mdp7
	movlw d'8'
	movwf mdp8
	
	;mdp : 34567890
	
	
	movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	

;Main-------------------------------------------------------------------------------------------------
inicia	
numero1	
	call teclado
	call segundo
	movfw in1
	subwf ref,W
	BTFSC STATUS,Z
	goto numero1
	
	call segundo
	
numero2
	call teclado2
	call segundo
	movfw in2
	subwf ref,W
	BTFSC STATUS,Z
	goto numero2
	
	call segundo
	
numero3
    call teclado3
    call segundo
    movfw in3
    subwf ref,W
    BTFSC STATUS,Z
    goto numero3
	
    call segundo
	
numero4
	call teclado4
	call segundo
	movfw in4
	subwf ref,W
	BTFSC STATUS,Z
	goto numero4
	
	call segundo
	
numero5
	call teclado5
	call segundo
	movfw in5
	subwf ref,W
	BTFSC STATUS,Z
	goto numero5
	
	call segundo
	
numero6
	call teclado6
	call segundo
	movfw in6
	subwf ref,W
	BTFSC STATUS,Z
	goto numero6
	
	call segundo
	
numero7
    call teclado7
    call segundo
    movfw in7
    subwf ref,W
    BTFSC STATUS,Z
    goto numero7

    call segundo
	
numero8
    call teclado8
    call segundo
    movfw in8
    subwf ref,W
    BTFSC STATUS,Z
    goto numero8
	
    call segundo
	

    movfw in1
    subwf mdp1,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta

    movfw in2
    subwf mdp2,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
	
    movfw in3
    subwf mdp3,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
	
    movfw in4
    subwf mdp4,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
	
    movfw in5
    subwf mdp5,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
    
    movfw in6
    subwf mdp6,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
	
    movfw in7
    subwf mdp7,W
    BTFSC STATUS,Z
    goto $+2
    call incorrecta
		
    movfw in8
    subwf mdp8,W
    BTFSC STATUS,Z
    call correcta
    call incorrecta
				
;-----------------------------------------------------------------------------------------------------   
    
    
correcta:
	
    call LCDRESET
    call LCDRESET
    call LCDRESET
    movlw 'C'
    call imprimir
    movlw 'L'
    call imprimir
    movlw 'A'
    call imprimir
    movlw 'V'
    call imprimir
    movlw 'E'
    call imprimir
    movlw ' '
    call imprimir
    movlw 'C'
    call imprimir
    movlw 'O'
    call imprimir
    movlw 'R'
    call imprimir
    movlw 'R'
    call imprimir
    movlw 'E'
    call imprimir
    movlw 'C'
    call imprimir
    movlw 'T'
    call imprimir
    movlw 'A'
    call imprimir
	
    movlw b'001' 			
    movwf PORTE 
	
    goto $

incorrecta:
	call LCDRESET
	call LCDRESET
	call LCDRESET
	movlw 'C'
	call imprimir
	movlw 'L'
	call imprimir
	movlw 'A'
	call imprimir
	movlw 'V'
	call imprimir
	movlw 'E'
	call imprimir
	movlw ' '
	call imprimir
	movlw 'I'
	call imprimir
	movlw 'N'
	call imprimir
	movlw 'C'
	call imprimir
	movlw 'O'
	call imprimir
	movlw 'R'
	call imprimir
	movlw 'R'
	call imprimir
	movlw 'E'
	call imprimir
	movlw 'C'
	call imprimir
	movlw 'T'
	call imprimir
	movlw 'A'
	call imprimir
	movlw b'010' 			
	movwf PORTE 
	
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	movlw b'000' 			
	movwf PORTE 
	call ON
	
;The part which scans keypad-----------------------------------------------------------------------------
 teclado					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
    btfsc PORTA, 6			
    call UNO
    btfsc PORTB, 6			
    call CUATRO		
    btfsc PORTB, 7			
    call SIETE
    bcf PORTB, 0			

    bsf PORTB, 1			
    
    btfsc PORTA, 4			
    CALL CERO				
    btfsc PORTA, 6			
    CALL DOS				
    btfsc PORTB, 6			
    CALL CINCO				
	
    btfsc PORTB, 7			
    CALL OCHO				
    bcf PORTB, 1			
    bsf PORTB, 2			
						
    btfsc PORTA, 6			
    CALL TRES				
		
    btfsc PORTB, 6			
    CALL SEIS				
		
    btfsc PORTB, 7			
    CALL NUEVE				
	
    bcf PORTB, 2			
    return						

CERO:
    movlw d'0'
    movwf in1
    movlw 0x30
    call imprimir
    return 


UNO:
    movlw d'1'
    movwf in1
    MOVLW 0x31
    call imprimir
    return 

DOS:
    movlw d'2'
    movwf in1
    movlw 0x32
    call imprimir
    return 

TRES:
    movlw d'3'
    movwf in1
    movlw 0x33
    call imprimir
    return 

CUATRO:
    movlw d'4'
    movwf in1
    movlw 0x34
    call imprimir
    return 

CINCO:
    movlw d'5'
    movwf in1
    movlw 0x35
    call imprimir
    return 

SEIS:
    movlw d'6'
    movwf in1
    movlw 0x36
    call imprimir
    return 

SIETE:
    movlw d'7'
    movwf in1
    movlw 0x37
    call imprimir
    return 

OCHO:
    movlw d'8'
    movwf in1
    movlw 0x38
    call imprimir
    return 

NUEVE:
    movlw d'9'
    movwf in1
    movlw 0x39
    call imprimir
    return 


    
 teclado2					

    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE2
		
    btfsc PORTB, 6			
    call FOUR2	
		
    btfsc PORTB, 7			
    call SEVEN2
	
    bcf PORTB, 0			

	
    bsf PORTB, 1			
	
    btfsc PORTA, 4			
		
    btfsc PORTA, 6			
    CALL TWO2				
	
    btfsc PORTB, 6			
    CALL FIVE2				
	
    btfsc PORTB, 7			
    CALL EIGHT2				
	
    bcf PORTB, 1			

	
    bsf PORTB, 2			
						
    btfsc PORTA, 6			
    CALL THREE2				
		
    btfsc PORTB, 6		
    CALL SIX2				
		
    btfsc PORTB, 7			
    CALL NINE2				
	
    bcf PORTB, 2			
    return	
ZERO2:
    movlw d'0'
    movwf in2
    movlw 0x30
    call imprimir
    return 


ONE2:
    movlw d'1'
    movwf in2
    MOVLW 0x31
    call imprimir
    return 

TWO2:
    movlw d'2'
    movwf in2
    movlw 0x32
    call imprimir
    return 

THREE2:
    movlw d'3'
    movwf in2
    movlw 0x33
    call imprimir
    return 

FOUR2:
    movlw d'4'
    movwf in2
    movlw 0x34
    call imprimir
    return 

FIVE2:
    movlw d'5'
    movwf in2
    movlw 0x35
    call imprimir
    return 

SIX2:
    movlw d'6'
    movwf in2
    movlw 0x36
    call imprimir
    return 

SEVEN2:
    movlw d'7'
    movwf in2
    movlw 0x37
    call imprimir
    return 

EIGHT2:
    movlw d'8'
    movwf in2
    movlw 0x38
    call imprimir
    return 

NINE2:
    movlw d'9'
    movwf in2
    movlw 0x39
    call imprimir
    return 

teclado3					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE3
		
		
    btfsc PORTB, 6			
    call FOUR3	
    
    btfsc PORTB, 7			
    call SEVEN3
	
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO3				
    btfsc PORTA, 6			
    CALL TWO3					
    btfsc PORTB, 6			
    CALL FIVE3				
	
    btfsc PORTB, 7			
    CALL EIGHT3				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE3				
		
    btfsc PORTB, 6			
    CALL SIX3				
		
    btfsc PORTB, 7			
    CALL NINE3				
	
    bcf PORTB, 2			
	return	
ZERO3:
    movlw d'0'
    movwf in3
    movlw 0x30
    call imprimir
    return 


ONE3:
    movlw d'1'
    movwf in3
    MOVLW 0x31
    call imprimir
    return 

TWO3:
    movlw d'2'
    movwf in3
    movlw 0x32
    call imprimir
    return 

THREE3:
    movlw d'3'
    movwf in3
    movlw 0x33
    call imprimir
    return 

FOUR3:
    movlw d'4'
    movwf in3
    movlw 0x34
    call imprimir
    return 

FIVE3:
    movlw d'5'
    movwf in3
    movlw 0x35
    call imprimir
    return 

SIX3:
    movlw d'6'
    movwf in3
    movlw 0x36
    call imprimir
    return 

SEVEN3:
    movlw d'7'
    movwf in3
    movlw 0x37
    call imprimir
    return 

EIGHT3:
    movlw d'8'
    movwf in3
    movlw 0x38
    call imprimir
    return 

NINE3:
    movlw d'9'
    movwf in3
    movlw 0x39
    call imprimir
    return 

    
teclado4					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE4
		
		
    btfsc PORTB, 6			
    call FOUR4	
    
    btfsc PORTB, 7			
    call SEVEN4
	
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO4				
    btfsc PORTA, 6			
    CALL TWO4					
    btfsc PORTB, 6			
    CALL FIVE4				
	
    btfsc PORTB, 7			
    CALL EIGHT4				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE4				
		
    btfsc PORTB, 6			
    CALL SIX4			
		
    btfsc PORTB, 7			
    CALL NINE4				
	
    bcf PORTB, 2			
	return	
ZERO4:
    movlw d'0'
    movwf in4
    movlw 0x30
    call imprimir
    return 


ONE4:
    movlw d'1'
    movwf in4
    MOVLW 0x31
    call imprimir
    return 

TWO4:
    movlw d'2'
    movwf in4
    movlw 0x32
    call imprimir
    return 

THREE4:
    movlw d'3'
    movwf in4
    movlw 0x33
    call imprimir
    return 

FOUR4:
    movlw d'4'
    movwf in4
    movlw 0x34
    call imprimir
    return 

FIVE4:
    movlw d'5'
    movwf in4
    movlw 0x35
    call imprimir
    return 

SIX4:
    movlw d'6'
    movwf in4
    movlw 0x36
    call imprimir
    return 

SEVEN4:
    movlw d'7'
    movwf in4
    movlw 0x37
    call imprimir
    return 

EIGHT4:
    movlw d'8'
    movwf in4
    movlw 0x38
    call imprimir
    return 

NINE4:
    movlw d'9'
    movwf in4
    movlw 0x39
    call imprimir
    return 
    
    
teclado5					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE5
		
		
    btfsc PORTB, 6			
    call FOUR5	
    
    btfsc PORTB, 7			
    call SEVEN5
	
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO5				
    btfsc PORTA, 6			
    CALL TWO5					
    btfsc PORTB, 6			
    CALL FIVE5				
	
    btfsc PORTB, 7			
    CALL EIGHT5				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE5				
		
    btfsc PORTB, 6			
    CALL SIX5				
		
    btfsc PORTB, 7			
    CALL NINE5				
	
    bcf PORTB, 2			
	return	
	
ZERO5:
    movlw d'0'
    movwf in5
    movlw 0x30
    call imprimir
    return 


ONE5:
    movlw d'1'
    movwf in5
    MOVLW 0x31
    call imprimir
    return 

TWO5:
    movlw d'2'
    movwf in5
    movlw 0x32
    call imprimir
    return 

THREE5:
    movlw d'3'
    movwf in5
    movlw 0x33
    call imprimir
    return 

FOUR5:
    movlw d'4'
    movwf in5
    movlw 0x34
    call imprimir
    return 

FIVE5:
    movlw d'5'
    movwf in5
    movlw 0x35
    call imprimir
    return 

SIX5:
    movlw d'6'
    movwf in5
    movlw 0x36
    call imprimir
    return 

SEVEN5:
    movlw d'7'
    movwf in5
    movlw 0x37
    call imprimir
    return 

EIGHT5:
    movlw d'8'
    movwf in5
    movlw 0x38
    call imprimir
    return 

NINE5:
    movlw d'9'
    movwf in5
    movlw 0x39
    call imprimir
    return 
    
teclado6					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE6
		
		
    btfsc PORTB, 6			
    call FOUR6	
    
    btfsc PORTB, 7			
    call SEVEN6
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO6				
    btfsc PORTA, 6			
    CALL TWO6					
    btfsc PORTB, 6			
    CALL FIVE6				
	
    btfsc PORTB, 7			
    CALL EIGHT6				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE6				
		
    btfsc PORTB, 6			
    CALL SIX6			
		
    btfsc PORTB, 7			
    CALL NINE6				
	
    bcf PORTB, 2			
	return	
ZERO6:
    movlw d'0'
    movwf in6
    movlw 0x30
    call imprimir
    return 


ONE6:
    movlw d'1'
    movwf in6
    MOVLW 0x31
    call imprimir
    return 

TWO6:
    movlw d'2'
    movwf in6
    movlw 0x32
    call imprimir
    return 

THREE6:
    movlw d'3'
    movwf in6
    movlw 0x33
    call imprimir
    return 

FOUR6:
    movlw d'4'
    movwf in6
    movlw 0x34
    call imprimir
    return 

FIVE6:
    movlw d'5'
    movwf in6
    movlw 0x35
    call imprimir
    return 

SIX6:
    movlw d'6'
    movwf in6
    movlw 0x36
    call imprimir
    return 

SEVEN6:
    movlw d'7'
    movwf in6
    movlw 0x37
    call imprimir
    return 

EIGHT6:
    movlw d'8'
    movwf in6
    movlw 0x38
    call imprimir
    return 

NINE6:
    movlw d'9'
    movwf in6
    movlw 0x39
    call imprimir
    return 
    
teclado7					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE7
		
		
    btfsc PORTB, 6			
    call FOUR7	
    
    btfsc PORTB, 7			
    call SEVEN7
	
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO7				
    btfsc PORTA, 6			
    CALL TWO7					
    btfsc PORTB, 6			
    CALL FIVE7				
	
    btfsc PORTB, 7			
    CALL EIGHT7				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE7				
		
    btfsc PORTB, 6			
    CALL SIX7				
		
    btfsc PORTB, 7			
    CALL NINE7				
	
    bcf PORTB, 2			
	return	
    
ZERO7:
    movlw d'0'
    movwf in7
    movlw 0x30
    call imprimir
    return 


ONE7:
    movlw d'1'
    movwf in7
    MOVLW 0x31
    call imprimir
    return 

TWO7:
    movlw d'2'
    movwf in7
    movlw 0x32
    call imprimir
    return 

THREE7:
    movlw d'3'
    movwf in7
    movlw 0x33
    call imprimir
    return 

FOUR7:
    movlw d'4'
    movwf in7
    movlw 0x34
    call imprimir
    return 

FIVE7:
    movlw d'5'
    movwf in7
    movlw 0x35
    call imprimir
    return 

SIX7:
    movlw d'6'
    movwf in7
    movlw 0x36
    call imprimir
    return 

SEVEN7:
    movlw d'7'
    movwf in7
    movlw 0x37
    call imprimir
    return 

EIGHT7:
    movlw d'8'
    movwf in7
    movlw 0x38
    call imprimir
    return 

NINE7:
    movlw d'9'
    movwf in7
    movlw 0x39
    call imprimir
    return 
    
teclado8					
    bsf PORTB, 0			
    btfsc PORTA, 4			
    call ON
	
    btfsc PORTA, 6			
    call ONE8
		
		
    btfsc PORTB, 6			
    call FOUR8	
    
    btfsc PORTB, 7			
    call SEVEN8
	
    bcf PORTB, 0				
    bsf PORTB, 1			
		
    btfsc PORTA, 4			
    CALL ZERO8				
    btfsc PORTA, 6			
    CALL TWO8					
    btfsc PORTB, 6			
    CALL FIVE8				
	
    btfsc PORTB, 7			
    CALL EIGHT8				
    
    bcf PORTB, 1			
    bsf PORTB, 2			
		
    btfsc PORTA, 6			
    CALL THREE8				
		
    btfsc PORTB, 6			
    CALL SIX8				
		
    btfsc PORTB, 7			
    CALL NINE8				
	
    bcf PORTB, 2			
	return	
    
    
ZERO8:
    movlw d'0'
    movwf in8
    movlw 0x30
    call imprimir
    return 


ONE8:
    movlw d'1'
    movwf in8
    MOVLW 0x31
    call imprimir
    return 

TWO8:
    movlw d'2'
    movwf in8
    movlw 0x32
    call imprimir
    return 

THREE8:
    movlw d'3'
    movwf in8
    movlw 0x33
    call imprimir
    return 

FOUR8:
    movlw d'4'
    movwf in8
    movlw 0x34
    call imprimir
    return 

FIVE8:
    movlw d'5'
    movwf in8
    movlw 0x35
    call imprimir
    return 

SIX8:
    movlw d'6'
    movwf in8
    movlw 0x36
    call imprimir
    return 

SEVEN8:
    movlw d'7'
    movwf in8
    movlw 0x37
    call imprimir
    return 

EIGHT8:
    movlw d'8'
    movwf in8
    movlw 0x38
    call imprimir
    return 

NINE8:
    movlw d'9'
    movwf in8
    movlw 0x39
    call imprimir
    return 
    


LCDRESET:
    movlw 0x01
    call DISPLAY

    clrf 0x35
    clrf 0x36
    clrf 0x37
    return

ON:
    call LCDRESET
    call LCDRESET
    call LCDRESET
    
    movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	
	call DELAY1
    
	goto test

REMISEZERO:
    
	movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	
	call DELAY1
    
	goto test

imprimir2:
    BSF PORTD,0
    BCF PORTD,1
    BSF PORTD,2
		
		
    call DISPLAY


    MOVLW 0x38
    CALL DISPLAY
		
		
   MOVLW 0X0C 
   CALL DISPLAY

    BSF PORTD,0
    RETURN


imprimir:
    BSF PORTD,0
    BCF PORTD,1
    BSF PORTD,2
		
		
    call DISPLAY

    MOVLW 0x38
    CALL DISPLAY
		
		
    MOVLW 0X0F 
    CALL DISPLAY

    BSF PORTD,0
    RETURN

DISPLAY:   
   MOVWF PORTC

   BCF PORTD,2
   CALL DELAY1

   BSF PORTD,2
   CALL DELAY1

   BCF PORTD,0
   RETURN

DELAY1:	
    MOVLW	D'13'	 ;A VERY SMALL DELAY
    MOVWF	0X38
    MOVLW	D'200'
    MOVWF	0X39
LOOP:	
    DECFSZ	0X39
    GOTO	LOOP
    DECFSZ	0X38
    GOTO	LOOP
    RETURN
    RETURN	
	return					

segundo
    nop
    movlw d'150' ;establecer valor de la variable m
    movwf m
mloopcorto:
    ;nop
    decfsz m,f
    goto mloopcorto

    movlw d'42' ;establecer valor de la variable i
    movwf i
iloopcorto:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'60' ;establecer valor de la variable j
    movwf j
jloopcorto:
    ;nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'15' ;establecer valor de la variable k
    movwf k
kloopcorto:
    nop
    decfsz k,f
    goto kloopcorto
    decfsz j,f
    goto jloopcorto
    decfsz i,f
    goto iloopcorto
    return ;salir de la rutina de tiempo y regresar al
    
END