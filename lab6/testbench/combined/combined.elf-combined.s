	.file	"combined.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/workspace/SOC_lab/lab/lab6/lab-wlos_baseline/testbench/combined" "combined.c"
	.section	.mprj,"ax",@progbits
	.align	2
	.globl	uart_write
	.type	uart_write, @function
uart_write:
.LFB321:
	.file 1 "combined.c"
	.loc 1 16 1
	.cfi_startproc
.LVL0:
	.loc 1 17 5
	.loc 1 17 14 is_stmt 0
	li	a4,805306368
.L2:
	.loc 1 17 11 is_stmt 1 discriminator 1
	.loc 1 17 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 17 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L2
	.loc 1 18 5 is_stmt 1
	.loc 1 18 39 is_stmt 0
	li	a5,805306368
	sw	a0,4(a5)
	.loc 1 19 1
	ret
	.cfi_endproc
.LFE321:
	.size	uart_write, .-uart_write
	.align	2
	.globl	uart_write_char
	.type	uart_write_char, @function
uart_write_char:
.LFB322:
	.loc 1 23 1 is_stmt 1
	.cfi_startproc
.LVL1:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 24 9
	.loc 1 24 12 is_stmt 0
	li	a5,10
	beq	a0,a5,.L9
.LVL2:
.L5:
	.loc 1 28 14 discriminator 1
	li	a4,805306368
.L6:
	.loc 1 28 11 is_stmt 1 discriminator 1
	.loc 1 28 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 28 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L6
	.loc 1 29 5 is_stmt 1
	.loc 1 29 39 is_stmt 0
	li	a5,805306368
	sw	s0,4(a5)
	.loc 1 30 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL3:
.L9:
	.cfi_restore_state
	.loc 1 25 17 is_stmt 1
	li	a0,13
.LVL4:
	call	uart_write_char
.LVL5:
	j	.L5
	.cfi_endproc
.LFE322:
	.size	uart_write_char, .-uart_write_char
	.align	2
	.globl	uart_write_string
	.type	uart_write_string, @function
uart_write_string:
.LFB323:
	.loc 1 34 1
	.cfi_startproc
.LVL6:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 35 5
	.loc 1 35 12
	lbu	a0,0(a0)
.LVL7:
	beq	a0,zero,.L10
.L12:
	.loc 1 36 9
	.loc 1 36 28 is_stmt 0
	addi	s0,s0,1
.LVL8:
	.loc 1 36 9
	call	uart_write_char
.LVL9:
	.loc 1 35 12 is_stmt 1
	lbu	a0,0(s0)
	bne	a0,zero,.L12
.L10:
	.loc 1 37 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL10:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	uart_write_string, .-uart_write_string
	.align	2
	.globl	uart_read_char
	.type	uart_read_char, @function
uart_read_char:
.LFB324:
	.loc 1 42 1 is_stmt 1
	.cfi_startproc
	li	a0,0
	.loc 1 43 9
	.loc 1 44 5
	.loc 1 44 12 is_stmt 0
	li	a5,805306368
	lw	a5,8(a5)
	.loc 1 44 44
	srli	a5,a5,5
	.loc 1 44 7
	bne	a5,zero,.L16
	.loc 1 44 67 discriminator 1
	li	a5,805306368
	lw	a5,8(a5)
	.loc 1 44 99 discriminator 1
	srli	a5,a5,4
	.loc 1 44 60 discriminator 1
	bne	a5,zero,.L16
.LVL11:
.LBB2:
	.loc 1 46 13 is_stmt 1 discriminator 3
 #APP
# 46 "combined.c" 1
	nop
# 0 "" 2
	.loc 1 45 32 discriminator 3
.LVL12:
	.loc 1 45 26 discriminator 3
 #NO_APP
.LBE2:
	.loc 1 48 9 discriminator 3
	.loc 1 48 16 is_stmt 0 discriminator 3
	li	a5,805306368
	lw	a0,0(a5)
	.loc 1 48 13 discriminator 3
	andi	a0,a0,0xff
