Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF18FA0E
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 06:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfHPEws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 00:52:48 -0400
Received: from ozlabs.org ([203.11.71.1]:53333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfHPEws (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 00:52:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468rXr4hJ2z9sND;
        Fri, 16 Aug 2019 14:52:43 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        benh@kernel.crashing.org, paulus@samba.org
Subject: Re: linux-next: build failure after merge of the arm64 tree
In-Reply-To: <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
References: <20190807095022.0314e2fc@canb.auug.org.au> <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com> <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
Date:   Fri, 16 Aug 2019 14:52:40 +1000
Message-ID: <87ftm17luv.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Will Deacon <will@kernel.org> writes:
> On Tue, Aug 06, 2019 at 07:34:36PM -0700, Peter Collingbourne wrote:
>> On Tue, Aug 6, 2019 at 4:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > After merging the arm64 tree, today's linux-next build (powerpc
>> > ppc64_defconfig) was just spinning in make - it executing some scripts,
>> > but it was hard to catch just what.
>> >
>> > Apparently caused by commit
>> >
>> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
>> >
>> > I have not idea why, but reverting the above commit allows to build
>> > to finish.
>> 
>> Okay, I can reproduce with:
>
> Likewise.
>
>> That leads me to ask what is special about $(NM) + powerpc? It turns
>> out to be this fragment of arch/powerpc/Makefile:
>> 
>> ifdef CONFIG_PPC64
>> new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' >
>> /dev/null; then echo y; else echo n; fi)
>> 
>> ifeq ($(new_nm),y)
>> NM              := $(NM) --synthetic
>> endif
>> endif
>> 
>> We're setting NM to something else based on a config option, which I
>> presume sets up some sort of circular dependency that confuses
>> Kconfig. Removing this fragment of the makefile (or appending
>> --synthetic unconditionally) also makes the problem go away.
>
> Yes, I think you're right. The lack of something like KBUILD_NMFLAGS means
> that architectures are forced to override NM entirely if they want to pass
> any specific options. Making that conditional on a Kconfig option appears
> to send the entire thing recursive.
>
>> So I guess we have a couple of possible quick fixes (assuming that the
>> Kconfig issue can't be solved somehow): either stop passing --synthetic on
>> powerpc and lose a couple of symbols in 64-bit kernels, or start passing
>> it unconditionally on powerpc (it doesn't seem to make a difference to the
>> nm output on a ppc64_defconfig kernel with CONFIG_PPC64=n). I'm cc'ing the
>> powerpc maintainers for their opinion on what to do. While this is being
>> resolved we should probably back out my patch from -next.
>
> Although Alpha, Itanic and PowerPC all override NM, only PowerPC does it
> conditionally so I agree with you that passing '--synthetic' unconditionally
> would resolve the problem and is certainly my preferred approach if mpe is
> ok with it.

I'd rather we keep passing --synthetic, otherwise there's the potential
that symbols go missing that were previously visible.

I think we can keep the new_nm check, but drop the dependency on
CONFIG_PPC64, and that will fix it. Worst case is we start passing
--synthetic on ppc32, but that's probably not a problem.

This seems to fix it for me, and 32-bit builds fine.

Do you want me to send a proper patch for this, or do you want to squash
it into the original series?

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a9..403f7e193833 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -39,13 +39,11 @@ endif
 uname := $(shell uname -m)
 KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defconfig
 
-ifdef CONFIG_PPC64
 new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' > /dev/null; then echo y; else echo n; fi)
 
 ifeq ($(new_nm),y)
 NM             := $(NM) --synthetic
 endif
-endif
 
 # BITS is used as extension for files which are available in a 32 bit
 # and a 64 bit version to simplify shared Makefiles.


cheers
