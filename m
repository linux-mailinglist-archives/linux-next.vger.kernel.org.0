Return-Path: <linux-next+bounces-6633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18BAB0B56
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 09:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F36577BE14B
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 07:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4BF26FDB8;
	Fri,  9 May 2025 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="De4Qdiac";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XPEi+DT/"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E1268C69;
	Fri,  9 May 2025 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774782; cv=none; b=FrqKM1iwu61Aw24p/P5z+B6ZNpInpyYG7AD33ByGr9/DVfcb45zp8xtxVvjcOVA/j4C0JQQ816uTCH1CP35cTXte2a7cRWCYcL441Y4P5IvT+uv3Vj2xv6e1GJxxC7ykQaXRkCtxl30GEg9v5U3YMbScTJVXQN2NTW/QaXIpn1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774782; c=relaxed/simple;
	bh=spjjPgVue+f67cgJZxO2lXkg3FIJCuHP+wo6LqIKcVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIN4i8ZC4XAcSSi2FJCGrJDf7gOgkfUEutjiCNMLt7kqoamBxv5MTHSITQpcrDrIXsXhvC9VjmWtYWZcddR1UOOFV1iKpmJ1G5H2iFFjIAud+lmFmY9YwjgrLsRxLsD0jFiTcZTs8u/gM9V7mgAeqBweFKNNkoNPzyKLb2pmk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=De4Qdiac; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XPEi+DT/; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BBE5D11400A9;
	Fri,  9 May 2025 03:12:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 09 May 2025 03:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1746774777; x=1746861177; bh=xsqp4yF/qF
	kbSJodQdzkj/nkOzXF56kikPLgbGmwsF4=; b=De4QdiacN1Oe5McaoTpqfLAc+6
	X2v/NDsbImG+G5teX2N+ADkEZZnmmm8YZN1Ww/NubYjvQA5ETBtC0u4X4WYCpf6D
	Bi5zL2xKpxF+hY5ku5AW37Qi+Lo5SLsrZmrOSsSk+e/g0vjBYg1YfCATBiJLGZto
	58z6EiKZGW6RxX6+MIo5gGK+mbrtfS5kcYDoKXkW3tZjc26/5o3yd8A0V4ynf/qD
	VvYeN7u2P9UIgTEtGRH0ptkqpr2xRk2zeiPEvsbig/0woyWJldwAJ25Y4KU37Ku6
	uVt2t4dYBnev0TWtti1Mv3sxBBA/VezdSsXIM2VT9O/PfNnykGilS2jb8R8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746774777; x=1746861177; bh=xsqp4yF/qFkbSJodQdzkj/nkOzXF56kikPL
	gbGmwsF4=; b=XPEi+DT/TDNw4WecPuthn5AslVk3FMKtsGU2r77uGm6W84X70e2
	22xLTHQK5faf4vQf6E6KmoqzFf8WOPW8bBe8J9UKhKGVMQFkbdFVl36gkz78QAG8
	Yl9E1CDDa+yjyes9hX4vyVxkd8GZ34GiOnooE9eTQvDzp0qPyUNpLf/Xj+ti7cnw
	uM8dpkCEFmotMuINpNKPBtk0TFhXJDHJpVFOu8t6W/pUol/AVlludmse1vEyCb3l
	VZg3u9fRe0JVBfyagDAuupDixMXdTwxub9x/pWiAPaCL5Ga78ljcJj1bZJ2a8Gof
	GIzGdm+Y0+OdqPvz3JN7Xxbcz2sMBeNMaFw==
X-ME-Sender: <xms:96odaIgAhEhNTZgBo9ay1hWzE-h4LEp4HRNpCaU2jIs0zYjOjFGi4w>
    <xme:96odaBCGBC7ae3_TMNC7wQBnQoF3w4dYLqedbutEtUrSXpZg3GB2e0vkZdM2uALw4
    A4QNSHhj5EXIw>
