	.file	"counter_la_combined.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/workspace/SOC_lab/lab/lab6/lab-wlos_baseline/testbench/combined" "counter_la_combined.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 20 2
	.loc 1 20 5 is_stmt 0
	li	a5,10
	beq	a0,a5,.L6
.LVL1:
.L2:
	.loc 1 22 13 discriminator 1
	li	a3,-268410880
	.loc 1 22 60 discriminator 1
	li	a4,1
.L3:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a5,-2044(a3)
	.loc 1 22 60 discriminator 1
	beq	a5,a4,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	li	a5,-268410880
	sw	s0,-2048(a5)
	.loc 1 24 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL2:
.L6:
	.cfi_restore_state
	.loc 1 21 3 is_stmt 1
	li	a0,13
.LVL3:
	call	putchar
.LVL4:
	j	.L2
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1
	.cfi_startproc
.LVL5:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 28 2
	.loc 1 28 9
	lbu	a0,0(a0)
.LVL6:
	beq	a0,zero,.L7
.L9:
	.loc 1 29 3
	.loc 1 29 14 is_stmt 0
	addi	s0,s0,1
.LVL7:
	.loc 1 29 3
	call	putchar
.LVL8:
	.loc 1 28 9 is_stmt 1
	lbu	a0,0(s0)
	bne	a0,zero,.L9
.L7:
	.loc 1 30 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL9:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB323:
	.file 2 "counter_la_combined.c"
	.loc 2 52 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 2 54 5
	.loc 2 82 5
	.loc 2 82 53 is_stmt 0
	li	a2,1
	li	a5,-268419072
	sw	a2,-2048(a5)
	.loc 2 84 5 is_stmt 1
	.loc 2 84 39 is_stmt 0
	li	a5,637534208
	li	a3,8192
	addi	a4,a3,-2039
	sw	a4,160(a5)
	.loc 2 85 5 is_stmt 1
	.loc 2 85 39 is_stmt 0
	sw	a4,156(a5)
	.loc 2 86 5 is_stmt 1
	.loc 2 86 39 is_stmt 0
	sw	a4,152(a5)
	.loc 2 87 5 is_stmt 1
	.loc 2 87 39 is_stmt 0
	sw	a4,148(a5)
	.loc 2 88 5 is_stmt 1
	.loc 2 88 39 is_stmt 0
	sw	a4,144(a5)
	.loc 2 89 5 is_stmt 1
	.loc 2 89 39 is_stmt 0
	sw	a4,140(a5)
	.loc 2 90 5 is_stmt 1
	.loc 2 90 39 is_stmt 0
	sw	a4,136(a5)
	.loc 2 91 5 is_stmt 1
	.loc 2 91 39 is_stmt 0
	sw	a4,132(a5)
	.loc 2 92 5 is_stmt 1
	.loc 2 92 39 is_stmt 0
	sw	a4,128(a5)
	.loc 2 93 5 is_stmt 1
	.loc 2 93 39 is_stmt 0
	sw	a4,124(a5)
	.loc 2 94 5 is_stmt 1
	.loc 2 94 39 is_stmt 0
	sw	a4,120(a5)
	.loc 2 95 5 is_stmt 1
	.loc 2 95 39 is_stmt 0
	sw	a4,116(a5)
	.loc 2 96 5 is_stmt 1
	.loc 2 96 39 is_stmt 0
	sw	a4,112(a5)
	.loc 2 97 5 is_stmt 1
	.loc 2 97 39 is_stmt 0
	sw	a4,108(a5)
	.loc 2 98 5 is_stmt 1
	.loc 2 98 39 is_stmt 0
	sw	a4,104(a5)
	.loc 2 99 5 is_stmt 1
	.loc 2 99 39 is_stmt 0
	sw	a4,100(a5)
	.loc 2 101 5 is_stmt 1
	.loc 2 101 39 is_stmt 0
	sw	a4,96(a5)
	.loc 2 102 5 is_stmt 1
	.loc 2 102 39 is_stmt 0
	sw	a4,92(a5)
	.loc 2 103 5 is_stmt 1
	.loc 2 103 39 is_stmt 0
	sw	a4,88(a5)
	.loc 2 104 5 is_stmt 1
	.loc 2 104 39 is_stmt 0
	sw	a4,84(a5)
	.loc 2 105 5 is_stmt 1
	.loc 2 105 39 is_stmt 0
	sw	a4,80(a5)
	.loc 2 106 5 is_stmt 1
	.loc 2 106 39 is_stmt 0
	sw	a4,76(a5)
	.loc 2 107 5 is_stmt 1
	.loc 2 107 39 is_stmt 0
	sw	a4,72(a5)
	.loc 2 108 5 is_stmt 1
	.loc 2 108 39 is_stmt 0
	sw	a4,68(a5)
	.loc 2 109 5 is_stmt 1
	.loc 2 109 39 is_stmt 0
	sw	a4,64(a5)
	.loc 2 110 5 is_stmt 1
	.loc 2 110 39 is_stmt 0
	sw	a4,52(a5)
	.loc 2 111 5 is_stmt 1
	.loc 2 111 39 is_stmt 0
	sw	a4,48(a5)
	.loc 2 112 5 is_stmt 1
	.loc 2 112 39 is_stmt 0
	sw	a4,44(a5)
	.loc 2 113 5 is_stmt 1
	.loc 2 113 39 is_stmt 0
	sw	a4,40(a5)
	.loc 2 114 5 is_stmt 1
	.loc 2 114 39 is_stmt 0
	sw	a4,36(a5)
	.loc 2 116 5 is_stmt 1
	.loc 2 116 39 is_stmt 0
	addi	a3,a3,-2040
	sw	a3,60(a5)
	.loc 2 117 5 is_stmt 1
	.loc 2 117 39 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 2 120 2 is_stmt 1
	.loc 2 120 36 is_stmt 0
	sw	a2,0(a5)
	.loc 2 121 2 is_stmt 1
	.loc 2 121 10 is_stmt 0
	li	a3,637534208
	.loc 2 121 43
	li	a4,1
