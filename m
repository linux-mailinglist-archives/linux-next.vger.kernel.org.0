Return-Path: <linux-next+bounces-7324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EFAF6CE2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 10:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60B183A5FB2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 08:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E7F2D0C9C;
	Thu,  3 Jul 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="h/IhFapT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lIvRjtSX"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41432D0C94;
	Thu,  3 Jul 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531412; cv=none; b=OjUHgXG+FlMp5OxGVWkaar7OssjyMqu8eeeviibFANrkCdtYdU8ZD26BOVqat7NVMTDVzrh6Cpkd9nVMN67Jk/MFBOCNbwsCPzXUqffvUuvKnXkLKBnkRm+r45At2esvDp/0zL3cfvCQ4AJt8fFL/TdFurnxPMkUAIV7GkaWuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531412; c=relaxed/simple;
	bh=CpZl4mdMF2Ctv/6uj/sWaWxp/0nirQHJdLY3NvBHDmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAZIpo32iM2MfxvGF0edQ8toYr7ZwDpUF/PIoXEVU1A/Y7Y2r+k00jIcqFjPtECgpIGnHHf/by94Q3MHsvJQYtrmWYtwLh36+oW4Q7w5AyS9tIEQXtVvFEcQfU9kOeEQCKC9G6Wj8kdevTuWxurpZbYrRetBsIiBYaZ2yS/aU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=h/IhFapT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lIvRjtSX; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id F02A7EC028E;
	Thu,  3 Jul 2025 04:30:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 03 Jul 2025 04:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751531408; x=1751617808; bh=NoARKltq1A
	RrFEtbCmiaou5A31Cm9AxIgFmsgyxez6o=; b=h/IhFapTVKOeAU3LyvYvCrmqMm
	NzY4CqLa9l0dVFnweUaq9cJJgTxO/Qu56rNQF/7C4KUnvNtnCAiX1byFIcjt3twt
	FWJ2ovqGkVPCDpUqnbIw1DGWKUxGoLFfuPcey2F8jlYPndzcihPnqfEIf7hMki/+
	Dj0KuwnxBu9a1u0cKruzKpkk6Jt+Mz/MaCSYcIO0Kn/ZxvJvqFZRXXgCN4bIb4Ob
	5Ebq1DFHca5l6Hv73qMMlJmdaj7IoEH7Ecr1qSFA9/rwIk8jRgxgtbVp4cL+GGoJ
	yCnmE0MRndKrFa9bLUb138GsXwTdZHtnd+5Y4yJRA7QErz46U7LEoMA2qG3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751531408; x=1751617808; bh=NoARKltq1ARrFEtbCmiaou5A31Cm9AxIgFm
	sgyxez6o=; b=lIvRjtSXnbdVjOMai31LMuurfVTsantAudgFaUUqAksLEWY/f8m
	r0otOTA65jlDDkLH516IV5Gy6Q8yzzzj90oSxKknpjoSdkYCULfxHzF+PAdn+hlt
	OUwc6MLCgz1zPEDlR9S0iXIIbQd4C0YkoBMZLRUsLz0BVVXMUFUe3ENBvgdwQvga
	ixbj6Vy5jK3/916HvcplLDGfJsap4e17GuYWjMJDizd/sKa+BMKxaqlLK4zULapE
	bs/BiZWuZVeY0zH80plDrynaRd0eA1Q5edlbAMTA0Rz/yeWwXpaN/PR62GhRJMAq
	OWab+aPBvgRfTk4FJuQlj1RLBukMaMMCGWA==
X-ME-Sender: <xms:kD9maJOWwW9RpkJEfEH0EAaBPqdsERWTLdbGhVAQ6FhMjcXXr5RTaw>
    <xme:kD9maL9KLxRPXqmcZCuyhsYulGx_yhCD46JfjBTYngUtyiV13dJ8y1UgrEgqEHd_h
    Il7T0b3VSBkUw>
X-ME-Received: <xmr:kD9maITFvpbawx4NDhpe9TJod0yHfVsRZe7qkDHD0O3H0konkltYey4LQ4nMxYv8tPu7SG1lNe4fM7nuSawhJzNOoIMCDrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlihiihhhird
    iguhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdr
    uggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:kD9maFsdQmcu6OByVvwLUhusJEBka5WthD0DbEwdgs2X1PmPxzk87Q>
    <xmx:kD9maBcGrpN39_VkhZ1tdfpqhugnlPnCI3Iwjbbhw8z8fS4x5QSHBQ>
    <xmx:kD9maB3eq0rNVkHT3_n8O2svewDOYgLkL_PDl1z9bCEXA6vyv57ykQ>
    <xmx:kD9maN8xFZCTe85nekKl5HbULkfhRcaTPQ76bdM4uCSX0LSxmA5Xfw>
    <xmx:kD9maI5d1_SIPJ8LYDdopKRM39DmOp_f5UxJP0atvQw5EBiPYW42bT7i>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 04:30:07 -0400 (EDT)
Date: Thu, 3 Jul 2025 10:30:01 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Lizhi Xu <lizhi.xu@windriver.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <2025070335-situated-sloped-bc1c@gregkh>
References: <20250703171021.0aee1482@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703171021.0aee1482@canb.auug.org.au>

On Thu, Jul 03, 2025 at 05:10:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/string.h:392,
>                  from include/linux/bitmap.h:13,
>                  from include/linux/cpumask.h:12,
>                  from arch/x86/include/asm/paravirt.h:21,
>                  from arch/x86/include/asm/irqflags.h:102,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:7,
>                  from include/linux/highmem.h:5,
>                  from drivers/misc/vmw_vmci/vmci_context.c:10:
> In function 'fortify_memset_chk',
>     inlined from 'ctx_fire_notification.isra' at drivers/misc/vmw_vmci/vmci_context.c:254:3:
> include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>   480 |                         __write_overflow_field(p_size_field, size);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   bfb4cf9fb97e ("vmci: Prevent the dispatching of uninitialized payloads")

Ah, nice catch!  Sorry this didn't trigger in my testing.

Yes, it looks like both the code is correct, AND the warning is correct
as the compiler has no idea that you can just scribble off the end of
the structure like this.  In fact I would say the code is wrong as there
could be padding between the two fields that the change doesn't handle
properly (which in reality probably isn't happening).

Lizhi, I'm going to revert this change now, please fix it up "properly"
either by correctly changing the structure definition to show that the
payload is hanging out after the header (and also you can use the
__counted_by mark), or just properly zapping out the payload length in
the proper way instead of doing "fun" pointer math like your change did.

thanks,

greg k-h

