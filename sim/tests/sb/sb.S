###############################################################################
# File         : sb.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of the 'sb' instruction.
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
    nop
    nop
    ori     $t0, $t0, 0x3210
    ori     $s2, $0, 0xde
    ori     $s3, $0, 0xaf
    ori     $s4, $0, 0xbe
    ori     $s5, $0, 0xef
    sb      $s2, 0($t0)
    sb      $s3, 1($t0)
    sb      $s4, 2($t0)
    sb      $s5, 3($t0)
    nop
    nop
    lw      $t1, 0($t0)
    lui     $t2, 0xdeaf
    nop
    nop
    ori     $t2, $t2, 0xbeef
    nop
    nop
    xor     $t3, $t1, $t2
    nop
    nop
    addi    $t3, $t3, 1
    nop
    nop 
    sw      $t3, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
