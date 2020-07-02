; Startup Branching Advanced
ldd AppResetVect            ; Load the application reset vector
cpd #$ffff                  ; Compare it to 0xFFFF
beq _GoBoot                 ; if the application reset vector is not
							; available then start the bootloader
ldd EepromProgStatus        ; Read the programmed status byte from eeprom
cpd #'B'                    ; Compare it to 'B' for boot-load
beq _GoBoot                 ; if status == 'B' for boot-loader then jump to
							; boot-loader, otherwise continue to the application

ldx AppResetVect
jmp 0,x                     ; jump to the application

_GoBoot:
lds #StackTop
jmp main                    ; continue boot-loader startup