.L13:
	.loc 2 121 43 is_stmt 1 discriminator 1
	.loc 2 121 10 is_stmt 0 discriminator 1
	lw	a5,0(a3)
	.loc 2 121 43 discriminator 1
	beq	a5,a4,.L13
	.loc 2 125 2 is_stmt 1
	.loc 2 125 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 2 125 57
	sw	zero,28(a5)
	.loc 2 126 2 is_stmt 1
	.loc 2 126 112 is_stmt 0
	li	a4,-1
	sw	a4,8(a5)
	.loc 2 126 56
	sw	a4,24(a5)
	.loc 2 127 2 is_stmt 1
	.loc 2 127 112 is_stmt 0
	sw	zero,4(a5)
	.loc 2 127 56
	sw	zero,20(a5)
	.loc 2 128 2 is_stmt 1
	.loc 2 128 100 is_stmt 0
	sw	zero,0(a5)
	.loc 2 128 50
	sw	zero,16(a5)
	.loc 2 131 2 is_stmt 1
	.loc 2 131 36 is_stmt 0
	li	s0,637534208
	li	a4,-1421869056
	sw	a4,12(s0)
	.loc 2 134 2 is_stmt 1
	.loc 2 134 56 is_stmt 0
	sw	zero,56(a5)
	.loc 2 137 2 is_stmt 1
	.loc 2 137 112 is_stmt 0
	sw	zero,8(a5)
	.loc 2 137 56
	sw	zero,24(a5)
	.loc 2 142 9 is_stmt 1
.LBB12:
.LBB13:
	.file 3 "../../firmware/irq_vex.h"
	.loc 3 24 2
	.loc 3 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
