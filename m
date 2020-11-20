Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268952BAAA8
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 14:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgKTM7G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 07:59:06 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:34446 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgKTM7G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 07:59:06 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 755D28000831;
        Fri, 20 Nov 2020 12:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EPVS-tzsg51y; Fri, 20 Nov 2020 15:59:00 +0300 (MSK)
Date:   Fri, 20 Nov 2020 15:58:59 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Boris Brezillon <boris.brezillon@collabora.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nand tree
Message-ID: <20201120125859.v7v4mr7rla5xd3xm@mobilestation>
References: <20201120113929.0aff2f32@canb.auug.org.au>
 <20201120122359.0bb7d98f@xps13>
 <20201120130123.1ca9e7af@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201120130123.1ca9e7af@collabora.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Miquel, Boris

On Fri, Nov 20, 2020 at 01:01:23PM +0100, Boris Brezillon wrote:
> On Fri, 20 Nov 2020 12:23:59 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Hi Serge,
> > 
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote on Fri, 20 Nov 2020
> > 11:39:29 +1100:
> > 
> > > Hi all,
> > > 
> > > After merging the nand tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > > 
> > > drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_read':
> > > drivers/mtd/maps/physmap-bt1-rom.c:39:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > >    39 |  shift = (unsigned int)src & 0x3;
> > >       |          ^
> > > drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_copy_from':
> > > drivers/mtd/maps/physmap-bt1-rom.c:78:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > >    78 |  shift = (unsigned int)src & 0x3;
> > >       |          ^
> > > 
> > > Introduced by commit
> > > 
> > >   69a75a1a47d8 ("mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace removal warning")
> > >   
> > 

> > Too bad :/ I'll drop this patch for now, let's look for another
> > solution...

that'd be great. I've forgotten that my arch is 32-bit and the
compiler just did print a warning for it.(

> 
> uintptr_t cast?

Yep, most likely that will be the best option in this case to make
sparse happy and not to cause the warning above.

I'll send v2 patch shortly.

-Sergey
