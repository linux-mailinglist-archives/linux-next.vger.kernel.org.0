Return-Path: <linux-next+bounces-3118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B793ACAE
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 08:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DE5328400D
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 06:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E90F43150;
	Wed, 24 Jul 2024 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gf+gMFo4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sxj8elBN"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546094C84;
	Wed, 24 Jul 2024 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721802815; cv=none; b=rFdLDDB/syuMXogCAEFinPrGSyvYQzWKDRJjCkHRDjcWWewvy/s6Q+miwBryzHAdPQGORU4F9WbzD++SLx9nbK0zc3KUm60cIIj8FG8tRYSykyV92MXziTdwIIq5FNhKc0285eL/chHz1Re00FmCwOzSiSVm5juki9ryxsiGsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721802815; c=relaxed/simple;
	bh=W7ZTNIZJUDkR1NZOwsq8wBikjL3HfTUvPAPjxUUNtzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPmHCcrSWL52aj9d5r9fv1FVC0OlsRHiEPiJm/C2P6ykzfwoR4c14YXLqvt0IFxvScKhQPd1VJwAV82dbAR8ITk+C6BRRrNxUmUyXAumJa+mhuCvPm1NCx/0zHlt26zmYz3aOnNFDnCrl5ji40QwI7GrA51fWD7/ppPm0Z6nGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gf+gMFo4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sxj8elBN; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 03B511140255;
	Wed, 24 Jul 2024 02:33:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 24 Jul 2024 02:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1721802812; x=1721889212; bh=ONM4SDJsTW
	DRgCLQvQuP0fVPbGZsbQsv+eRpfl5HdY4=; b=gf+gMFo4ZFc2c6v50EQd8uu6ok
	HHMwmCkKOpZuyyZgAE9kFXHXCU1nlGOiJR+EFHx0SpzbOe+uIqywpBIo+YPKdFnz
	WCHQVKjMRecjwyjhLODx+OYodcsiTOzaUOxr+BJGk9kM7bWJemZ/W/jymjGxl16x
	swX1CZgAAv1gdMwid/BnYW/6oQ/HG7QCK0Hhd97ZOi8d4KVRKcog3ccNLp1aZFAt
	l7sqsJkCuYUIVzsyk+9rC5Kf14/Jx9QM9loiFiNJwg4RzOrAbk4sxkI4kmpxDRH/
	t9fwTRNW97bhs7sEugfIWvz4PTVjd0oSlkcyUXLVeucHMAvdZH1xwYMnpz2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721802812; x=1721889212; bh=ONM4SDJsTWDRgCLQvQuP0fVPbGZs
	bQsv+eRpfl5HdY4=; b=Sxj8elBNCdvSk5TZ/PUBL6ylO9EYNHL1t3JZ5pvSHzOg
	5Oxj0D02hK9+U3xF2KM3smsc1eBz2uc3q9rDGK6Myzdy4ZAJ63TRtIi+Hf1fFdzB
	AikwT5Kq8RGQPjY397Beezuw1EFwWhzHVU9A9jxAeenES7kAn+Y87ycdVQROXa1s
	BJxTodqZvcQsa5Ec6ugCM26mhyMy8JkBPlWIelyXVbBSltA2gpOsbILjsGKYu79M
	bqaKlcPJTspESvXxqp6BFr7Ili1DV8/zKokBm6XhgO4BsMVhYo5YPe4oUw3/Rwds
	1TxN5S9Tm74eGFZq+dAFUVumXUm5d1jBDZGauCelgQ==
X-ME-Sender: <xms:O6CgZol3ZSN9qtL5gNwrgM9LaivvN5TaJkYDiu4Nw5E7WuLOwf0OPg>
    <xme:O6CgZn0X24OEkdzl1505ROet7uvkrPSJGReuZdKzN5lQU17EV2gK2b66iFpuM6J4Y
    sZU7m7jozLhng>
X-ME-Received: <xmr:O6CgZmqm___SbQR5AU4deshZWoD0nEGJ41Kbinh28ErxK-X6dcxQYLHd3LXs1qVXJtSHriPsbbgC4IWg6Oq9RgUDQM5OAMB1NxTbGmnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddriedtgdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:O6CgZkmD-Elxp-1hqLARQlSs0Icsp6B5tYA2_KIF6CPpCm02hqc54w>
    <xmx:O6CgZm1AU1ZWq66mEsoJfGB2T9ZDYyBkkDy98V4WIlKveHSnzXjHMg>
    <xmx:O6CgZrv4tvh6oKTL_jMKFpSCTOfjvNbtkLlIlJf70r4LlWb_GB8wTg>
    <xmx:O6CgZiV7YTKN1mmu8didc_exS1daygjKcItpzIPFfFdl1TpJ8ivGlA>
    <xmx:O6CgZsOOJuFGVWg3VeT-bf7xFtNjLUXxXG7I3aAszg9RSgX1ere5GGMN>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jul 2024 02:33:30 -0400 (EDT)
Date: Wed, 24 Jul 2024 08:33:29 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the mm tree
Message-ID: <2024072446-scooter-maritime-4888@gregkh>
References: <20240612123640.68ae0310@canb.auug.org.au>
 <20240724085721.7fac67d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724085721.7fac67d8@canb.auug.org.au>

On Wed, Jul 24, 2024 at 08:57:21AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 12 Jun 2024 12:36:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Today's linux-next merge of the driver-core tree got a conflict in:
> > 
> >   drivers/fsi/fsi-occ.c
> > 
> > between commit:
> > 
> >   2d2bf1e680a9 ("fsi: occ: remove usage of the deprecated ida_simple_xx() API")
> > 
> > from the mm-nonmm-unstable branch of the mm tree and commit:
> > 
> >   29f102dbb11f ("fsi: occ: Convert to platform remove callback returning void")
> > 
> > from the driver-core tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc drivers/fsi/fsi-occ.c
> > index f7157c1d77d8,21d2666c4195..000000000000
> > --- a/drivers/fsi/fsi-occ.c
> > +++ b/drivers/fsi/fsi-occ.c
> > @@@ -718,9 -719,7 +718,7 @@@ static void occ_remove(struct platform_
> >   	else
> >   		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
> >   
> >  -	ida_simple_remove(&occ_ida, occ->idx);
> >  +	ida_free(&occ_ida, occ->idx);
> > - 
> > - 	return 0;
> >   }
> >   
> >   static const struct of_device_id occ_match[] = {
> 
> This conflict is now between the driver-core tree and Linus tree.

Yeah, there's lots of conflicts now, I was waiting for all of these to
be merged before submitting my pull request.  I'll do some test builds
here locally today before submitting it with links to these resolutions
to give Linus a hint of what to do.

thanks,

greg k-h

