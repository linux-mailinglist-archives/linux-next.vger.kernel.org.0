Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4103EE8B5
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 10:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbhHQIlk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 17 Aug 2021 04:41:40 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48859 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhHQIlk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 04:41:40 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1DEB324000C;
        Tue, 17 Aug 2021 08:41:03 +0000 (UTC)
Date:   Tue, 17 Aug 2021 10:41:02 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Sean Young <sean@mess.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Richard Weinberger <richard.weinberger@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: linux-next: manual merge of the mtd tree with Linus' tree
Message-ID: <20210817104102.1fd78cf0@xps13>
In-Reply-To: <20210817081558.GA14856@gofer.mess.org>
References: <20210817144907.2e691d0d@canb.auug.org.au>
        <20210817081558.GA14856@gofer.mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Sean,

Sean Young <sean@mess.org> wrote on Tue, 17 Aug 2021 09:15:59 +0100:

> On Tue, Aug 17, 2021 at 02:49:07PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the mtd tree got a conflict in:
> > 
> >   drivers/mtd/mtd_blkdevs.c
> > 
> > between commit:
> > 
> >   2b6d2833cd1d ("mtd: mtd_blkdevs: Initialize rq.limits.discard_granularity")
> > 
> > from Linus' tree and commit:
> > 
> >   c7c12c7ce6c1 ("mtd: blk_devs: make discard work on FTLs")
> > 
> > from the mtd tree.
> > 
> > I fixed it up (I (arbitrarily) used the former version)  
> 
> The former is slightly better, and also already merged upstream. My commit
> c7c12c7ce6c1 should be dropped from mtd/next, I think.

Dropped, thanks for the check.

Thanks,
Miquèl
