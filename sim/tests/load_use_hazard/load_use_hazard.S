###############################################################################
# File         : load_use_hazard.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test handling of load-use hazards
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
    lui     $t5, 0
    ori     $t5, $t5, 0x3210
    ori     $t0, $0, 0x000f
    ori     $t1, $0, 0xfff0
    sw      $t0, 0($t5)
    lw      $t4, 0($t5)        
    or      $t2, $t4, $t1       # Load-use hazard
    xori    $t3, $t2, 0xfffe
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
