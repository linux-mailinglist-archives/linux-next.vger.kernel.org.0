Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2059C2BA8F4
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 12:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgKTLYF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 20 Nov 2020 06:24:05 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59431 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgKTLYE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 06:24:04 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8F5FE60009;
        Fri, 20 Nov 2020 11:24:00 +0000 (UTC)
Date:   Fri, 20 Nov 2020 12:23:59 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nand tree
Message-ID: <20201120122359.0bb7d98f@xps13>
In-Reply-To: <20201120113929.0aff2f32@canb.auug.org.au>
References: <20201120113929.0aff2f32@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Serge,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Fri, 20 Nov 2020
11:39:29 +1100:

> Hi all,
> 
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_read':
> drivers/mtd/maps/physmap-bt1-rom.c:39:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    39 |  shift = (unsigned int)src & 0x3;
>       |          ^
> drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_copy_from':
> drivers/mtd/maps/physmap-bt1-rom.c:78:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    78 |  shift = (unsigned int)src & 0x3;
>       |          ^
> 
> Introduced by commit
> 
>   69a75a1a47d8 ("mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace removal warning")
> 

Too bad :/ I'll drop this patch for now, let's look for another
solution...

Thanks,
Miquèl