.LVL10:
	.loc 3 26 2
 #NO_APP
.LBE13:
.LBE12:
	.loc 2 143 9
	.loc 2 144 9
.LBB14:
.LBB15:
	.loc 3 31 2
	ori	a5,a5,4
.LVL11:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
.LVL12:
 #NO_APP
.LBE15:
.LBE14:
	.loc 2 146 9
.LBB16:
	.file 4 "../../firmware/csr.h"
	.loc 4 806 2
.LBB17:
.LBB18:
	.file 5 "../../firmware/hw/common.h"
	.loc 5 34 2
	.loc 5 34 32 is_stmt 0
	li	a5,-268406784
.LVL13:
	li	a4,1
	sw	a4,-2028(a5)
.LVL14:
.LBE18:
.LBE17:
.LBE16:
	.loc 2 149 2 is_stmt 1
	.loc 2 151 2
	.loc 2 151 15
	.loc 2 152 3
	.loc 2 153 3
	.loc 2 153 37 is_stmt 0
	li	a5,-1420754944
	sw	a5,12(s0)
	.loc 2 151 15 is_stmt 1
	.loc 2 155 2
.LVL15:
	.loc 2 158 2
	.loc 2 158 13 is_stmt 0
	call	fir
.LVL16:
	.loc 2 159 9 is_stmt 1
	.loc 2 159 50 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 159 43
	sw	a5,12(s0)
	.loc 2 160 9 is_stmt 1
	.loc 2 160 54 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 160 43
	sw	a5,12(s0)
	.loc 2 161 9 is_stmt 1
	.loc 2 161 54 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 161 43
	sw	a5,12(s0)
	.loc 2 162 9 is_stmt 1
	.loc 2 162 54 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 162 43
	sw	a5,12(s0)
	.loc 2 163 9 is_stmt 1
	.loc 2 163 54 is_stmt 0
	lw	a5,16(a0)
	slli	a5,a5,16
	.loc 2 163 43
	sw	a5,12(s0)
	.loc 2 164 9 is_stmt 1
	.loc 2 164 54 is_stmt 0
	lw	a5,20(a0)
	slli	a5,a5,16
	.loc 2 164 43
	sw	a5,12(s0)
	.loc 2 165 9 is_stmt 1
	.loc 2 165 54 is_stmt 0
	lw	a5,24(a0)
	slli	a5,a5,16
	.loc 2 165 43
	sw	a5,12(s0)
	.loc 2 166 9 is_stmt 1
	.loc 2 166 54 is_stmt 0
	lw	a5,28(a0)
	slli	a5,a5,16
	.loc 2 166 43
	sw	a5,12(s0)
	.loc 2 167 9 is_stmt 1
	.loc 2 167 54 is_stmt 0
	lw	a5,32(a0)
	slli	a5,a5,16
	.loc 2 167 43
	sw	a5,12(s0)
	.loc 2 168 9 is_stmt 1
	.loc 2 168 54 is_stmt 0
	lw	a5,36(a0)
	slli	a5,a5,16
	.loc 2 168 43
	sw	a5,12(s0)
	.loc 2 169 9 is_stmt 1
	.loc 2 169 55 is_stmt 0
	lw	a5,40(a0)
	slli	a5,a5,16
	.loc 2 169 43
	sw	a5,12(s0)
	.loc 2 171 2 is_stmt 1
	.loc 2 171 15
	.loc 2 172 3
.LVL17:
	.loc 2 173 3
	.loc 2 173 37 is_stmt 0
	li	a5,-1419706368
	sw	a5,12(s0)
	.loc 2 171 15 is_stmt 1
	.loc 2 175 2
.LVL18:
	.loc 2 178 2
	.loc 2 178 8 is_stmt 0
	call	matmul
