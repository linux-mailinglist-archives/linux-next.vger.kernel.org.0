Return-Path: <linux-next+bounces-6518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71146AA8D2D
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 09:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2443B3D46
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 07:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCC21CB337;
	Mon,  5 May 2025 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EM/VRuNJ"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022B14AA9;
	Mon,  5 May 2025 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430756; cv=none; b=Fhz0mx9mbX/JVWG+zYWwndiE9v1PwtAcGq4XzyvJBhjBpCGul8YHI1X9HNK/bv0/ImkDbFpIz4NWBdXnpFe+JN7ia3VpmHRiPTWHcXlgyRiLbiBrBh92JcMlqYA9aS/Uk5mGDCjA6BAe1zJ+i8l+HHNnCKn6UoRDNQ58eXfk9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430756; c=relaxed/simple;
	bh=1KP4mAI19Zk1amrAS0hjHJvbX0fHpJxaad8PMwQ5Vt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eam4PSpzMN/lR/v0TScB/EKxsqaA7WSawGVApc2tC4p+0/JqviLuM3kORHnqpgR4rYWA1ai0mHO7TdWOOhcRHM32M2ImeCymfiCXMWA9hUHYXJeQiOhHjY1hs/kWmrxjMbIUFsraF6D4wvGDgUileilDYm4QDlb/rpTyJV4c0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EM/VRuNJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746430751;
	bh=1KP4mAI19Zk1amrAS0hjHJvbX0fHpJxaad8PMwQ5Vt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EM/VRuNJci79q1yA7wuBSWS9ZDqm4Wx7NzH8Rc2FLZPr+xNjcoK32pjLCqYyvRNR5
	 KW0D50qLub6HetV59S05OXi8+ZPJA3iPNma+REXs4g9blO5r0aDlLxR5wOXL5m/Ieg
	 J5Ds+Gb0P/RUsDBME4wNrvywsPVzcQU+Kalq5BJk=
Date: Mon, 5 May 2025 09:39:10 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naman Jain <namjain@linux.microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <2b57638f-82e3-4eec-a64d-fdde782f1ddb@t-8ch.de>
References: <20250505160831.73e797b7@canb.auug.org.au>
 <20250505161215.58a03af0@canb.auug.org.au>
 <20250505171425.0d4169e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505171425.0d4169e2@canb.auug.org.au>

Hi Stephen,

On 2025-05-05 17:14:25+1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 5 May 2025 16:12:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 5 May 2025 16:08:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the char-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/hv/vmbus_drv.c:1893:22: error: initialization of 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
> > >  1893 |         .bin_attrs = vmbus_chan_bin_attrs,
> > >       |                      ^~~~~~~~~~~~~~~~~~~~
> > > drivers/hv/vmbus_drv.c:1893:22: note: (near initialization for 'vmbus_chan_group.<anonymous>.bin_attrs')
> > > 
> > > Caused by commit
> > > 
> > >   f31fe8165d36 ("uio_hv_generic: Fix sysfs creation path for ring buffer")
> > > 
> > > interacting with commit
> > > 
> > >   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> > > 
> > > from the driver-core tree.
> > > 
> > > I have applied the following merge fixup for today.  
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 5 May 2025 15:56:12 +1000
> > Subject: [PATCH] uio_hv_generic: constify bin_attribute definitions
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/hv/vmbus_drv.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> > index e3d51a316316..857109bb99a0 100644
> > --- a/drivers/hv/vmbus_drv.c
> > +++ b/drivers/hv/vmbus_drv.c
> > @@ -1815,7 +1815,7 @@ static int hv_mmap_ring_buffer_wrapper(struct file *filp, struct kobject *kobj,
> >  	return channel->mmap_ring_buffer(channel, vma);
> >  }
> >  
> > -static struct bin_attribute chan_attr_ring_buffer = {
> > +static const struct bin_attribute chan_attr_ring_buffer = {
> >  	.attr = {
> >  		.name = "ring",
> >  		.mode = 0600,
> > @@ -1841,7 +1841,7 @@ static struct attribute *vmbus_chan_attrs[] = {
> >  	NULL
> >  };
> >  
> > -static struct bin_attribute *vmbus_chan_bin_attrs[] = {
> > +static const struct bin_attribute *vmbus_chan_bin_attrs[] = {

An additional "const" would be a bit better:

+static const struct bin_attribute *const vmbus_chan_bin_attrs[] = {

Otherwise looks good in general.

> >  	&chan_attr_ring_buffer,
> >  	NULL
> >  };
> > -- 
> > 2.47.2

> It occurred to me that the above patch could be applied directly to the
> char-misc tree if vmbus_chan_bin_attrs was assigned to .bin_attrs_new
> instead of .bin_attrs (later in the file), right?

Yes, that would also work. It will require adaption of the future patch
removing .bin_attrs_new again, but that shouldn't be an issue.


Thomas