.LVL13:
.L16:
	.loc 1 51 5 is_stmt 1
	.loc 1 52 1 is_stmt 0
	ret
	.cfi_endproc
.LFE324:
	.size	uart_read_char, .-uart_read_char
	.align	2
	.globl	uart_read
	.type	uart_read, @function
uart_read:
.LFB325:
	.loc 1 56 1 is_stmt 1
	.cfi_startproc
	.loc 1 57 5
	.loc 1 58 5
	.loc 1 58 12 is_stmt 0
	li	a5,805306368
	lw	a5,8(a5)
	.loc 1 58 44
	srli	a5,a5,5
	.loc 1 58 7
	bne	a5,zero,.L18
	.loc 1 58 67 discriminator 1
	li	a5,805306368
	lw	a5,8(a5)
	.loc 1 58 99 discriminator 1
	srli	a5,a5,4
	.loc 1 58 60 discriminator 1
	bne	a5,zero,.L18
.LVL14:
.LBB3:
	.loc 1 60 13 is_stmt 1 discriminator 3
 #APP
# 60 "combined.c" 1
	nop
# 0 "" 2
	.loc 1 59 32 discriminator 3
.LVL15:
	.loc 1 59 26 discriminator 3
 #NO_APP
.LBE3:
	.loc 1 62 9 discriminator 3
	.loc 1 62 16 is_stmt 0 discriminator 3
	li	a5,805306368
	lw	a0,0(a5)
.LVL16:
.L18:
	.loc 1 65 5 is_stmt 1
	.loc 1 66 1 is_stmt 0
	ret
	.cfi_endproc
.LFE325:
	.size	uart_read, .-uart_read
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB326:
	.loc 1 69 61 is_stmt 1
	.cfi_startproc
	.loc 1 70 9
.LBB4:
	.loc 1 70 13
.LVL17:
	.loc 1 70 23
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a4,a5,44
	mv	a3,a4
.LVL18:
.L20:
	.loc 1 71 17 discriminator 3
	.loc 1 71 32 is_stmt 0 discriminator 3
	sw	zero,0(a5)
	.loc 1 72 17 is_stmt 1 discriminator 3
	.loc 1 72 33 is_stmt 0 discriminator 3
	sw	zero,0(a4)
	.loc 1 70 29 is_stmt 1 discriminator 3
	.loc 1 70 23 discriminator 3
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a5,a3,.L20
.LBE4:
	.loc 1 74 1 is_stmt 0
	ret
	.cfi_endproc
.LFE326:
	.size	initfir, .-initfir
	.globl	__mulsi3
	.align	2
	.globl	firfilter
	.type	firfilter, @function
firfilter:
.LFB327:
	.loc 1 76 77 is_stmt 1
	.cfi_startproc
.LVL19:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.loc 1 77 9
.LBB5:
	.loc 1 77 13
.LVL20:
	.loc 1 77 27
	lui	s1,%hi(.LANCHOR0)
	addi	a5,s1,%lo(.LANCHOR0)
	addi	a5,a5,36
	addi	s1,s1,%lo(.LANCHOR0)
.LVL21:
.L23:
	.loc 1 78 17 discriminator 3
	mv	a4,a5
	.loc 1 78 32 is_stmt 0 discriminator 3
	lw	a3,0(a5)
	sw	a3,4(a5)
	.loc 1 77 32 is_stmt 1 discriminator 3
	.loc 1 77 27 discriminator 3
	addi	a5,a5,-4
	bne	a4,s1,.L23
.LBE5:
	.loc 1 80 9
	.loc 1 80 24 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	sw	a0,%lo(.LANCHOR0)(a5)
	.loc 1 82 9 is_stmt 1
.LVL22:
	.loc 1 83 9
.LBB6:
	.loc 1 83 13
	.loc 1 83 23
	lui	s0,%hi(.LANCHOR1)
	addi	s0,s0,%lo(.LANCHOR1)
	addi	s3,s0,44
.LBE6:
	.loc 1 82 13 is_stmt 0
	li	s2,0