.LVL19:
	.loc 2 179 2 is_stmt 1
	.loc 2 179 15
	.loc 2 180 3
	.loc 2 181 10
	.loc 2 181 51 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 181 44
	sw	a5,12(s0)
	.loc 2 179 15 is_stmt 1
.LVL20:
	.loc 2 185 3
	.loc 2 186 10
	.loc 2 186 55 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 186 44
	sw	a5,12(s0)
	.loc 2 184 15 is_stmt 1
.LVL21:
	.loc 2 190 3
	.loc 2 191 10
	.loc 2 191 55 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 191 44
	sw	a5,12(s0)
	.loc 2 189 15 is_stmt 1
.LVL22:
	.loc 2 195 3
	.loc 2 196 10
	.loc 2 196 55 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 196 44
	sw	a5,12(s0)
	.loc 2 194 15 is_stmt 1
.LVL23:
	.loc 2 199 15
	.loc 2 200 3
	.loc 2 201 3
	.loc 2 201 37 is_stmt 0
	li	a5,-1418657792
	sw	a5,12(s0)
	.loc 2 199 15 is_stmt 1
	.loc 2 203 2
.LVL24:
	.loc 2 206 2
	.loc 2 206 8 is_stmt 0
	call	qsort
.LVL25:
	.loc 2 207 2 is_stmt 1
	.loc 2 207 15
	.loc 2 208 10
	.loc 2 209 3
	.loc 2 209 44 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 209 37
	sw	a5,12(s0)
	.loc 2 207 15 is_stmt 1
.LVL26:
	.loc 2 213 3
	.loc 2 214 10
	.loc 2 214 55 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 214 44
	sw	a5,12(s0)
	.loc 2 212 15 is_stmt 1
.LVL27:
	.loc 2 218 3
	.loc 2 219 10
	.loc 2 219 55 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 219 44
	sw	a5,12(s0)
	.loc 2 217 15 is_stmt 1
.LVL28:
	.loc 2 222 15
	.loc 2 223 3
	.loc 2 224 10
	.loc 2 224 55 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 224 44
	sw	a5,12(s0)
	.loc 2 222 15 is_stmt 1
	.loc 2 226 2
.LVL29:
	.loc 2 227 9
	.loc 2 227 54 is_stmt 0
	lw	a5,16(a0)
	slli	a5,a5,16
	.loc 2 227 43
	sw	a5,12(s0)
	.loc 2 228 9 is_stmt 1
	.loc 2 228 54 is_stmt 0
	lw	a5,20(a0)
	slli	a5,a5,16
	.loc 2 228 43
	sw	a5,12(s0)
	.loc 2 229 9 is_stmt 1
	.loc 2 229 54 is_stmt 0
	lw	a5,24(a0)
	slli	a5,a5,16
	.loc 2 229 43
	sw	a5,12(s0)
	.loc 2 230 9 is_stmt 1
	.loc 2 230 54 is_stmt 0
	lw	a5,28(a0)
	slli	a5,a5,16
	.loc 2 230 43
	sw	a5,12(s0)
	.loc 2 231 9 is_stmt 1
	.loc 2 231 54 is_stmt 0
	lw	a5,32(a0)
	slli	a5,a5,16
	.loc 2 231 43
	sw	a5,12(s0)
	.loc 2 232 9 is_stmt 1
	.loc 2 232 54 is_stmt 0
	lw	a5,36(a0)
	slli	a5,a5,16
	.loc 2 232 43
	sw	a5,12(s0)
	.loc 2 234 2 is_stmt 1
	.loc 2 234 15
	.loc 2 235 3
