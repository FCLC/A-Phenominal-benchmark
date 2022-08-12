global IMUL_REG_REG
global IMUL_SSE
global IMUL_AVX
global IMUL_AVX512

section .text

%macro IMUL_MACRO 0
	imul rax, rcx
	imul rdx, rcx
	imul rdi, rcx
	imul rsi, rcx
	imul r11, rcx
	imul r8, rcx
	imul r9, rcx
	imul r10, rcx
%endmacro

%macro IMUL_SSE_MACRO 0
	pmulld xmm0, xmm1
	pmulld xmm2, xmm3
	pmulld xmm4, xmm5
	pmulld xmm6, xmm7
	pmulld xmm8, xmm9
	pmulld xmm10, xmm11
	pmulld xmm12, xmm13
	pmulld xmm14, xmm15
%endmacro

%macro IMUL_AVX_MACRO 0
	vpmulld ymm0, ymm1, ymm0
	vpmulld ymm2, ymm3, ymm2
	vpmulld ymm4, ymm5, ymm4
	vpmulld ymm6, ymm7, ymm6
	vpmulld ymm8, ymm9, ymm8
	vpmulld ymm10, ymm11, ymm10
	vpmulld ymm12, ymm13, ymm12
	vpmulld ymm14, ymm15, ymm14
%endmacro

%macro IMUL_AVX512_MACRO 0
	vpmulld zmm0, zmm1, zmm0
	vpmulld zmm2, zmm3, zmm2
	vpmulld zmm4, zmm5, zmm4
	vpmulld zmm6, zmm7, zmm6
	vpmulld zmm8, zmm9, zmm8
	vpmulld zmm10, zmm11, zmm10
	vpmulld zmm12, zmm13, zmm12
	vpmulld zmm14, zmm15, zmm14
%endmacro




IMUL_REG_REG:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10

	mov rcx, (1024*1024*1024)/128

	; Set all the accumulators to 1
	mov rbx, 1
	mov rax, 1
	mov rdx, 1
	mov rdi, 1
	mov rsi, 1
	mov r11, 1
	mov r8, 1
	mov r9, 1
	mov r10, 1

.LoopHead:
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO
	IMUL_MACRO

	dec rcx
	jnz .LoopHead

	pop r10
	pop r9
	pop r8
	pop r11
	pop rbp
	pop rsi
	pop rdi
	pop rbx
	ret


IMUL_AVX:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10
	push r12
	push r13
	push r14
	push r15

	mov rbx, (1024*1024*1024)/256

	; Set all the accumulators to 1
	
	mov rbx, 1
	vbroadcastss ymm0, [rbx]
	vbroadcastss ymm1, [rbx]
	vbroadcastss ymm2, [rbx]
	vbroadcastss ymm3, [rbx]
	vbroadcastss ymm4, [rbx]
	vbroadcastss ymm5, [rbx]
	vbroadcastss ymm6, [rbx]
	vbroadcastss ymm7, [rbx]
	vbroadcastss ymm8, [rbx]
	vbroadcastss ymm9, [rbx]
	vbroadcastss ymm10, [rbx]
	vbroadcastss ymm11, [rbx]
	vbroadcastss ymm12, [rbx]
	vbroadcastss ymm13, [rbx]
	vbroadcastss ymm14, [rbx]
	vbroadcastss ymm15, [rbx]
	

.LoopHead: 
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO
	IMUL_AVX_MACRO



IMUL_AVX512:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10
	push r12
	push r13
	push r14
	push r15

	mov rbx, (1024*1024*1024)/512

	; Set all the accumulators to 1
	
	mov rbx, 1
	vbroadcastss zmm0, [rbx]
	vbroadcastss zmm1, [rbx]
	vbroadcastss zmm2, [rbx]
	vbroadcastss zmm3, [rbx]
	vbroadcastss zmm4, [rbx]
	vbroadcastss zmm5, [rbx]
	vbroadcastss zmm6, [rbx]
	vbroadcastss zmm7, [rbx]
	vbroadcastss zmm8, [rbx]
	vbroadcastss zmm9, [rbx]
	vbroadcastss zmm10, [rbx]
	vbroadcastss zmm11, [rbx]
	vbroadcastss zmm12, [rbx]
	vbroadcastss zmm13, [rbx]
	vbroadcastss zmm14, [rbx]
	vbroadcastss zmm15, [rbx]
	

.LoopHead: 
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
	IMUL_AVX512_MACRO
