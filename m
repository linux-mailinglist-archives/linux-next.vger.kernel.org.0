Return-Path: <linux-next+bounces-5830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAEA65204
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59D53B5F3A
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76D623F422;
	Mon, 17 Mar 2025 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pqIZga1S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m9W/EPsC"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CA23F397;
	Mon, 17 Mar 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742219875; cv=none; b=c06da4AtZZqD2iTbFzx/L4GAzkiIeRuzAywz6hWR41AMfWeZh+fgVleQW7U/R4wFfAu6rF+GAv2R+xiTAA9piPsToFHyxc6TfcMeUazkoDHZ0iaOl2JHcom2VPwn9BNQmU/nXPA7gkFa/cEZGzHTokBy4S9/GpOriyTavrP8sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742219875; c=relaxed/simple;
	bh=yn74oDPEllu48np5VpXOGrW927upfcFuDeKKraWCvfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBDoUl4dxAuSbPZLT2fkvJeYqSd4v5V5+fBcV4nrbQ8cKGvX0cgw76TaMHnWVzH6zgM7WSMtwpvtTMZ36nTHExhAN0ahrEQ0mFZDTbGMBJUr24sBZbl1oCwv9bgYKFNIQhne1GPY2DDk1JfAZFl6kdrJRQ1T7dWdCVU1KU6oaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pqIZga1S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m9W/EPsC; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B97D91382D0B;
	Mon, 17 Mar 2025 09:57:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 17 Mar 2025 09:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1742219872; x=1742306272; bh=5WY1ykl3TH
	oF2b5rAp3efM/WqrwRJ29J83R0Uskvz3g=; b=pqIZga1SvcXpeNuH+CCJlK/MsB
	/NGxJcz0hyM3b2fq58yzH6s3L0E/bBR8Wi4k5MD+jto3QrH5t+R87Ah5YA4PtL5v
	BZnZV6t2UuovR5dBouKL5snzrCfqwAS5DmBbHvjRwQpqR/szCFQCW+B0oqpD7UzS
	sxA7TGcfoCupvcWzJl635N3KZ2xyj6J5Cp3XrqtWeVMsg9kXKyNJYeDUblJcts+S
	vNG7TzMW4Ksjpl637Afc/9xvOFN5bIzMqA1bbKsB/WWxOmV7f0/wXVYAfH4TFbwL
	c6ORCthIn0FmWl8KiXTlcIzr8zWC6vYeovR2zhp8T2TAszjKgO4HSlNbQbsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742219872; x=1742306272; bh=5WY1ykl3THoF2b5rAp3efM/WqrwRJ29J83R
	0Uskvz3g=; b=m9W/EPsCBDOTroyLPjSACCBweQa4HCSeNY33Bp3Ddw2YmUBPtdP
	GO5Pal8+NOUmXiR4TM/xuY9RDYsitkOZ02GVzVYSFdn6u4gWAEkfYmnGKV+Ix5v7
	vOOrMGHj/cbJwRgagwJ606p03VBY2GRGZl42yaWqAXs533lRrxK12K7TrvYBP5Ti
	NhqJP6bHK2BEKEpulyoIUu6AuIlRgGfxznFvOMChlSJpdpecVDmqhfTPB7XALv78
	IbcLiq4B0buo6beIIuravzzDAkdZ4f1FnjcVwQL1w0sV4AD7a6XblSE+C39yEjaT
	v7QG3EMyKZRnTvMAMQ4J+2jOTnp0d1SKA2Q==
X-ME-Sender: <xms:XyrYZ4FlZ_StJyhqJKwCoEtW07fCLkyFAYfxtjFBqF_KFoPGAOChgg>
    <xme:XyrYZxU6Gq6MbzBmSgT7VdragOhJwbDhR950JR9U3ocKHlQNWWTCC1Dua1jknigu1
    Ol8jFt3U3GO6w>
X-ME-Received: <xmr:XyrYZyLxFWqgmwG0h811isE3eS_zZuKAMywQAMU8fF2wzqeupMTfBK3gUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegsrhhoohhn
    ihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheptggvghhgvghrshesrghrrhhirdguvgdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XyrYZ6GjN-7FDnVy6PRY4vPF3g90zKO4_jkzOmfPtyylO7uhPDjcDA>
    <xmx:XyrYZ-UVYx0EOiSd28WpIgEWSh_cIYDNoMzq7VSeo7RIoh_WXxAphg>
    <xmx:XyrYZ9Os3s59eplzZ2OOf0plhOcRo9MtjoxKeeBYpIIOoKQQlPMuUw>
    <xmx:XyrYZ125NuMfTNZ6olGrCuRvxxt6mN809tT5MJ_aZvYXS4K9ioRUrQ>
    <xmx:YCrYZ_vywwBRAz2nup1jRo8tqx1lk3fBlJj3wTCI70RSshMxufakXAY0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 09:57:50 -0400 (EDT)
Date: Mon, 17 Mar 2025 14:56:27 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Christian Eggers <ceggers@arri.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 regulator-fixes tree
Message-ID: <2025031712-cash-animating-4313@gregkh>
References: <20250317181843.59127ac9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317181843.59127ac9@canb.auug.org.au>

On Mon, Mar 17, 2025 at 06:18:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/regulator/dummy.c
> 
> between commit:
> 
>   8619909b38ee ("regulator: dummy: force synchronous probing")
> 
> from the regulator-fixes tree and commit:
> 
>   dcd2a9a5550e ("regulator: dummy: convert to use the faux device interface")
> 
> from the char-misc tree.
> 
> I fixed it up (I just used the latter - since that seems to always use
> synchronous probing) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Resolution sounds good to me, thanks!

greg k-h

