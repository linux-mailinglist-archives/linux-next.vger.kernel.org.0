Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D66AA4577
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 18:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfHaQt2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 31 Aug 2019 12:49:28 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7640 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfHaQt2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 31 Aug 2019 12:49:28 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6aa51a0000>; Sat, 31 Aug 2019 09:49:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 31 Aug 2019 09:49:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 31 Aug 2019 09:49:27 -0700
Received: from [10.25.72.86] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 31 Aug
 2019 16:49:24 +0000
Subject: Re: linux-next: build failure after merge of the pci tree
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Krzysztof Wilczynski <kw@linux.com>
References: <20190830132311.7190ccc3@canb.auug.org.au>
 <CAErSpo618ewbJQHS3E3KWhTLe6T47u=Xjx9E-gYKMzjn=MmujA@mail.gmail.com>
 <9ae74244-f1e1-de7f-6d03-b2cca012f6fc@nvidia.com>
 <20190831084917.GA27466@e121166-lin.cambridge.arm.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <b4053e63-cfeb-9d38-d182-1fb88445474e@nvidia.com>
Date:   Sat, 31 Aug 2019 22:19:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190831084917.GA27466@e121166-lin.cambridge.arm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567270170; bh=/Z4mXFGx6fG9Ac342sfuiMn/y8zQuOXEAfS7/Y90TNc=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RsPLTrKm90s9P8+rMbRrYn/vbrRgtp9lQ1KzWS87HTmF1jhSy6rccVNuCScNiuF29
         ZMJsy7UO5uBXyxF7f0KmYY7JKoJycN4PoJkfRPiR8o0O126FsNQCv4ubzertSD5ujW
         Yr5POvEQBLMFF6BN/+be+8HTZhw3nntmdulSWfUVbodI6QdM4gCygG2KKg3Rq45nk7
         ba6fUJq9XXSZ79X1V/5qljcSzFMZ1Q9sRtXfelUPzGHeeX1Bhr7PE9u6eAzGJAEJz6
         lvh2kaGRoudK1UqcUAK69/YWZYO8ZVirwlWe9KHjhpaMASKFPTXU4xaWdENIV5i2tA
         xSzNuvCqa7O7g==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/31/2019 2:19 PM, Lorenzo Pieralisi wrote:
> On Sat, Aug 31, 2019 at 09:51:05AM +0530, Vidya Sagar wrote:
>> On 8/30/2019 6:00 PM, Bjorn Helgaas wrote:
>>> [+cc Krzysztof]
>>>
>>> On Thu, Aug 29, 2019 at 10:23 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
>>>> failed like this:
>>>>
>>>> drivers/pci/controller/dwc/pcie-tegra194.c:24:10: fatal error: linux/pci-aspm.h: No such file or directory
>>>>      24 | #include <linux/pci-aspm.h>
>>>>         |          ^~~~~~~~~~~~~~~~~~
>>>>
>>>> Caused by commit
>>>>
>>>>     81564976b1a9 ("PCI: tegra: Add Tegra194 PCIe support")
>>>>
>>>> I have reverted that commit for todat.
>>>
>>> Thanks, Stephen.
>>>
>>> I *could* fix this by removing that include in the merge, since the
>>> contents of linux/pci-aspm.h were moved into linux/pci.h by
>>> https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=7ce2e76a0420
>>>
>>> But as far as I can tell, pcie-tegra194.c doesn't actually require
>>> anything from linux/pci-aspm.h, so I'd rather amend the tegra194
>>> commit https://git.kernel.org/cgit/linux/kernel/git/lpieralisi/pci.git/commit/?id=81564976b1a9
>>> so it doesn't include pci-aspm.h in the first place.
>> Thanks Bjorn for the reply.
>> Yes. This header file is not required for now and can be removed.
>> Is there any action required from my side for this?
> 
> I updated my pci/tegra branch so that Bjorn can pull it.
Thanks a lot Lorenzo and Bjorn.

- Vidya Sagar
> 
> Lorenzo
> 

