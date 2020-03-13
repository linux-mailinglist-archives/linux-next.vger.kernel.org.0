Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06200184127
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 08:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCMHFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 03:05:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57750 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgCMHFX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 03:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=+GIAeKVn6/6mS7zEjp0He9SbnOKS6iiO5n3vZgWytUg=; b=lZQmOUoAaK3wdVVuBwmtNxtSiy
        oboOZIBjmB5yRXLnwUeC+LV/HKzvVZvCeF2t8XuzwPAU+iHV5RbJKXIyd2+wcbrhX73PES2ujSSyo
        C38tcZp2WSs0oyVbGFfl1A/Ult/3Bmfu5Iq+qRbYC81pVBbuS7EplLkQ5stIAbG1AMHS4jaWR3P2A
        GsVAGAwnL2c9kIXb7PHl7motzuNky5BsD8KwRBMsCmFbaRHMzQP8h+sXQ4l+VldTTieKYxxNzb1pF
        gfDatKwA8z2JcCx+L79iABKfTuyzFF973oqGn9mWNJnDp4ThQNzTjQwCo1uYU7J/U9Zw9tGK6mSjr
        EmbvzO2Q==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jCeNi-0008CX-OU; Fri, 13 Mar 2020 07:05:19 +0000
Date:   Fri, 13 Mar 2020 08:05:14 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313080514.3f65c8d9@coco.lan>
In-Reply-To: <20200313064807.op4ghjsc22du3q4e@pengutronix.de>
References: <20200313131903.3975cdd2@canb.auug.org.au>
        <20200313064807.op4ghjsc22du3q4e@pengutronix.de>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Fri, 13 Mar 2020 07:48:07 +0100
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> Hi Stephen,
> 
> On 20-03-13 13:19, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the v4l-dvb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.ko] undefined!
> > 
> > Caused by commit
> > 
> >   dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing support")
> > 
> > I have used the v4l-dvb tree from next-20200312 for today.  
> 
> I'm sorry for that. I put my branch on our 0day to test most of the
> compile configs. Obviously this casae wasn't covered..
> 
> @Sakari
> I will send a patch to fix this by adding:
> EXPORT_SYMBOL_GPL(fwnode_get_name).

There is already such patch at next-20200312:

$ git show a7914d1072fb8ddeb2ec87bba1d28812483a3565
commit a7914d1072fb8ddeb2ec87bba1d28812483a3565
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Mon Mar 2 16:53:51 2020 +0300

    device property: Export fwnode_get_name()
    
    This makes it possible to take advantage of the function in
    the device drivers.
    
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Link: https://lore.kernel.org/r/20200302135353.56659-8-heikki.krogerus@linux.intel.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 511f6d7acdfe..5f35c0ccf5e0 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -566,6 +566,7 @@ const char *fwnode_get_name(const struct fwnode_handle *fwnode)
 {
        return fwnode_call_ptr_op(fwnode, get_name);
 }
+EXPORT_SYMBOL_GPL(fwnode_get_name);
 
 /**
  * fwnode_get_name_prefix - Return the prefix of node for printing purposes




Thanks,
Mauro
