###############################################################################
# File         : llsc_stores.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'll' and 'sc' instructions with
#   some store instruction between the two.
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
    lui     $t0, 0              # Load some valid address 0x00003210 to register $t0
    ori     $t0, $t0, 0x3210
    ll      $t1, 0($t0)         # Loads from result and links so that sc can check later
    ori     $t2, $t2, 0
    sw      $t2, 0($t0)
    addiu   $t1, $t1, 10
    sc      $t1, 0($t0)  
    addiu   $t1, $t1, 1
    sw      $t1, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
