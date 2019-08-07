Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED8084FCC
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 17:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbfHGPZN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 11:25:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387815AbfHGPZN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 11:25:13 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D092B2199C;
        Wed,  7 Aug 2019 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565191511;
        bh=R0cxUUU2n2BAdx2vkaNGAMUuI5Mc+vsow+jDxNZKzKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2TaYZxu8SZ0cdXn25bFcFX5hGnlPG1hs6hDmQeQPJf86NIZurQYAyvrNzo2pPHJm0
         rdItY+C71vzubF77ZB/0ere9UztnqUrqPOUE2erz51U8wzgreuGBNYwbB3mNPSYB8A
         AoJiXIenuRYXQnz/yu8Q7utPwWvaQrW691rgHZ8E=
Date:   Wed, 7 Aug 2019 16:25:06 +0100
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Peter Collingbourne <pcc@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the arm64 tree
Message-ID: <20190807152506.m2mzzjtb7kzjoiia@willie-the-truck>
References: <20190807095022.0314e2fc@canb.auug.org.au>
 <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
 <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
 <CAK7LNASr8mbGDbWikr2P8Pc_6WEpMyXuK-xkgypYOzkWw_6LUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASr8mbGDbWikr2P8Pc_6WEpMyXuK-xkgypYOzkWw_6LUw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Masahiro,

On Wed, Aug 07, 2019 at 11:43:02PM +0900, Masahiro Yamada wrote:
> On Wed, Aug 7, 2019 at 8:46 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Aug 06, 2019 at 07:34:36PM -0700, Peter Collingbourne wrote:
> > > We're setting NM to something else based on a config option, which I
> > > presume sets up some sort of circular dependency that confuses
> > > Kconfig. Removing this fragment of the makefile (or appending
> > > --synthetic unconditionally) also makes the problem go away.
> 
> Exactly. This makes a circular dependency.
> Kconfig determines the environment variable 'NM' has been changed,
> and re-runs.
> 
> > Yes, I think you're right. The lack of something like KBUILD_NMFLAGS means
> > that architectures are forced to override NM entirely if they want to pass
> > any specific options. Making that conditional on a Kconfig option appears
> > to send the entire thing recursive.
> 
> Adding KBUILD_NMFLAGS is probably the right thing to do.
> (Is there somebody who wants to volunteer for this?)

I don't think so ;) We don't do this for many other tools, and there's only
this one case that really seems to require it.

> But, for this particular case, I vote for
> the entire removal of --synthetic.
> 
> This dates back to 2004, and the commit message
> did not clearly explain why it was needed.
> 
> The PowerPC maintainers should re-evaluate
> whether or not this flag is necessary.
> 
> ppc32 is working without --synthetic,
> so probably ppc64 would be ...

Again, this is up to the PPC maintainers.

> > diff --git a/init/Kconfig b/init/Kconfig
> > index d96127ebc44e..a38027a06b79 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -31,7 +31,7 @@ config CC_HAS_ASM_GOTO
> >         def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> >
> >  config TOOLS_SUPPORT_RELR
> > -       def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
> > +       def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(CROSS_COMPILE)nm" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
> >
> >  config CC_HAS_WARN_MAYBE_UNINITIALIZED
> >         def_bool $(cc-option,-Wmaybe-uninitialized)
> 
> Maybe,
> 
> def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "OBJCOPY=$(OBJCOPY)"
> $(srctree)/scripts/tools-support-relr.sh)
> 
> will work.

Oh yes, I prefer that. I've included the updated patch below, and I'll
put it into -next shortly so that we resolve the build breakage. Hopefully
we'll have a better fix once the ozlabs folks wake up.

> Or more simply
> 
> def_bool $(success,$(srctree)/scripts/tools-support-relr.sh)
> 
> CC, LD, OBJCOPY, NM are environment variables,
> so I think tools-support-relr.sh can directly use them.

Maybe, but the other scripts invoked here tend to pass $(CC) through as
an argument, and that helps with your observation below...:

> However, this bypasses the detection of environment variable changes.
> If a user passes NM= from the command line, Kconfig will no longer
> notice the change of NM.

... but since my proposal also breaks this, then I think your idea of just
dropping $NM for now is best.

Will

--->8

From 71c67a31f09fa8fdd1495dffd96a5f0d4cef2ede Mon Sep 17 00:00:00 2001
From: Will Deacon <will@kernel.org>
Date: Wed, 7 Aug 2019 12:48:33 +0100
Subject: [PATCH] init/Kconfig: Fix infinite Kconfig recursion on PPC

Commit 5cf896fb6be3 ("arm64: Add support for relocating the kernel with
RELR relocations") introduced CONFIG_TOOLS_SUPPORT_RELR, which checks
for RELR support in the toolchain as part of the kernel configuration.
During this procedure, "$(NM)" is invoked to see if it supports the new
relocation format, however PowerPC conditionally overrides this variable
in the architecture Makefile in order to pass '--synthetic' when
targetting PPC64.

This conditional override causes Kconfig to recurse forever, since
CONFIG_TOOLS_SUPPORT_RELR cannot be determined without $(NM) being
defined, but that in turn depends on CONFIG_PPC64:

  $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-
  scripts/kconfig/conf  --syncconfig Kconfig
  scripts/kconfig/conf  --syncconfig Kconfig
  scripts/kconfig/conf  --syncconfig Kconfig
  [...]

In this particular case, it looks like PowerPC may be able to pass
'--synthetic' unconditionally to nm or even drop it altogether. While
that is being resolved, let's just bodge the RELR check by picking up
$(NM) directly from the environment in whatever state it happens to be
in.

Cc: Peter Collingbourne <pcc@google.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index d96127ebc44e..8b4596edda4e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -31,7 +31,7 @@ config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
 config TOOLS_SUPPORT_RELR
-	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
+	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 
 config CC_HAS_WARN_MAYBE_UNINITIALIZED
 	def_bool $(cc-option,-Wmaybe-uninitialized)
-- 
2.17.1