.LVL23:
.L24:
.LBB7:
	.loc 1 84 17 is_stmt 1 discriminator 3
	.loc 1 84 40 is_stmt 0 discriminator 3
	lw	a1,0(s1)
	lw	a0,0(s0)
	call	__mulsi3
.LVL24:
	.loc 1 84 30 discriminator 3
	add	s2,s2,a0
.LVL25:
	.loc 1 83 29 is_stmt 1 discriminator 3
	.loc 1 83 23 discriminator 3
	addi	s0,s0,4
	addi	s1,s1,4
	bne	s0,s3,.L24
.LBE7:
	.loc 1 86 9
	.loc 1 87 1 is_stmt 0
	mv	a0,s2
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
.LVL26:
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE327:
	.size	firfilter, .-firfilter
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB328:
	.loc 1 89 57 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 90 9
	call	initfir
.LVL27:
	.loc 1 91 9
.LBB8:
	.loc 1 91 13
	.loc 1 91 23
	lui	s2,%hi(.LANCHOR1)
	addi	s2,s2,%lo(.LANCHOR1)
	addi	s0,s2,44
	lui	s1,%hi(.LANCHOR0+44)
	addi	s1,s1,%lo(.LANCHOR0+44)
	addi	s2,s2,88
.LVL28:
.L29:
	.loc 1 92 17 discriminator 3
	.loc 1 92 35 is_stmt 0 discriminator 3
	lw	a0,0(s0)
	call	firfilter
.LVL29:
	.loc 1 92 33 discriminator 3
	sw	a0,0(s1)
	.loc 1 91 29 is_stmt 1 discriminator 3
	.loc 1 91 23 discriminator 3
	addi	s0,s0,4
	addi	s1,s1,4
	bne	s0,s2,.L29
.LBE8:
	.loc 1 94 9
	.loc 1 95 1 is_stmt 0
	lui	a0,%hi(.LANCHOR0+44)
	addi	a0,a0,%lo(.LANCHOR0+44)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE328:
	.size	fir, .-fir
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB329:
	.loc 1 99 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	.loc 1 100 9
.LVL30:
	.loc 1 101 9
	.loc 1 102 9
	.loc 1 103 9
	.loc 1 104 9
	.loc 1 105 9
	.loc 1 106 9
	.loc 1 106 20
	lui	s3,%hi(.LANCHOR1)
	addi	s3,s3,%lo(.LANCHOR1)
	addi	s7,s3,88
	addi	s3,s3,104
	lui	s9,%hi(.LANCHOR0+88)
	addi	s9,s9,%lo(.LANCHOR0+88)
	.loc 1 107 23 is_stmt 0
	li	s10,0
	lui	s11,%hi(.LANCHOR1)
	addi	s11,s11,%lo(.LANCHOR1)
	.loc 1 107 28
	li	s8,4
.LVL31:
.L33:
	.loc 1 107 28 is_stmt 1
	addi	s6,s11,152
	.loc 1 108 29 is_stmt 0
	mv	s5,s9
	.loc 1 107 23
	li	s4,0
.LVL32:
.L37:
	.loc 1 109 36 is_stmt 1
	.loc 1 99 1 is_stmt 0
	mv	s1,s6
	mv	s0,s7
	.loc 1 108 29
	li	s2,0
.LVL33:
.L34:
	.loc 1 110 33 is_stmt 1 discriminator 3
	.loc 1 110 53 is_stmt 0 discriminator 3
	lw	a1,0(s1)
	lw	a0,0(s0)
	call	__mulsi3
.LVL34:
	.loc 1 110 37 discriminator 3
	add	s2,s2,a0
.LVL35:
	.loc 1 109 40 is_stmt 1 discriminator 3
	.loc 1 109 36 discriminator 3
	addi	s0,s0,4
	addi	s1,s1,16
	bne	s0,s3,.L34
	.loc 1 111 25 discriminator 2
	.loc 1 111 43 is_stmt 0 discriminator 2
	sw	s2,0(s5)
	.loc 1 107 33 is_stmt 1 discriminator 2
	addi	s4,s4,1
