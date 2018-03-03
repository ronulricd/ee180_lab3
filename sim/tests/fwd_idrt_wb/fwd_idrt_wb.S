###############################################################################
# File         : fwd_idrt_wb.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of forwarding from MEM to ID.Wb
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
    lw      $t4, 0($t5)        # Performs lw operation and then or operation, which is hazard 
    or      $t2, $t1, $t4
    xori    $t3, $t2, 0xfffe
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
