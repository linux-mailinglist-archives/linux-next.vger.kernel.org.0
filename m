Return-Path: <linux-next+bounces-8704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF80C04642
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 07:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1261A04D13
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 05:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28821DE4C4;
	Fri, 24 Oct 2025 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nQtR3tla";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z53lB5uA"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0518FDAF;
	Fri, 24 Oct 2025 05:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283452; cv=none; b=obpl2wSDjyPl19jOZN3VRhIk3f7DYe/Ld13/NF+3qgKHyb50f+ukfVojHpf0/sYwbG+RAeKqJZj2BIiJJYM7yChqAj4nIsOEG2lo/pEsaJIoYqzcVbIn5m74FB6P0UueQ6sFaebTav+ZEJIqS7XloDF9WjjmH+bruIxSPZwuAL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283452; c=relaxed/simple;
	bh=NkXYq5Y1DtBiY/fJleyZOFYqLgHNMhz2vKYk/rGQ5nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sgj2QBGHYNaQsqqr6ggEYJT9deIWhOGA+o/yLufOHH4ULcFQH/kGIBPcr5+vLP5wxGO8LBKFcwUh4lcEn30nKRYsqFAypMet9uJH3g6yt7KYjsEzJp8wzMsEkHeKPKEpxGfeM4OctdSuhruRWueQfy4s2jAu6hEUDeozoK1afmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nQtR3tla; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z53lB5uA; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id D4E30EC0288;
	Fri, 24 Oct 2025 01:24:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 24 Oct 2025 01:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1761283448; x=1761369848; bh=OXPzRTNSgR
	WkmQae3N485kKFjn4ctYst9EikgzCRO6A=; b=nQtR3tla6rd1TfWQnCejH/lM8y
	GOxNPH0u2H2jOEvoBtrHH93ZPbQ5nTuYgoXGBKLXmMubcjP1stHyT5ua4hFecVAa
	ckZk2u7GYybfuidlIsDZ9OWloPcv8xYblhNko9EfsHWQujrQnSmt6239bMtnNq2S
	3s9s0G7dGN8F8rcVEFVtGts4FlNAeQ/3z0BjKVURtLybDgGSs7cQbHQOTb0hrAIm
	QEYfDgRhxvAs64k2+Ynwz9J2W944g2YRirbBf6Z32W273S3bInIagpXCDstb71cE
	5X08/FcKYAQs841uwHwGRAI73sCkSFU4XyefHcBPDTpvsJYRQFBDVS6iwb8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761283448; x=1761369848; bh=OXPzRTNSgRWkmQae3N485kKFjn4ctYst9Ei
	kgzCRO6A=; b=Z53lB5uAZP6nAAZI8aCAWbNADWirsYP4MiiZJK0qph+9BkmNByI
	vNHiJkSZDHKEd2zqh1SVNMDEITTKzODi1rxI6fw1hFq+7Ez41t3sM1K+GN1COFsj
	/0lYxZr8wY4EWk5cgOkZDGIiocONn++NvkLDqWtTq0UYaxP3wIjBRcoZB9/laiZD
	A/W1MRCBirv0duAfdkmvhCwMQ/PPnAjHkOgTyhYveg6aTbT03zRxL/+nRWbACR4z
	+RF4+3Es8dTsxD2QsLyAYVW3k85rkmp5WkhJoB4qb73Ggoq7VBeG827qFcH7n6VB
	+KlO3zHl/Ou6JZkcZLqy9xTwfCGrxlq9zHQ==
X-ME-Sender: <xms:dw37aMVMniGqbVKkn3eUp9eOg78YWjkjM2Y5jVA9T5-7oIU5u9UirQ>
    <xme:dw37aFz1e1W8s1IncHDJbDvEN4po41iPPy_1g98zvYceqK1pplBcXj7nZ8tbg4U-C
    FzcX1rF2aObIjxAuaPhNay6ywB4dS-iMphUL1U7SsZGgqlt>
X-ME-Received: <xmr:dw37aDyoctyHOy1wdcSbyZTUVDzS2YjLhyTOtaQllrrAsa2LYBePYR-Xf6HfhlrjzVNjiVJqg1ScDXwZg8YBrvWi5z1jkQ07eGwgYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheprghrnhguse
    grrhhnuggsrdguvgdprhgtphhtthhopegrkhhshhgrhidrghhuphhtrgesrghmugdrtgho
    mhdprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdguvgdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dw37aK3IZZ3P7NuevJyKCymQmvtCnL3frZQVf9qecDMlsGrpgoIF1Q>
    <xmx:dw37aBpzmV75Poj5hVbZKRwLRRU3tgb6qKi8KW9Sfjk8WRvJj4yxTg>
    <xmx:dw37aADelw0xC_YxA4qmNulzo29QT0wQRUPdyU4140JteeqzyetKtQ>
    <xmx:dw37aCoX2SXL83gxqXW3dWjrZtTS4E7ABUxkaAHjXKoqVcT0dEunag>
    <xmx:eA37aBy0MpT9woTYlgKXCQycLVSE4FkE0D87arG8ZshlZFKn7XTigkyv>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 01:24:07 -0400 (EDT)
Date: Fri, 24 Oct 2025 07:24:04 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <2025102457-sleek-unrented-a6f9@gregkh>
References: <20251024124906.70323e51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024124906.70323e51@canb.auug.org.au>

On Fri, Oct 24, 2025 at 12:49:06PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/misc/amd-sbi/Kconfig
> 
> between commit:
> 
>   70ad06df73a9 ("misc: amd-sbi: Clarify that this is a BMC driver")
> 
> from the char-misc.current tree and commit:
> 
>   5c7dddd7360b ("misc: amd-sbi: Add support for SB-RMI over I3C")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/misc/amd-sbi/Kconfig
> index ab594908cb4a,acf0450ba220..000000000000
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@@ -2,11 -2,11 +2,13 @@@
>   config AMD_SBRMI_I2C
>   	tristate "AMD side band RMI support"
>   	depends on I2C
>  +	depends on ARM || ARM64 || COMPILE_TEST
>   	select REGMAP_I2C
> + 	depends on I3C || !I3C
> + 	select REGMAP_I3C if I3C
>   	help
> - 	  Side band RMI over I2C support for AMD out of band management.
> + 	  Side band RMI over I2C/I3C support for AMD out of band management.
>  +	  This driver is intended to run on the BMC, not the managed node.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called sbrmi-i2c.

Looks good to me, thanks!

greg k-h

