Return-Path: <linux-next+bounces-4041-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31298BAD1
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 13:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70BD71C21A1B
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 11:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E57186E24;
	Tue,  1 Oct 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpaRcJBI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041E19CD08;
	Tue,  1 Oct 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781486; cv=none; b=MRHlrj10H/IsBeQ1R28/qGTwTTC/gvRV3OyUQUU/uWQRhoaII07AKHaIijgHmJcUQ2Jgr/4fnDX4pQeyaBCOI8avP5I1HVgWKUNnPM1vwGrMNoJ3ILdAfL+2ZxoROBmcAJI0IEnl2Y6qyxpSofjXz6B7TXlINVOVh1Hn8mKVSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781486; c=relaxed/simple;
	bh=T+amTWNQefkhkdEXaKs505NfmuM0ScKlB/qCXMTx2vs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHinuBgwx+lXsr1dlI9QV1gdMEnKbVUXbxdF9rQyxRVN2ja1tc8H13VXkVW+kwGOOcGuh4jSpxmz3U0w2VhRUbYDPhvQxCw3fbKoOGuGqk7AL4Db+0uXxnBMn/2koAOFnTXIeXbYQSEFm7UdE0QrSlOPMhac0FHf/KD5ywLV8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpaRcJBI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C4C4CEC6;
	Tue,  1 Oct 2024 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727781486;
	bh=T+amTWNQefkhkdEXaKs505NfmuM0ScKlB/qCXMTx2vs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cpaRcJBIyvXKpaX7nWqXaiVuK6COdx1Xz/v/y5FE3JUcgyKsVMw8M3hFHnsqJqT+w
	 e3soMAcLrwCbhZLehlR2NX1kmwAUS6ju9B/UVJmQ76lMWstyKoXoTbYbahjltsHTOl
	 BDp6SdsWUDMIYiMFqXTbMhSXwePFfrzHMW+6nBZfgtklG8CpCZuvQ2IV41czSW2oSY
	 BCWQN3QP4/0rLbEqj5iZi4oT63kf6VmxaYziwDdbNSXOrT8+Mmiv1cSV2xT/o7D8Z8
	 mdOidiItXURzDqLAno9sUl1OTBkjEpXejUyHZk8vM3zn/uRMkYnw07IIAeluhhOYNB
	 8coLx1gARKlPw==
Date: Tue, 1 Oct 2024 13:18:00 +0200
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
Message-ID: <20241001131755.1c8e62ff@foz.lan>
In-Reply-To: <Zo1WrGAL2mJejdeS@kekkonen.localdomain>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
	<Zo1SrABWB-axGibI@kekkonen.localdomain>
	<Zo1WrGAL2mJejdeS@kekkonen.localdomain>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 9 Jul 2024 15:26:36 +0000
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> On Tue, Jul 09, 2024 at 03:09:34PM +0000, Sakari Ailus wrote:
> > Hi Stephen,
> > 
> > Thanks for the patch.
> > 
> > On Tue, Jul 09, 2024 at 04:37:15PM +1000, Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > After merging the driver-core tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
> > >  1786 |         .remove         = pispbe_remove,
> > >       |                           ^~~~~~~~~~~~~
> > > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> > > cc1: all warnings being treated as errors
> > > 
> > > Caused by commit
> > > 
> > >   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
> > > 
> > > interacting withc commit
> > > 
> > >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > > 
> > > from the vl4-dvb-next tree.
> > > 
> > > I have applied the following fix up patch.
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 9 Jul 2024 16:03:05 +1000
> > > Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
> > > 
> > > interacting with commit
> > > 
> > >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > > 
> > > from the v4l-dvb-next tree.
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > index e74df5b116dc..7596ae1f7de6 100644
> > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
> > >  	return ret;
> > >  }
> > >  
> > > -static int pispbe_remove(struct platform_device *pdev)
> > > +static void pispbe_remove(struct platform_device *pdev)  
> > 
> > While this approach works when the patch is squashed to commit
> > 0edb555a65d1, it's better to also use the remove_new op as its return type
> > won't be changed. That can be merged independently of commit 0edb555a65d1.
> > 
> > Feel free to submit v2, I can post a modified patch as well.  
> 
> IOW, I'll add this and post v2:
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6..65ff2382cffe 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1781,7 +1781,7 @@ MODULE_DEVICE_TABLE(of, pispbe_of_match);
>  
>  static struct platform_driver pispbe_pdrv = {
>         .probe          = pispbe_probe,
> -       .remove         = pispbe_remove,
> +       .remove_new     = pispbe_remove,
>         .driver         = {
>                 .name   = PISPBE_NAME,
>                 .of_match_table = pispbe_of_match,
> 

Makes sense to me, as it prevents having a patch floating around at
-next to solve the conflict.

We can later migrate this one from remove_new to remove for
6.13, as the return argument for pispbe_remove is bogus.


Thanks,
Mauro

