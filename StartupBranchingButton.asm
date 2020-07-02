; Startup Branching
brclr $0259,$01,GoBoot      ; if PPO == 0 then start the boot-loader
                            ; if PPO == 1 then start the application
ldd AppResetVect            ; Load the application reset vector
cpd #$ffff                  ; Compare it to 0xFFFF
beq _GoBoot                 ; if the application reset vector is not
                            ; available then start the bootloader
ldx AppResetVect
jmp 0,x                     ; jump to the application

_GoBoot:
lds #StackTop
jmp main ;                  ; continue boot-loader startup

