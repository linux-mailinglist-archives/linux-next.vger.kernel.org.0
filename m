Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F54231E94
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 14:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgG2MbN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 08:31:13 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:59990 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgG2MbN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 08:31:13 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0lEf-0000nN-9t; Wed, 29 Jul 2020 22:31:06 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 29 Jul 2020 22:31:05 +1000
Date:   Wed, 29 Jul 2020 22:31:05 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] locking/atomic: Move ATOMIC_INIT into linux/types.h
Message-ID: <20200729123105.GB7047@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729122807.GA7047@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This patch moves ATOMIC_INIT from asm/atomic.h into linux/types.h.
This allows users of atomic_t to use ATOMIC_INIT without having to
include atomic.h as that way may lead to header loops.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm/atomic.h
index 2144530d1428..e2093994fd0d 100644
--- a/arch/alpha/include/asm/atomic.h
+++ b/arch/alpha/include/asm/atomic.h
@@ -24,7 +24,6 @@
 #define __atomic_acquire_fence()
 #define __atomic_post_full_fence()
 
-#define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
 #define atomic_read(v)		READ_ONCE((v)->counter)
diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index 7298ce84762e..c614857eb209 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -14,8 +14,6 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #ifndef CONFIG_ARC_PLAT_EZNPS
 
 #define atomic_read(v)  READ_ONCE((v)->counter)
diff --git a/arch/arm/include/asm/atomic.h b/arch/arm/include/asm/atomic.h
index 75bb2c543e59..455eb19a5ac1 100644
--- a/arch/arm/include/asm/atomic.h
+++ b/arch/arm/include/asm/atomic.h
@@ -15,8 +15,6 @@
 #include <asm/barrier.h>
 #include <asm/cmpxchg.h>
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #ifdef __KERNEL__
 
 /*
diff --git a/arch/arm64/include/asm/atomic.h b/arch/arm64/include/asm/atomic.h
index a08890da696c..015ddffaf6ca 100644
--- a/arch/arm64/include/asm/atomic.h
+++ b/arch/arm64/include/asm/atomic.h
@@ -99,8 +99,6 @@ static inline long arch_atomic64_dec_if_positive(atomic64_t *v)
 	return __lse_ll_sc_body(atomic64_dec_if_positive, v);
 }
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #define arch_atomic_read(v)			__READ_ONCE((v)->counter)
 #define arch_atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
 
diff --git a/arch/h8300/include/asm/atomic.h b/arch/h8300/include/asm/atomic.h
index c6b6a06231b2..a990d151f163 100644
--- a/arch/h8300/include/asm/atomic.h
+++ b/arch/h8300/include/asm/atomic.h
@@ -12,8 +12,6 @@
  * resource counting etc..
  */
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #define atomic_read(v)		READ_ONCE((v)->counter)
 #define atomic_set(v, i)	WRITE_ONCE(((v)->counter), (i))
 
diff --git a/arch/hexagon/include/asm/atomic.h b/arch/hexagon/include/asm/atomic.h
index 0231d69c8bf2..4ab895d7111f 100644
--- a/arch/hexagon/include/asm/atomic.h
+++ b/arch/hexagon/include/asm/atomic.h
@@ -12,8 +12,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)		{ (i) }
-
 /*  Normal writes in our arch don't clear lock reservations  */
 
 static inline void atomic_set(atomic_t *v, int new)
diff --git a/arch/ia64/include/asm/atomic.h b/arch/ia64/include/asm/atomic.h
index 50440f3ddc43..f267d956458f 100644
--- a/arch/ia64/include/asm/atomic.h
+++ b/arch/ia64/include/asm/atomic.h
@@ -19,7 +19,6 @@
 #include <asm/barrier.h>
 
 
-#define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
 #define atomic_read(v)		READ_ONCE((v)->counter)
diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/atomic.h
index 47228b0d4163..756c5cc58f94 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -16,8 +16,6 @@
  * We do not have SMP m68k systems, so we don't have to deal with that.
  */
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #define atomic_read(v)		READ_ONCE((v)->counter)
 #define atomic_set(v, i)	WRITE_ONCE(((v)->counter), (i))
 
diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index e5ac88392d1f..f904084fcb1f 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -45,7 +45,6 @@ static __always_inline type pfx##_xchg(pfx##_t *v, type n)		\
 	return xchg(&v->counter, n);					\
 }
 
