Return-Path: <linux-next+bounces-5746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6DA5C7B3
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 16:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C724C7AA14E
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 15:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6159325F790;
	Tue, 11 Mar 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="Jv1XkV52"
X-Original-To: linux-next@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872181A5BA4;
	Tue, 11 Mar 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707469; cv=none; b=YDMjj7OOSlhzwKFTglL4shancixdDrsPfZI31o0jyp2HirBATm9xyzktKuGJCclspjZYoSIE3T39c9C5aAsEKz1JWpFiRfzdkNHL+/RWq+z6ogq4BfQmlKMCahNbUT6CXrreTEu2JIAJykdzXHnHr4dOGp5pTVoYh6xywUCS8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707469; c=relaxed/simple;
	bh=NIvIQnZyKMdfbTLiQV0uVSuNbprUBl4vVdOd4Nh2Swo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5lMu1R4r627m0BFaYFbUd6fNQQBW/v0pAuyVMrM/iEeaRLASlcnyiwBdQj2JL623QGKRUJMpnE6NDFgDj5Xd0VywhAtf+vuEg5icK+NZ6ODw7eG8fOY52WTDP3qq6cLcJOJIfTWPLECXI2LdNwOPuu/v8vu8cHQOMAbDy6nB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=Jv1XkV52; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 2864F40A03; Tue, 11 Mar 2025 15:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 2864F40A03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1741704874;
	bh=NIvIQnZyKMdfbTLiQV0uVSuNbprUBl4vVdOd4Nh2Swo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv1XkV52px8Lw7oYfjz+Ho/EFbHhizTaj5dRe1sTWYzpxbvRZtLILqBvRHCZEcNwF
	 i2sn3H+fw+kbl4Xucp+LUh3SZ5Em3mxG5SxAUDhkiWZ5i9UtnPjcjC0offAwK70zBg
	 HoocK5V425mqscB0KJXYgEhxRJ2EjNCvaS6w/P2c=
Date: Tue, 11 Mar 2025 15:54:33 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Wim Van Sebroeck <wim@iguana.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20250311145433.GA5107@www.linux-watchdog.org>
References: <20250311210305.3c5a2313@canb.auug.org.au>
 <3da76007-31f0-404a-a324-dd3068e339c5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da76007-31f0-404a-a324-dd3068e339c5@app.fastmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Stephen, Mark,

> Thanks Stephen,
> 
> On Tue, Mar 11, 2025, at 6:03 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the watchdog tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
> > drivers/watchdog/lenovo_se30_wdt.c:272:31: error: implicit declaration 
> > of function 'devm_ioremap' [-Wimplicit-function-declaration]
> >   272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, 
> > SHM_WIN_SIZE);
> >       |                               ^~~~~~~~~~~~
> > drivers/watchdog/lenovo_se30_wdt.c:272:29: error: assignment to 
> > 'unsigned char *' from 'int' makes pointer from integer without a cast 
> > [-Wint-conversion]
> >   272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, 
> > SHM_WIN_SIZE);
> >       |                             ^
> >
> > Caused by commit
> >
> >   c284153a2c55 ("watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo 
> > SE30 platform")
> >
> > Somewhere alogn the way a change to some include file means that
> > linux/io.h is no longer implicitly included.  I have added the following
> > patch for today.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 11 Mar 2025 20:50:05 +1100
> > Subject: [PATCH] watchdog: lenovo_se30_wdt: include io.h for devm_ioremap()
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/watchdog/lenovo_se30_wdt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/watchdog/lenovo_se30_wdt.c 
> > b/drivers/watchdog/lenovo_se30_wdt.c
> > index f25429da0cec..024b842499b3 100644
> > --- a/drivers/watchdog/lenovo_se30_wdt.c
> > +++ b/drivers/watchdog/lenovo_se30_wdt.c
> > @@ -5,6 +5,7 @@
> > 
> >  #define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
> > 
> > +#include <linux/io.h>
> >  #include <linux/dmi.h>
> >  #include <linux/delay.h>
> >  #include <linux/iommu.h>
> > -- 
> > 2.45.2
> >
> > -- 
> Appreciate you getting this done so fast - it was on my todo list for today.
> Apologies for the build break.
> 
> Change looks good to me.
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> 
> Mark

Patch added to linux-watchdog-next.

Kind regards,
Wim.


