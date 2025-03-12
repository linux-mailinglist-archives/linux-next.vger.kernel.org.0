Return-Path: <linux-next+bounces-5779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9BA5E2AE
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 18:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C781899B36
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 17:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9212571DE;
	Wed, 12 Mar 2025 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ESlNCfYp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oOLWqqPe"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F66824BC09;
	Wed, 12 Mar 2025 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741800054; cv=none; b=gjByeObuccBZBt3mip5R8ShyvEzdzgRfkbg8DoVIelcNT9nx1186jM4uRX6uEF5/9BaBdfSIjXGN81A48QS61fIvZWgREm3j2DfPMgeep3D86vCtHjr88pjGTj6p/KLe7htwOmqN8eMGzR8QnqXEFX2GYAmps8jJsAI48QdVpZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741800054; c=relaxed/simple;
	bh=5O13yplnFhNunuhJ3wr9SnEC4OAOFAhqMT5eu6N73PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd9OjFLRscck0CL2c9RnlNgheFaHnRbsd9V1HVtBi6vpC/qWcv93diPx9uEmUA/Rma6ExR60YATHJi6qXE06v1+GZ8TKIRez8W7HWZJ4SnYCkp9aLx3UBnqBreafBjcd8SmlOd4574EOcabQYXk2+Cwm5WIHccjH6S5yYVN8gsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ESlNCfYp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oOLWqqPe; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 62EE125402DB;
	Wed, 12 Mar 2025 13:20:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 12 Mar 2025 13:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1741800050; x=1741886450; bh=1/6diSKHHw
	xZi7Q5f0dDcfiEIdTViztZvS+b3ZuEBj4=; b=ESlNCfYpliwTi2JDBB7PwCYBG4
	nzmaU6WeWt3AkReAAsYyW15A6sjGyrEt7n23ZGbQXjQ1C9CGIXqlOLumP2JvT/bg
	ddKclGfAIYBn2IawSrrNTSX6v3L3OL6MXLo7hKJRTDV6VSfQ8Rb0te3gwq9ByLXS
	IpPkdSJf8vikV9gze7knWG9YCT1x8uVaVU4ioVSwmPkcAT9ZPrqQ6ewNd8JdV+jp
	1nbxl04O7uFGbnIKzhROArhKG3cNZMVYCuHjdLE4giHNNesA+BGSUmEE4ibbPRZB
	RgD34z5NYsuqxu2FFde/8wfA9zuYo58lN0xhqL7ODOThdj1zZyukgPTgoBBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741800050; x=1741886450; bh=1/6diSKHHwxZi7Q5f0dDcfiEIdTViztZvS+
	b3ZuEBj4=; b=oOLWqqPel1N9bBe3316fSDcmCy1MYoAldK2Da47If9fuiiFOC7h
	GBSWJOayA1Ma+9WqsOmlp8nLp3JQHP1saTstjXqK0/2CDt7wL0EtRW3vOA2zLSkH
	uKgQL1hotGJ5ng7eALG5gYc0ag2NbbBhIIlhbife6y7sQcQSj+Vs0lVOny2xirAY
	DBIwDVghg5Ue4kkSGwg4iXSEndF8D758syoYbR2Nioc7Z5Mn6CuTEkCGahg4vbRc
	B8oNo8HKaLXMv9AYYe3hfs7R8xy4BDfqaCnEOyhwbzkdnHep1Db94yNiQgIWIJB7
	vB2nkRi0scHA4O3s+eFTMwU0rsxyzvMOYjA==
X-ME-Sender: <xms:cMLRZzVkCojzny6SeSOWfgK3IY8Vw-LnhxzERX62YgzrRhqCG6w_Qg>
    <xme:cMLRZ7lkRuF0V6Yg3INZDebcAaZlQVKD0QjJ4cWneT7LeYx6YCgBaLVTVQ5QRxMD2
    hSVfVN87alqhA>
X-ME-Received: <xmr:cMLRZ_ZwY2l6sraCTCXYquckomQdLjpHohp3BIrjpS2g4iH6kueCf8wmUZUfNM8ojuJBhZ4R4ahQz3UKoPJwKMl5_Tnzk8sO5YDfog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmvges
    khhlohgvnhhkrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cMLRZ-WIf_IldB65gC4WVYA5MBZPczpfBIquCgXx4zGovduoCc6Cmg>
    <xmx:cMLRZ9nLqtrwUzoAyBWG9VJRhcSUfM5ocW46qV5c6SdbPPRHvDGutA>
    <xmx:cMLRZ7dd0CijYbC_nX_LTFrzVSdFVyjBahFQEjh33hmBSJObQhmphg>
    <xmx:cMLRZ3HiOx5bKDGxibopUpsbiJ51FlLs7ycNM5WjR1CnaapF2prYiA>
    <xmx:csLRZ2cGsCmrFjJlK6FFn_kROxkxmvuzoTBAyk2ly2XvAg1ZIHkeQsCi>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Mar 2025 13:20:47 -0400 (EDT)
Date: Wed, 12 Mar 2025 18:20:45 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <2025031235-trailside-unexpired-88c6@gregkh>
References: <20250312220950.28ed9ad7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312220950.28ed9ad7@canb.auug.org.au>

On Wed, Mar 12, 2025 at 10:09:50PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error[E0599]: no method named `readl` found for reference `&Bar<8>` in the current scope
>   --> drivers/gpu/nova-core/regs.rs:38:18
>    |
> 38 |         Self(bar.readl(BOOT0_OFFSET))
>    |                  ^^^^^
>    |
> help: there is a method `read8` with a similar name
>    |
> 38 |         Self(bar.read8(BOOT0_OFFSET))
>    |                  ~~~~~
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0599`.
> 
> Caused by commit
> 
>   354fd6e86fac ("rust: io: rename `io::Io` accessors")
> 
> interacting with commit
> 
>   54e6baf123fd ("gpu: nova-core: add initial driver stub")
> 
> from the drm-nova tree.
> 
> I applied the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 12 Mar 2025 21:36:48 +1100
> Subject: [PATCH] fix up for "rust: io: rename `io::Io` accessors"
> 
> interacting with "gpu: nova-core: add initial driver stub"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/nova-core/regs.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 50aefb150b0b..b1a25b86ef17 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -35,7 +35,7 @@
>  impl Boot0 {
>      #[inline]
>      pub(crate) fn read(bar: &Bar0) -> Self {
> -        Self(bar.readl(BOOT0_OFFSET))
> +        Self(bar.read32(BOOT0_OFFSET))
>      }
>  
>      #[inline]
> -- 
> 2.45.2
> 

Fix looks good to me, thanks!

greg k-h

