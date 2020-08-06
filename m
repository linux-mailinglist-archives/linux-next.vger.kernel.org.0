Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDC823DDB7
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 19:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgHFRNt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 13:13:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3046 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgHFRNk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 13:13:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c3a360001>; Thu, 06 Aug 2020 10:13:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 10:13:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 10:13:40 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 17:13:39 +0000
Subject: Re: linux-next: Tree for Aug 6 (mm/migrate.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200806162116.1d033db0@canb.auug.org.au>
 <85e9276d-1747-b265-53be-a33ab6203045@infradead.org>
X-Nvconfidentiality: public
From:   Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <1634e188-0faf-a240-6847-94468d63d7d7@nvidia.com>
Date:   Thu, 6 Aug 2020 10:13:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <85e9276d-1747-b265-53be-a33ab6203045@infradead.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596734006; bh=FgNKwrpR6dpbYgks9Ta2+mgfbhRCmYt+NfPFOCEKaP8=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=YvMnkjxVR89j7CHtxQAoxybVDJtVOJOqMzLz/7hFOS8O3DRjkdCY76DMI7twMYZce
         HE92lSHfPHiX86gbdO8CeRO32qZrMVIr6+8eq0Dmnrjo5RS8FrGAdd0+zL9J0ovO+K
         PzrOgVCmRqou7a8bH9hTmSNYJch7PtDkdYs8uq8I6gRvkJBbxi/JHSGiQ1zxC1JJ5Z
         Gr2+KjbxXdXUGy0uG/Q2GfHeKAzrWFg/7j0NEm5rEGd1E7WYDvjFvnxGzneDAJDzKX
         hYLvRJm60bshRxJP45c1yNAzAO5jaMGPDAcAcXcj8HvUXs0tVtgrX+PjjgvCwyA+Co
         roOGPCqemxbUA==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 8/6/20 7:50 AM, Randy Dunlap wrote:
> On 8/5/20 11:21 PM, Stephen Rothwell wrote:
>> Hi all,
>>
> 
> on x86_64:
> 
> when CONFIG_MMU_NOTIFIER is not set/enabled:
> 
> ../mm/migrate.c: In function 'migrate_vma_collect':
> ../mm/migrate.c:2481:7: error: 'struct mmu_notifier_range' has no member named 'migrate_pgmap_owner'
>    range.migrate_pgmap_owner = migrate->pgmap_owner;
>         ^
> 

Thanks for finding this.
I'm working on it.