X-ME-Received: <xmr:96odaAHNfxYvGzfbojG29k2Gbem4DvxePP4QATk5s1wfAwYL0CjMgMLO38DRAckTFbL4CQGcasnkPjaNWQdNi9DGzT2p0bs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleduleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedviedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepuggrnhdrjhdrfihilhhlihgrmhhssehinhhtvg
    hlrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhr
    tghpthhtohepshgrthhhhigrnhgrrhgrhigrnhgrnhdrkhhuphhpuhhsfigrmhihsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephihilhhunhdrgihusehinhhtvghl
    rdgtohhmpdhrtghpthhtohepshgrmhgvohesrhhivhhoshhinhgtrdgtohhmpdhrtghpth
    htoheprghikhesrghmugdrtghomhdprhgtphhtthhopehsuhiiuhhkihdrphhouhhlohhs
    vgesrghrmhdrtghomhdprhgtphhtthhopehsthgvvhgvnhdrphhrihgtvgesrghrmhdrtg
    homhdprhgtphhtthhopehluhhkrghsseifuhhnnhgvrhdruggv
X-ME-Proxy: <xmx:96odaJSbaIYhmMmuQzU2pM6O8EAKkElHmapXemxcw-viWKCfmUpmkg>
    <xmx:96odaFz6BDeTwkAQgGltbe-Bgtuu3wrTwL5TdY8L1PSsNdM9vLcI1Q>
    <xmx:96odaH7dw_spqr77-ZxGAGPk7W_WlZ9DQSlgO5m0QmWcjo5KydhLeA>
    <xmx:96odaCwUKhKmIvsSZGKp8LCxAfmjYRhdITUPuzFUQlrt4Ap7h0bSIw>
    <xmx:-aodaHBpXsffGnfoz6RqA215EhuOT0628sUQ410LGKkoz5zEjBtdOZ2N>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 03:12:55 -0400 (EDT)
Date: Fri, 9 May 2025 09:12:53 +0200
From: Greg KH <greg@kroah.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	sathyanarayanan.kuppuswamy@linux.intel.com, yilun.xu@intel.com,
	sameo@rivosinc.com, aik@amd.com, suzuki.poulose@arm.com,
	steven.price@arm.com, lukas@wunner.de,
	Cedric Xing <cedric.xing@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <2025050909-muscular-lanky-48ac@gregkh>
References: <20250508181032.58fc7e5b@canb.auug.org.au>
 <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>

On Thu, May 08, 2025 at 05:37:41PM -0700, Dan Williams wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the devsec-tsm tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_group':
> > drivers/virt/coco/guest/tsm-mr.c:228:29: error: assignment to 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
> >   228 |         ctx->agrp.bin_attrs = no_free_ptr(bas);
> >       |                             ^
> > 
> > Caused by commit
> > 
> >   29b07a7b8f41 ("tsm-mr: Add TVM Measurement Register support")
> > 
> > interacting with commit
> > 
> >   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> > 
> > from the driver-core tree.
> > 
> > I have applied the following merge resolution for today (there must be
> > a better solution).
> 
> Indeed.
> 
> So it looks like while there are plenty of dynamic binary attribute
> creation users (see sysfs_bin_attr_init() callers). There are zero that
> attempt to assign dynamically allocated attributes to be registered by a
> static @groups.
> 
> The @groups publishing model is preferable because the lifetime rules
> are all handled by the driver core at device add/del time.
> 
> So, while there is still casting involved, I think a better solution is
> to make the allocation const and then cast for init ala incremental
> patch below. Cedric, if this looks ok to you I'll send out another
> partial-reroll to get this fixed up so the build breakage stays out of
> bisection runs.

Ick, yeah, that seems ok.

But what are these binary files for?  I looked in the documentation and
found this entry:
	/sys/devices/virtual/misc/tdx_guest/measurements/rtmr[0123]:sha384
is that these binary files?

Why is sysfs being used to expose binary "registers" and not done
through the ioctl api instead?  That's an internal kernel-computed
structure, not coming from the hardware, or am I mistaken?

thanks,

greg k-h

