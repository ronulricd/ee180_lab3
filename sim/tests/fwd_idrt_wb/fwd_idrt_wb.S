###############################################################################
# File         : fwd_idrt_wb.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of forwarding from WB to ID.Rt
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
    nop 
    nop                         # This nop needs to be here so that the data is forwarded two instructions down instead of one (from the mem stage to the id stage)                        
    or      $t2, $t0, $t1
    xori    $t3, $t2, 0xfffe
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
