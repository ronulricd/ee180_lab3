###############################################################################
# File         : serious_hazard.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Tests multiple stress cases to ensure proper functionality of stalling
#   and forwarding in dealing with hazards.
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
    ori     $t0, $0, 0x000f
    ori     $t1, $0, 0xfff0
    ori     $t5, $0, 0x3210
    sw      $t0, 0($t5)
    lw      $t4, 0($t5)
    or      $t2, $t1, $t4       # Load-use hazard
    xori    $t2, $t2, 0xfffe    # t2 = 1
    addi    $t2, $t2, 1
    sw      $t2, 0($t5)
    lw      $t2, 0($t5)
    addi    $t2, $t2, -1        # t2 = 1
    sw      $t2, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
