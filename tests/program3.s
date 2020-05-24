addi a0, x0, 6 # this is n
addi t0, x0, 1 # this is fact
addi a1, x0, 1 # this is i
again:
mul t0, t0, a1
addi a1, a1, 1
bne a1, a0, again
mul t0, t0, a1