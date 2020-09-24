Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C307276D10
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgIXJZy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 05:25:54 -0400
Received: from 8bytes.org ([81.169.241.247]:46308 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727377AbgIXJZu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 05:25:50 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 075A33D1; Thu, 24 Sep 2020 11:25:47 +0200 (CEST)
Date:   Thu, 24 Sep 2020 11:25:46 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Will Deacon <will@kernel.org>, linux-mtd@lists.infradead.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        masonccyang@mxic.com.tw, Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, Zhiqiang.Hou@nxp.com,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>, robh@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20200924092546.GJ27174@8bytes.org>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Robin,

On Thu, Sep 24, 2020 at 10:08:46AM +0100, Robin Murphy wrote:
> This should be fixed by https://lore.kernel.org/linux-iommu/daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com/T/#u
> (already in linux-next).

Thanks! The question remains why this goes through the dma-mapping tree,
was it caused by a patch there?

Regards,

	Joerg
