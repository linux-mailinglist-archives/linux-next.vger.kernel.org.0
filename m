Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86BE37F96F
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 16:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbhEMOL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 10:11:58 -0400
Received: from terminus.zytor.com ([198.137.202.136]:35947 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234348AbhEMOLu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 May 2021 10:11:50 -0400
Received: from [IPv6:2601:646:8602:8be1:5c7d:57f0:ac0a:2918] ([IPv6:2601:646:8602:8be1:5c7d:57f0:ac0a:2918])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 14DEAJkp2955655
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 13 May 2021 07:10:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 14DEAJkp2955655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021042801; t=1620915023;
        bh=lsNwHqYrdOPxDyN6/UREe5pqcpSuK5Odrcfx1pR1LGA=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=JhkGbgwsPDO7oHof9rli9KWYZ899bKMCynbbhOdJa7pNACriDEgaac1JDiL0JXIJJ
         MVM/c8Sd2/lWqV61NDkQg11MPLHPM4Jk2aVPIaV6Q5AYhSeNgS8h794iB7bCGk802R
         trc9+BIUVqGfbyFJqcAveYUyTNca/8BIPFpWzYhdEEz59YFTgRJUJqrN4VtvUG+7fp
         b1YqUJNB5ZolmTTYNfVKO/jFvs5pUQGEyLULtfRAeV/3ZQmpKC3PHq8zOUsmQyNHFs
         sDelNJPe+7b5B6qbFQ9IcZ89NRP5XQ2WQDJ2Z7ibMIToB2bQ3wnJaiNXmr2Vh1t9zp
         vq6zoqe22K9ZA==
Date:   Thu, 13 May 2021 07:10:11 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <YJ0RM2JIfFL8a0X2@gmail.com>
References: <20210513120515.7060879c@canb.auug.org.au> <YJ0Ew9gjprpCByxF@gmail.com> <4A5E6F25-37B6-4114-AB3C-476F6F551DBD@zytor.com> <YJ0RM2JIfFL8a0X2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] x86/asm: Make <asm/asm.h> valid on cross-builds as well
To:     Ingo Molnar <mingo@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <712482C6-B967-4F3D-A47F-0945219A9CBB@zytor.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Makes sense to me=2E

Reviewed-by: H=2E Peter Anvin <hpa@zytor=2Ecom>

On May 13, 2021 4:44:51 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>
>> Needed some head scratching, but then=2E=2E=2E
>>=20
>> It makes sense for the cross-build: it's building for the host, and a
>
>> non-x86 machine isn't doing to have a register named "%rsp"=2E
>
>Oh, indeed, sfr is building on powerpc64 I think?
>
>> So this needs to be protected from non-kernel use either via
>__KERNEL__=20
>> or by factoring the basic macros out into a separate file=2E
>
>So something like the below?
>
>The exception table stuff is definitely kernel-only=2E The others could,
>in=20
>principle, be used by tooling as well=2E
>
>Thanks,
>
>	Ingo
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
>From: Ingo Molnar <mingo@kernel=2Eorg>
>Date: Thu, 13 May 2021 13:41:41 +0200
>Subject: [PATCH] x86/asm: Make <asm/asm=2Eh> valid on cross-builds as
>well
>
>Stephen Rothwell reported that the objtool cross-build breaks on
>non-x86 hosts:
>
>> tools/arch/x86/include/asm/asm=2Eh:185:24: error: invalid register name
>for 'current_stack_pointer'
>  >   185 | register unsigned long current_stack_pointer asm(_ASM_SP);
>  >       |                        ^~~~~~~~~~~~~~~~~~~~~
>
>The PowerPC host obviously doesn't know much about x86 register names=2E
>
>Protect the kernel-specific bits of <asm/asm=2Eh>, so that it can be
>included by tooling and cross-built=2E
>
>Reported-by: Stephen Rothwell <sfr@canb=2Eauug=2Eorg=2Eau>
>Signed-off-by: Ingo Molnar <mingo@kernel=2Eorg>
>---
> arch/x86/include/asm/asm=2Eh       | 4 ++++
> tools/arch/x86/include/asm/asm=2Eh | 4 ++++
> 2 files changed, 8 insertions(+)
>
>diff --git a/arch/x86/include/asm/asm=2Eh b/arch/x86/include/asm/asm=2Eh
>index 507a37a46027=2E=2E3ad3da9a7d97 100644
>--- a/arch/x86/include/asm/asm=2Eh
>+++ b/arch/x86/include/asm/asm=2Eh
>@@ -120,6 +120,8 @@
> # define CC_OUT(c) [_cc_ ## c] "=3Dqm"
> #endif
>=20
>+#ifdef __KERNEL__
>+
> /* Exception table entry */
> #ifdef __ASSEMBLY__
> # define _ASM_EXTABLE_HANDLE(from, to, handler)			\
>@@ -186,4 +188,6 @@ register unsigned long current_stack_pointer
>asm(_ASM_SP);
> #define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
> #endif /* __ASSEMBLY__ */
>=20
>+#endif /* __KERNEL__ */
>+
> #endif /* _ASM_X86_ASM_H */
>diff --git a/tools/arch/x86/include/asm/asm=2Eh
>b/tools/arch/x86/include/asm/asm=2Eh
>index 507a37a46027=2E=2E3ad3da9a7d97 100644
>--- a/tools/arch/x86/include/asm/asm=2Eh
>+++ b/tools/arch/x86/include/asm/asm=2Eh
>@@ -120,6 +120,8 @@
> # define CC_OUT(c) [_cc_ ## c] "=3Dqm"
> #endif
>=20
>+#ifdef __KERNEL__
>+
> /* Exception table entry */
> #ifdef __ASSEMBLY__
> # define _ASM_EXTABLE_HANDLE(from, to, handler)			\
>@@ -186,4 +188,6 @@ register unsigned long current_stack_pointer
>asm(_ASM_SP);
> #define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
> #endif /* __ASSEMBLY__ */
>=20
>+#endif /* __KERNEL__ */
>+
> #endif /* _ASM_X86_ASM_H */

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
