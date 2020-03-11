Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2D8181588
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 11:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCKKKp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 11 Mar 2020 06:10:45 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55301 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgCKKKo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 06:10:44 -0400
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8F6E040003;
        Wed, 11 Mar 2020 10:10:42 +0000 (UTC)
Date:   Wed, 11 Mar 2020 11:10:41 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200311111041.2dd477f5@xps13>
In-Reply-To: <20200311131616.41e728a1@canb.auug.org.au>
References: <20200311131616.41e728a1@canb.auug.org.au>
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

+ Janusz, ams-delta patch author

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Wed, 11 Mar 2020
13:16:16 +1100:

> Hi all,
> 
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Thanks for the report.

> 
> FATAL: modpost: drivers/mtd/nand/raw/ams-delta: sizeof(struct of_device_id)=200 is not a modulo of the size of section __mod_of__<identifier>_device_table=64.
> Fix definition of struct of_device_id in mod_devicetable.h
> 
> Maybe caused by commit
> 
>   966d708517e3 ("mtd: rawnand: ams-delta: Add module device tables")
> 
> But I have no idea why.
> 

This is strange. I think this is caused because of the addition of a
second device table with the same "of" scope. Changing one of them to
"platform" (the legacy one) seems to fix the problem.

Janusz, Is the following change okay for you? I would like to apply it
today so that linux-next get's updated with the 50+ stack of new
patches by tomorrow.

	--- a/drivers/mtd/nand/raw/ams-delta.c
	+++ b/drivers/mtd/nand/raw/ams-delta.c
	@@ -411,7 +411,7 @@ static const struct platform_device_id gpio_nand_plat_id_table[] = {
	                /* sentinel */
	        },
	 };
	-MODULE_DEVICE_TABLE(of, gpio_nand_plat_id_table);
	+MODULE_DEVICE_TABLE(platform, gpio_nand_plat_id_table);
 
	 static struct platform_driver gpio_nand_driver = {
	        .probe          = gpio_nand_probe,


Thanks,
Miquèl
