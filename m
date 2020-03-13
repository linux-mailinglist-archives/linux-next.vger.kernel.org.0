Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55AF18415C
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 08:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgCMHO3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 03:14:29 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55587 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgCMHO2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 03:14:28 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCeWW-0001RC-J0; Fri, 13 Mar 2020 08:14:24 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCeWW-00042G-26; Fri, 13 Mar 2020 08:14:24 +0100
Date:   Fri, 13 Mar 2020 08:14:24 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313071423.c4t3onkft4r66hav@pengutronix.de>
References: <20200313131903.3975cdd2@canb.auug.org.au>
 <20200313064807.op4ghjsc22du3q4e@pengutronix.de>
 <20200313080514.3f65c8d9@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313080514.3f65c8d9@coco.lan>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:13:26 up 118 days, 22:32, 137 users,  load average: 0.09, 0.07,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20-03-13 08:05, Mauro Carvalho Chehab wrote:
> Em Fri, 13 Mar 2020 07:48:07 +0100
> Marco Felsch <m.felsch@pengutronix.de> escreveu:
> 
> > Hi Stephen,
> > 
> > On 20-03-13 13:19, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the v4l-dvb tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.ko] undefined!
> > > 
> > > Caused by commit
> > > 
> > >   dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing support")
> > > 
> > > I have used the v4l-dvb tree from next-20200312 for today.  
> > 
> > I'm sorry for that. I put my branch on our 0day to test most of the
> > compile configs. Obviously this casae wasn't covered..
> > 
> > @Sakari
> > I will send a patch to fix this by adding:
> > EXPORT_SYMBOL_GPL(fwnode_get_name).
> 
> There is already such patch at next-20200312:

You're right. This answers my question why I got no build errors..

Regards,
  Marco

> $ git show a7914d1072fb8ddeb2ec87bba1d28812483a3565
> commit a7914d1072fb8ddeb2ec87bba1d28812483a3565
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Mon Mar 2 16:53:51 2020 +0300
> 
>     device property: Export fwnode_get_name()
>     
>     This makes it possible to take advantage of the function in
>     the device drivers.
>     
>     Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>     Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>     Link: https://lore.kernel.org/r/20200302135353.56659-8-heikki.krogerus@linux.intel.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 511f6d7acdfe..5f35c0ccf5e0 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -566,6 +566,7 @@ const char *fwnode_get_name(const struct fwnode_handle *fwnode)
>  {
>         return fwnode_call_ptr_op(fwnode, get_name);
>  }
> +EXPORT_SYMBOL_GPL(fwnode_get_name);
>  
>  /**
>   * fwnode_get_name_prefix - Return the prefix of node for printing purposes
> 
> 
> 
> 
> Thanks,
> Mauro
