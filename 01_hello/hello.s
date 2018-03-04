@ This is a hello world program for ARM controllers

    .text
start:              @Label, not really required
    mov r0, #1      @loads 1 in ro
    mov r1, #4      @loads 4 in r1
    add r2, r1, r0  @adds r0 and r1 and puts the result in r2
stop:
    b stop          @infinite loop