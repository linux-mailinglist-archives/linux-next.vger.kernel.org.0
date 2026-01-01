Return-Path: <linux-next+bounces-9515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5069CECEDA
	for <lists+linux-next@lfdr.de>; Thu, 01 Jan 2026 10:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E5D30076A5
	for <lists+linux-next@lfdr.de>; Thu,  1 Jan 2026 09:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF21280308;
	Thu,  1 Jan 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a5CfWcRn"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F7F22F388;
	Thu,  1 Jan 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767259323; cv=none; b=Mha4aXi1UP80MPSjLHCXBJ8WuUyse/8i5a5Ug+8q91svOZ6Q4tvO0bU1cQFcGMfMls8DuiVx2q24CIACpr0RxR6tduaMPCseF1ai9HyA8QjTr+Jjzf2v+ez+I/YP95g4UBLrF9HwEJiPWJUjGNLJj96kLUQpEdWCAtYJkVWbSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767259323; c=relaxed/simple;
	bh=/mVHcyIBYA41kVdzB34+Lqn95bry4C3DSCCBDqCZerE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TIV4xcfAVCFbsYnjnywUMj0H36soJ+uMWAS20q8/CZafWaKyaSfTJXttLo30e5ZDsoU1/ND+TKGV1TIQ37SUL9wkJZ+mDxU3bPEFsVk1mLYpEvrBLivoVH4ThPuGcQBrNC9hhOhqcC06Fr4GpLn3dKSE5yJQ/BrClYeX1XFMEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a5CfWcRn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EACDA7A0040;
	Thu,  1 Jan 2026 04:21:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 01 Jan 2026 04:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767259318; x=1767345718; bh=4Q3BncsmsRAe/KKpDmA6P1xD/P55g252gRH
	WPhEdpBU=; b=a5CfWcRnxKjJq54b12n7r0b74GJqFibhyVwIRuxOJXbEcvi3esz
	+9db2HSoMVL2LSjKXkOeXv3pkxOW4IpVq0zEvx65NAUGa6lKmoY99UC5xbRd/cCg
	HeHwTbXGuhfWHj6CgQgOPjVgovoDPWu3Ax2xgpFZ97XpaXt9KkWVk4HN8nz1JFQN
	14QB4beGrdkDWgsjleqsa8R0T/wyMuqiO0Pvmg3QfNWDqfFcvIS/I/PZDh+zD1YD
	fxWQ6GaoGvp9cPQWz9IY1qaT1OFA1K9QEnUqscOWF6tTqufQdIZagsgqBG9N3DjN
	oW2AKQ5+TWfaXh2384b9CGH+DwzxYcIRI4Q==
X-ME-Sender: <xms:tTxWaXz-NoBQlbuRJa0oVY3WlIaX2AV2eaPkZHfOsl4Pg7GbfqvoYQ>
    <xme:tTxWaXfTz-T8GPK_ou_QY7dHFK4D7_lIr_i5OFOAT2utalwVDD5Lysvh9Peq3kNz0
    qVJlJYsjtily9tNN_S4SY_hgYnLyXCycdcvxJ-34duf0MS5uRIx8yA>
X-ME-Received: <xmr:tTxWac61qNHZnzV4-bHyhP_qx5HdXUrGztZUsNGY-HqSFOGlbB9v8OS5-20XIjC68Ia8-D75YW_aOJGuRg-eVEBVMBTUCbI6-24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekheegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepkeffjefgfeduuddufeffjeffvdeifeefudfgkeevgfeftdejueehhedtteegvdek
    necuffhomhgrihhnpeduledqrhgtuddrshhopdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhgusgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehsfhhrsegtrghnsgdrrghu
    uhhgrdhorhhgrdgruhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tTxWacICjXjbm5Fcz2wNF8LkiE4elOL2gzyZ4g4w7DA3ACqstN5jAw>
    <xmx:tTxWaUy8qsJUnNRu6W2rDLwYyGYehJ4X_lhrCpNHpKmknyIFR9zPRw>
    <xmx:tTxWaUJH07zF7n6kJWYQu_bnwi0XitldoFGBVJo9XYaWBlws3Vlcug>
    <xmx:tTxWaTW-nfTCcqMrgiLIoT2BAUTEAYL_aLx4LVPiHj42kEmFMx5MgQ>
    <xmx:tjxWaUMXzXXIfpnUnXRBN8j-Y6gAFko82TTvBHa3FfiFObbsxkz86Gjc>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jan 2026 04:21:54 -0500 (EST)
