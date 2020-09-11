Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B524E266553
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 18:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgIKQ7D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 11 Sep 2020 12:59:03 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52283 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgIKQ65 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2020 12:58:57 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2DFCB200003;
        Fri, 11 Sep 2020 16:58:53 +0000 (UTC)
Date:   Fri, 11 Sep 2020 18:58:52 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200911185852.26a8a0a0@xps13>
In-Reply-To: <20200910141252.3faeb89b@canb.auug.org.au>
References: <20200908133536.6ab7a7f0@canb.auug.org.au>
        <20200910141252.3faeb89b@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Thu, 10 Sep 2020
14:12:52 +1000:

> Hi all,
> 
> On Tue, 8 Sep 2020 13:35:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the nand tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geometry':
> > drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: error: 'chip' undeclared (first use in this function)
> >   513 |   nanddev_get_ecc_requirements(&chip->base);
> >       |                                 ^~~~
> > drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: note: each undeclared identifier is reported only once for each function it appears in
> > 
> > Caused by commit
> > 
> >   aa5faaa5f95c ("mtd: rawnand: Use nanddev_get/set_ecc_requirements() when relevant")
> > 
> > I have used the nand tree from next-20200903 for today.  
> 
> I am still getting this failure.
> 

I am very sorry for all these errors, As usual, I pushed this branch to
my 0-day repository last Thursday and got a green light. But it
regularly happens, like this week, that I received an error report
even after that. This time the robot discovered the mistake at the
same time as you...

Anyway, it is now fixed and I pushed a hopefully fine nand/next branch.

As always, thank you very much for your time.
Miquèl
