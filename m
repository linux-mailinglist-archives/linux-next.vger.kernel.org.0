Return-Path: <linux-next+bounces-7055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3460ACDB6D
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 11:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 187CF16D9D9
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 09:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868301F4C8C;
	Wed,  4 Jun 2025 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="U5Ri+8Du";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GAmZDAai"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BD28D82D;
	Wed,  4 Jun 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030776; cv=none; b=p96lE9fDOoIln55wSYYZRZwIc4MLvLuL65lgymKbnH+FTxyjNqJ31A+N8bN6CKOrA7ZIyVdX8IAXgZZJGGSNSREhJMEojLMOTbwyQFRbiS5ST2kGoPzkWGyk1aSgM74UssQUViNmXYhYqFqhVYcPe8jVo7HhWSBP7iGIRDP4qPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030776; c=relaxed/simple;
	bh=FY4lEHOq4x+pB4JWAVKPgcTAiQFWbIjedrLUyx6+ODY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AN9YKC1qFtUFI+kDUjXvMonXcfZEPI4M/eL/+NAFG5+0pplpBSmgHyajmCqffzImY2KBTF1W2UCLE4Aesf6DR1fbx9J/9MSw6hcRfvR0IPIVLhutLdbfY2p5JCuf0WZXiMhf6wb2/drcOU2Axg3I4nczoPWc8i1v/nakWrBxN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=U5Ri+8Du; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GAmZDAai; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 9D80613803EE;
	Wed,  4 Jun 2025 05:52:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 04 Jun 2025 05:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1749030772; x=
	1749117172; bh=aiJtCPKpRcL2bfmmYmjB2wpik8z8vrsqCPOjOzw+OeQ=; b=U
	5Ri+8DuZXmm8NGJIW8TexHnIR4yO9MYM+Zel2nVwinYiRQG3J9PaAwemJ+yd1DTx
	bAso26nf/kh/FrceA9Z7/Y/eKODtIsWaw+x6vLtcvTZDJ6F6SWnSFlXls9+RryEk
	66wpn7z/uGYUtk6FwdoH/m1y/7vYm5XCzNU5NhIM/nIDeCECOYY0oFnohV9Xrwi7
	xke9+KbyLbpKDRoa6BhcXL6hVtbMPp35BbX8QVKYNIj7umkr38pZv9TW7+WErv7c
	oxsNMzOTtYtdgW/NMB5falGzKIswpVed3EydOFUsU2R2jrlcS4NwLu2uC7SLFBPL
	U9qL1fK4wQntq7kdiJGbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749030772; x=1749117172; bh=aiJtCPKpRcL2bfmmYmjB2wpik8z8vrsqCPO
	jOzw+OeQ=; b=GAmZDAaiRjRNltwJRdDysP9aJJidmC0apJNijsO1Ao4Z44dOPdI
	rHiG7RbbmS+raxcyK2PRw/O4dNy7RE0gDGF07TS6bSLszlmQO/DfJKeVfrUmTqJV
	5vc4A5Z28bFklPJ7oI/3ShTCSuAFHwt1gMcOBVhDVtZVb49AmyZlkzrCHZgKZ1d2
	v8wB5jrF/fn+PWPSl07V3/bgSuQOGm/GNmflhFZ6P3rIuDvzMUVPy0HJh52NN8WL
	12cQAI5fCXc/uO7u8OjjV2sgo8lfCwFqOuRQiGV0xitmeMpxo57H1KIhwm/buAqA
	dJJh3BKNa+o+wjKjE+8fC83lvCZTH00kWsw==
X-ME-Sender: <xms:cxdAaPyvX204P6dEPrfO30VKD_FRM82FeLQyKNonuaSTP-AWe2Zfiw>
    <xme:cxdAaHRyIJbbqBrlgUUuTeJKWhDaydneJL5NHdXI2Lx9ghboy-jdvPhEnKrueNLix
    WVZ1az7BaUAdoZ8pR8>
X-ME-Received: <xmr:cxdAaJVL9SS0fVTj2lTio-oP36JEIctVG4j4pUf0l95u_msIhHZD-uV2Y7CVrz09XNnFXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeeltedugedtgfehuddu
    hfetleeiuedvtdehieejjedufeejfeegteetuddtgefgudenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhope
    ejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehkih
    hrihhllhdrshhhuhhtvghmohhvsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:cxdAaJh4mEaDFMprfp1TxyERANo72przNlqsBG0IG-AeIPtzH7eBhA>
    <xmx:cxdAaBCtp0P67Jw-sfHqcAYWZaqkkx8KPJmTOBYZVEHP1Y5BenXkEQ>
    <xmx:cxdAaCKsh1_beOXyXTwdIclYi6IVGAvMfnrb5etMcuipfNefr08QHw>
    <xmx:cxdAaABoYC_07BEEqzThTbKgsS6jg9edYU7kd2-5SuvD5Z1h5OtQ5w>
    <xmx:dBdAaMHrCZDqpTI_xNvSrYxboUUX7fJau88azRjwK8f1poKGj49gD83P>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Jun 2025 05:52:48 -0400 (EDT)
Date: Wed, 4 Jun 2025 12:52:45 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: linux-next: Tree for Jun 4 (mm/vmstat.c)
Message-ID: <zg6ql34habvml3lwr2pq4fl3aibmbf54ezkee5taj2r75qqlbq@x5uqfrveeafl>
References: <20250604140235.2f14220f@canb.auug.org.au>
 <fc028557-648b-4dca-bd46-96cd4d2fbac0@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc028557-648b-4dca-bd46-96cd4d2fbac0@infradead.org>

On Wed, Jun 04, 2025 at 01:16:40AM -0700, Randy Dunlap wrote:
> 
> 
> On 6/3/25 9:02 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any material destined for v6.17 to you rlinux-next
> > included branches until after v6.16-rc1 has been released.
> > 
> > Changes since 20250603:
> > 
> 
> on x86_64:
> 
> ../mm/vmstat.c: In function 'vmstat_start':
> ./../include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_436' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS
>   568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> ./../include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
>   549 |                         prefix ## suffix();                             \
>       |                         ^~~~~~
> ./../include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
>   568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>       |         ^~~~~~~~~~~~~~~~
> ../mm/vmstat.c:1872:9: note: in expansion of macro 'BUILD_BUG_ON'
>  1872 |         BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS);
>       |         ^~~~~~~~~~~~
> 
> 
> Full randconfig file is attached.

Thanks for the report!

The fix is here:

https://lore.kernel.org/all/20250604095111.533783-1-kirill.shutemov@linux.intel.com/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