.LVL30:
	.loc 2 236 3
	.loc 2 236 37 is_stmt 0
	li	a5,-1417609216
	sw	a5,12(s0)
	.loc 2 234 15 is_stmt 1
	.loc 2 239 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	main, .-main
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x25c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xd
	.4byte	.LASF21
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x6
	.4byte	.LASF11
	.byte	0x20
	.4byte	0x88
	.4byte	0x88
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	0x6a
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1e
	.4byte	0x88
	.4byte	0x9d
	.byte	0x4
	.byte	0
	.byte	0xf
	.string	"fir"
	.byte	0x2
	.byte	0x1c
	.byte	0xd
	.4byte	0x88
	.4byte	0xaf
	.byte	0x4
	.byte	0
	.byte	0x10
	.4byte	.LASF22
	.byte	0x2
	.byte	0x33
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x186
	.byte	0x8
	.4byte	.LASF13
	.byte	0x36
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0x8
	.4byte	.LASF14
	.byte	0x95
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST3
	.byte	0x11
	.string	"tmp"
	.byte	0x2
	.byte	0x9e
	.byte	0x7
	.4byte	0x88
	.4byte	.LLST4
	.byte	0x5
	.4byte	0x1a0
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x8e
	.byte	0x10
	.4byte	0x10c
	.byte	0x12
	.4byte	0x1b1
	.byte	0
	.byte	0x5
	.4byte	0x186
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x90
	.byte	0x9
	.4byte	0x129
	.byte	0x2
	.4byte	0x193
	.4byte	.LLST5
	.byte	0
	.byte	0x5
	.4byte	0x22b
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x92
	.byte	0x9
	.4byte	0x16a
	.byte	0x2
	.4byte	0x239
	.4byte	.LLST6
	.byte	0x13
	.4byte	0x245
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x4
	.2byte	0x326
	.byte	0x2
	.byte	0x2
	.4byte	0x256
	.4byte	.LLST7
	.byte	0x2
	.4byte	0x24e
	.4byte	.LLST6
	.byte	0
	.byte	0
	.byte	0x3
	.4byte	.LVL16
	.4byte	0x9d
	.byte	0x3
	.4byte	.LVL19
	.4byte	0x8d
	.byte	0x3
	.4byte	.LVL25
	.4byte	0x78
	.byte	0
	.byte	0x14
	.4byte	.LASF18
	.byte	0x3
	.byte	0x1d
	.byte	0x14
	.byte	0x3
	.4byte	0x1a0
	.byte	0x15
	.4byte	.LASF13
	.byte	0x3
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x16
	.4byte	.LASF23
	.byte	0x3
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x1be
	.byte	0x17
	.4byte	.LASF13
	.byte	0x3
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x9
	.4byte	.LASF16
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0xa
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x1e9
	.4byte	.LLST1
	.byte	0x3
	.4byte	.LVL8
	.4byte	0x1fa
	.byte	0
	.byte	0x7
	.4byte	0x1f5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0x18
	.4byte	0x1ee
	.byte	0x9
	.4byte	.LASF17
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x22b
	.byte	0xa
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x1ee
	.4byte	.LLST0
	.byte	0x19
	.4byte	.LVL4
	.4byte	0x1fa
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x245
	.byte	0x1c
	.string	"v"
	.byte	0x4
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0x1d
	.4byte	.LASF24
	.byte	0x5
	.byte	0x20
	.byte	0x14
	.byte	0x3
	.byte	0xb
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0xb
	.string	"a"
	.byte	0x44
	.4byte	0x5c
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x6
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
	.byte	0xa
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
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0x21
	.byte	0x20
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x3c
	.byte	0x19
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
	.byte	0x11
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
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
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
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
.LLST2:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL17
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL24
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL29
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LFE323
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL19-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL25-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LFE323
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL14
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL14
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL9
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"count"
.LASF20:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF24:
	.string	"csr_write_simple"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF17:
	.string	"putchar"
.LASF22:
	.string	"main"
.LASF23:
	.string	"irq_getmask"
.LASF18:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF19:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"mask"
.LASF16:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF21:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF15:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/workspace/SOC_lab/lab/lab6/lab-wlos_baseline/testbench/combined"
.LASF0:
	.string	"counter_la_combined.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
