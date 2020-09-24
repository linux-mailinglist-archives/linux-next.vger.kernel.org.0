Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D572779EA
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgIXUIS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 16:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIXUIS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 16:08:18 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF4AC0613DB;
        Thu, 24 Sep 2020 13:08:18 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLXXD-005WRM-23; Thu, 24 Sep 2020 20:08:07 +0000
Date:   Thu, 24 Sep 2020 21:08:07 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200924200807.GU3421308@ZenIV.linux.org.uk>
References: <20200924183038.3c6da86e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924183038.3c6da86e@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 24, 2020 at 06:30:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> arch/x86/include/asm/barrier.h: Assembler messages:
> arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cmp'
> arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cmp'
> 
> and many more ...
> 
> Caused by commit
> 
>   e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculation")
> 
> I am not exactly sure why (but reverting it fixes the build).
> 
> I have reverted that commit for today.

Can't reproduce here...  This on top of today's -next seems to build with
allnoconfig here:

diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentation/admin-guide/hw-vuln/spectre.rst
index e05e581af5cf..27a8adedd2b8 100644
--- a/Documentation/admin-guide/hw-vuln/spectre.rst
+++ b/Documentation/admin-guide/hw-vuln/spectre.rst
@@ -426,9 +426,9 @@ Spectre variant 1
    <spec_ref2>` to avoid any usable disclosure gadgets. However, it may
    not cover all attack vectors for Spectre variant 1.
 
-   Copy-from-user code has an LFENCE barrier to prevent the access_ok()
-   check from being mis-speculated.  The barrier is done by the
-   barrier_nospec() macro.
+   Usercopy code uses user pointer masking to prevent the access_ok()
+   check from being mis-speculated in the success path with a kernel
+   address.  The masking is done by the force_user_ptr() macro.
 
    For the swapgs variant of Spectre variant 1, LFENCE barriers are
    added to interrupt, exception and NMI entry where needed.  These
diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
index 7f828fe49797..d158ea1fa250 100644
--- a/arch/x86/include/asm/barrier.h
+++ b/arch/x86/include/asm/barrier.h
@@ -48,9 +48,6 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 /* Override the default implementation from linux/nospec.h. */
 #define array_index_mask_nospec array_index_mask_nospec
 
-/* Prevent speculative execution past this barrier. */
-#define barrier_nospec() alternative("", "lfence", X86_FEATURE_LFENCE_RDTSC)
-
 #define dma_rmb()	barrier()
 #define dma_wmb()	barrier()
 
diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/checksum_32.h
index 17da95387997..c7ebc40c6fb9 100644
--- a/arch/x86/include/asm/checksum_32.h
+++ b/arch/x86/include/asm/checksum_32.h
@@ -49,7 +49,8 @@ static inline __wsum csum_and_copy_from_user(const void __user *src,
 	might_sleep();
 	if (!user_access_begin(src, len))
 		return 0;
-	ret = csum_partial_copy_generic((__force void *)src, dst, len);
+	ret = csum_partial_copy_generic((__force void *)force_user_ptr(src),
+					dst, len);
 	user_access_end();
 
 	return ret;
@@ -177,8 +178,7 @@ static inline __wsum csum_and_copy_to_user(const void *src,
 	might_sleep();
 	if (!user_access_begin(dst, len))
 		return 0;
-
-	ret = csum_partial_copy_generic(src, (__force void *)dst, len);
+	ret = csum_partial_copy_generic(src, (__force void *)force_user_ptr(dst), len);
 	user_access_end();
 	return ret;
 }
diff --git a/arch/x86/include/asm/futex.h b/arch/x86/include/asm/futex.h
index f9c00110a69a..0cecdaa362b1 100644
--- a/arch/x86/include/asm/futex.h
+++ b/arch/x86/include/asm/futex.h
@@ -59,6 +59,8 @@ static __always_inline int arch_futex_atomic_op_inuser(int op, int oparg, int *o
 	if (!user_access_begin(uaddr, sizeof(u32)))
 		return -EFAULT;
 
+	uaddr = force_user_ptr(uaddr);
+
 	switch (op) {
 	case FUTEX_OP_SET:
 		unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, Efault);
@@ -94,6 +96,9 @@ static inline int futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	if (!user_access_begin(uaddr, sizeof(u32)))
 		return -EFAULT;
+
+	uaddr = force_user_ptr(uaddr);
+
 	asm volatile("\n"
 		"1:\t" LOCK_PREFIX "cmpxchgl %4, %2\n"
 		"2:\n"
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index b24f8623bcda..cad8d0b1dbbb 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -7,6 +7,7 @@
 #include <linux/compiler.h>
 #include <linux/fault-inject-usercopy.h>
 #include <linux/kasan-checks.h>
+#include <linux/nospec.h>
 #include <linux/string.h>
 #include <asm/asm.h>
 #include <asm/page.h>
@@ -67,13 +68,24 @@ static inline bool pagefault_disabled(void);
  * Return: true (nonzero) if the memory block may be valid, false (zero)
  * if it is definitely invalid.
  */
-#define access_ok(addr, size)					\
+#define access_ok(addr, size)						\
 ({									\
 	WARN_ON_IN_IRQ();						\
 	likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));		\
 })
 
 /*
+ * Sanitize a user pointer such that it becomes NULL if it's not a valid user
+ * pointer.  This prevents speculative dereferences of user-controlled pointers
+ * to kernel space when access_ok() speculatively returns true.  This should be
+ * done *after* access_ok(), to avoid affecting error handling behavior.
+ */
+#define force_user_ptr(ptr)						\
+	(typeof(ptr)) array_index_nospec((__force unsigned long)ptr,	\
+					 TASK_SIZE_MAX)
+
+
+/*
  * These are the main single-value transfer routines.  They automatically
  * use the right size if we just have the right pointer type.
  *
@@ -96,11 +108,6 @@ extern int __get_user_bad(void);
 
 #define __uaccess_begin() stac()
 #define __uaccess_end()   clac()
-#define __uaccess_begin_nospec()	\
-({					\
-	stac();				\
-	barrier_nospec();		\
-})
 
 /*
  * This is the smallest unsigned integer type that can fit a value
@@ -343,7 +350,7 @@ do {									\
 	__label__ __pu_label;					\
 	int __pu_err = -EFAULT;					\
 	__typeof__(*(ptr)) __pu_val = (x);			\
-	__typeof__(ptr) __pu_ptr = (ptr);			\
+	__typeof__(ptr) __pu_ptr = force_user_ptr(ptr);	\
 	__typeof__(size) __pu_size = (size);			\
 	__uaccess_begin();					\
 	__put_user_size(__pu_val, __pu_ptr, __pu_size, __pu_label);	\
@@ -357,9 +364,9 @@ __pu_label:							\
 ({									\
 	int __gu_err;							\
 	__inttype(*(ptr)) __gu_val;					\
-	__typeof__(ptr) __gu_ptr = (ptr);				\
+	__typeof__(ptr) __gu_ptr = force_user_ptr(ptr);		\
 	__typeof__(size) __gu_size = (size);				\
-	__uaccess_begin_nospec();					\
+	__uaccess_begin();						\
 	__get_user_size(__gu_val, __gu_ptr, __gu_size, __gu_err);	\
 	__uaccess_end();						\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
@@ -489,7 +496,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 {
 	if (unlikely(!access_ok(ptr,len)))
 		return 0;
-	__uaccess_begin_nospec();
+	__uaccess_begin();
 	return 1;
 }
 #define user_access_begin(a,b)	user_access_begin(a,b)
@@ -498,14 +505,16 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 #define user_access_save()	smap_save()
 #define user_access_restore(x)	smap_restore(x)
 
-#define unsafe_put_user(x, ptr, label)	\
-	__put_user_size((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)
+#define unsafe_put_user(x, ptr, label)						\
+	__put_user_size((__typeof__(*(ptr)))(x), force_user_ptr(ptr),		\
+			sizeof(*(ptr)), label)
 
 #define unsafe_get_user(x, ptr, err_label)					\
 do {										\
 	int __gu_err;								\
 	__inttype(*(ptr)) __gu_val;						\
-	__get_user_size(__gu_val, (ptr), sizeof(*(ptr)), __gu_err);		\
+	__get_user_size(__gu_val, force_user_ptr(ptr), sizeof(*(ptr)),	\
+			__gu_err);						\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
 	if (unlikely(__gu_err)) goto err_label;					\
 } while (0)
diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index e7265a552f4f..425ffbb2a737 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -49,20 +49,20 @@ copy_user_generic(void *to, const void *from, unsigned len)
 static __always_inline __must_check unsigned long
 raw_copy_from_user(void *dst, const void __user *src, unsigned long size)
 {
-	return copy_user_generic(dst, (__force void *)src, size);
+	return copy_user_generic(dst, (__force void *)force_user_ptr(src), size);
 }
 
 static __always_inline __must_check unsigned long
 raw_copy_to_user(void __user *dst, const void *src, unsigned long size)
 {
-	return copy_user_generic((__force void *)dst, src, size);
+	return copy_user_generic((__force void *)force_user_ptr(dst), src, size);
 }
 
 static __always_inline __must_check
 unsigned long raw_copy_in_user(void __user *dst, const void __user *src, unsigned long size)
 {
-	return copy_user_generic((__force void *)dst,
-				 (__force void *)src, size);
+	return copy_user_generic((__force void *)force_user_ptr(dst),
+				 (__force void *)force_user_ptr(src), size);
 }
 
 extern long __copy_user_nocache(void *dst, const void __user *src,
@@ -77,13 +77,13 @@ __copy_from_user_inatomic_nocache(void *dst, const void __user *src,
 				  unsigned size)
 {
 	kasan_check_write(dst, size);
-	return __copy_user_nocache(dst, src, size, 0);
+	return __copy_user_nocache(dst, force_user_ptr(src), size, 0);
 }
 
 static inline int
 __copy_from_user_flushcache(void *dst, const void __user *src, unsigned size)
 {
 	kasan_check_write(dst, size);
-	return __copy_user_flushcache(dst, src, size);
+	return __copy_user_flushcache(dst, force_user_ptr(src), size);
 }
 #endif /* _ASM_X86_UACCESS_64_H */
diff --git a/arch/x86/lib/csum-wrappers_64.c b/arch/x86/lib/csum-wrappers_64.c
index 189344924a2b..8872f2233491 100644
--- a/arch/x86/lib/csum-wrappers_64.c
+++ b/arch/x86/lib/csum-wrappers_64.c
@@ -28,7 +28,8 @@ csum_and_copy_from_user(const void __user *src, void *dst, int len)
 	might_sleep();
 	if (!user_access_begin(src, len))
 		return 0;
-	sum = csum_partial_copy_generic((__force const void *)src, dst, len);
+	sum = csum_partial_copy_generic((__force const void *)force_user_ptr(src),
+					dst, len);
 	user_access_end();
 	return sum;
 }
@@ -53,7 +54,7 @@ csum_and_copy_to_user(const void *src, void __user *dst, int len)
 	might_sleep();
 	if (!user_access_begin(dst, len))
 		return 0;
-	sum = csum_partial_copy_generic(src, (void __force *)dst, len);
+	sum = csum_partial_copy_generic(src, (void __force *)force_user_ptr(dst), len);
 	user_access_end();
 	return sum;
 }
diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 2f052bc96866..5a95ed6a0a36 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -49,7 +49,7 @@ SYM_FUNC_START(__get_user_1)
 	LOAD_TASK_SIZE_MINUS_N(0)
 	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
-	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
+	sbb %_ASM_DX, %_ASM_DX		/* force_user_ptr() */
 	and %_ASM_DX, %_ASM_AX
 	ASM_STAC
 1:	movzbl (%_ASM_AX),%edx
@@ -63,7 +63,7 @@ SYM_FUNC_START(__get_user_2)
 	LOAD_TASK_SIZE_MINUS_N(1)
 	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
-	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
+	sbb %_ASM_DX, %_ASM_DX		/* force_user_ptr() */
 	and %_ASM_DX, %_ASM_AX
 	ASM_STAC
 2:	movzwl (%_ASM_AX),%edx
@@ -77,7 +77,7 @@ SYM_FUNC_START(__get_user_4)
 	LOAD_TASK_SIZE_MINUS_N(3)
 	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
-	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
+	sbb %_ASM_DX, %_ASM_DX		/* force_user_ptr() */
 	and %_ASM_DX, %_ASM_AX
 	ASM_STAC
 3:	movl (%_ASM_AX),%edx
@@ -92,7 +92,7 @@ SYM_FUNC_START(__get_user_8)
 	LOAD_TASK_SIZE_MINUS_N(7)
 	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
-	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
+	sbb %_ASM_DX, %_ASM_DX		/* force_user_ptr() */
 	and %_ASM_DX, %_ASM_AX
 	ASM_STAC
 4:	movq (%_ASM_AX),%rdx
@@ -103,7 +103,7 @@ SYM_FUNC_START(__get_user_8)
 	LOAD_TASK_SIZE_MINUS_N(7)
 	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user_8
-	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
+	sbb %_ASM_DX, %_ASM_DX		/* force_user_ptr() */
 	and %_ASM_DX, %_ASM_AX
 	ASM_STAC
 4:	movl (%_ASM_AX),%edx
diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index 358239d77dff..3db4e263fcfb 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -45,6 +45,8 @@ SYM_FUNC_START(__put_user_1)
 	LOAD_TASK_SIZE_MINUS_N(0)
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
+	sbb %_ASM_BX, %_ASM_BX		/* force_user_ptr() */
+	and %_ASM_BX, %_ASM_CX
 	ASM_STAC
 1:	movb %al,(%_ASM_CX)
 	xor %eax,%eax
@@ -57,6 +59,8 @@ SYM_FUNC_START(__put_user_2)
 	LOAD_TASK_SIZE_MINUS_N(1)
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
+	sbb %_ASM_BX, %_ASM_BX		/* force_user_ptr() */
+	and %_ASM_BX, %_ASM_CX
 	ASM_STAC
 2:	movw %ax,(%_ASM_CX)
 	xor %eax,%eax
@@ -69,6 +73,8 @@ SYM_FUNC_START(__put_user_4)
 	LOAD_TASK_SIZE_MINUS_N(3)
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
+	sbb %_ASM_BX, %_ASM_BX		/* force_user_ptr() */
+	and %_ASM_BX, %_ASM_CX
 	ASM_STAC
 3:	movl %eax,(%_ASM_CX)
 	xor %eax,%eax
@@ -81,6 +87,8 @@ SYM_FUNC_START(__put_user_8)
 	LOAD_TASK_SIZE_MINUS_N(7)
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
+	sbb %_ASM_BX, %_ASM_BX		/* force_user_ptr() */
+	and %_ASM_BX, %_ASM_CX
 	ASM_STAC
 4:	mov %_ASM_AX,(%_ASM_CX)
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/lib/usercopy_32.c b/arch/x86/lib/usercopy_32.c
index 7d290777246d..1ac802c9e685 100644
--- a/arch/x86/lib/usercopy_32.c
+++ b/arch/x86/lib/usercopy_32.c
@@ -68,7 +68,7 @@ clear_user(void __user *to, unsigned long n)
 {
 	might_fault();
 	if (access_ok(to, n))
-		__do_clear_user(to, n);
+		__do_clear_user(force_user_ptr(to), n);
 	return n;
 }
 EXPORT_SYMBOL(clear_user);
@@ -331,7 +331,7 @@ do {									\
 
 unsigned long __copy_user_ll(void *to, const void *from, unsigned long n)
 {
-	__uaccess_begin_nospec();
+	__uaccess_begin();
 	if (movsl_is_ok(to, from, n))
 		__copy_user(to, from, n);
 	else
@@ -344,7 +344,7 @@ EXPORT_SYMBOL(__copy_user_ll);
 unsigned long __copy_from_user_ll_nocache_nozero(void *to, const void __user *from,
 					unsigned long n)
 {
-	__uaccess_begin_nospec();
+	__uaccess_begin();
 #ifdef CONFIG_X86_INTEL_USERCOPY
 	if (n > 64 && static_cpu_has(X86_FEATURE_XMM2))
 		n = __copy_user_intel_nocache(to, from, n);
diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
index 5617b3864586..8aa5ea7150fb 100644
--- a/arch/x86/lib/usercopy_64.c
+++ b/arch/x86/lib/usercopy_64.c
@@ -43,7 +43,8 @@ unsigned long __clear_user(void __user *addr, unsigned long size)
 		_ASM_EXTABLE_UA(0b, 3b)
 		_ASM_EXTABLE_UA(1b, 2b)
 		: [size8] "=&c"(size), [dst] "=&D" (__d0)
-		: [size1] "r"(size & 7), "[size8]" (size / 8), "[dst]"(addr));
+		: [size1] "r"(size & 7), "[size8]" (size / 8),
+		  "[dst]" (force_user_ptr(addr)));
 	clac();
 	return size;
 }
@@ -54,7 +55,7 @@ unsigned long clear_user(void __user *to, unsigned long n)
 	if (should_fail_usercopy())
 		return n;
 	if (access_ok(to, n))
-		return __clear_user(to, n);
+		return __clear_user(force_user_ptr(to), n);
 	return n;
 }
 EXPORT_SYMBOL(clear_user);
@@ -90,7 +91,7 @@ EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 long __copy_user_flushcache(void *dst, const void __user *src, unsigned size)
 {
 	unsigned long flushed, dest = (unsigned long) dst;
-	long rc = __copy_user_nocache(dst, src, size, 0);
+	long rc = __copy_user_nocache(dst, force_user_ptr(src), size, 0);
 
 	/*
 	 * __copy_user_nocache() uses non-temporal stores for the bulk
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 35293ad83297..aca828b9b831 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -647,7 +647,7 @@ static int copyout_mc(void __user *to, const void *from, size_t n)
 {
 	if (access_ok(to, n)) {
 		instrument_copy_to_user(to, from, n);
-		n = copy_mc_to_user((__force void *) to, from, n);
+		n = copy_mc_to_user((__force void *)force_user_ptr(to), from, n);
 	}
 	return n;
 }
diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index e6d5fcc2cdf3..99e80110d2c0 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -25,7 +25,7 @@
  * hit it), 'max' is the address space maximum (and we return
  * -EFAULT if we hit it).
  */
-static inline long do_strncpy_from_user(char *dst, const char __user *src,
+static __always_inline long do_strncpy_from_user(char *dst, const char __user *src,
 					unsigned long count, unsigned long max)
 {
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 1616710b8a82..bd79d6e0535d 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -20,7 +20,8 @@
  * if it fits in a aligned 'long'. The caller needs to check
  * the return value against "> max".
  */
-static inline long do_strnlen_user(const char __user *src, unsigned long count, unsigned long max)
+static __always_inline long do_strnlen_user(const char __user *src,
+				unsigned long count, unsigned long max)
 {
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
 	unsigned long align, res = 0;
