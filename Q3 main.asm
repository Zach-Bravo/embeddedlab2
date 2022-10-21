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

		  mov.w #4001h,R4
		  mov.w #0F18h,R5
		  mov.w #0001h,R6

		  and.w R6,R4
		  and.w R6,R5
		  cmp.w R4,R6
          jeq stepUpOne
          cmp.w R5,R6
          jeq stepUpTwo


stepUpOne:
          ;If R5 == R6
          cmp.w  R5,R6
          jeq stepDown
          ;If Not
		  jmp stepUpTwo
          ;move values


stepUpTwo:
		  ;Second Option
		  ;one’s complement of the value in register R9
		  ;will be saved in register R10.
		  inv.w R9
		  mov.w R9, R10
          jmp $
          ;move values


stepDown:
          mov.w #0FF0h, R9
          ;move values

          jmp $


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
            