-#define ATOMIC_INIT(i)		{ (i) }
 ATOMIC_OPS(atomic, int)
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 118953d41763..f960e2f32b1b 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -136,8 +136,6 @@ ATOMIC_OPS(xor, ^=)
 #undef ATOMIC_OP_RETURN
 #undef ATOMIC_OP
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #ifdef CONFIG_64BIT
 
 #define ATOMIC64_INIT(i) { (i) }
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index f6a3d145ffb7..8a55eb8cc97b 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -11,8 +11,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)		{ (i) }
-
 /*
  * Since *_return_relaxed and {cmp}xchg_relaxed are implemented with
  * a "bne-" instruction at the end, so an isync is enough as a acquire barrier
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 96f95c9ebd97..400a8c8b6de7 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -19,8 +19,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #define __atomic_acquire_fence()					\
 	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
 
diff --git a/arch/s390/include/asm/atomic.h b/arch/s390/include/asm/atomic.h
index 491ad53a0d4e..cae473a7b6f7 100644
--- a/arch/s390/include/asm/atomic.h
+++ b/arch/s390/include/asm/atomic.h
@@ -15,8 +15,6 @@
 #include <asm/barrier.h>
 #include <asm/cmpxchg.h>
 
-#define ATOMIC_INIT(i)  { (i) }
-
 static inline int atomic_read(const atomic_t *v)
 {
 	int c;
diff --git a/arch/sh/include/asm/atomic.h b/arch/sh/include/asm/atomic.h
index f37b95a80232..7c2a8a703b9a 100644
--- a/arch/sh/include/asm/atomic.h
+++ b/arch/sh/include/asm/atomic.h
@@ -19,8 +19,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 #define atomic_read(v)		READ_ONCE((v)->counter)
 #define atomic_set(v,i)		WRITE_ONCE((v)->counter, (i))
 
diff --git a/arch/sparc/include/asm/atomic_32.h b/arch/sparc/include/asm/atomic_32.h
index 94c930f0bc62..efad5532f169 100644
--- a/arch/sparc/include/asm/atomic_32.h
+++ b/arch/sparc/include/asm/atomic_32.h
@@ -18,8 +18,6 @@
 #include <asm/barrier.h>
 #include <asm-generic/atomic64.h>
 
-#define ATOMIC_INIT(i)  { (i) }
-
 int atomic_add_return(int, atomic_t *);
 int atomic_fetch_add(int, atomic_t *);
 int atomic_fetch_and(int, atomic_t *);
diff --git a/arch/sparc/include/asm/atomic_64.h b/arch/sparc/include/asm/atomic_64.h
index b60448397d4f..6b235d3d1d9d 100644
--- a/arch/sparc/include/asm/atomic_64.h
+++ b/arch/sparc/include/asm/atomic_64.h
@@ -12,7 +12,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)		{ (i) }
 #define ATOMIC64_INIT(i)	{ (i) }
 
 #define atomic_read(v)		READ_ONCE((v)->counter)
diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
index bf35e476a776..b6cac6e9bb70 100644
--- a/arch/x86/include/asm/atomic.h
+++ b/arch/x86/include/asm/atomic.h
@@ -14,8 +14,6 @@
  * resource counting etc..
  */
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 /**
  * arch_atomic_read - read atomic variable
  * @v: pointer of type atomic_t
diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 3e7c6134ed32..744c2f463845 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -19,8 +19,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 /*
  * This Xtensa implementation assumes that the right mechanism
  * for exclusion is for locking interrupts to level EXCM_LEVEL.
diff --git a/include/asm-generic/atomic.h b/include/asm-generic/atomic.h
index 286867f593d2..11f96f40f4a7 100644
--- a/include/asm-generic/atomic.h
+++ b/include/asm-generic/atomic.h
@@ -159,8 +159,6 @@ ATOMIC_OP(xor, ^)
  * resource counting etc..
  */
 
-#define ATOMIC_INIT(i)	{ (i) }
-
 /**
  * atomic_read - read atomic variable
  * @v: pointer of type atomic_t
diff --git a/include/linux/types.h b/include/linux/types.h
index d3021c879179..a147977602b5 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -167,6 +167,8 @@ typedef struct {
 	int counter;
 } atomic_t;
 
+#define ATOMIC_INIT(i) { (i) }
+
 #ifdef CONFIG_64BIT
 typedef struct {
 	s64 counter;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
