Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94A02689AF
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 12:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgINK7a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 14 Sep 2020 06:59:30 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50345 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbgINK71 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 06:59:27 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5C3542000D;
        Mon, 14 Sep 2020 10:58:59 +0000 (UTC)
Date:   Mon, 14 Sep 2020 12:58:58 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200914125858.2614d92d@xps13>
In-Reply-To: <20200914095041.phuv6q7rl4nsdxnw@medion>
References: <20200914114552.5030ef1e@canb.auug.org.au>
        <20200914095041.phuv6q7rl4nsdxnw@medion>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

Alex Dewar <alex.dewar90@gmail.com> wrote on Mon, 14 Sep 2020 10:50:41
+0100:

> On Mon, Sep 14, 2020 at 11:45:52AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the nand tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/mtd/nand/onenand/onenand_omap2.c:27:10: fatal error: asm/mach/flash.h: No such file or directory
> >    27 | #include <asm/mach/flash.h>
> >       |          ^~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   26e1a8efc63d ("mtd: onenand: omap2: Allow for compile-testing on !ARM")
> > 
> > I have reverted that commit for today.
> 
> Gah, sorry :(. I definitely *tried* to build test it, but I must have
> messed up and built the wrong tree or something.
> 
> Apologies,
> Alex
> 
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 

I'll drop this patch for now, we'll try to have it for the next release
if Alex fixes it.

Thanks,
Miquèl
