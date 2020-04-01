Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC8219B894
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 00:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387871AbgDAWkI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 18:40:08 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:35878 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387876AbgDAWkH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 18:40:07 -0400
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jJm1c-0001q4-RA; Thu, 02 Apr 2020 00:39:57 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id DC17E100D52; Thu,  2 Apr 2020 00:39:55 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the tip tree
In-Reply-To: <20200402090051.741905cd@canb.auug.org.au>
References: <20200330134746.627dcd93@canb.auug.org.au> <20200401085753.617c1636@canb.auug.org.au> <877dyzv6y2.fsf@nanos.tec.linutronix.de> <20200402090051.741905cd@canb.auug.org.au>
Date:   Thu, 02 Apr 2020 00:39:55 +0200
Message-ID: <874ku2q18k.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> On Wed, 01 Apr 2020 12:25:25 +0200 Thomas Gleixner <tglx@linutronix.de> wrote:
>> Me neither. Which compiler version?
>
> arm-linux-gnueabi-gcc (Debian 9.2.1-21) 9.2.1 20191130
>
>> I'm using arm-linux-gnueabi-gcc (Debian 8.3.0-2) 8.3.0 which does not
>> show that oddity.
>
> I assume it is because of the change to arch_futex_atomic_op_inuser()
> for arm and the compiler is not clever enough to work out that the early
> return from arch_futex_atomic_op_inuser() means that oldval is not
> referenced in its caller.

Actually no. It's the ASM part which causes this. With the following
hack applied it compiles:

diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
index e133da303a98..2c6b40f71009 100644
--- a/arch/arm/include/asm/futex.h
+++ b/arch/arm/include/asm/futex.h
@@ -132,7 +132,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
-	int oldval = 0, ret, tmp;
+	int oldval = 0, ret;
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
@@ -142,6 +142,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 #endif
 
 	switch (op) {
+#if 0
 	case FUTEX_OP_SET:
 		__futex_atomic_op("mov	%0, %4", ret, oldval, tmp, uaddr, oparg);
 		break;
@@ -157,6 +158,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 	case FUTEX_OP_XOR:
 		__futex_atomic_op("eor	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
 		break;
+#endif
 	default:
 		ret = -ENOSYS;
 	}

but with this is emits the warning:

diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
index e133da303a98..5191d7b61b83 100644
--- a/arch/arm/include/asm/futex.h
+++ b/arch/arm/include/asm/futex.h
@@ -145,6 +145,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 	case FUTEX_OP_SET:
 		__futex_atomic_op("mov	%0, %4", ret, oldval, tmp, uaddr, oparg);
 		break;
+#if 0
 	case FUTEX_OP_ADD:
 		__futex_atomic_op("add	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
 		break;
@@ -157,6 +158,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 	case FUTEX_OP_XOR:
 		__futex_atomic_op("eor	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
 		break;
+#endif
 	default:
 		ret = -ENOSYS;
 	}

and the below proves it:

diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
index e133da303a98..a9151884bc85 100644
--- a/arch/arm/include/asm/futex.h
+++ b/arch/arm/include/asm/futex.h
@@ -165,8 +165,13 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 	preempt_enable();
 #endif
 
-	if (!ret)
-		*oval = oldval;
+	/*
+	 * Store unconditionally. If ret != 0 the extra store is the least
+	 * of the worries but GCC cannot figure out that __futex_atomic_op()
+	 * is either setting ret to -EFAULT or storing the old value in
+	 * oldval which results in a uninitialized warning at the call site.
+	 */
+	*oval = oldval;
 
 	return ret;
 }

I think that's the right thing to do anyway. The conditional is pointless.

Thanks,

        tglx
