Return-Path: <linux-next+bounces-7287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DBAEEE0C
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 07:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEC6189E62F
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 05:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9405C219E8C;
	Tue,  1 Jul 2025 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="lfNJnlIk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bgz4i06y"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D1223323;
	Tue,  1 Jul 2025 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349409; cv=none; b=SnOnDx6okkXMc8oEuOAL9jcFQOAHPknRUWYDNTSGsVRY8hlTMiec/ZuGwsqJS5jiL071lnMX1CEDS94peAnWUpa+7OTgP8UUJB4R72ps7frb/CGmMt1KHRBSgGalk2iRhBFon2mNl0cKji3rcnz5rFeZsvTf/eyLPeR1YrAmgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349409; c=relaxed/simple;
	bh=weuu0PKSqyAKKSdgO8LG1eLVN/kfYqJCDZWa+HJkSm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuYyml0ZyO8JW0VM+hOGcaH0Tu/3EQmS+tV/dMtoE/qFMNlZiIHTgZGbWgQMxZCqnjjionXDt/m6vKvRwFMlVWh6hyF0e741NJdqe5YOE5P0QiFS5zyQqbPfFBJ21s/lkw1HFY+k0XOBEVJlHWfOPNICOdIbmnG7J6tM4ZkS5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=lfNJnlIk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bgz4i06y; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6D28FEC0219;
	Tue,  1 Jul 2025 01:56:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 01 Jul 2025 01:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751349405; x=1751435805; bh=E3S1Cn3Aqp
	YL9BA2Yi3QWinHbl+Y6FLQBZFBDsvbbNs=; b=lfNJnlIkF6BhaLF2I1wju14WxN
	oGeBsoHqdlnVm2V4JB4ajWZ9Qmg68rByBQNsUtfy8VluFQKYJAzc013XTSuCVuOK
	U/tPST7E77gUoUJZjvpDCAuYtYUrk2JsMBIdzQqHA8yV7noU20YRmBI1i78UhWjD
	xbm+ruqsr5x+EqtprwDqnPC3wKgCjQGnZH+3W9TdfrVTJ3dMTx3P007kWwRpPtDn
	ACIHtHayyOLdZlK2TifKcPzcGT+5hgDDuFMLHGNdL8ygQCmgCgfrcP1HvCQ91cbv
	dXasv55p9U7M4GI2xITelKruY+6mnNXJaKRl2MbDfSbYk775g/cmk/GoE6KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751349405; x=1751435805; bh=E3S1Cn3AqpYL9BA2Yi3QWinHbl+Y6FLQBZF
	BDsvbbNs=; b=Bgz4i06ylWsENVtY9sh5f/YYsquJarJ1uywr7ixRJhLFdcdU9//
	l8Hy/+X5gLcbuCDav0yIxaqh8zrRwQUarq+F7QgtuQ2SedLgt7os+I2CPzP/hYub
	ARu6gZGDn4LICS6XvkAxhQk8jz9vPFmOxLRcjYibO2nEW9Rp5VyOIjnBsLddoLaX
	hiQRVLBkTLNHd7xdRZXnnV12/RJjs/JfBJvH4SWGSzgPHpGz4GFliOXbCsQlq2sj
	IfLSOwv+JA7xXahh/sOykT6X2/idMjzOBTL9CXJhsOsZV3xTy64GwroprOnUb4Lv
	a9kEijOWOhyo2Mtd0EkjOLbRkZpYLNiQy7Q==
X-ME-Sender: <xms:nXhjaKk-xMjc_dd93QmB12h5-u-NlxivKuzGdjUXDbUdv4S1FUSRtA>
    <xme:nXhjaB2gnGVgiwpkeE3N19LAa68VsjsXF6mB-pM-dUFAoM_B6Ngm07SX90EtD7v7S
    el1fFh1RIJGqA>
X-ME-Received: <xmr:nXhjaIqSprOlcAkYNnFWYbCZL1HZ0IR5rvB7TuV0MjaT1XP6dqZmqoQihCAdOEH_SKxALx7FtsVIS3-ROLKYWIzMmeJQ4CI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegurghkrheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:nXhjaOnMry0KflqEodLsqFdXhLu3Zgxgao-FE9ouR_LS5mPGPi2MtA>
    <xmx:nXhjaI1ZA5eUL-fx-qsaH6f54EqrEmsV31EmiUDpGCJMimVpi-w7wg>
    <xmx:nXhjaFtrxKOL_mBCcpVKX-k1kOyVXxx1ZeE5TqryTFPYgzQAdSzNsQ>
    <xmx:nXhjaEUJl4ed9W-cixwfYwDHpLA3FuC5Kf2SsDF9eLw_LW2X8nhDXw>
    <xmx:nXhjaAQXfJMgWy8pHzVU9WynmZBl8g9x6pGFCsF0Df3au07K580iooOZ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 01:56:44 -0400 (EDT)
Date: Tue, 1 Jul 2025 07:56:42 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-nova tree
Message-ID: <2025070134-daintily-chemist-54ae@gregkh>
References: <20250701155159.47b914a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701155159.47b914a3@canb.auug.org.au>

On Tue, Jul 01, 2025 at 03:51:59PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/gpu/nova-core/driver.rs
> 
> between commit:
> 
>   94a08721435c ("gpu: nova-core: increase BAR0 size to 16MB")
> 
> from the drm-nova tree and commit:
> 
>   f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
> 
> from the driver-core tree.
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
> diff --cc drivers/gpu/nova-core/driver.rs
> index 518ef8739550,110f2b355db4..000000000000
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@@ -1,6 -1,6 +1,6 @@@
>   // SPDX-License-Identifier: GPL-2.0
>   
> - use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M};
>  -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sync::Arc};
> ++use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
>   

Looks good to me, thanks!

greg k-h

