Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E03A420A
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 06:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfHaEVP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 31 Aug 2019 00:21:15 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3851 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfHaEVP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 31 Aug 2019 00:21:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d69f5ba0000>; Fri, 30 Aug 2019 21:21:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 30 Aug 2019 21:21:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 30 Aug 2019 21:21:14 -0700
Received: from [10.25.72.86] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 31 Aug
 2019 04:21:10 +0000
Subject: Re: linux-next: build failure after merge of the pci tree
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Krzysztof Wilczynski <kw@linux.com>
References: <20190830132311.7190ccc3@canb.auug.org.au>
 <CAErSpo618ewbJQHS3E3KWhTLe6T47u=Xjx9E-gYKMzjn=MmujA@mail.gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <9ae74244-f1e1-de7f-6d03-b2cca012f6fc@nvidia.com>
Date:   Sat, 31 Aug 2019 09:51:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAErSpo618ewbJQHS3E3KWhTLe6T47u=Xjx9E-gYKMzjn=MmujA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567225275; bh=v1nWbEGKg2bagzwvzFTzbWWgbcaDsnbU7NOGZ26ZRm0=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rMkOwl9KdKxTuY0EoQcyxmo/F5ZkGlBFzZzGPD52I0Pas74eDOkIfd/yNhI0IVHXm
         tki3jTz+aygMviA6/G/XAQeezuTzDSW0j+u1XKpfo1ZcvfYN5FKOkLJIRZOtkdCBej
         bdv3Rv51euBoBBjCfY8Hw0E0N4V18NtljTNZkbrZXHiGHyEY0sgYniFUOqautRhOwX
         kG2hJdT/ka/8NyzumQqfBaBCcU8GXMW7sBob/MNTHZ0RTwvOHvDzSTxVS4BjV2vuZg
         GBYkNuH0iYEBWwDzNfJKL56M8DXB4BWKa+6eeRBtzwqr9RVXb4GpbPmuoZ/jQc01BF
         cPR1reB+okggg==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/30/2019 6:00 PM, Bjorn Helgaas wrote:
> [+cc Krzysztof]
> 
> On Thu, Aug 29, 2019 at 10:23 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> drivers/pci/controller/dwc/pcie-tegra194.c:24:10: fatal error: linux/pci-aspm.h: No such file or directory
>>     24 | #include <linux/pci-aspm.h>
>>        |          ^~~~~~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>    81564976b1a9 ("PCI: tegra: Add Tegra194 PCIe support")
>>
>> I have reverted that commit for todat.
> 
> Thanks, Stephen.
> 
> I *could* fix this by removing that include in the merge, since the
> contents of linux/pci-aspm.h were moved into linux/pci.h by
> https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=7ce2e76a0420
> 
> But as far as I can tell, pcie-tegra194.c doesn't actually require
> anything from linux/pci-aspm.h, so I'd rather amend the tegra194
> commit https://git.kernel.org/cgit/linux/kernel/git/lpieralisi/pci.git/commit/?id=81564976b1a9
> so it doesn't include pci-aspm.h in the first place.
Thanks Bjorn for the reply.
Yes. This header file is not required for now and can be removed.
Is there any action required from my side for this?

> 
> Bjorn
> 

