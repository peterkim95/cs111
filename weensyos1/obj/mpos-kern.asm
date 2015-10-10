
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 3b 02 00 00       	call   100254 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 ac 9f 10 00       	mov    0x109fac,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 54             	imul   $0x54,%edx,%eax
  1000a4:	83 b8 50 92 10 00 01 	cmpl   $0x1,0x109250(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 04 92 10 00       	add    $0x109204,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 b9 03 00 00       	call   100474 <run>

001000bb <interrupt>:
static pid_t do_fork(process_t *parent);
static pid_t new_thread(process_t *parent, int start_func);

void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx
static pid_t do_fork(process_t *parent);
static pid_t new_thread(process_t *parent, int start_func);

void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d ac 9f 10 00    	mov    0x109fac,%ebx
static pid_t do_fork(process_t *parent);
static pid_t new_thread(process_t *parent, int start_func);

void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 08             	lea    0x8(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 05             	cmp    $0x5,%eax
  1000e1:	0f 87 6b 01 00 00    	ja     100252 <interrupt+0x197>
  1000e7:	ff 24 85 2c 0a 10 00 	jmp    *0x100a2c(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
		run(current);
  1000f0:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000f3:	89 43 24             	mov    %eax,0x24(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	eb 79                	jmp    100172 <interrupt+0xb7>
  1000f9:	bd 58 92 10 00       	mov    $0x109258,%ebp
  1000fe:	ba 01 00 00 00       	mov    $0x1,%edx
	pid_t process_id = 1;
	process_t* process;
	while(process_id < NPROCS)
	{
		process = &proc_array[process_id];
		if(process->p_state == P_EMPTY)
  100103:	83 7d 4c 00          	cmpl   $0x0,0x4c(%ebp)
  100107:	75 51                	jne    10015a <interrupt+0x9f>
		{
			process->p_registers = parent->p_registers;
  100109:	8d 7d 08             	lea    0x8(%ebp),%edi
  10010c:	b9 11 00 00 00       	mov    $0x11,%ecx
	uint32_t dest_stack_bottom, dest_stack_top;

	pid_t pid_src = src->p_pid;
	pid_t pid_dest = dest->p_pid;

	src_stack_top = PROC1_STACK_ADDR + (pid_src * PROC_STACK_SIZE);
  100111:	8b 03                	mov    (%ebx),%eax
	while(process_id < NPROCS)
	{
		process = &proc_array[process_id];
		if(process->p_state == P_EMPTY)
		{
			process->p_registers = parent->p_registers;
  100113:	8d 73 08             	lea    0x8(%ebx),%esi
  100116:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	pid_t pid_src = src->p_pid;
	pid_t pid_dest = dest->p_pid;

	src_stack_top = PROC1_STACK_ADDR + (pid_src * PROC_STACK_SIZE);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (pid_dest * PROC_STACK_SIZE);
  100118:	8b 4d 00             	mov    0x0(%ebp),%ecx
	uint32_t dest_stack_bottom, dest_stack_top;

	pid_t pid_src = src->p_pid;
	pid_t pid_dest = dest->p_pid;

	src_stack_top = PROC1_STACK_ADDR + (pid_src * PROC_STACK_SIZE);
  10011b:	83 c0 0a             	add    $0xa,%eax
	src_stack_bottom = src->p_registers.reg_esp;
  10011e:	8b 7b 44             	mov    0x44(%ebx),%edi
	uint32_t dest_stack_bottom, dest_stack_top;

	pid_t pid_src = src->p_pid;
	pid_t pid_dest = dest->p_pid;

	src_stack_top = PROC1_STACK_ADDR + (pid_src * PROC_STACK_SIZE);
  100121:	c1 e0 12             	shl    $0x12,%eax
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (pid_dest * PROC_STACK_SIZE);
  100124:	83 c1 0a             	add    $0xa,%ecx
  100127:	c1 e1 12             	shl    $0x12,%ecx
	dest_stack_bottom = dest_stack_top - (src_stack_top - src_stack_bottom);

	dest->p_registers.reg_esp = dest_stack_bottom;
  10012a:	8d 34 39             	lea    (%ecx,%edi,1),%esi
  10012d:	29 c6                	sub    %eax,%esi
  10012f:	89 75 44             	mov    %esi,0x44(%ebp)
	memcpy((void*) dest_stack_top, (void*) src_stack_top, (src_stack_top - src_stack_bottom));
  100132:	56                   	push   %esi
  100133:	89 c6                	mov    %eax,%esi
  100135:	29 fe                	sub    %edi,%esi
  100137:	56                   	push   %esi
  100138:	50                   	push   %eax
  100139:	51                   	push   %ecx
  10013a:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  10013e:	e8 09 04 00 00       	call   10054c <memcpy>
		if(process->p_state == P_EMPTY)
		{
			process->p_registers = parent->p_registers;
			copy_stack(process, parent);
			process->p_state = P_RUNNABLE;
			process->p_registers.reg_eax = 0;
  100143:	83 c4 10             	add    $0x10,%esp
		process = &proc_array[process_id];
		if(process->p_state == P_EMPTY)
		{
			process->p_registers = parent->p_registers;
			copy_stack(process, parent);
			process->p_state = P_RUNNABLE;
  100146:	c7 45 4c 01 00 00 00 	movl   $0x1,0x4c(%ebp)
  10014d:	8b 54 24 0c          	mov    0xc(%esp),%edx
			process->p_registers.reg_eax = 0;
  100151:	c7 45 24 00 00 00 00 	movl   $0x0,0x24(%ebp)
  100158:	eb 0c                	jmp    100166 <interrupt+0xab>
			return process_id;
		}
		process_id++;
  10015a:	42                   	inc    %edx
  10015b:	83 c5 54             	add    $0x54,%ebp
	//                What should sys_fork() return to the child process?)
	// You need to set one other process descriptor field as well.
	// Finally, return the child's process ID to the parent.
	pid_t process_id = 1;
	process_t* process;
	while(process_id < NPROCS)
  10015e:	83 fa 10             	cmp    $0x10,%edx
  100161:	75 a0                	jne    100103 <interrupt+0x48>
  100163:	83 ca ff             	or     $0xffffffff,%edx
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  100166:	89 53 24             	mov    %edx,0x24(%ebx)
		run(current);
  100169:	83 ec 0c             	sub    $0xc,%esp
  10016c:	ff 35 ac 9f 10 00    	pushl  0x109fac
  100172:	e8 fd 02 00 00       	call   100474 <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  100177:	e8 10 ff ff ff       	call   10008c <schedule>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  10017c:	a1 ac 9f 10 00       	mov    0x109fac,%eax
		current->p_exit_status = current->p_registers.reg_eax;

		if (current->p_wait != NULL)
  100181:	8b 50 04             	mov    0x4(%eax),%edx
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
  100184:	8b 48 24             	mov    0x24(%eax),%ecx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  100187:	c7 40 4c 03 00 00 00 	movl   $0x3,0x4c(%eax)
		current->p_exit_status = current->p_registers.reg_eax;

		if (current->p_wait != NULL)
  10018e:	85 d2                	test   %edx,%edx
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
		current->p_exit_status = current->p_registers.reg_eax;
  100190:	89 48 50             	mov    %ecx,0x50(%eax)

		if (current->p_wait != NULL)
  100193:	74 11                	je     1001a6 <interrupt+0xeb>
		{
			current->p_wait->p_state = P_RUNNABLE;
  100195:	c7 42 4c 01 00 00 00 	movl   $0x1,0x4c(%edx)
			current->p_wait->p_registers.reg_eax = current->p_exit_status;
  10019c:	89 4a 24             	mov    %ecx,0x24(%edx)
			current->p_state = P_EMPTY;
  10019f:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
		}

		schedule();
  1001a6:	e8 e1 fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001ab:	a1 ac 9f 10 00       	mov    0x109fac,%eax
  1001b0:	8b 50 24             	mov    0x24(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001b3:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001b6:	83 f9 0e             	cmp    $0xe,%ecx
  1001b9:	77 14                	ja     1001cf <interrupt+0x114>
  1001bb:	3b 10                	cmp    (%eax),%edx
  1001bd:	74 10                	je     1001cf <interrupt+0x114>
		    || proc_array[p].p_state == P_EMPTY)
  1001bf:	6b d2 54             	imul   $0x54,%edx,%edx
  1001c2:	8d 8a 10 92 10 00    	lea    0x109210(%edx),%ecx
  1001c8:	8b 59 40             	mov    0x40(%ecx),%ebx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001cb:	85 db                	test   %ebx,%ebx
  1001cd:	75 09                	jne    1001d8 <interrupt+0x11d>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001cf:	c7 40 24 ff ff ff ff 	movl   $0xffffffff,0x24(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001d6:	eb 24                	jmp    1001fc <interrupt+0x141>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  1001d8:	83 fb 03             	cmp    $0x3,%ebx
  1001db:	75 12                	jne    1001ef <interrupt+0x134>
		{
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1001dd:	8b 92 54 92 10 00    	mov    0x109254(%edx),%edx
			proc_array[p].p_state = P_EMPTY;
  1001e3:	c7 41 40 00 00 00 00 	movl   $0x0,0x40(%ecx)
		if (p <= 0 || p >= NPROCS || p == current->p_pid
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
		{
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1001ea:	89 50 24             	mov    %edx,0x24(%eax)
  1001ed:	eb 0d                	jmp    1001fc <interrupt+0x141>
			proc_array[p].p_state = P_EMPTY;
		}
		else
		{
			proc_array[p].p_wait = current;
  1001ef:	89 82 08 92 10 00    	mov    %eax,0x109208(%edx)
			current->p_state = P_BLOCKED;
  1001f5:	c7 40 4c 02 00 00 00 	movl   $0x2,0x4c(%eax)
		}
		schedule();
  1001fc:	e8 8b fe ff ff       	call   10008c <schedule>
	}

	case INT_SYS_NEWTHREAD: {
		current->p_registers.reg_eax = new_thread(current, current->p_registers.reg_eax);
  100201:	8b 15 ac 9f 10 00    	mov    0x109fac,%edx
  100207:	b8 58 92 10 00       	mov    $0x109258,%eax
  10020c:	bb 01 00 00 00       	mov    $0x1,%ebx
  100211:	8b 6a 24             	mov    0x24(%edx),%ebp
	pid_t process_id = 1;
	process_t *process;
	while(process_id < NPROCS)
	{
		process = &proc_array[process_id];
		if(process->p_state == P_EMPTY)
  100214:	83 78 4c 00          	cmpl   $0x0,0x4c(%eax)
  100218:	75 20                	jne    10023a <interrupt+0x17f>
		{
			process->p_registers = parent->p_registers;
  10021a:	8d 78 08             	lea    0x8(%eax),%edi
  10021d:	b9 11 00 00 00       	mov    $0x11,%ecx
  100222:	8d 72 08             	lea    0x8(%edx),%esi
			process->p_registers.reg_eip = start_func;
			process->p_state = P_RUNNABLE;
  100225:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)
	while(process_id < NPROCS)
	{
		process = &proc_array[process_id];
		if(process->p_state == P_EMPTY)
		{
			process->p_registers = parent->p_registers;
  10022c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
			process->p_registers.reg_eip = start_func;
  10022e:	89 68 38             	mov    %ebp,0x38(%eax)
			process->p_state = P_RUNNABLE;
			process->p_registers.reg_eax = 0;
  100231:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
  100238:	eb 0c                	jmp    100246 <interrupt+0x18b>
			return process_id;
		}
		process_id++;
  10023a:	43                   	inc    %ebx
  10023b:	83 c0 54             	add    $0x54,%eax

static pid_t new_thread(process_t *parent, int start_func)
{
	pid_t process_id = 1;
	process_t *process;
	while(process_id < NPROCS)
  10023e:	83 fb 10             	cmp    $0x10,%ebx
  100241:	75 d1                	jne    100214 <interrupt+0x159>
  100243:	83 cb ff             	or     $0xffffffff,%ebx
		schedule();
	}

	case INT_SYS_NEWTHREAD: {
		current->p_registers.reg_eax = new_thread(current, current->p_registers.reg_eax);
		run(current);
  100246:	83 ec 0c             	sub    $0xc,%esp
		}
		schedule();
	}

	case INT_SYS_NEWTHREAD: {
		current->p_registers.reg_eax = new_thread(current, current->p_registers.reg_eax);
  100249:	89 5a 24             	mov    %ebx,0x24(%edx)
		run(current);
  10024c:	52                   	push   %edx
  10024d:	e9 20 ff ff ff       	jmp    100172 <interrupt+0xb7>
  100252:	eb fe                	jmp    100252 <interrupt+0x197>

00100254 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  100254:	53                   	push   %ebx
  100255:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  100258:	68 40 05 00 00       	push   $0x540
  10025d:	6a 00                	push   $0x0
  10025f:	68 04 92 10 00       	push   $0x109204
  100264:	e8 47 03 00 00       	call   1005b0 <memset>
  100269:	b8 04 92 10 00       	mov    $0x109204,%eax
  10026e:	31 d2                	xor    %edx,%edx
  100270:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100273:	89 10                	mov    %edx,(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100275:	42                   	inc    %edx
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  100276:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
		proc_array[i].p_wait = NULL;
  10027d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100284:	83 c0 54             	add    $0x54,%eax
  100287:	83 fa 10             	cmp    $0x10,%edx
  10028a:	75 e7                	jne    100273 <start+0x1f>
		proc_array[i].p_state = P_EMPTY;
		proc_array[i].p_wait = NULL;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  10028c:	c7 05 ac 9f 10 00 58 	movl   $0x109258,0x109fac
  100293:	92 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100296:	e8 71 00 00 00       	call   10030c <segments_init>
	special_registers_init(current);
  10029b:	83 ec 0c             	sub    $0xc,%esp
  10029e:	ff 35 ac 9f 10 00    	pushl  0x109fac
  1002a4:	e8 e2 01 00 00       	call   10048b <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  1002a9:	e8 2d 01 00 00       	call   1003db <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  1002ae:	83 c4 0c             	add    $0xc,%esp
  1002b1:	68 44 0a 10 00       	push   $0x100a44
  1002b6:	68 00 07 00 00       	push   $0x700
  1002bb:	ff 35 00 00 06 00    	pushl  0x60000
  1002c1:	e8 4c 07 00 00       	call   100a12 <console_printf>
  1002c6:	83 c4 10             	add    $0x10,%esp
  1002c9:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  1002ce:	e8 4b 01 00 00       	call   10041e <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  1002d3:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1002d6:	83 fb 01             	cmp    $0x1,%ebx
  1002d9:	77 f3                	ja     1002ce <start+0x7a>
	console_clear();
  1002db:	e8 fb 00 00 00       	call   1003db <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  1002e0:	50                   	push   %eax
  1002e1:	50                   	push   %eax
  1002e2:	a1 ac 9f 10 00       	mov    0x109fac,%eax
  1002e7:	83 c0 38             	add    $0x38,%eax
  1002ea:	50                   	push   %eax
  1002eb:	53                   	push   %ebx
  1002ec:	e8 cf 01 00 00       	call   1004c0 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  1002f1:	a1 ac 9f 10 00       	mov    0x109fac,%eax
  1002f6:	c7 40 44 00 00 2c 00 	movl   $0x2c0000,0x44(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  1002fd:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)

	// Switch to the main process using run().
	run(current);
  100304:	89 04 24             	mov    %eax,(%esp)
  100307:	e8 68 01 00 00       	call   100474 <run>

0010030c <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10030c:	b8 44 97 10 00       	mov    $0x109744,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100311:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100316:	89 c2                	mov    %eax,%edx
  100318:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  10031b:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10031c:	bb 56 00 10 00       	mov    $0x100056,%ebx
  100321:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100324:	66 a3 e2 1a 10 00    	mov    %ax,0x101ae2
  10032a:	c1 e8 18             	shr    $0x18,%eax
  10032d:	88 15 e4 1a 10 00    	mov    %dl,0x101ae4
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100333:	ba ac 97 10 00       	mov    $0x1097ac,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100338:	a2 e7 1a 10 00       	mov    %al,0x101ae7
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10033d:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10033f:	66 c7 05 e0 1a 10 00 	movw   $0x68,0x101ae0
  100346:	68 00 
  100348:	c6 05 e6 1a 10 00 40 	movb   $0x40,0x101ae6
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  10034f:	c6 05 e5 1a 10 00 89 	movb   $0x89,0x101ae5

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  100356:	c7 05 48 97 10 00 00 	movl   $0x80000,0x109748
  10035d:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  100360:	66 c7 05 4c 97 10 00 	movw   $0x10,0x10974c
  100367:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100369:	66 89 0c c5 ac 97 10 	mov    %cx,0x1097ac(,%eax,8)
  100370:	00 
  100371:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100378:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10037d:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  100382:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  100387:	40                   	inc    %eax
  100388:	3d 00 01 00 00       	cmp    $0x100,%eax
  10038d:	75 da                	jne    100369 <segments_init+0x5d>
  10038f:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  100393:	ba ac 97 10 00       	mov    $0x1097ac,%edx
  100398:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  10039f:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  1003a6:	66 89 0c c5 ac 97 10 	mov    %cx,0x1097ac(,%eax,8)
  1003ad:	00 
  1003ae:	c1 e9 10             	shr    $0x10,%ecx
  1003b1:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  1003b6:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  1003bb:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  1003c0:	40                   	inc    %eax
  1003c1:	83 f8 3a             	cmp    $0x3a,%eax
  1003c4:	75 d2                	jne    100398 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  1003c6:	b0 28                	mov    $0x28,%al
  1003c8:	0f 01 15 a8 1a 10 00 	lgdtl  0x101aa8
  1003cf:	0f 00 d8             	ltr    %ax
  1003d2:	0f 01 1d b0 1a 10 00 	lidtl  0x101ab0
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  1003d9:	5b                   	pop    %ebx
  1003da:	c3                   	ret    

001003db <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003db:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003dc:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003de:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003df:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  1003e6:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  1003e9:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  1003f0:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  1003f3:	40                   	inc    %eax
  1003f4:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  1003f9:	75 ee                	jne    1003e9 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1003fb:	be d4 03 00 00       	mov    $0x3d4,%esi
  100400:	b0 0e                	mov    $0xe,%al
  100402:	89 f2                	mov    %esi,%edx
  100404:	ee                   	out    %al,(%dx)
  100405:	31 c9                	xor    %ecx,%ecx
  100407:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  10040c:	88 c8                	mov    %cl,%al
  10040e:	89 da                	mov    %ebx,%edx
  100410:	ee                   	out    %al,(%dx)
  100411:	b0 0f                	mov    $0xf,%al
  100413:	89 f2                	mov    %esi,%edx
  100415:	ee                   	out    %al,(%dx)
  100416:	88 c8                	mov    %cl,%al
  100418:	89 da                	mov    %ebx,%edx
  10041a:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  10041b:	5b                   	pop    %ebx
  10041c:	5e                   	pop    %esi
  10041d:	c3                   	ret    

0010041e <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  10041e:	ba 64 00 00 00       	mov    $0x64,%edx
  100423:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  100424:	a8 01                	test   $0x1,%al
  100426:	74 45                	je     10046d <console_read_digit+0x4f>
  100428:	b2 60                	mov    $0x60,%dl
  10042a:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  10042b:	8d 50 fe             	lea    -0x2(%eax),%edx
  10042e:	80 fa 08             	cmp    $0x8,%dl
  100431:	77 05                	ja     100438 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  100433:	0f b6 c0             	movzbl %al,%eax
  100436:	48                   	dec    %eax
  100437:	c3                   	ret    
	else if (data == 0x0B)
  100438:	3c 0b                	cmp    $0xb,%al
  10043a:	74 35                	je     100471 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  10043c:	8d 50 b9             	lea    -0x47(%eax),%edx
  10043f:	80 fa 02             	cmp    $0x2,%dl
  100442:	77 07                	ja     10044b <console_read_digit+0x2d>
		return data - 0x47 + 7;
  100444:	0f b6 c0             	movzbl %al,%eax
  100447:	83 e8 40             	sub    $0x40,%eax
  10044a:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  10044b:	8d 50 b5             	lea    -0x4b(%eax),%edx
  10044e:	80 fa 02             	cmp    $0x2,%dl
  100451:	77 07                	ja     10045a <console_read_digit+0x3c>
		return data - 0x4B + 4;
  100453:	0f b6 c0             	movzbl %al,%eax
  100456:	83 e8 47             	sub    $0x47,%eax
  100459:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  10045a:	8d 50 b1             	lea    -0x4f(%eax),%edx
  10045d:	80 fa 02             	cmp    $0x2,%dl
  100460:	77 07                	ja     100469 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  100462:	0f b6 c0             	movzbl %al,%eax
  100465:	83 e8 4e             	sub    $0x4e,%eax
  100468:	c3                   	ret    
	else if (data == 0x53)
  100469:	3c 53                	cmp    $0x53,%al
  10046b:	74 04                	je     100471 <console_read_digit+0x53>
  10046d:	83 c8 ff             	or     $0xffffffff,%eax
  100470:	c3                   	ret    
  100471:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  100473:	c3                   	ret    

00100474 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  100474:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100478:	a3 ac 9f 10 00       	mov    %eax,0x109fac

	asm volatile("movl %0,%%esp\n\t"
  10047d:	83 c0 08             	add    $0x8,%eax
  100480:	89 c4                	mov    %eax,%esp
  100482:	61                   	popa   
  100483:	07                   	pop    %es
  100484:	1f                   	pop    %ds
  100485:	83 c4 08             	add    $0x8,%esp
  100488:	cf                   	iret   
  100489:	eb fe                	jmp    100489 <run+0x15>

0010048b <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  10048b:	53                   	push   %ebx
  10048c:	83 ec 0c             	sub    $0xc,%esp
  10048f:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  100493:	6a 44                	push   $0x44
  100495:	6a 00                	push   $0x0
  100497:	8d 43 08             	lea    0x8(%ebx),%eax
  10049a:	50                   	push   %eax
  10049b:	e8 10 01 00 00       	call   1005b0 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  1004a0:	66 c7 43 3c 1b 00    	movw   $0x1b,0x3c(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  1004a6:	66 c7 43 2c 23 00    	movw   $0x23,0x2c(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  1004ac:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  1004b2:	66 c7 43 48 23 00    	movw   $0x23,0x48(%ebx)
}
  1004b8:	83 c4 18             	add    $0x18,%esp
  1004bb:	5b                   	pop    %ebx
  1004bc:	c3                   	ret    
  1004bd:	90                   	nop
  1004be:	90                   	nop
  1004bf:	90                   	nop

001004c0 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  1004c0:	55                   	push   %ebp
  1004c1:	57                   	push   %edi
  1004c2:	56                   	push   %esi
  1004c3:	53                   	push   %ebx
  1004c4:	83 ec 1c             	sub    $0x1c,%esp
  1004c7:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  1004cb:	83 f8 01             	cmp    $0x1,%eax
  1004ce:	7f 04                	jg     1004d4 <program_loader+0x14>
  1004d0:	85 c0                	test   %eax,%eax
  1004d2:	79 02                	jns    1004d6 <program_loader+0x16>
  1004d4:	eb fe                	jmp    1004d4 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  1004d6:	8b 34 c5 e8 1a 10 00 	mov    0x101ae8(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  1004dd:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  1004e3:	74 02                	je     1004e7 <program_loader+0x27>
  1004e5:	eb fe                	jmp    1004e5 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004e7:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  1004ea:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004ee:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  1004f0:	c1 e5 05             	shl    $0x5,%ebp
  1004f3:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  1004f6:	eb 3f                	jmp    100537 <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  1004f8:	83 3b 01             	cmpl   $0x1,(%ebx)
  1004fb:	75 37                	jne    100534 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  1004fd:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100500:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  100503:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100506:	01 c7                	add    %eax,%edi
	memsz += va;
  100508:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  10050a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  10050f:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  100513:	52                   	push   %edx
  100514:	89 fa                	mov    %edi,%edx
  100516:	29 c2                	sub    %eax,%edx
  100518:	52                   	push   %edx
  100519:	8b 53 04             	mov    0x4(%ebx),%edx
  10051c:	01 f2                	add    %esi,%edx
  10051e:	52                   	push   %edx
  10051f:	50                   	push   %eax
  100520:	e8 27 00 00 00       	call   10054c <memcpy>
  100525:	83 c4 10             	add    $0x10,%esp
  100528:	eb 04                	jmp    10052e <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  10052a:	c6 07 00             	movb   $0x0,(%edi)
  10052d:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  10052e:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  100532:	72 f6                	jb     10052a <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  100534:	83 c3 20             	add    $0x20,%ebx
  100537:	39 eb                	cmp    %ebp,%ebx
  100539:	72 bd                	jb     1004f8 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  10053b:	8b 56 18             	mov    0x18(%esi),%edx
  10053e:	8b 44 24 34          	mov    0x34(%esp),%eax
  100542:	89 10                	mov    %edx,(%eax)
}
  100544:	83 c4 1c             	add    $0x1c,%esp
  100547:	5b                   	pop    %ebx
  100548:	5e                   	pop    %esi
  100549:	5f                   	pop    %edi
  10054a:	5d                   	pop    %ebp
  10054b:	c3                   	ret    

0010054c <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  10054c:	56                   	push   %esi
  10054d:	31 d2                	xor    %edx,%edx
  10054f:	53                   	push   %ebx
  100550:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100554:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100558:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  10055c:	eb 08                	jmp    100566 <memcpy+0x1a>
		*d++ = *s++;
  10055e:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  100561:	4e                   	dec    %esi
  100562:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100565:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100566:	85 f6                	test   %esi,%esi
  100568:	75 f4                	jne    10055e <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  10056a:	5b                   	pop    %ebx
  10056b:	5e                   	pop    %esi
  10056c:	c3                   	ret    

0010056d <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  10056d:	57                   	push   %edi
  10056e:	56                   	push   %esi
  10056f:	53                   	push   %ebx
  100570:	8b 44 24 10          	mov    0x10(%esp),%eax
  100574:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100578:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  10057c:	39 c7                	cmp    %eax,%edi
  10057e:	73 26                	jae    1005a6 <memmove+0x39>
  100580:	8d 34 17             	lea    (%edi,%edx,1),%esi
  100583:	39 c6                	cmp    %eax,%esi
  100585:	76 1f                	jbe    1005a6 <memmove+0x39>
		s += n, d += n;
  100587:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  10058a:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  10058c:	eb 07                	jmp    100595 <memmove+0x28>
			*--d = *--s;
  10058e:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100591:	4a                   	dec    %edx
  100592:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100595:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  100596:	85 d2                	test   %edx,%edx
  100598:	75 f4                	jne    10058e <memmove+0x21>
  10059a:	eb 10                	jmp    1005ac <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  10059c:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  10059f:	4a                   	dec    %edx
  1005a0:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  1005a3:	41                   	inc    %ecx
  1005a4:	eb 02                	jmp    1005a8 <memmove+0x3b>
  1005a6:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  1005a8:	85 d2                	test   %edx,%edx
  1005aa:	75 f0                	jne    10059c <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  1005ac:	5b                   	pop    %ebx
  1005ad:	5e                   	pop    %esi
  1005ae:	5f                   	pop    %edi
  1005af:	c3                   	ret    

001005b0 <memset>:

void *
memset(void *v, int c, size_t n)
{
  1005b0:	53                   	push   %ebx
  1005b1:	8b 44 24 08          	mov    0x8(%esp),%eax
  1005b5:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  1005b9:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  1005bd:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  1005bf:	eb 04                	jmp    1005c5 <memset+0x15>
		*p++ = c;
  1005c1:	88 1a                	mov    %bl,(%edx)
  1005c3:	49                   	dec    %ecx
  1005c4:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  1005c5:	85 c9                	test   %ecx,%ecx
  1005c7:	75 f8                	jne    1005c1 <memset+0x11>
		*p++ = c;
	return v;
}
  1005c9:	5b                   	pop    %ebx
  1005ca:	c3                   	ret    

001005cb <strlen>:

size_t
strlen(const char *s)
{
  1005cb:	8b 54 24 04          	mov    0x4(%esp),%edx
  1005cf:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005d1:	eb 01                	jmp    1005d4 <strlen+0x9>
		++n;
  1005d3:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005d4:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  1005d8:	75 f9                	jne    1005d3 <strlen+0x8>
		++n;
	return n;
}
  1005da:	c3                   	ret    

001005db <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  1005db:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1005df:	31 c0                	xor    %eax,%eax
  1005e1:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005e5:	eb 01                	jmp    1005e8 <strnlen+0xd>
		++n;
  1005e7:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005e8:	39 d0                	cmp    %edx,%eax
  1005ea:	74 06                	je     1005f2 <strnlen+0x17>
  1005ec:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  1005f0:	75 f5                	jne    1005e7 <strnlen+0xc>
		++n;
	return n;
}
  1005f2:	c3                   	ret    

001005f3 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005f3:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  1005f4:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005f9:	53                   	push   %ebx
  1005fa:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  1005fc:	76 05                	jbe    100603 <console_putc+0x10>
  1005fe:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  100603:	80 fa 0a             	cmp    $0xa,%dl
  100606:	75 2c                	jne    100634 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100608:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  10060e:	be 50 00 00 00       	mov    $0x50,%esi
  100613:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  100615:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100618:	99                   	cltd   
  100619:	f7 fe                	idiv   %esi
  10061b:	89 de                	mov    %ebx,%esi
  10061d:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  10061f:	eb 07                	jmp    100628 <console_putc+0x35>
			*cursor++ = ' ' | color;
  100621:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100624:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  100625:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100628:	83 f8 50             	cmp    $0x50,%eax
  10062b:	75 f4                	jne    100621 <console_putc+0x2e>
  10062d:	29 d0                	sub    %edx,%eax
  10062f:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  100632:	eb 0b                	jmp    10063f <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  100634:	0f b6 d2             	movzbl %dl,%edx
  100637:	09 ca                	or     %ecx,%edx
  100639:	66 89 13             	mov    %dx,(%ebx)
  10063c:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  10063f:	5b                   	pop    %ebx
  100640:	5e                   	pop    %esi
  100641:	c3                   	ret    

00100642 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  100642:	56                   	push   %esi
  100643:	53                   	push   %ebx
  100644:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  100648:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10064b:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  10064f:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  100654:	75 04                	jne    10065a <fill_numbuf+0x18>
  100656:	85 d2                	test   %edx,%edx
  100658:	74 10                	je     10066a <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  10065a:	89 d0                	mov    %edx,%eax
  10065c:	31 d2                	xor    %edx,%edx
  10065e:	f7 f1                	div    %ecx
  100660:	4b                   	dec    %ebx
  100661:	8a 14 16             	mov    (%esi,%edx,1),%dl
  100664:	88 13                	mov    %dl,(%ebx)
			val /= base;
  100666:	89 c2                	mov    %eax,%edx
  100668:	eb ec                	jmp    100656 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  10066a:	89 d8                	mov    %ebx,%eax
  10066c:	5b                   	pop    %ebx
  10066d:	5e                   	pop    %esi
  10066e:	c3                   	ret    

0010066f <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  10066f:	55                   	push   %ebp
  100670:	57                   	push   %edi
  100671:	56                   	push   %esi
  100672:	53                   	push   %ebx
  100673:	83 ec 38             	sub    $0x38,%esp
  100676:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  10067a:	8b 7c 24 54          	mov    0x54(%esp),%edi
  10067e:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100682:	e9 60 03 00 00       	jmp    1009e7 <console_vprintf+0x378>
		if (*format != '%') {
  100687:	80 fa 25             	cmp    $0x25,%dl
  10068a:	74 13                	je     10069f <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  10068c:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100690:	0f b6 d2             	movzbl %dl,%edx
  100693:	89 f0                	mov    %esi,%eax
  100695:	e8 59 ff ff ff       	call   1005f3 <console_putc>
  10069a:	e9 45 03 00 00       	jmp    1009e4 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10069f:	47                   	inc    %edi
  1006a0:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  1006a7:	00 
  1006a8:	eb 12                	jmp    1006bc <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  1006aa:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  1006ab:	8a 11                	mov    (%ecx),%dl
  1006ad:	84 d2                	test   %dl,%dl
  1006af:	74 1a                	je     1006cb <console_vprintf+0x5c>
  1006b1:	89 e8                	mov    %ebp,%eax
  1006b3:	38 c2                	cmp    %al,%dl
  1006b5:	75 f3                	jne    1006aa <console_vprintf+0x3b>
  1006b7:	e9 3f 03 00 00       	jmp    1009fb <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1006bc:	8a 17                	mov    (%edi),%dl
  1006be:	84 d2                	test   %dl,%dl
  1006c0:	74 0b                	je     1006cd <console_vprintf+0x5e>
  1006c2:	b9 78 0a 10 00       	mov    $0x100a78,%ecx
  1006c7:	89 d5                	mov    %edx,%ebp
  1006c9:	eb e0                	jmp    1006ab <console_vprintf+0x3c>
  1006cb:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  1006cd:	8d 42 cf             	lea    -0x31(%edx),%eax
  1006d0:	3c 08                	cmp    $0x8,%al
  1006d2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1006d9:	00 
  1006da:	76 13                	jbe    1006ef <console_vprintf+0x80>
  1006dc:	eb 1d                	jmp    1006fb <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  1006de:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  1006e3:	0f be c0             	movsbl %al,%eax
  1006e6:	47                   	inc    %edi
  1006e7:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  1006eb:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  1006ef:	8a 07                	mov    (%edi),%al
  1006f1:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006f4:	80 fa 09             	cmp    $0x9,%dl
  1006f7:	76 e5                	jbe    1006de <console_vprintf+0x6f>
  1006f9:	eb 18                	jmp    100713 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  1006fb:	80 fa 2a             	cmp    $0x2a,%dl
  1006fe:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  100705:	ff 
  100706:	75 0b                	jne    100713 <console_vprintf+0xa4>
			width = va_arg(val, int);
  100708:	83 c3 04             	add    $0x4,%ebx
			++format;
  10070b:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  10070c:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10070f:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  100713:	83 cd ff             	or     $0xffffffff,%ebp
  100716:	80 3f 2e             	cmpb   $0x2e,(%edi)
  100719:	75 37                	jne    100752 <console_vprintf+0xe3>
			++format;
  10071b:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  10071c:	31 ed                	xor    %ebp,%ebp
  10071e:	8a 07                	mov    (%edi),%al
  100720:	8d 50 d0             	lea    -0x30(%eax),%edx
  100723:	80 fa 09             	cmp    $0x9,%dl
  100726:	76 0d                	jbe    100735 <console_vprintf+0xc6>
  100728:	eb 17                	jmp    100741 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  10072a:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  10072d:	0f be c0             	movsbl %al,%eax
  100730:	47                   	inc    %edi
  100731:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  100735:	8a 07                	mov    (%edi),%al
  100737:	8d 50 d0             	lea    -0x30(%eax),%edx
  10073a:	80 fa 09             	cmp    $0x9,%dl
  10073d:	76 eb                	jbe    10072a <console_vprintf+0xbb>
  10073f:	eb 11                	jmp    100752 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  100741:	3c 2a                	cmp    $0x2a,%al
  100743:	75 0b                	jne    100750 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  100745:	83 c3 04             	add    $0x4,%ebx
				++format;
  100748:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  100749:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  10074c:	85 ed                	test   %ebp,%ebp
  10074e:	79 02                	jns    100752 <console_vprintf+0xe3>
  100750:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  100752:	8a 07                	mov    (%edi),%al
  100754:	3c 64                	cmp    $0x64,%al
  100756:	74 34                	je     10078c <console_vprintf+0x11d>
  100758:	7f 1d                	jg     100777 <console_vprintf+0x108>
  10075a:	3c 58                	cmp    $0x58,%al
  10075c:	0f 84 a2 00 00 00    	je     100804 <console_vprintf+0x195>
  100762:	3c 63                	cmp    $0x63,%al
  100764:	0f 84 bf 00 00 00    	je     100829 <console_vprintf+0x1ba>
  10076a:	3c 43                	cmp    $0x43,%al
  10076c:	0f 85 d0 00 00 00    	jne    100842 <console_vprintf+0x1d3>
  100772:	e9 a3 00 00 00       	jmp    10081a <console_vprintf+0x1ab>
  100777:	3c 75                	cmp    $0x75,%al
  100779:	74 4d                	je     1007c8 <console_vprintf+0x159>
  10077b:	3c 78                	cmp    $0x78,%al
  10077d:	74 5c                	je     1007db <console_vprintf+0x16c>
  10077f:	3c 73                	cmp    $0x73,%al
  100781:	0f 85 bb 00 00 00    	jne    100842 <console_vprintf+0x1d3>
  100787:	e9 86 00 00 00       	jmp    100812 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  10078c:	83 c3 04             	add    $0x4,%ebx
  10078f:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  100792:	89 d1                	mov    %edx,%ecx
  100794:	c1 f9 1f             	sar    $0x1f,%ecx
  100797:	89 0c 24             	mov    %ecx,(%esp)
  10079a:	31 ca                	xor    %ecx,%edx
  10079c:	55                   	push   %ebp
  10079d:	29 ca                	sub    %ecx,%edx
  10079f:	68 80 0a 10 00       	push   $0x100a80
  1007a4:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1007a9:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007ad:	e8 90 fe ff ff       	call   100642 <fill_numbuf>
  1007b2:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  1007b6:	58                   	pop    %eax
  1007b7:	5a                   	pop    %edx
  1007b8:	ba 01 00 00 00       	mov    $0x1,%edx
  1007bd:	8b 04 24             	mov    (%esp),%eax
  1007c0:	83 e0 01             	and    $0x1,%eax
  1007c3:	e9 a5 00 00 00       	jmp    10086d <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  1007c8:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  1007cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1007d0:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007d3:	55                   	push   %ebp
  1007d4:	68 80 0a 10 00       	push   $0x100a80
  1007d9:	eb 11                	jmp    1007ec <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  1007db:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  1007de:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007e1:	55                   	push   %ebp
  1007e2:	68 94 0a 10 00       	push   $0x100a94
  1007e7:	b9 10 00 00 00       	mov    $0x10,%ecx
  1007ec:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007f0:	e8 4d fe ff ff       	call   100642 <fill_numbuf>
  1007f5:	ba 01 00 00 00       	mov    $0x1,%edx
  1007fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1007fe:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  100800:	59                   	pop    %ecx
  100801:	59                   	pop    %ecx
  100802:	eb 69                	jmp    10086d <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  100804:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  100807:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10080a:	55                   	push   %ebp
  10080b:	68 80 0a 10 00       	push   $0x100a80
  100810:	eb d5                	jmp    1007e7 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  100812:	83 c3 04             	add    $0x4,%ebx
  100815:	8b 43 fc             	mov    -0x4(%ebx),%eax
  100818:	eb 40                	jmp    10085a <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  10081a:	83 c3 04             	add    $0x4,%ebx
  10081d:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100820:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  100824:	e9 bd 01 00 00       	jmp    1009e6 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  100829:	83 c3 04             	add    $0x4,%ebx
  10082c:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  10082f:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  100833:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  100838:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  10083c:	88 44 24 24          	mov    %al,0x24(%esp)
  100840:	eb 27                	jmp    100869 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  100842:	84 c0                	test   %al,%al
  100844:	75 02                	jne    100848 <console_vprintf+0x1d9>
  100846:	b0 25                	mov    $0x25,%al
  100848:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  10084c:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  100851:	80 3f 00             	cmpb   $0x0,(%edi)
  100854:	74 0a                	je     100860 <console_vprintf+0x1f1>
  100856:	8d 44 24 24          	lea    0x24(%esp),%eax
  10085a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10085e:	eb 09                	jmp    100869 <console_vprintf+0x1fa>
				format--;
  100860:	8d 54 24 24          	lea    0x24(%esp),%edx
  100864:	4f                   	dec    %edi
  100865:	89 54 24 04          	mov    %edx,0x4(%esp)
  100869:	31 d2                	xor    %edx,%edx
  10086b:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10086d:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  10086f:	83 fd ff             	cmp    $0xffffffff,%ebp
  100872:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100879:	74 1f                	je     10089a <console_vprintf+0x22b>
  10087b:	89 04 24             	mov    %eax,(%esp)
  10087e:	eb 01                	jmp    100881 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100880:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100881:	39 e9                	cmp    %ebp,%ecx
  100883:	74 0a                	je     10088f <console_vprintf+0x220>
  100885:	8b 44 24 04          	mov    0x4(%esp),%eax
  100889:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  10088d:	75 f1                	jne    100880 <console_vprintf+0x211>
  10088f:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100892:	89 0c 24             	mov    %ecx,(%esp)
  100895:	eb 1f                	jmp    1008b6 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  100897:	42                   	inc    %edx
  100898:	eb 09                	jmp    1008a3 <console_vprintf+0x234>
  10089a:	89 d1                	mov    %edx,%ecx
  10089c:	8b 14 24             	mov    (%esp),%edx
  10089f:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1008a3:	8b 44 24 04          	mov    0x4(%esp),%eax
  1008a7:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  1008ab:	75 ea                	jne    100897 <console_vprintf+0x228>
  1008ad:	8b 44 24 08          	mov    0x8(%esp),%eax
  1008b1:	89 14 24             	mov    %edx,(%esp)
  1008b4:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  1008b6:	85 c0                	test   %eax,%eax
  1008b8:	74 0c                	je     1008c6 <console_vprintf+0x257>
  1008ba:	84 d2                	test   %dl,%dl
  1008bc:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  1008c3:	00 
  1008c4:	75 24                	jne    1008ea <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  1008c6:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  1008cb:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  1008d2:	00 
  1008d3:	75 15                	jne    1008ea <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  1008d5:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008d9:	83 e0 08             	and    $0x8,%eax
  1008dc:	83 f8 01             	cmp    $0x1,%eax
  1008df:	19 c9                	sbb    %ecx,%ecx
  1008e1:	f7 d1                	not    %ecx
  1008e3:	83 e1 20             	and    $0x20,%ecx
  1008e6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  1008ea:	3b 2c 24             	cmp    (%esp),%ebp
  1008ed:	7e 0d                	jle    1008fc <console_vprintf+0x28d>
  1008ef:	84 d2                	test   %dl,%dl
  1008f1:	74 40                	je     100933 <console_vprintf+0x2c4>
			zeros = precision - len;
  1008f3:	2b 2c 24             	sub    (%esp),%ebp
  1008f6:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  1008fa:	eb 3f                	jmp    10093b <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008fc:	84 d2                	test   %dl,%dl
  1008fe:	74 33                	je     100933 <console_vprintf+0x2c4>
  100900:	8b 44 24 14          	mov    0x14(%esp),%eax
  100904:	83 e0 06             	and    $0x6,%eax
  100907:	83 f8 02             	cmp    $0x2,%eax
  10090a:	75 27                	jne    100933 <console_vprintf+0x2c4>
  10090c:	45                   	inc    %ebp
  10090d:	75 24                	jne    100933 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  10090f:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100911:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  100914:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100919:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  10091c:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  10091f:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  100923:	7d 0e                	jge    100933 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  100925:	8b 54 24 0c          	mov    0xc(%esp),%edx
  100929:	29 ca                	sub    %ecx,%edx
  10092b:	29 c2                	sub    %eax,%edx
  10092d:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100931:	eb 08                	jmp    10093b <console_vprintf+0x2cc>
  100933:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  10093a:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  10093b:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  10093f:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100941:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100945:	2b 2c 24             	sub    (%esp),%ebp
  100948:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  10094d:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100950:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100953:	29 c5                	sub    %eax,%ebp
  100955:	89 f0                	mov    %esi,%eax
  100957:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10095b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10095f:	eb 0f                	jmp    100970 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  100961:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100965:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10096a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  10096b:	e8 83 fc ff ff       	call   1005f3 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100970:	85 ed                	test   %ebp,%ebp
  100972:	7e 07                	jle    10097b <console_vprintf+0x30c>
  100974:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100979:	74 e6                	je     100961 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  10097b:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100980:	89 c6                	mov    %eax,%esi
  100982:	74 23                	je     1009a7 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  100984:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100989:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10098d:	e8 61 fc ff ff       	call   1005f3 <console_putc>
  100992:	89 c6                	mov    %eax,%esi
  100994:	eb 11                	jmp    1009a7 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  100996:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10099a:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  10099f:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  1009a0:	e8 4e fc ff ff       	call   1005f3 <console_putc>
  1009a5:	eb 06                	jmp    1009ad <console_vprintf+0x33e>
  1009a7:	89 f0                	mov    %esi,%eax
  1009a9:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  1009ad:	85 f6                	test   %esi,%esi
  1009af:	7f e5                	jg     100996 <console_vprintf+0x327>
  1009b1:	8b 34 24             	mov    (%esp),%esi
  1009b4:	eb 15                	jmp    1009cb <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  1009b6:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  1009ba:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  1009bb:	0f b6 11             	movzbl (%ecx),%edx
  1009be:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009c2:	e8 2c fc ff ff       	call   1005f3 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  1009c7:	ff 44 24 04          	incl   0x4(%esp)
  1009cb:	85 f6                	test   %esi,%esi
  1009cd:	7f e7                	jg     1009b6 <console_vprintf+0x347>
  1009cf:	eb 0f                	jmp    1009e0 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  1009d1:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009d5:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009da:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  1009db:	e8 13 fc ff ff       	call   1005f3 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009e0:	85 ed                	test   %ebp,%ebp
  1009e2:	7f ed                	jg     1009d1 <console_vprintf+0x362>
  1009e4:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  1009e6:	47                   	inc    %edi
  1009e7:	8a 17                	mov    (%edi),%dl
  1009e9:	84 d2                	test   %dl,%dl
  1009eb:	0f 85 96 fc ff ff    	jne    100687 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  1009f1:	83 c4 38             	add    $0x38,%esp
  1009f4:	89 f0                	mov    %esi,%eax
  1009f6:	5b                   	pop    %ebx
  1009f7:	5e                   	pop    %esi
  1009f8:	5f                   	pop    %edi
  1009f9:	5d                   	pop    %ebp
  1009fa:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009fb:	81 e9 78 0a 10 00    	sub    $0x100a78,%ecx
  100a01:	b8 01 00 00 00       	mov    $0x1,%eax
  100a06:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100a08:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100a09:	09 44 24 14          	or     %eax,0x14(%esp)
  100a0d:	e9 aa fc ff ff       	jmp    1006bc <console_vprintf+0x4d>

00100a12 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  100a12:	8d 44 24 10          	lea    0x10(%esp),%eax
  100a16:	50                   	push   %eax
  100a17:	ff 74 24 10          	pushl  0x10(%esp)
  100a1b:	ff 74 24 10          	pushl  0x10(%esp)
  100a1f:	ff 74 24 10          	pushl  0x10(%esp)
  100a23:	e8 47 fc ff ff       	call   10066f <console_vprintf>
  100a28:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  100a2b:	c3                   	ret    
