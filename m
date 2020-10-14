Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF128E139
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 15:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgJNNZV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 14 Oct 2020 09:25:21 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50286 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgJNNZV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 09:25:21 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 4F3193B5E05
        for <linux-next@vger.kernel.org>; Wed, 14 Oct 2020 12:59:18 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B936D200013;
        Wed, 14 Oct 2020 12:58:47 +0000 (UTC)
Date:   Wed, 14 Oct 2020 14:58:46 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        abhimanyu.saini@nxp.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org, Suram Suram <suram@nxp.com>,
        masonccyang@mxic.com.tw, Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20201014145846.613977d5@xps13>
In-Reply-To: <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
        <20200924090349.GF27174@8bytes.org>
        <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
        <20200924092546.GJ27174@8bytes.org>
        <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
        <20200924095629.GL27174@8bytes.org>
        <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
        <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
        <20201011055258.22337d66@canb.auug.org.au>
        <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
        <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
        <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

Fabio Estevam <festevam@gmail.com> wrote on Wed, 14 Oct 2020 09:28:49
-0300:

> Hi Florian,
> 
> On Sun, Oct 11, 2020 at 6:59 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> > however the NAND warning still remains. Someone else familiar with these
> > NXP development boards should fix the DTS so as to provide the require
> > ECC strength property.  
> 
> The ECC NAND warning looks like a regression.
> 
> I had originally reported it for an imx27 board and now I also pointed
> out that it also affects Layerscape:
> https://lore.kernel.org/linux-mtd/20201013193652.0c535c7c@xps13/T/#m09fad7eacdf86aee0834bbd8863d6d5ee2e69f8c

I think this thread initially reported two distinct defects, one has
been solved, the second one is in my hands but I couldn't find the root
cause yet. I tried to reproduce, without luck, with another NAND
controller. If someone has an imx based board and a NAND controller on
it, I would appreciate some help.

Thanks,
Miquèl
