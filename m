Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BF51D7225
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 09:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgERHpZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 18 May 2020 03:45:25 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46295 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgERHpZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 03:45:25 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5BEE524001A;
        Mon, 18 May 2020 07:45:21 +0000 (UTC)
Date:   Mon, 18 May 2020 09:45:19 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: build failure after merge of the mtd-fixes tree
Message-ID: <20200518094519.1e15d108@xps13>
In-Reply-To: <CAFLxGvy-MytQLhrju0cBaC5rz-80XA29R4EU_eh9LC670h2H5w@mail.gmail.com>
References: <20200518084021.64cbf411@canb.auug.org.au>
        <CAFLxGvy-MytQLhrju0cBaC5rz-80XA29R4EU_eh9LC670h2H5w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Richard,

Richard Weinberger <richard.weinberger@gmail.com> wrote on Mon, 18 May
2020 01:02:54 +0200:

> On Mon, May 18, 2020 at 12:41 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the mtd-fixes tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > /home/sfr/next/next/drivers/mtd/nand/spi/core.c: In function 'spinand_init':
> > /home/sfr/next/next/drivers/mtd/nand/spi/core.c:1093:26: error: 'struct nand_device' has no member named 'ecc'
> >  1093 |  mtd->ecc_strength = nand->ecc.ctx.conf.strength;
> >       |                          ^~
> > /home/sfr/next/next/drivers/mtd/nand/spi/core.c:1094:27: error: 'struct nand_device' has no member named 'ecc'
> >  1094 |  mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
> >       |                           ^~
> >
> > Caused by commit
> >
> >   d5baa0ec83de ("mtd: spinand: Propagate ECC information to the MTD structure")
> >
> > "This fix depends on recent changes and should not be backported as-is." ?  
> 
> Urgh, yes.
> This patch slipped in.
> 
> Anyway, Miquel, the ready-to-backport diff would be this?
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 248c4d7a0cf4..e2c382ffc5b6 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1090,8 +1090,8 @@ static int spinand_init(struct spinand_device *spinand)
>         mtd->oobavail = ret;
> 
>         /* Propagate ECC information to mtd_info */
> -       mtd->ecc_strength = nand->ecc.ctx.conf.strength;
> -       mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
> +       mtd->ecc_strength = nand->eccreq.strength;
> +       mtd->ecc_step_size = nand->eccreq.step_size;

Indeed, sorry for the confusion, this is fine.

Thanks,
Miquèl
