Return-Path: <linux-next+bounces-2898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797C92BE40
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 17:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53745286B29
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ECD19D087;
	Tue,  9 Jul 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzqcsqIU"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70743147;
	Tue,  9 Jul 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538804; cv=none; b=YCbUuT7WxoEEDf3hT5Me1HVJh+d28LebTsgHMT8n7JA/oo1fuvLthzJ4tVk91kWzaVuxOPWFBsVPuImgBmdkyVqyW9nC0d20uNDhRkaEX5cqB1RrCq5l2pyBvJUgZrGZOXzvDYY6dObKZuH8Eub9UbGx9JS/1+pLZuvkV04zrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538804; c=relaxed/simple;
	bh=0iOSYuZ06gPqnu9DLFKt9TUyS7HzPq7eik1t5fjAP54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8WA/f7nGvjqolDUzwuEmW8U9gNQp51Vqq/aZk3ozhCpbOqVwUgDHFOKILmeaaTXyBiELmzz0KiKjE9TbgUR5c2zOI6Y5qKHl+fgzbSDDjUDuKgxr7+Ha2Ox3JfYUFlAMXClRznhaZdQdbPe1zns1JUruONJqWFNGVxQLDbg2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzqcsqIU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720538803; x=1752074803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0iOSYuZ06gPqnu9DLFKt9TUyS7HzPq7eik1t5fjAP54=;
  b=ZzqcsqIUwO68XloXoGOLd5g0eEEfsD60YB+dThOb7m9psKxTCuV2nlwT
   WhaGn2tZYV0TsuKpGmvmoTVgp340VQyKY77GdRBL/MAYWKdIDPa1qGjK6
   ebQ6YDhgYU64zFRWjlhSn/5qt7c/tEdJMMnmYnkTbPa4NHf3BO9uhYUH+
   f9u7afCpRtDCfDu10jlGlb/ZrPrQqPOeWbt8PrH55XK6fMGpQwqIru8o1
   sHM+9GQQEGgaBTxkRpjnqA1gzUfSPVbE1OCqn/CBCjwi1wbhRMuiv3/TL
   UYUOyMsWiHN1bnzSkNV7p/9t9X9uKs6JIz3aQMCrBBDlq5BCnKB4DmEV5
   Q==;
X-CSE-ConnectionGUID: m7mL+v5pQuuaSSrFAzAZpQ==
X-CSE-MsgGUID: 1eEHvo06R56fpxYojPdzDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28963519"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="28963519"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:26:42 -0700
X-CSE-ConnectionGUID: d16CEwxwRampy1lisffegg==
X-CSE-MsgGUID: UIX/+oVTQLKDZRM9BA4edQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="48333094"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:26:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A439211F811;
	Tue,  9 Jul 2024 18:26:36 +0300 (EEST)
Date: Tue, 9 Jul 2024 15:26:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <Zo1WrGAL2mJejdeS@kekkonen.localdomain>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
 <Zo1SrABWB-axGibI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo1SrABWB-axGibI@kekkonen.localdomain>

On Tue, Jul 09, 2024 at 03:09:34PM +0000, Sakari Ailus wrote:
> Hi Stephen,
> 
> Thanks for the patch.
> 
> On Tue, Jul 09, 2024 at 04:37:15PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
> >  1786 |         .remove         = pispbe_remove,
> >       |                           ^~~~~~~~~~~~~
> > drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
> > 
> > interacting withc commit
> > 
> >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > 
> > from the vl4-dvb-next tree.
> > 
> > I have applied the following fix up patch.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 9 Jul 2024 16:03:05 +1000
> > Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
> > 
> > interacting with commit
> > 
> >   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > 
> > from the v4l-dvb-next tree.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index e74df5b116dc..7596ae1f7de6 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >  
> > -static int pispbe_remove(struct platform_device *pdev)
> > +static void pispbe_remove(struct platform_device *pdev)
> 
> While this approach works when the patch is squashed to commit
> 0edb555a65d1, it's better to also use the remove_new op as its return type
> won't be changed. That can be merged independently of commit 0edb555a65d1.
> 
> Feel free to submit v2, I can post a modified patch as well.

IOW, I'll add this and post v2:

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6..65ff2382cffe 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1781,7 +1781,7 @@ MODULE_DEVICE_TABLE(of, pispbe_of_match);
 
 static struct platform_driver pispbe_pdrv = {
        .probe          = pispbe_probe,
-       .remove         = pispbe_remove,
+       .remove_new     = pispbe_remove,
        .driver         = {
                .name   = PISPBE_NAME,
                .of_match_table = pispbe_of_match,

-- 
Sakari Ailus

