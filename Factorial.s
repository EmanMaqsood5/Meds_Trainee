.section .text
.globl _start

_start:
    la a0, num          # Load address of num
    lw a0, 0(a0)        # Load value of num
    call factorial      # Call factorial(num)
    la t0, result
    sw a0, 0(t0)        # Store result

    # Signal SPIKE termination
    la t5, tohost
    li x1, 1
    sw x1, 0(t5)
    j write_tohost

factorial:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)

    li t0, 1
    ble a0, t0, base_case   # if (num <= 1) go to base_case

    addi a0, a0, -1
    call factorial
    lw t1, 0(sp)
    mul a0, a0, t1          # result = a0 * t1

    lw ra, 4(sp)
    addi sp, sp, 8
    ret

base_case:
    li a0, 1
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

write_tohost:
    li x1, 1
    sw x1, tohost, t5
    j write_tohost

.section .data
.align 4
num:    .word 5
result: .word 0

.align 12
.section ".tohost","aw",@progbits
.align 4; .global tohost; tohost: .dword 0
.align 4; .global fromhost; fromhost: .dword 0
