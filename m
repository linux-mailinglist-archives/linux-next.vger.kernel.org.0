Return-Path: <linux-next+bounces-4042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C0498BADF
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 13:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A40C7B2367C
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 11:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232231BF7E7;
	Tue,  1 Oct 2024 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUrPawbz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDABA1BD000;
	Tue,  1 Oct 2024 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781656; cv=none; b=asEqP4ujv3pSIaWj6AXzDIzWNAnajXCP4WGDlZTDr6fzHVL8KJPUF0N4PLSjphnbk/Wcy9InDUBtAQxZ0atGxt5SM8vgENndgPHcDqtr9LiC0KUvkTX5KshbaXbthUuisYyWHrs90D3AV+Y6wDN5sWsw4j5DFzmLVyXfgtDJ1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781656; c=relaxed/simple;
	bh=eH/OOqXwZXzYMLioNwbjosTvUiITErciT1v3abSc6ns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWwTU0fKzAJT+XoH2Mc761JJ/Xs7/sqedKfjvn+kCX6XwirzC/9aKJWaq4dJXFUolkMT09XwDV7eRe2sR7Q7fFPgPM+rqYlzO+VewoqXOa143LifavMoWCIM7KQsQQqsVs0d0cKarRoGsHezvwdAZBcc+z8Fd9yyNw2KQBLqJrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUrPawbz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43052C4CEC6;
	Tue,  1 Oct 2024 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727781655;
	bh=eH/OOqXwZXzYMLioNwbjosTvUiITErciT1v3abSc6ns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CUrPawbzxr7pZUi/MvE+hLuTenwLKGSKHS9q8Uf+RuYDvCVAz3qVhAO1nKHDEHUzM
	 ghnXbfqgIZgOUAZQBBqAFpurTeHswvdtOUZ7BTAT7gvwWJ2KcYh6X4wMtmG9ddoP0S
	 5Ibf1G8eF0g0Ll4Uqz1QGWv+zvcYs3vfH358aa3cPVhPo1kKQbMmBRH7z99RT0Po7V
	 HfHQs7x44o8DuoXLzKDfidRzc4t5aqRbuY4rBbYabiDKFxvKmqxhHLGo3mD09H39A8
	 akcqnyL5lTBkoJB+b0pXfF+lALvUQNz0PYp3bdQUyr9MmV//sbPiMFTr2f8gyfb8Ru
	 Z/KdS5+A764VA==
Date: Tue, 1 Oct 2024 13:20:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, David Plowman
 <david.plowman@raspberrypi.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Naushir Patuck
 <naush@raspberrypi.com>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20241001132050.0d50172a@foz.lan>
In-Reply-To: <20241001131755.1c8e62ff@foz.lan>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
	<Zo1SrABWB-axGibI@kekkonen.localdomain>
	<Zo1WrGAL2mJejdeS@kekkonen.localdomain>
	<20241001131755.1c8e62ff@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 1 Oct 2024 13:18:00 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 9 Jul 2024 15:26:36 +0000
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

Please ignore my comment below. I didn't realize I had a filter on my mailbox.
This was solved already a long time ago...

Regards,
Mauro

> 
> > On Tue, Jul 09, 2024 at 03:09:34PM +0000, Sakari Ailus wrote:  
> > > Hi Stephen,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Tue, Jul 09, 2024 at 04:37:15PM +1000, Stephen Rothwell wrote:    
> > > > Hi all,
> > > > 
> > > > After merging the driver-core tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > > 
> > > > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
> > > >  1786 |         .remove         = pispbe_remove,
> > > >       |                           ^~~~~~~~~~~~~
> > > > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> > > > cc1: all warnings being treated as errors
> > > > 
> > > > Caused by commit
> > > > 
> > > >   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
> > > > 
> > > > interacting withc commit
> > > > 
> > > >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > > > 
> > > > from the vl4-dvb-next tree.
> > > > 
> > > > I have applied the following fix up patch.
> > > > 
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Tue, 9 Jul 2024 16:03:05 +1000
> > > > Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
> > > > 
> > > > interacting with commit
> > > > 
> > > >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > > > 
> > > > from the v4l-dvb-next tree.
> > > > 
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > index e74df5b116dc..7596ae1f7de6 100644
> > > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
> > > >  	return ret;
> > > >  }
> > > >  
> > > > -static int pispbe_remove(struct platform_device *pdev)
> > > > +static void pispbe_remove(struct platform_device *pdev)    
> > > 
> > > While this approach works when the patch is squashed to commit
> > > 0edb555a65d1, it's better to also use the remove_new op as its return type
> > > won't be changed. That can be merged independently of commit 0edb555a65d1.
> > > 
> > > Feel free to submit v2, I can post a modified patch as well.    
> > 
> > IOW, I'll add this and post v2:
> > 
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index 7596ae1f7de6..65ff2382cffe 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -1781,7 +1781,7 @@ MODULE_DEVICE_TABLE(of, pispbe_of_match);
> >  
> >  static struct platform_driver pispbe_pdrv = {
> >         .probe          = pispbe_probe,
> > -       .remove         = pispbe_remove,
> > +       .remove_new     = pispbe_remove,
> >         .driver         = {
> >                 .name   = PISPBE_NAME,
> >                 .of_match_table = pispbe_of_match,
> >   
> 
> Makes sense to me, as it prevents having a patch floating around at
> -next to solve the conflict.
> 
> We can later migrate this one from remove_new to remove for
> 6.13, as the return argument for pispbe_remove is bogus.
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro

