Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3C628AAC6
	for <lists+linux-next@lfdr.de>; Sun, 11 Oct 2020 23:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgJKV7K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Oct 2020 17:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgJKV7J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Oct 2020 17:59:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BE7C0613CE;
        Sun, 11 Oct 2020 14:59:08 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c6so7455575plr.9;
        Sun, 11 Oct 2020 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9e6PE672g+KN/RueGHdjxF/dIhOA0t5UklRi8kBXIYo=;
        b=eGZTXqEJPHVQ6ExQM7Q4fX+YX9UywNaaTdrhxNyhFq/x/ONPOaRsJX9Ja5k1UcZXD9
         ZB+iBqfiyu8OAzY3LJavM7fqkMdhO+IPw8QuQZV5B54j3NTkKulvSgaZ1aXLL3m1zzOU
         tsPp7+UyR3dcp2WugGmzBiqrrLUWZCdAbgSHC4rTI9Rva4wIwFnhFT6v6T8s6TxLBdxf
         T1f2euYnQCi4WdYmGHwcwOQ4n2p4q0mfQ3vfD9CsPY2g7VrtHxM6LqrwbHXzd7dPtxHu
         jtdRAt8Vt/MzxNTRJDJh/Mt8GGnOnUFqHCUcqEyafKCN103ST1QSj2yc5OM9Y+3DOdsE
         66eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9e6PE672g+KN/RueGHdjxF/dIhOA0t5UklRi8kBXIYo=;
        b=cyVuTKQWPV8vyZK9kZwQ/gs16270IHXwlFraORXKX2aXCOkLX+ZDQniaAi3yTqe4cX
         GkgqXaIcElTerzUuVkMlhBofenFDYT43/eZqRS9SZSqabTk/bFynsKVrfBp/B886VYn7
         rtFdR0YIVL2XCN+c2ixAuEYYn8spKzFHnAwSkl4gZ1gfkdjXj71Y/lNsqNyRNUkfGos+
         mpEZ1icfSK6p9cW1ExYxN7MBuTzdWLgur2AYhvNbg7563tZkXMVuyeiYnVynoTYcL31C
         JS/Y75jeEhgyFeIhv+CqKQzjC6aMCvSJY57wkg1m5C4H0KV/Nbt+8iJrscwTgJmvrUhk
         YEKQ==
X-Gm-Message-State: AOAM533gIFdqv87HONg0DSn0donl0MxZnrRA5xQPyWGIXynVDzyNcgxv
        7oLWFYRY6ao/UXJBCyG0WT0=
X-Google-Smtp-Source: ABdhPJw9w8wG0tU/Hja1vCXKXZXyjMFMCjOovpXFIPxKynORAT5MAY46GzyM3OLhJvvH95vQJ+Z4jg==
X-Received: by 2002:a17:902:7d97:b029:d2:8046:f593 with SMTP id a23-20020a1709027d97b02900d28046f593mr20862497plm.43.1602453547585;
        Sun, 11 Oct 2020 14:59:07 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id e13sm17090832pfi.70.2020.10.11.14.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2020 14:59:06 -0700 (PDT)
To:     Jim Quinlan <james.quinlan@broadcom.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        abhimanyu.saini@nxp.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
Date:   Sun, 11 Oct 2020 14:59:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Abhimanyu, Ioana, Fabio

On 10/11/2020 1:36 PM, Jim Quinlan wrote:
> On Sat, Oct 10, 2020 at 2:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Naresh,
>>
>> Just adding Christoph and Jim to cc]
>>
>> On Fri, 9 Oct 2020 19:26:24 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>
>>> On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
>>>>>
>>>>> On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
>>>>>> Yes, the issue was introduced by one of the changes in "dma-mapping:
>>>>>> introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
>>>>>> the dma-mapping/for-next branch anyway.
>>>>
>>>
>>> FYI,
>>> The reported problem still exists on 5.9.0-rc8-next-20201009.
>>>
>>> [    1.843814] Driver must set ecc.strength when using hardware ECC
>>> [    1.849847] WARNING: CPU: 4 PID: 1 at
>>> drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
>>> [    1.859676] Modules linked in:
>>> [    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
>>> 5.9.0-rc8-next-20201009 #1
>>> [    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
>>> [    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
>>> [    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
>>> [    1.887183] lr : nand_scan_with_ids+0x1450/0x1470
> 
> Hi,
> 
> I'm having a hard time coming up with a theory regarding  how a commit
> concerning DMA offsets can affect the operation of a NAND driver that
> appears not to use DMA or the dma-ranges property.  Does anyone else
> have some ideas, or is there perhaps someone familiar with this test
> configuration that I can correspond with to get to the bottom of the
> warning?

I believe you are given only a partial warning and just a glimpse of the 
thread here which is why understanding the connection to the dma ranges 
parsing is not clear. The start of the thread can be found here:

https://lore.kernel.org/lkml/CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com/

Robin indicated that the IOMMU probe failure was fixed with:

https://lore.kernel.org/linux-iommu/daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com/T/#u

which is confirmed with the new log from Naresh:

https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log

however the NAND warning still remains. Someone else familiar with these 
NXP development boards should fix the DTS so as to provide the require 
ECC strength property.
-- 
Florian