.LVL36:
	.loc 1 107 28 discriminator 2
	addi	s5,s5,4
	addi	s6,s6,4
	bne	s4,s8,.L37
	.loc 1 106 25 discriminator 2
	.loc 1 106 20 discriminator 2
	addi	s10,s10,4
	addi	s7,s7,16
	addi	s3,s3,16
	addi	s9,s9,16
	li	a5,16
	bne	s10,a5,.L33
	.loc 1 114 9
	.loc 1 115 1 is_stmt 0
	lui	a0,%hi(.LANCHOR0+88)
	addi	a0,a0,%lo(.LANCHOR0+88)
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL37:
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
.LVL38:
	lw	s5,36(sp)
	.cfi_restore 21
.LVL39:
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE329:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB330:
	.loc 1 119 76 is_stmt 1
	.cfi_startproc
.LVL40:
	.loc 1 120 9
	.loc 1 120 13 is_stmt 0
	slli	a4,a1,2
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	add	a5,a5,a4
	lw	a6,216(a5)
.LVL41:
	.loc 1 121 9 is_stmt 1
	.loc 1 121 13 is_stmt 0
	addi	a2,a0,-1
.LVL42:
	.loc 1 122 9 is_stmt 1
	.loc 1 123 9
	.loc 1 123 22
	ble	a1,a0,.L41
	lui	a4,%hi(.LANCHOR1+216)
	addi	a4,a4,%lo(.LANCHOR1+216)
	slli	a5,a0,2
	add	a5,a4,a5
	slli	a0,a1,2
.LVL43:
	add	a0,a0,a4
	.loc 1 126 30 is_stmt 0
	lui	t1,%hi(.LANCHOR1)
	addi	t1,t1,%lo(.LANCHOR1)
	j	.L43
.LVL44:
.L42:
	.loc 1 123 27 is_stmt 1 discriminator 2
	.loc 1 123 22 discriminator 2
	addi	a5,a5,4
	beq	a5,a0,.L41
.L43:
	.loc 1 124 17
	.loc 1 124 21 is_stmt 0
	lw	a3,0(a5)
	.loc 1 124 19
	bge	a3,a6,.L42
	.loc 1 125 25 is_stmt 1
	.loc 1 125 27 is_stmt 0
	addi	a2,a2,1
.LVL45:
	.loc 1 126 25 is_stmt 1
	.loc 1 126 30 is_stmt 0
	slli	a4,a2,2
	add	a4,t1,a4
	lw	a7,216(a4)
.LVL46:
	.loc 1 127 25 is_stmt 1
	.loc 1 127 30 is_stmt 0
	sw	a3,216(a4)
	.loc 1 128 25 is_stmt 1
	.loc 1 128 30 is_stmt 0
	sw	a7,0(a5)
	j	.L42
.LVL47:
.L41:
	.loc 1 131 9 is_stmt 1
	.loc 1 131 13 is_stmt 0
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	slli	a4,a1,2
	add	a4,a5,a4
	lw	a3,216(a4)
	.loc 1 131 23
	addi	a0,a2,1
	.loc 1 131 21
	slli	a4,a0,2
	add	a5,a5,a4
	lw	a4,216(a5)
	.loc 1 131 11
	bge	a3,a4,.L40
	.loc 1 132 17 is_stmt 1
.LVL48:
	.loc 1 133 17
	.loc 1 133 24 is_stmt 0
	lui	a5,%hi(.LANCHOR1)
	addi	a5,a5,%lo(.LANCHOR1)
	slli	a2,a0,2
.LVL49:
	add	a2,a5,a2
	sw	a3,216(a2)
	.loc 1 134 17 is_stmt 1
	.loc 1 134 23 is_stmt 0
	slli	a1,a1,2
.LVL50:
	add	a5,a5,a1
	sw	a4,216(a5)
	.loc 1 136 9 is_stmt 1
.LVL51:
.L40:
	.loc 1 137 1 is_stmt 0
	ret
	.cfi_endproc
