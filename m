Return-Path: <linux-next+bounces-9507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822ACE643F
	for <lists+linux-next@lfdr.de>; Mon, 29 Dec 2025 09:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 924073005A95
	for <lists+linux-next@lfdr.de>; Mon, 29 Dec 2025 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81649238178;
	Mon, 29 Dec 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ewatZJ2U"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513C22A7F1;
	Mon, 29 Dec 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766998540; cv=none; b=B7x1u/RkgyamYZNAz8O140AkA46dWo/1oXj6TReQlYbJ2fgfAIDdofszjG+Zw1FcN3AGJWwAXuulRvIzpQx8ae5yUOClxmwOTwVusgxne0m9gKswTQZSkZDGDpNEotf53Xg+PV0sX2YddRE67OqD0lS1ZRpjy8KPwtmzx4oASmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766998540; c=relaxed/simple;
	bh=frU2xzxTMRDafkwBbpl+dvDQ9+jrgVjRC4Ok5hHbI/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XN2kO+UOn3kIRWTPPCp5ulxf5QSMYZPl7cLiQgNjNKCzoSQH7Noj3qi+FMq7InqEMZatS0z2S3TG5MINDTFAyO3HTIBBtdN9gY5ToB9eAg0g/P5LYAOUWyZrdgpGD/fOnDszG3DRaJoyM5RaiOzA45GxRHPA+vgMhk/qOILj4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ewatZJ2U; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 8A3ADEC021D;
	Mon, 29 Dec 2025 03:55:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 29 Dec 2025 03:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1766998536; x=1767084936; bh=oRR4TWayPDqMUlUgrTukSRmLAwfX6hgh8FB
	mPb543CE=; b=ewatZJ2URNJshljRKsJPI1Ylbw5gzky46fxohgQcHC9avAljO3I
	RSWD6xAPTXTndLnFiRH9rgDrNcYWp22pdoI41M4sIIE39pFGsvrlSsNQW3D7kaMh
	ldjZvgp3b8eBsLjZ3CNIvEfWrzqw+kxNuRXCmQQBdZ2R/gKo7NHKe5JNLdSNam1I
	s3EKxLNmTSGzhZ7sTGtQqrzly3YXO+Leiyc3PlGMj0VDxCB9FVf0sFO2rV8BLga+
	pQKfkG7TZAok1XGgr8MSf6IijFIRfz03wBH6jdorYdB7bu9bw66H6xa0DnQyuqHX
	P9gZC5eXCNwdoaGtPxzklYkMtoQlPU8DVxA==
X-ME-Sender: <xms:B0JSadIFN4V-g9fAtFSLdypGkcVdF3elI6UDO7AhraIz5f-qKBNLyA>
    <xme:B0JSaRU3smNU3Cuz2ftcXNqD73rTVycn7m219gwmXKGjhDSCqEMxdIHMzTl8dZxMs
    lNsRMLwD2z5TVVdrjWOUPVga0wZxqk_g11Svq2tNGMIfzI0tTSamg>
X-ME-Received: <xmr:B0JSaRQUNRctIAj8qipoTuLp9P3xEGI62cYFBc6bN-upEV-EpsSObuYssNlD0iLqdcL3uG4aQV3WvMv9rTPnVVvti81flTZuXY4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejieejvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:B0JSaZAKjM7pJRK3zeZc7eQQc32xJI3JSs-6cpYITkVdKlYOgxxLDw>
    <xmx:B0JSaQIjLFcQ2xz8Sy154KMFd8TU_O4LhifRSYmfRL4RSWLI3dow4A>
    <xmx:B0JSacCG-732Mtm7KS9b329qdn5hBXbYUou_5BRrDBZytAroA6naHw>
    <xmx:B0JSadv682eiA552CjB8TcIFYqvmNImIvJaKiHS0oeVq-Z13kgAaYA>
    <xmx:CEJSaU7Warm0jqxmkHBPc9SH2tsQoNIE6k-_DJ7WF_-eLABzINB9jaBW>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 03:55:32 -0500 (EST)
Date: Mon, 29 Dec 2025 19:56:44 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Sasha Levin <sashal@kernel.org>
cc: Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
    x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
In-Reply-To: <aU67sD1u83Qrpvdu@laps>
Message-ID: <df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org>
References: <20251218153050.44da4a78@canb.auug.org.au> <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org> <aU67sD1u83Qrpvdu@laps>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 26 Dec 2025, Sasha Levin wrote:

> On Sun, Dec 21, 2025 at 01:58:17PM +1100, Finn Thain wrote:
> >
> >On Thu, 18 Dec 2025, Stephen Rothwell wrote:
> >
> >> After merging the mm-nonmm-unstable tree, today's linux-next build
> >> (x86_64 allmodconfig) failed like this:
> >>
> >> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from
> >> `arch/x86/boot/compressed/sev-handle-vc.o'
> >>
> >
> >I found that I could reproduce the same build failure after applying
> >Peter's patch to v6.19-rc1. So it's not confined to linux-next. I used
> >allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and
> >CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.
> >
> >The patch in question is this one:
> >https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/
> >
> >I may have found a solution for the problem, but I don't understand this
> >code, so I've Cc'd Ard et al. I don't know whether the __bug_table section
> >is relevant to sev-handle-vc.c. If that section is not desired, I propose
> >to make this change to Peter's patch --
> 
> I think that the issue here is that we're trying to use WARN in the 
> early boot context. We should probably add CONFIG_DEBUG_ATOMIC to the 
> list of configs we disable for that:
> 
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index 4f86c5903e03..bb36dcef7d08 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -14,6 +14,7 @@
>  #undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_DEBUG_ATOMIC
> 

Thanks for sending that suggestion. It does fix the problem on x86_64. 
However, the problem also affects arm, arm64, riscv, riscv64 and 
loongarch. The fix I proposed (i.e. test __DISABLE_EXPORTS) works on all 
of the affected architectures because 
drivers/firmware/efi/libstub/Makefile puts -D__DISABLE_EXPORTS in CFLAGS, 
just as arch/x86/boot/compressed/Makefile does.

AFAICT, when I put -UCONFIG_DEBUG_ATOMIC in CFLAGS, it doesn't override 
that macro definition autoconf.h. And there is no equivalent of 
arch/x86/boot/compressed/misc.h in drivers/firmware/efi/libstub so I can't 
simply add #undef CONFIG_DEBUG_ATOMIC there.

If __DISABLE_EXPORTS is not the appropriate macro for this purpose, then 
we need a new macro (e.g. __DISABLE_BUG_TABLE) or else we need a new 
header, to be included by some unknown set of .c files (that might 
accidentally #include bug.h) so that this new header could do #undef 
CONFIG_DEBUG_ATOMIC. My inclination is to implement -D__DISABLE_BUG_TABLE 
but I'm open to suggestions.

