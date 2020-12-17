Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7180E2DCCD1
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 08:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgLQHEx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 02:04:53 -0500
Received: from infomag.iguana.be ([185.87.124.46]:54568 "EHLO
        infomag.iguana.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgLQHEx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 02:04:53 -0500
Received: by infomag.iguana.be (Postfix, from userid 1001)
        id 558BD603CACE; Thu, 17 Dec 2020 08:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 558BD603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
        s=infomag-20180602; t=1608188650;
        bh=RdkPP6WNJPWorfHVUcot0t3//ynUN7oeE6htn3S5hG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p3a6jB9RUxkrr1ULrhqAHFeN7KowG9NCLzcJ1zZpIpB7utaFWjLLgUiPAssdRG0I3
         Bn1DYslafgrWYBN1KUbKg1Uy/iSOh9S+ZE+yRsjkP0PnzpWIhYYJg4A1yPdIsf2/tr
         PXO0aHs1E+ZZ4ovee0GceNVGfVesHw6d+VV9VuKY=
Date:   Thu, 17 Dec 2020 08:04:10 +0100
From:   Wim Van Sebroeck <wim@iguana.be>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20201217070410.GA16380@infomag.iguana.be>
References: <20201214162129.79efb225@canb.auug.org.au>
 <81ec0eee-0f22-b8ad-5a71-1690d4c4ec27@roeck-us.net>
 <20201216135608.4e7a72e5@canb.auug.org.au>
 <20201216152713.GA13666@infomag.iguana.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216152713.GA13666@infomag.iguana.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Some operational work-related issues broke my planning yesterday.
I just made the changes to the watchdog tree.

My apologies,
Wim.

> Hi Stephen,
> 
> It's on my todo list for today.
> 
> Kind ergards,
> Wim.
> 
> > Hi all,
> > 
> > On Sun, 13 Dec 2020 22:09:55 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 12/13/20 9:23 PM, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the watchdog tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > > 
> > > > In file included from include/linux/device.h:15,
> > > >                  from include/linux/acpi.h:15,
> > > >                  from drivers/watchdog/iTCO_wdt.c:48:
> > > > drivers/watchdog/iTCO_wdt.c: In function 'iTCO_wdt_start':
> > > > drivers/watchdog/iTCO_wdt.c:280:17: error: 'struct watchdog_device' has no member named 'dev'
> > > >   280 |   dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
> > > >       |                 ^~  
> > > 
> > > Yes, that should have been wd_dev->parent. Sorry I didn't notice that earlier.
> > > 
> > > Guenter
> > > 
> > > > include/linux/dev_printk.h:112:11: note: in definition of macro 'dev_err'
> > > >   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> > > >       |           ^~~
> > > > 
> > > > Caused by commit
> > > > 
> > > >   9c612b338fdf ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for logging")
> > > 
> > > > I have used the wtchdog tree from next-20201211 for today.
> > 
> > I am still getting this build failure.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 
