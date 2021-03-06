###############################################################################
# File         : add_neg_over.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the behavior of the add instruction in the case of negative
#   overflow. Ensures that the overflow bit gets turned on in this case.
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
    and     $t0, $0, $0
    lui     $t0, 0x8000         # A = 0x10000000
    and     $t1, $0, $0         # B = 0x10000000
    lui     $t1, 0x8000
    add     $t2, $t0, $t1       # C = A+B = 0
    addi    $t2, $t2, 1 
    sw      $t2, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
