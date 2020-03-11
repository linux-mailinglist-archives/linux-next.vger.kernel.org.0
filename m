Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D45181AAA
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 15:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbgCKOCD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 10:02:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58686 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729646AbgCKOCC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 10:02:02 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 31DA5295FF6;
        Wed, 11 Mar 2020 14:02:01 +0000 (GMT)
Date:   Wed, 11 Mar 2020 15:01:58 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200311150158.7481ffaa@collabora.com>
In-Reply-To: <20200311111041.2dd477f5@xps13>
References: <20200311131616.41e728a1@canb.auug.org.au>
        <20200311111041.2dd477f5@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Mar 2020 11:10:41 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Stephen,
> 
> + Janusz, ams-delta patch author
> 
> Stephen Rothwell <sfr@canb.auug.org.au> wrote on Wed, 11 Mar 2020
> 13:16:16 +1100:
> 
> > Hi all,
> > 
> > After merging the nand tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:  
> 
> Thanks for the report.
> 
> > 
> > FATAL: modpost: drivers/mtd/nand/raw/ams-delta: sizeof(struct of_device_id)=200 is not a modulo of the size of section __mod_of__<identifier>_device_table=64.
> > Fix definition of struct of_device_id in mod_devicetable.h
> > 
> > Maybe caused by commit
> > 
> >   966d708517e3 ("mtd: rawnand: ams-delta: Add module device tables")
> > 
> > But I have no idea why.
> >   
> 
> This is strange. I think this is caused because of the addition of a
> second device table with the same "of" scope. Changing one of them to
> "platform" (the legacy one) seems to fix the problem.
> 
> Janusz, Is the following change okay for you? I would like to apply it
> today so that linux-next get's updated with the 50+ stack of new
> patches by tomorrow.

Yep, this change looks good to me, I don't think you need to wait for
Janusz' ack to merge it.

Regards,

Boris
