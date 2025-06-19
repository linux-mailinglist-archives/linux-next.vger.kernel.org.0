Return-Path: <linux-next+bounces-7177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE2ADFF9C
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 10:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4270E3A402B
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 08:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612DE217F29;
	Thu, 19 Jun 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="OTaNUbHU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eIerTE7D"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE991A3167;
	Thu, 19 Jun 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321133; cv=none; b=MG+hGmRIpFiYCor1fa77Oh0QdVJEOJK6O5R0nqVwYVKV1V2lvvuMgdBvzAShTZxvFvEvdKrijkQah1TbbVwCX3qH9xSmqXYkabPtbCwZEaoH9U3DfE4DIOx54oPmC8TwcnAFSJsg7qrH7VQgJK8mSr+Mof9DM8jdG/z3wUiGgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321133; c=relaxed/simple;
	bh=8ON1PuHs59N+9niai0QkyI3pWBnhs3ZSnScI0/WxQ3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/wFqrtL2HkdgK714uObj54olfX8dloflnKaDQ+JRi6w88kCj25c/JjbecKVVNvnHg9qkkFhzHs2fxlwPWckEXVjunNpoS2TqcE3EDsq14F+brW2bZKnevMG4dNWha24JICn9ICSBhwaWlKMhMqpu1L36Kl5aGlCQdWF6UrBq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=OTaNUbHU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eIerTE7D; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 04CF62540257;
	Thu, 19 Jun 2025 04:18:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 19 Jun 2025 04:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750321128; x=1750407528; bh=zckYaeCJio
	biRhHT538hM7C/c6OHzOyttoxAyLFvTW8=; b=OTaNUbHU7SnOTj1uoIeOgBa6N9
	YpfchNw2nMdLarOFaLMzJ3bUmjgYMSMCrPwi5Jm2EUT3xX2Yu7Axy/man7OMAVIb
	ODwM08hE8gV46dLiGDrC9Lfurcx+fsghQW+Gmej4/fWxziYsPFb6adLdpfBj7rdl
	Ifv/7ctC8g10eETAmL6taO0h1/4be/fb9Mx3VZefcKKCZAx5ohAb+vne8PiIwqMn
	o6FEUH4pexTclcv0VAcfD1RU0j9RShq/GKmCNvFBC2/uUbMA32ZFUhG6X2xDWUhn
	vu1loxXai/1ewguSfQG51UW5VbKlmHYW56Q+uh+y84NjzirbG1daA0ZXffOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750321128; x=1750407528; bh=zckYaeCJiobiRhHT538hM7C/c6OHzOyttox
	AyLFvTW8=; b=eIerTE7DHD5dIz5mzFneR6AkrzuayFC3Mg/iZM6vRhteZhxKLLq
	sGgikuR2eLqtQUMjpiQnE13aZWRmTHyLecvWf/YR5DHS0ZJSqh/RmHjAJCdX9AD6
	txbhvFZj4WZ5t9QUBOUJwGuBt1JHcz+kH249k31PODnXtJi2pZHE5hQiek23P34y
	fmUrHRIKv0R9qqT9ov/iiZ1wzXXgChJ6dJw+exCftRN7AJfiMXOjQcUWpclx5J+f
	cP0WP+j8VmFFkZia5lX0B+JDT4/qEN0LZl7unvuBLwVRGikTdcaiRJZXvMg91JL0
	rEwoDmoJDhjpxpX4Rk4fr2JapY4nJDqjVmQ==
X-ME-Sender: <xms:58dTaBeeCorKMKO8CTivpE8ybpQa4hQbQAW4vhVpsniHupOUIN5zZA>
    <xme:58dTaPMVuEc2rGFqtjnSktZHTkO01zW845vkUIOtREAlueiLhBAGTTzpVukcx9XO0
    rTw_NWz31ryDg>
X-ME-Received: <xmr:58dTaKgCfto5deJcOBqrsLPpRC0pzirFTnkbvq97ZMA3YnBj8ezOLImGt4ZZc7PobQRSy-6CeBIVMnWUUC9qcZI2G2wt8Wc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvdelje
    eugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
    hmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    shhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepuggvnhhnihhsrd
    gurghlvghsshgrnhgurhhosegtohhrnhgvlhhishhnvghtfihorhhkshdrtghomhdprhgt
    phhtthhopehjghhgsehnvhhiughirgdrtghomhdprhgtphhtthhopehjghhgseiiihgvph
    gvrdgtrgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhuhhdrnhgvth
X-ME-Proxy: <xmx:58dTaK99zaWnkf1-s8Nc2bZTbQpxnIIYs09LvHnI5QILddWzUChFiQ>
    <xmx:58dTaNuBARMa_eV2z5aE4jNv-xOJlgmsqWfW6ensaa3FJfWnWHwsvQ>
    <xmx:58dTaJGoGZMgYCH7SnTgwmD0lpf94aZwjS742or371-Ac9pjywO25Q>
    <xmx:58dTaEOdqEVTgPr-RL-MqJ3w3GDYCFSGv2a9bJIsi6AYZKAWMm4r0w>
    <xmx:6MdTaJTT7xSxO_HnffrcwXXA498woA2IApjzkToOXw27wDLT6Zaom0PZ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 04:18:47 -0400 (EDT)
Date: Thu, 19 Jun 2025 10:18:45 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the rdma
 tree
Message-ID: <2025061939-blurt-stereo-0f01@gregkh>
References: <20250619163041.7e4f9c96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619163041.7e4f9c96@canb.auug.org.au>

On Thu, Jun 19, 2025 at 04:30:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/infiniband/hw/qib/qib_sysfs.c
> 
> between commit:
> 
>   24baad32b710 ("RDMA/qib: Remove outdated driver")
> 
> from the rdma tree and commit:
> 
>   fb506e31b3d5 ("sysfs: treewide: switch back to attribute_group::bin_attrs")
> 
> from the driver-core tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Looks good, thanks!

greg k-h

