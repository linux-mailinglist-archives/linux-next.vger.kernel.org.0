Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6771A2BA9BC
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 13:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgKTMB3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 07:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgKTMB2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 07:01:28 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EAFC0613CF;
        Fri, 20 Nov 2020 04:01:28 -0800 (PST)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 28F571F45EFD;
        Fri, 20 Nov 2020 12:01:26 +0000 (GMT)
Date:   Fri, 20 Nov 2020 13:01:23 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nand tree
Message-ID: <20201120130123.1ca9e7af@collabora.com>
In-Reply-To: <20201120122359.0bb7d98f@xps13>
References: <20201120113929.0aff2f32@canb.auug.org.au>
        <20201120122359.0bb7d98f@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 20 Nov 2020 12:23:59 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Serge,
> 
> Stephen Rothwell <sfr@canb.auug.org.au> wrote on Fri, 20 Nov 2020
> 11:39:29 +1100:
> 
> > Hi all,
> > 
> > After merging the nand tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_read':
> > drivers/mtd/maps/physmap-bt1-rom.c:39:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >    39 |  shift = (unsigned int)src & 0x3;
> >       |          ^
> > drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_copy_from':
> > drivers/mtd/maps/physmap-bt1-rom.c:78:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >    78 |  shift = (unsigned int)src & 0x3;
> >       |          ^
> > 
> > Introduced by commit
> > 
> >   69a75a1a47d8 ("mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace removal warning")
> >   
> 
> Too bad :/ I'll drop this patch for now, let's look for another
> solution...

uintptr_t cast?
