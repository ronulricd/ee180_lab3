###############################################################################
# File         : nor.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'nor' instruction.
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
    nop
    nop
    lui     $t1, 0xffff
    lui     $t2, 0xffff
    nop
    nop
    ori     $t1, 0xfffe
    ori     $t2, 0xfffe
    nop
    nop
    nor     $t3, $t1, $t2
    nop
    nop
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
