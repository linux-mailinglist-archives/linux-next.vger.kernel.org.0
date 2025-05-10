Return-Path: <linux-next+bounces-6663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79DAB21A1
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 09:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 174937ACD30
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F0A1E5702;
	Sat, 10 May 2025 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SB5DbBmx"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD91BD035;
	Sat, 10 May 2025 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746860757; cv=none; b=C+ipTyevv9iaGPk7lDJA3ADrLHzlX3LiEJ2U5j4wY/HobrIkvJOA/IRDJYUy9QEM2q/QNc1HQwwRc4birJNDk7pX57cR7x4Wnl1vDjyKYeejdT6Hga6+yAZyaIbylpf9TOyXjz0VtzrjZA9VUAzjOOJPHumudBrJheuiLz+vAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746860757; c=relaxed/simple;
	bh=60psAXT3n4qmQ2xRNIm1GGtIZMipVivzHqpM4vk64QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n71dfon+GQ5QeErGtO0HWQGa3TzPnN/w98Qo66QuW9z6bkeKd1H5nIcqpygHxCjkS8sV/sjNlH2C8Dpe7QV9C04myi2si2djsaq2KhIw2Iok+clS2f/JNqNTw1Fc6MBBdwAQ8kegS4qTtPtLo2XIEaU8q1esnCw8qyz+icav1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SB5DbBmx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746860753;
	bh=60psAXT3n4qmQ2xRNIm1GGtIZMipVivzHqpM4vk64QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SB5DbBmxu0wcPkpleLGXJ0XNFcZA1kSew7sFd2PcTvqbmHIgbpOL3AGWJIvYGR335
	 3jI3t9VqqgyvJHcTrzi+Pph0kbAlxGlML9kUEujDbTnpZPZo+A1ssS3mJZyLPHNZPz
	 PG2yZVSYIg8Sr460TfB8ZfNFLiymHSGHm+UJbZ/s=
Date: Sat, 10 May 2025 09:05:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	sathyanarayanan.kuppuswamy@linux.intel.com, yilun.xu@intel.com, sameo@rivosinc.com, aik@amd.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, lukas@wunner.de, Greg KH <greg@kroah.com>, 
	Cedric Xing <cedric.xing@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <6e5559f3-29b3-45d0-b475-cc021b90b1c2@t-8ch.de>
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

Hi Dan,

On 2025-05-08 17:37:41-0700, Dan Williams wrote:
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

Take a look at nvmem_populate_sysfs_cells() in drivers/nvmem/core.c.
It uses an intermediary non-const pointer for the initialization and
works without any casts.

Could you then also use .bin_attrs_new?
.read_new and .write_new are already used.


Thomas

