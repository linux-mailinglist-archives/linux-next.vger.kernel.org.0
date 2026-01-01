Return-Path: <linux-next+bounces-9517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21ACED8B1
	for <lists+linux-next@lfdr.de>; Fri, 02 Jan 2026 00:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAEE130056F9
	for <lists+linux-next@lfdr.de>; Thu,  1 Jan 2026 23:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2391419CD1B;
	Thu,  1 Jan 2026 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PpgS51Ov"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC717A586;
	Thu,  1 Jan 2026 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767309352; cv=none; b=C6tc9mS9IyrqZTDTVnMQldv4qcTg+dBPEEUniaYprcwPVH+an7N4WqvqqhInJ5wwFAc6+EpEIBgKNhAqRUrosn0sgca7yNeczGtk0XR9xg0O39rZrltjwhNkntG8nEsq28OII3Pxoxf0klJ5+/lqxqhN3qXOYQ3jXl7so6a/RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767309352; c=relaxed/simple;
	bh=713u+FjkUUPYLP+jnsXIwYlCMCLklecAUvjVzxhyfEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=US0YuurRT5wp6RYYI1ihwKy12E1Al74qmjJ3Bw3xSNmNtEWahUH0sDeLVxnM+saKms/xhxAT7h4wtbSuzAcIusTt8JfCF68yxcGvi6/HzUYOOEC9iNbMv6sIdUYMtOvW57HPEKhgS/it3T6CH+sfj5glrtINKHWjgLb4mYpVUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PpgS51Ov; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id DFE92EC02FE;
	Thu,  1 Jan 2026 18:15:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 01 Jan 2026 18:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767309347; x=1767395747; bh=fXeiVUpN14yoAK2l+zb0ArNGoy3quSVAU4q
	+Y4KikI0=; b=PpgS51Ov/lNXXc/GoSgcgMFTxiVW4cVE7RZJxO6mt5LUXOT4UTv
	gpzhj8de4DJ+QqD9TXhAquv9hQsO1PRc7xZ5tuvZNfNCX73MfczRxCdpo6ooylzO
	o+dfhzyLl+PZZOz0DfBHyU+Xv2UFJRqav+swr0fOg323+aFajeeMCFru6EZK5+Eb
	+e1KRSn5v7YYnvSzKODkpEj3Ah89eGF7qmHK20uX67ITTFSiRj1aIf0MdYLUgEpz
	63AobVQy1VQaFsD7jvIp0bHbW2oY8z/Lb9dVi+E6l0D/wPjga+5PlcLwBvqD8+tY
	rxAU00sV6bwKNMkY3Q4qAdiYWyZ1BpCgcjw==
X-ME-Sender: <xms:IwBXaYJN0XFlbrfpo-XCCtvXTGN8z001D3CggkG2sDNkI0rvF85HlQ>
    <xme:IwBXaT83ym4g79SD7ej5FOgFDxaA05a2gC3PylLjfV-AcdsuHEvhPqtutM3lHKNKi
    xyanv1cgciqUv-I1-3NZBY_cw8n13iDvbl0FwQt19P5YI8NDUCfb1Q>
X-ME-Received: <xmr:IwBXaUFZITKwY_w2UQpVx4KdxaRET7et_Uw40LlXUqQRYzjo4JfXcC3B3nx-7DNcgzaRqDZhaB0I946t8hLpvnVFtqbClc0Z8E8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekjedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepuddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhgusgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehsfhhrsegtrghnsgdrrghu
    uhhgrdhorhhgrdgruhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IwBXae6j_SZKj4P91UNzf0iH5okDj8X3Dh1xwJq3n-V2o-IBn9Tb2g>
    <xmx:IwBXadY2OUXJMkYfBHOtzDFuS4G2M6Kcq9ozMdE0ZBCFOoNL22-3eQ>
    <xmx:IwBXachu5yxHNYjkOfudjOcPP7Jh67I46Ne3XK5DKtaIAcJOCicPSA>
    <xmx:IwBXaffoCmY8DewDAxPmFMKp1CKPADFjYZypWt7aaovuG3l0LIejoQ>
    <xmx:IwBXaT0w4mg21VJjOarA73Ziw2-jzq2jNQ9AtwKR665vvOCOu9d70lAB>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jan 2026 18:15:45 -0500 (EST)
Date: Fri, 2 Jan 2026 10:15:39 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Randy Dunlap <rdunlap@infradead.org>
cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
    x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
