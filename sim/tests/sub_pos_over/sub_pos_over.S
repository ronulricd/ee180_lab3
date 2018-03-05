###############################################################################
# File         : sub_pos_over.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'sub' instruction in the case of 
#   positive overflow.
#
###############################################################################


    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002         # Load the base address of the status/test registers
    ori     $s1, $0, 1          # Prepare the 'done' status
    lui     $t0, 0x7fff         # A = 0x7fffffff (2^31-1)
    ori     $t0, $t0, 0xffff
    and     $t1, $0, $0 
    lui     $t1, 0x8000         # B = 0x80000000 (-1)
    sub     $t2, $t0, $t1       # C = A-B = 0xfffffffe
    lui     $t3, 0xffff         # D = 0xfffffffe
    ori     $t3, $t3, 0xfffe
    xor     $t4, $t3, $t2
    sw      $t4, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
