Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCBA2337B4
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 19:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgG3Rbx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 13:31:53 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1305 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbgG3Rbw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 13:31:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2303da0000>; Thu, 30 Jul 2020 10:31:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jul 2020 10:31:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jul 2020 10:31:52 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 17:31:45 +0000
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
To:     Jason Gunthorpe <jgg@mellanox.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ben Skeggs <bskeggs@redhat.com>
CC:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <20200730192110.1466e63e@canb.auug.org.au>
 <20200730120303.GQ19097@mellanox.com>
From:   Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <cf7af4c9-592a-2143-831a-cb0f44bc768e@nvidia.com>
Date:   Thu, 30 Jul 2020 10:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200730120303.GQ19097@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596130266; bh=k4vNNiKstW6Z4KOTz1fqT9YxUmyKEbjWauOw7RAdy6E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=IDllqmel5uIxCRjyj3mE7PtQjbfdPLAHQaKS7JSlcufXQnN0y2wr9uNpduQmM5RrJ
         DxzkaWGYixjZ+7++WSnROrAz3JQ3PSagZWwfKQzu1JnTOBWOGOeHtssYrwZpALTrN0
         qhdmTSvdkX+jNESbUszk6fWDe1c5xsOT13/gNEINM+faqNkqqGbtr0zycn7+lNiweS
         M9mMWebWrxVBt8GQGc6KU9KJBVlueykDJk/COiuW0lgjClzIuxbbs++nOYHW8llTvT
         O9+y7MGd8SlBYOL0G/08vXb6g0g+SoVCzw7djjwc0r/ka1lZCwWT+ZytK7Tb8mF2Zd
         fesOHI2MS7mtQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 7/30/20 5:03 AM, Jason Gunthorpe wrote:
> On Thu, Jul 30, 2020 at 07:21:10PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the hmm tree got a conflict in:
>>
>>    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
>>
>> between commit:
>>
>>    7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
>>
>> from the drm tree and commits:
>>
>>    4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
>>    1a77decd0cae ("nouveau: fix storing invalid ptes")
>>
>> from the hmm tree.
>>
>> 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
> 
> Oh? Ralph? What happened here?

Ben did email me saying he was planning to take this patch into
his nouveau tree and I did reply to him saying you had also taken it
into your tree and that I had more nouveau/SVM patches for you on the way.
So, I'm not sure what happened.

> Ben can you drop 7763d24f3ba0 ?
> 
> Jason
> 