.LFE330:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB331:
	.loc 1 139 73 is_stmt 1
	.cfi_startproc
.LVL52:
	.loc 1 140 9
	.loc 1 140 11 is_stmt 0
	blt	a0,a1,.L52
	ret
.L52:
	.loc 1 139 73
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,a0
	mv	s0,a1
.LBB9:
	.loc 1 141 17 is_stmt 1
	.loc 1 141 25 is_stmt 0
	call	partition
.LVL53:
	mv	s2,a0
.LVL54:
	.loc 1 142 17 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s1
.LVL55:
	call	sort
.LVL56:
	.loc 1 143 17
	mv	a1,s0
	addi	a0,s2,1
	call	sort
.LVL57:
.LBE9:
	.loc 1 145 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL58:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL59:
	lw	s2,0(sp)
	.cfi_restore 18
.LVL60:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE331:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB332:
	.loc 1 147 59 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 148 9
	li	a1,9
	li	a0,0
	call	sort
.LVL61:
	.loc 1 149 9
	.loc 1 150 1 is_stmt 0
	lui	a0,%hi(.LANCHOR1+216)
	addi	a0,a0,%lo(.LANCHOR1+216)
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE332:
	.size	qsort, .-qsort
	.globl	Q
	.globl	result
	.globl	B
	.globl	A
	.globl	outputsignal
	.globl	inputsignal
	.globl	inputbuffer
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.type	inputsignal, @object
	.size	inputsignal, 44
inputsignal:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.type	Q, @object
	.size	Q, 40
Q:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.type	outputsignal, @object
	.size	outputsignal, 44
