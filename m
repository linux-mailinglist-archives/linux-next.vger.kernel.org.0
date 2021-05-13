Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E95537F681
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 13:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbhEMLNl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 07:13:41 -0400
Received: from terminus.zytor.com ([198.137.202.136]:34563 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231255AbhEMLNk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 May 2021 07:13:40 -0400
Received: from [IPv6:2601:646:8602:8be1:5c7d:57f0:ac0a:2918] ([IPv6:2601:646:8602:8be1:5c7d:57f0:ac0a:2918])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 14DBBt4W2922109
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 13 May 2021 04:11:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 14DBBt4W2922109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021042801; t=1620904319;
        bh=qSPlqdGJ/YhmwRMi/TOo7jeYGsFgt5FeFY+duSoYoTQ=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=KwCCWaMZDe6K3+jBhdvhJFERObFtuGFKL5HHZWI2o3X9Kf5wQF7khDVFoEdsdIpyD
         Bey3gGoyMCQz3DuUHkMxjVwCG2kaIT8bKEY+qalLYpJ2go2Uyq3YHN7bX/BIgApPq5
         WeQVI7P5duykrSwo5JAkAKFhXfAwbQeOgZ1adh6qEwgxzIIqcqN2EDXFNbnhws6CVT
         qqhgAHY7DPY4Nv3e0Vt5J9671tlP9f5yrD/jpUqcsn3dX+CwglWpKtALdxiJ8uf+Qz
         HU4+OtUb1vMXzBvjzJ+NFPYjf06s+Z5K6La+wMVt8Sb/bCtnwuya5oWuNrKCfWDXhw
         xG+HESLWa9ZgQ==
Date:   Thu, 13 May 2021 04:11:49 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <YJ0Ew9gjprpCByxF@gmail.com>
References: <20210513120515.7060879c@canb.auug.org.au> <YJ0Ew9gjprpCByxF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Ingo Molnar <mingo@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <4A5E6F25-37B6-4114-AB3C-476F6F551DBD@zytor.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Needed some head scratching, but then=2E=2E=2E

It makes sense for the cross-build: it's building for the host, and a non-=
x86 machine isn't doing to have a register named "%rsp"=2E

So this needs to be protected from non-kernel use either via __KERNEL__ or=
 by factoring the basic macros out into a separate file=2E

Incidentally, we seem to have three categories of include files now: kerne=
l-only, uapi, and "tools api"=2E Perhaps we need such a "tapi" directory in=
stead of copying things around=2E=2E=2E the infrastructure for uapi with ma=
ke headers_install etc ought to be generalizable=2E


On May 13, 2021 3:51:47 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Stephen Rothwell <sfr@canb=2Eauug=2Eorg=2Eau> wrote:
>
>> Hi all,
>>=20
>> After merging the tip tree, today's linux-next build (x86_64
>allmodconfig)
>> failed like this:
>>=20
>> In file included from tools/arch/x86/include/asm/nops=2Eh:5,
>>                  from arch/x86/decode=2Ec:15:
>> tools/arch/x86/include/asm/asm=2Eh:185:24: error: invalid register name
>for 'current_stack_pointer'
>>   185 | register unsigned long current_stack_pointer asm(_ASM_SP);
>>       |                        ^~~~~~~~~~~~~~~~~~~~~
>>=20
>> Caused by commit
>>=20
>>   eef23e72b78b ("x86/asm: Use _ASM_BYTES() in <asm/nops=2Eh>")
>>=20
>> I have used the tip tree from next-20210512 for today=2E
>
>Hm, this must be some cross-build artifact or toolchain version
>dependency=20
>- as plain native build of x86-64 allmodconfig builds just fine:
>
>    CC       arch/x86/decode=2Eo
>    LD       arch/x86/objtool-in=2Eo
>
>I tried with gcc-8, but that didn't trigger it=2E
>
>I suppose the workaround below would make it build - but that's not a
>real=20
>solution=2E
>
>hpa, any ideas?
>
>Thanks,
>
>	Ingo
>
>diff --git a/tools/arch/x86/include/asm/asm=2Eh
>b/tools/arch/x86/include/asm/asm=2Eh
>index 507a37a46027=2E=2Eada5482c024a 100644
>--- a/tools/arch/x86/include/asm/asm=2Eh
>+++ b/tools/arch/x86/include/asm/asm=2Eh
>@@ -176,14 +176,6 @@
>=20
> /* For C file, we already have NOKPROBE_SYMBOL macro */
>=20
>-/*
>- * This output constraint should be used for any inline asm which has
>a "call"
>- * instruction=2E  Otherwise the asm may be inserted before the frame
>pointer
>- * gets set up by the containing function=2E  If you forget to do this,
>objtool
>- * may print a "call without frame pointer save/setup" warning=2E
>- */
>-register unsigned long current_stack_pointer asm(_ASM_SP);
>-#define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
> #endif /* __ASSEMBLY__ */
>=20
> #endif /* _ASM_X86_ASM_H */

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
