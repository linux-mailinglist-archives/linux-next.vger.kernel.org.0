Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A5A84AFD
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfHGLqU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 07:46:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728235AbfHGLqU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 07:46:20 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A27B21BF6;
        Wed,  7 Aug 2019 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565178378;
        bh=71XmBvCa/h7frFTi6KSxetoEQBU7S+V7meKhHdKgYvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ed+R3e9wNoY92TmQ657ha+wnFgD1UIo2ZLDBrvrUZOP6WjiF7MKkOEFOa+j3B1xWq
         L4KcAXcpqZmPDFTab7KcC55liscX7STUJYodVKILYbbyzrwM6Ff+lzpdzbgrqsi+/Z
         5l7CCbWoctc3XKBh2Xu3jZtN0Onj8WGrM/RjYElI=
Date:   Wed, 7 Aug 2019 12:46:14 +0100
From:   Will Deacon <will@kernel.org>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Subject: Re: linux-next: build failure after merge of the arm64 tree
Message-ID: <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
References: <20190807095022.0314e2fc@canb.auug.org.au>
 <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Peter,

On Tue, Aug 06, 2019 at 07:34:36PM -0700, Peter Collingbourne wrote:
> On Tue, Aug 6, 2019 at 4:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > After merging the arm64 tree, today's linux-next build (powerpc
> > ppc64_defconfig) was just spinning in make - it executing some scripts,
> > but it was hard to catch just what.
> >
> > Apparently caused by commit
> >
> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
> >
> > I have not idea why, but reverting the above commit allows to build
> > to finish.
> 
> Okay, I can reproduce with:

Likewise.

> That leads me to ask what is special about $(NM) + powerpc? It turns
> out to be this fragment of arch/powerpc/Makefile:
> 
> ifdef CONFIG_PPC64
> new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' >
> /dev/null; then echo y; else echo n; fi)
> 
> ifeq ($(new_nm),y)
> NM              := $(NM) --synthetic
> endif
> endif
> 
> We're setting NM to something else based on a config option, which I
> presume sets up some sort of circular dependency that confuses
> Kconfig. Removing this fragment of the makefile (or appending
> --synthetic unconditionally) also makes the problem go away.

Yes, I think you're right. The lack of something like KBUILD_NMFLAGS means
that architectures are forced to override NM entirely if they want to pass
any specific options. Making that conditional on a Kconfig option appears
to send the entire thing recursive.

> So I guess we have a couple of possible quick fixes (assuming that the
> Kconfig issue can't be solved somehow): either stop passing --synthetic on
> powerpc and lose a couple of symbols in 64-bit kernels, or start passing
> it unconditionally on powerpc (it doesn't seem to make a difference to the
> nm output on a ppc64_defconfig kernel with CONFIG_PPC64=n). I'm cc'ing the
> powerpc maintainers for their opinion on what to do. While this is being
> resolved we should probably back out my patch from -next.

Although Alpha, Itanic and PowerPC all override NM, only PowerPC does it
conditionally so I agree with you that passing '--synthetic' unconditionally
would resolve the problem and is certainly my preferred approach if mpe is
ok with it.

In the meantime, it seems a shame to revert your patch, so I'll bodge it
as below and we can revert the bodge if PowerPC manages to remove the
conditional NM override. Sound ok to you?

Cheers,

Will

--->8

diff --git a/init/Kconfig b/init/Kconfig
index d96127ebc44e..a38027a06b79 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -31,7 +31,7 @@ config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
 config TOOLS_SUPPORT_RELR
-	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
+	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(CROSS_COMPILE)nm" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 
 config CC_HAS_WARN_MAYBE_UNINITIALIZED
 	def_bool $(cc-option,-Wmaybe-uninitialized)
