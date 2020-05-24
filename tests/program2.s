addi t0, x0, 8
addi t1, x0, 15
sw t1, 0(t0)
add t2, t1, t0
sub t3, t1, t0
mul s1, t2, t3
addi t0, t0, 4
lw s2, -4(t0)
sub s2, s1, s2
slli s2, s2, 2
sw s2, 0(t0)