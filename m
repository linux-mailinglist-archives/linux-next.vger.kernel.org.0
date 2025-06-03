Return-Path: <linux-next+bounces-7018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0AACBF75
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 07:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7EF6188BC6D
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 05:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DE41F2BB5;
	Tue,  3 Jun 2025 05:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="qTxKsWRh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hwBuFQ3W"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E71D6DB9;
	Tue,  3 Jun 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748927479; cv=none; b=upz9j4STb77AHB9ts53EcWl1LrQiFACHU8+Tnnp1VumsHbvSdjY7upBvtJwRMO+yFRNo07jEPbNaxkzYQzKHt/QVE7gJQh57DTLTgNEVjdU/dr/WFAJdsyCgFc7pxIFxWFHP6N7e1hbtOxWM+bQZmtxxPeiMpUPY7aDLw+RS7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748927479; c=relaxed/simple;
	bh=Dx/VK87AmLLgtcRd480u9IN/HcaIFL9/n9Qw9H6FB/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5LyHl1V/g3ZKaImKufOnbk2kkPw+DxzhGXG5LMEe1scanQAAjP2FzVPyaIC23hPj1DqMGKJ6M9YZB7Ld6N4uNgcMleQ4OswvVdjgYo0Q0sdfws095ftgAe7IMG2AWIX+dYA69uz35LVAVgRrpygsDK+8y24lFKLDxLqp+9Cnqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=qTxKsWRh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hwBuFQ3W; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C9A6138035F;
	Tue,  3 Jun 2025 01:11:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 03 Jun 2025 01:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1748927473; x=1749013873; bh=50nxHTzCmt
	WnB6tBiM/A0RvRLIJt43Fj+BsaGe35DRA=; b=qTxKsWRhfYuViXyhYjjBsb7dLQ
	RjxjdigzFa8bm+mXMiknxXurc+WoBkj79x7v79mh2o7wm9/rXMhQuMGD/G1ULpwy
	xJrE7ExV4igHTFtzK4m0ZTQIdxXoM5fCUuOUU0u/epF4RJaiXWFTOL94QLJyMtmu
	Chu6VJiM61RSR5Y/PUH94hl0moFVEIpnUJfxXFOJ/kXlapHRSeO0v7+1Bn7ETa55
	q/VvPhCr3nL1sdojP808bCpexlnCCGksSUFS8Mcrsv5oNpcDLFVp+5uebCdMK/my
	oh8rDiifkuj1+Q0ZrHdUxKTr0PnkFhcfF5fuFjWZs0fWt8gQYEqY4mqfKvzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748927473; x=1749013873; bh=50nxHTzCmtWnB6tBiM/A0RvRLIJt43Fj+Bs
	aGe35DRA=; b=hwBuFQ3WnjzSxcIkVVByaA2RDF9IYbQyiErWKqfJQR5lzcRBfbk
	8sxW5EKHLyPZsbtxPbK3u1LEa4mUwGd3H08bI1DBSL68VqN+GiUUSvyVj9jZKi3+
	c5F5vqV176mteiMiPLDKsdQ5pSA//tt+UjPV6HGquWojZtyLQLHsNUh62IZ7hWSi
	V8zfFT+U5bLPRnpxi2sQOtnvGcV68ymBPi/C61c7orxFF1gI0/JT4czhZ7PmwJ8C
	zFK6X1CARkQ8krl9RLHfOAIAMaZ8/mCG4eO+BUegM6niMI6o/qePMRBcMXITuF3P
	ayXsZgaifVz8YvbcFEwKG4/F1Xb10T4JEtA==
X-ME-Sender: <xms:8IM-aO7pCtE1xNnkI-VNXj_MSEFNeBPGJJW08KF-_wRilJM98tKc3w>
    <xme:8IM-aH6KLyN5scaUhx4QT0YADPAKwspTJiLZffbCr4rN1FrNE1YOUhrwhCTGyDcry
    tj5cXVvNzcekQ>
X-ME-Received: <xmr:8IM-aNeDM5lfkpPA6YQ_GzAOXA8RrqdYBJEUO6r0xwLCnqraouY8E4H5lu1Ya7Zg_YHOqXa6ilfDelQK5LVX5ORIFmttj1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefleeikeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrh
    horghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeel
    tdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghp
    thhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsg
    drrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhr
    tghpthhtohepfhdrfhgrihhnvghllhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprg
    hkshhhrgihrdhguhhpthgrsegrmhgurdgtohhmpdhrtghpthhtoheprghnughrvggrrdhp
    ohhrthgrsehsuhhsvgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlh
    hlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8IM-aLK4ecT6v-H7qlXsH-Y8mnLUoTJE2Nv3dKkwg0UgpJdvTuRmtQ>
    <xmx:8IM-aCJUH-BYGw4JiWR3ojPro7vkP7aoSYQyoLE2V_0jhpnDUKHpLg>
    <xmx:8IM-aMz6Kx9pcMn9lha8kLLkroez_oAh9sP51DKaVS3jPCXNmyIh4w>
    <xmx:8IM-aGKiulcMQpwoNz3eZARGiySZTVwGD8XiWgZ1JUDfYAuyZ9sy3A>
    <xmx:8YM-aNphLU_3d9aySS6frB33aIA0fdynpW8gmGrirscBy6bxpbHA98Xh>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 01:11:12 -0400 (EDT)
Date: Tue, 3 Jun 2025 07:11:10 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the broadcom
 tree
Message-ID: <2025060350-porous-clutter-88fc@gregkh>
References: <20250603142730.084cf0a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603142730.084cf0a4@canb.auug.org.au>

On Tue, Jun 03, 2025 at 02:27:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   drivers/misc/Kconfig
>   drivers/misc/Makefile
> 
> between commit:
> 
>   d04abc60a903 ("misc: rp1: RaspberryPi RP1 misc driver")
> 
> from the broadcom tree and commit:
> 
>   e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc")
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
> diff --cc drivers/misc/Kconfig
> index e12e445a10fa,0de7c35f6fe5..000000000000
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@@ -660,5 -647,5 +659,6 @@@ source "drivers/misc/uacce/Kconfig
>   source "drivers/misc/pvpanic/Kconfig"
>   source "drivers/misc/mchp_pci1xxxx/Kconfig"
>   source "drivers/misc/keba/Kconfig"
>  +source "drivers/misc/rp1/Kconfig"
> + source "drivers/misc/amd-sbi/Kconfig"
>   endmenu
> diff --cc drivers/misc/Makefile
> index 9ed1c3d8dc06,b628044fb74e..000000000000
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@@ -75,4 -73,4 +74,5 @@@ lan966x-pci-objs		:= lan966x_pci.
>   lan966x-pci-objs		+= lan966x_pci.dtbo.o
>   obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
>   obj-y				+= keba/
>  +obj-$(CONFIG_MISC_RP1)		+= rp1/
> + obj-y				+= amd-sbi/

This is fine, but why are new drivers being added to trees during the
-rc1 merge window period?

thanks,

greg k-h