Date: Thu, 1 Jan 2026 20:21:46 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Sasha Levin <sashal@kernel.org>
cc: Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
    x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
In-Reply-To: <df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org>
Message-ID: <4a3455a6-a0dc-f7fb-8b68-da471bb312c7@linux-m68k.org>
References: <20251218153050.44da4a78@canb.auug.org.au> <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org> <aU67sD1u83Qrpvdu@laps> <df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 29 Dec 2025, Finn Thain wrote:

> On Fri, 26 Dec 2025, Sasha Levin wrote:
> 
> > On Sun, Dec 21, 2025 at 01:58:17PM +1100, Finn Thain wrote:
> > >
> > >On Thu, 18 Dec 2025, Stephen Rothwell wrote:
> > >
> > >> After merging the mm-nonmm-unstable tree, today's linux-next build 
> > >> (x86_64 allmodconfig) failed like this:
> > >>
> > >> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from
> > >> `arch/x86/boot/compressed/sev-handle-vc.o'
> > >>
> > >
> > >I found that I could reproduce the same build failure after applying 
> > >Peter's patch to v6.19-rc1. So it's not confined to linux-next. I 
> > >used allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and 
> > >CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.
> > >
> > >The patch in question is this one: 
> > >https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/
> > >
> > >I may have found a solution for the problem, but I don't understand 
> > >this code, so I've Cc'd Ard et al. I don't know whether the 
> > >__bug_table section is relevant to sev-handle-vc.c. If that section 
> > >is not desired, I propose to make this change to Peter's patch --
> > 
> > I think that the issue here is that we're trying to use WARN in the 
> > early boot context. We should probably add CONFIG_DEBUG_ATOMIC to the 
> > list of configs we disable for that:
> > 
> > diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> > index 4f86c5903e03..bb36dcef7d08 100644
> > --- a/arch/x86/boot/compressed/misc.h
> > +++ b/arch/x86/boot/compressed/misc.h
> > @@ -14,6 +14,7 @@
> >  #undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> >  #undef CONFIG_KASAN
> >  #undef CONFIG_KASAN_GENERIC
> > +#undef CONFIG_DEBUG_ATOMIC
> > 
> 
> Thanks for sending that suggestion. It does fix the problem on x86_64. 
> However, the problem also affects arm, arm64, riscv, riscv64 and 
> loongarch. The fix I proposed (i.e. test __DISABLE_EXPORTS) works on all 
> of the affected architectures because 
> drivers/firmware/efi/libstub/Makefile puts -D__DISABLE_EXPORTS in 
> CFLAGS, just as arch/x86/boot/compressed/Makefile does.
> 
> AFAICT, when I put -UCONFIG_DEBUG_ATOMIC in CFLAGS, it doesn't override 
> that macro definition autoconf.h. And there is no equivalent of 
> arch/x86/boot/compressed/misc.h in drivers/firmware/efi/libstub so I 
> can't simply add #undef CONFIG_DEBUG_ATOMIC there.
> 

I'd better correct myself. That header does actually exist:
drivers/firmware/efi/libstub/efistub.h
I overlooked it somehow.

> If __DISABLE_EXPORTS is not the appropriate macro for this purpose, then 
> we need a new macro (e.g. __DISABLE_BUG_TABLE) or else we need a new 
> header, to be included by some unknown set of .c files (that might 
> accidentally #include bug.h) so that this new header could do #undef 
> CONFIG_DEBUG_ATOMIC. My inclination is to implement 
> -D__DISABLE_BUG_TABLE but I'm open to suggestions.
> 

After I sent patches using -D__DISABLE_BUG_TABLE, I figured out that your 
#undef suggestion has some appeal: by confining the preprocessor tricks to 
drivers/firmware/efi/libstub/, we might avoid spreading them across 
include/linux/ which has a certain tidyness to it.

The only problem is fragility. The ordering of #include and #undef 
directives is critical and complicated. I can't seem to get it right.
The following patch produces a build failure.

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index fd855e32c9b9..8442eebaada1 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -8,6 +8,7 @@
  * we just keep it from happening. (This list needs to be extended when new
  * paravirt and debugging variants are added.)
  */
+#include <generated/autoconf.h>
 #undef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS


Problem is, you can't do #undef unless you know that #define has already 
taken place, and you can't #define again if #undef has already taken 
place...

Anyway, that's just BTW: I don't feel any need to revise the patches I 
sent.

