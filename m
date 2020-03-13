Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70BB18412E
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 08:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCMHHp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 03:07:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59158 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgCMHHp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 03:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=hTZKtE22TdpyZUE6k61swZnNwB9Kz0BlD6wfZDOZcAA=; b=UBo9N5AmiIGkUST8w0tgyjaj5y
        G44UxxHYexW+Kcb3SoDXZEjomILnZW/SbYjpEfNyUfDcDKmLBIxG5icUc8T07vOPHiN3KtJ+atK4F
        qqic1xL3Dt/B3s2kk5g1tW/8Wwj+yVNOElZS+PUqEwEJ0Vb4/hOuU+D+PXz7Vdkk8cypaIf79uSIA
        vvgzcEwry0u6Nn0P8ck/5d4ZfGmrRnN9OwhFni8hdy/dST8vmwCxiFZvK1bKEXqJUHIuX4kiz7SvE
        p+9mxfFt2uWK1yxSGd4kOnE4/bRgDZj7oy307SL9agoxbS5bGE/blIeJUoTPFtPr2NYLulVTPcun2
        ah7qA66g==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jCeQ4-0000H4-PP; Fri, 13 Mar 2020 07:07:45 +0000
Date:   Fri, 13 Mar 2020 08:07:35 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313080209.0c36c2b7@coco.lan>
In-Reply-To: <20200313131903.3975cdd2@canb.auug.org.au>
References: <20200313131903.3975cdd2@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Fri, 13 Mar 2020 13:19:03 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.ko] undefined!
> 
> Caused by commit
> 
>   dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing support")
> 
> I have used the v4l-dvb tree from next-20200312 for today.
 
Hmm... I double-checked at next-20200312. This function is defined
at linux/property.h header:

	include/linux/property.h:const char *fwnode_get_name(const struct fwnode_handle *fwnode);

Its implementation is at drivers/base/property.c, and this is always
built, according with drivers/base/Makefile:

	obj-y			:= component.o core.o bus.o dd.o syscore.o \
				   driver.o class.o platform.o \
				   cpu.o firmware.o init.o map.o devres.o \
				   attribute_container.o transport_class.o \
				   topology.o container.o property.o cacheinfo.o \
				   devcon.o swnode.o

The v4l2-fwnode.c properly includes include/linux/property.h.

So, at least up to next-20200312, everything looks fine on my eyes.

The header is probably there, as the error happened at link stage.

Maybe there is some merge conflict caused by merging a patch from
some other tree that might have renamed or removed its implementation
after next-20200312, or changed from obj-y target?

Or maybe this changeset got reverted?

	a7914d1072fb ("device property: Export fwnode_get_name()")


Thanks,
Mauro
