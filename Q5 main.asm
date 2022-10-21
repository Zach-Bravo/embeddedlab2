;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Main_loop:

			mov.w #4001h,R4
		  	mov.w #0F18h,R5
			cmp.w R5,R4
			jhs Greater
            jlo Less
            jmp Main_loop

            Greater:
            mov.w #0001h,&2000
			mov.w #0002h,&2002
			mov.w #0003h,&2004
			mov.w #0004h,&2006
			mov.w #0005h,&2008
            inc.w R4

            jmp Main_loop

            Less:
            mov.w #000Ah,&2000
            mov.w #0009h,&2002
			mov.w #0008h,&2004
			mov.w #0007h,&2006
			mov.w #0006h,&2008
            dec.w R4

            jmp Main_loop



;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