outputsignal:
	.zero	44
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.text
.Letext0:
	.file 2 "combined.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4bd
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x14
	.4byte	.LASF32
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL23
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x15
	.4byte	.LASF33
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x16
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xa
	.4byte	0x6a
	.4byte	0x88
	.byte	0xb
	.4byte	0x71
	.byte	0xa
	.byte	0
	.byte	0x5
	.4byte	.LASF11
	.byte	0xc
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x5
	.4byte	.LASF12
	.byte	0xd
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x5
	.4byte	.LASF13
	.byte	0xe
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x5
	.4byte	.LASF14
	.byte	0xf
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0xa
	.4byte	0x6a
	.4byte	0xd8
	.byte	0xb
	.4byte	0x71
	.byte	0xf
	.byte	0
	.byte	0xc
	.string	"A"
	.byte	0x12
	.4byte	0xc8
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xc
	.string	"B"
	.byte	0x17
	.4byte	0xc8
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x5
	.4byte	.LASF15
	.byte	0x1c
	.4byte	0xc8
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0xa
	.4byte	0x6a
	.4byte	0x114
	.byte	0xb
	.4byte	0x71
	.byte	0x9
	.byte	0
	.byte	0xc
	.string	"Q"
	.byte	0x1f
	.4byte	0x104
	.byte	0x5
	.byte	0x3
	.4byte	Q
	.byte	0x7
	.4byte	.LASF16
	.byte	0x93
	.byte	0x33
	.4byte	0x150
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x150
	.byte	0xd
	.4byte	.LVL61
	.4byte	0x155
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x39
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	0x6a
	.byte	0x8
	.4byte	.LASF17
	.byte	0x8b
	.byte	0x33
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0x4
	.string	"low"
	.byte	0x8b
	.byte	0x3c
	.4byte	0x6a
	.4byte	.LLST20
	.byte	0x4
	.string	"hi"
	.byte	0x8b
	.byte	0x45
	.4byte	0x6a
	.4byte	.LLST21
	.byte	0x9
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.byte	0x1
	.string	"p"
	.byte	0x8d
	.byte	0x15
	.4byte	0x6a
	.4byte	.LLST22
	.byte	0xf
	.4byte	.LVL53
	.4byte	0x1e9
	.4byte	0x1b7
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LVL56
	.4byte	0x155
	.4byte	0x1d1
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0x7f
	.byte	0
	.byte	0xd
	.4byte	.LVL57
	.4byte	0x155
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0x1
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF22
	.byte	0x77
	.4byte	0x6a
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.4byte	0x255
	.byte	0x4
	.string	"low"
	.byte	0x77
	.byte	0x40
	.4byte	0x6a
	.4byte	.LLST15
	.byte	0x4
	.string	"hi"
	.byte	0x77
	.byte	0x48
	.4byte	0x6a
	.4byte	.LLST16
	.byte	0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x78
	.byte	0xd
	.4byte	0x6a
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.string	"i"
	.byte	0x79
	.byte	0xd
	.4byte	0x6a
	.4byte	.LLST17
	.byte	0x1
	.string	"j"
	.byte	0x79
	.byte	0x17
	.4byte	0x6a
	.4byte	.LLST18
	.byte	0x11
	.4byte	.LASF19
	.byte	0x7a
	.4byte	0x6a
	.4byte	.LLST19
	.byte	0
	.byte	0x7
	.4byte	.LASF20
	.byte	0x62
	.byte	0x33
	.4byte	0x150
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.4byte	0x2c6
	.byte	0x1
	.string	"i"
	.byte	0x64
	.byte	0xd
	.4byte	0x6a
	.4byte	.LLST11
	.byte	0x1
	.string	"j"
	.byte	0x65
	.byte	0xd
	.4byte	0x6a
	.4byte	.LLST12
	.byte	0x1
	.string	"k"
	.byte	0x66
	.byte	0xd
	.4byte	0x6a
	.4byte	.LLST13
	.byte	0x1
	.string	"sum"
	.byte	0x67
	.byte	0xd
	.4byte	0x6a
	.4byte	.LLST14
	.byte	0x18
	.string	"kk"
	.byte	0x1
	.byte	0x68
	.byte	0xd
	.4byte	0x6a
	.byte	0x19
	.4byte	.LASF21
	.byte	0x1
	.byte	0x69
	.byte	0x16
	.4byte	0x71
	.byte	0
	.byte	0x6
	.4byte	.LVL34
	.4byte	0x4b7
	.byte	0
	.byte	0x1a
	.string	"fir"
	.byte	0x1
	.byte	0x59
	.byte	0x33
	.4byte	0x150
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.4byte	0x30e
	.byte	0x12
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x304
	.byte	0x1
	.string	"i"
	.byte	0x5b
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST10
	.byte	0x6
	.4byte	.LVL29
	.4byte	0x30e
	.byte	0
	.byte	0x6
	.4byte	.LVL27
	.4byte	0x37c
	.byte	0
	.byte	0x10
	.4byte	.LASF23
	.byte	0x4c
	.4byte	0x6a
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x37c
	.byte	0x1b
	.4byte	.LASF24
	.byte	0x1
	.byte	0x4c
	.byte	0x40
	.4byte	0x6a
	.4byte	.LLST5
	.byte	0x11
	.4byte	.LASF25
	.byte	0x52
	.4byte	0x6a
	.4byte	.LLST6
	.byte	0x12
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x35f
	.byte	0x1
	.string	"i"
	.byte	0x4d
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST7
	.byte	0
	.byte	0x1c
	.4byte	.LLRL8
	.byte	0x1
	.string	"i"
	.byte	0x53
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST9
	.byte	0x6
	.4byte	.LVL24
	.4byte	0x4b7
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF34
	.byte	0x1
	.byte	0x45
	.byte	0x33
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x3aa
	.byte	0x9
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.string	"i"
	.byte	0x46
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF26
	.byte	0x37
	.byte	0x2f
	.4byte	0x6a
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x3e8
	.byte	0x13
	.string	"num"
	.byte	0x39
	.byte	0x9
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x1
	.string	"i"
	.byte	0x3b
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF27
	.byte	0x29
	.byte	0x30
	.4byte	0x426
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x426
	.byte	0x13
	.string	"num"
	.byte	0x2b
	.byte	0xe
	.4byte	0x426
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x1
	.string	"i"
	.byte	0x2d
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF28
	.byte	0x1e
	.4byte	0x426
	.byte	0x8
	.4byte	.LASF29
	.byte	0x21
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x45e
	.byte	0x4
	.string	"s"
	.byte	0x21
	.byte	0x4e
	.4byte	0x45e
	.4byte	.LLST1
	.byte	0x6
	.4byte	.LVL9
	.4byte	0x463
	.byte	0
	.byte	0xe
	.4byte	0x42d
	.byte	0x8
	.4byte	.LASF30
	.byte	0x16
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x495
	.byte	0x4
	.string	"c"
	.byte	0x16
	.byte	0x45
	.4byte	0x426
	.4byte	.LLST0
	.byte	0xd
	.4byte	.LVL5
	.4byte	0x463
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF31
	.byte	0xf
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.4byte	0x4b7
	.byte	0x1f
	.string	"n"
	.byte	0x1
	.byte	0xf
	.byte	0x3f
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x20
	.4byte	.LASF35
	.4byte	.LASF35
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x32
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST20:
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL53-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL53-1
	.4byte	.LVL59
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL59
	.4byte	.LFE331
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST21:
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL53-1
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL53-1
	.4byte	.LVL58
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL58
	.4byte	.LFE331
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST22:
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL55
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LVL60
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL43
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LVL44
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LFE330
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL50
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL50
	.4byte	.LFE330
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL49
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL49
	.4byte	.LFE330
	.byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL43
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LVL44
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0x1
	.byte	0x61
	.byte	0x7
	.4byte	.LVL48
	.4byte	.LVL51
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL38
	.byte	0x1
	.byte	0x64
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL37
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL39
	.byte	0x2
	.byte	0x85
	.byte	0x7c
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL28
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL23
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LFE327
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL23
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL26
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LFE327
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL23
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL10
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LFE322
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x74
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL8:
	.byte	0x6
	.4byte	.LBB6
	.4byte	.LBE6
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7
	.byte	0
