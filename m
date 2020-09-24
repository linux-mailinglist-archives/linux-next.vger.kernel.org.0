Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FB0276D96
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 11:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIXJgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 05:36:52 -0400
Received: from foss.arm.com ([217.140.110.172]:40048 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgIXJgw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 05:36:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AFC911D4;
        Thu, 24 Sep 2020 02:36:51 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0343E3F73B;
        Thu, 24 Sep 2020 02:36:48 -0700 (PDT)
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Poonam Aggrwal <poonam.aggrwal@nxp.com>, robh@kernel.org,
        Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>, Zhiqiang.Hou@nxp.com
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
Date:   Thu, 24 Sep 2020 10:36:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200924092546.GJ27174@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-09-24 10:25, Joerg Roedel wrote:
> Hi Robin,
> 
> On Thu, Sep 24, 2020 at 10:08:46AM +0100, Robin Murphy wrote:
>> This should be fixed by https://lore.kernel.org/linux-iommu/daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com/T/#u
>> (already in linux-next).
> 
> Thanks! The question remains why this goes through the dma-mapping tree,
> was it caused by a patch there?

Yes, the issue was introduced by one of the changes in "dma-mapping: 
introduce DMA range map, supplanting dma_pfn_offset", so it only existed 
in the dma-mapping/for-next branch anyway.

Robin.