In-Reply-To: <77d3d65a-9ef0-451e-b24f-1b3f38cf822b@infradead.org>
Message-ID: <84ebf3ef-1385-1b11-772b-7bccac4d25ae@linux-m68k.org>
References: <20251218153050.44da4a78@canb.auug.org.au> <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org> <aU67sD1u83Qrpvdu@laps> <df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org> <4a3455a6-a0dc-f7fb-8b68-da471bb312c7@linux-m68k.org>
 <77d3d65a-9ef0-451e-b24f-1b3f38cf822b@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 1 Jan 2026, Randy Dunlap wrote:

> > The following patch produces a build failure.
> > 
> > diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> > index fd855e32c9b9..8442eebaada1 100644
> > --- a/arch/x86/boot/compressed/misc.h
> > +++ b/arch/x86/boot/compressed/misc.h
> > @@ -8,6 +8,7 @@
> >   * we just keep it from happening. (This list needs to be extended when new
> >   * paravirt and debugging variants are added.)
> >   */
> > +#include <generated/autoconf.h>
> >  #undef CONFIG_PARAVIRT
> >  #undef CONFIG_PARAVIRT_XXL
> >  #undef CONFIG_PARAVIRT_SPINLOCKS
> > 
> > 
> > Problem is, you can't do #undef unless you know that #define has already 
> > taken place, and you can't #define again if #undef has already taken 
> > place...
> > 
> > Anyway, that's just BTW: I don't feel any need to revise the patches I 
> > sent.
> > 
> 
> Hi,
> You mean something more than
> 
> +#include <generated/autoconf.h>
> +#ifdef CONFIG_PARAVIRT
>  #undef CONFIG_PARAVIRT
> +#endif
> +#ifdef CONFIG_PARAVIRT_XXL
>  #undef CONFIG_PARAVIRT_XXL
> +#endif
> +#ifdef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_PARAVIRT_SPINLOCKS
> +#endif
> 

That's not what I meant. Perhaps I should have said, you can't #undef 
unless you know that #include has already taken place. That is, if some 
header does #undef CONFIG_FOO on the assumption that #include 
<generated/autoconf.h> has already taken place, then it is fragile.

autoconf.h contains no multiple inclusion guard, and it gets included by 
multiple other headers, so it is prone to 0, 1 or N inclusions. Ordering 
with respect to #undef CONFIG_FOO is anyone's guess...

FYI, the build failure I was referring to looks like this. It's actually 
caused by solving the fragility problem I just described above...

  LD      arch/x86/boot/compressed/vmlinux
x86_64-linux-ld: error: unplaced orphan section `.altinstructions' from `arch/x86/boot/compressed/ident_map_64.o'
x86_64-linux-ld: error: unplaced orphan section `.altinstr_replacement' from `arch/x86/boot/compressed/ident_map_64.o'
x86_64-linux-ld: error: unplaced orphan section `.altinstr_aux' from `arch/x86/boot/compressed/ident_map_64.o'
x86_64-linux-ld: arch/x86/boot/compressed/ident_map_64.o: in function `ident_p4d_init':
ident_map_64.c:(.text+0x57f): undefined reference to `__pti_set_user_pgtbl'
x86_64-linux-ld: arch/x86/boot/compressed/ident_map_64.o: in function `kernel_ident_mapping_init':
ident_map_64.c:(.text+0x8ab): undefined reference to `__pti_set_user_pgtbl'
x86_64-linux-ld: arch/x86/boot/compressed/ident_map_64.o:(.altinstr_aux+0x2): undefined reference to `boot_cpu_data'
x86_64-linux-ld: arch/x86/boot/compressed/ident_map_64.o:(.altinstr_aux+0x14): undefined reference to `boot_cpu_data'
x86_64-linux-ld: arch/x86/boot/compressed/ident_map_64.o:(.altinstr_aux+0x26): undefined reference to `boot_cpu_data'
x86_64-linux-ld: arch/x86/boot/compressed/vmlinux: hidden symbol `__pti_set_user_pgtbl' isn't defined
x86_64-linux-ld: final link failed: bad value
make[3]: *** [arch/x86/boot/compressed/Makefile:119: arch/x86/boot/compressed/vmlinux] Error 1
make[2]: *** [arch/x86/boot/Makefile:96: arch/x86/boot/compressed/vmlinux] Error 2
make[1]: *** [arch/x86/Makefile:310: bzImage] Error 2
make: *** [Makefile:248: __sub-make] Error 2

If you wish to try that experiment, you'll probably need something like this:

./scripts/config -e WERROR -e LD_ORPHAN_WARN --set-str LD_ORPHAN_WARN_LEVEL error -e EFI_STUB -e CPU_SUP_AMD -e AMD_MEM_ENCRYPT