.LLRL23:
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321
	.byte	0x6
	.4byte	.LFB322
	.4byte	.LFE322
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0x6
	.4byte	.LFB324
	.4byte	.LFE324
	.byte	0x6
	.4byte	.LFB325
	.4byte	.LFE325
	.byte	0x6
	.4byte	.LFB326
	.4byte	.LFE326
	.byte	0x6
	.4byte	.LFB327
	.4byte	.LFE327
	.byte	0x6
	.4byte	.LFB328
	.4byte	.LFE328
	.byte	0x6
	.4byte	.LFB329
	.4byte	.LFE329
	.byte	0x6
	.4byte	.LFB330
	.4byte	.LFE330
	.byte	0x6
	.4byte	.LFB331
	.4byte	.LFE331
	.byte	0x6
	.4byte	.LFB332
	.4byte	.LFE332
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.string	"inputsignal"
.LASF34:
	.string	"initfir"
.LASF21:
	.string	"count"
.LASF32:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF17:
	.string	"sort"
.LASF26:
	.string	"uart_read"
.LASF20:
	.string	"matmul"
.LASF16:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF19:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF25:
	.string	"outputsample"
.LASF22:
	.string	"partition"
.LASF35:
	.string	"__mulsi3"
.LASF10:
	.string	"unsigned int"
.LASF27:
	.string	"uart_read_char"
.LASF11:
	.string	"taps"
.LASF9:
	.string	"long long unsigned int"
.LASF15:
	.string	"result"
.LASF31:
	.string	"uart_write"
.LASF12:
	.string	"inputbuffer"
.LASF30:
	.string	"uart_write_char"
.LASF14:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF28:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF29:
	.string	"uart_write_string"
.LASF23:
	.string	"firfilter"
.LASF33:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF18:
	.string	"pivot"
.LASF2:
	.string	"signed char"
.LASF24:
	.string	"inputsample"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/workspace/SOC_lab/lab/lab6/lab-wlos_baseline/testbench/combined"
.LASF0:
	.string	"combined.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
