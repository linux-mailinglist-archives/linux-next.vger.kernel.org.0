Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D035B180E87
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 04:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgCKDdd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 23:33:33 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2531 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgCKDdc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 23:33:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e685bdf0000>; Tue, 10 Mar 2020 20:32:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 10 Mar 2020 20:33:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 10 Mar 2020 20:33:32 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Mar
 2020 03:33:31 +0000
Subject: Re: [PATCH] pid: fix uninitialized retval in alloc_pid()
To:     Christian Brauner <christian.brauner@ubuntu.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200311032153.431492-1-jhubbard@nvidia.com>
 <20200311033021.qm26c6cltfndlx3c@wittgenstein>
From:   John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e9eed2e9-5bcf-1978-3776-b8b25f92ac5b@nvidia.com>
Date:   Tue, 10 Mar 2020 20:33:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311033021.qm26c6cltfndlx3c@wittgenstein>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583897567; bh=Rmr1OCF1smWpgkALhWurYV1x/xRC0traeg34+z5gvtk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RHBCxJTeB3toSl6UDZK5GlFTIf+Dz0Nhz4u8lm6LHje8525BjDkJbGus2Fqmdj7lj
         rCrg6Wc5+rLPnWUZdbr7es7ryTYdbUeS8eQoj91EvioHtUcKIbC5fzoZswwSm0HeqA
         lgVTohrcZg+DJYlHRwqiL4ux75boN64IYvv31y6DQC8S5OiRnJkb7uxYPn1QsB4sFg
         DDZN7P9Lr9paFC1Q2BQm4yAZilNQvyLCym/dVDifK2MqtvINaq8LD6eVWdJ2LKsWN1
         igAcleeuFo2FOx0CigYr1h9Yuf1tE63IKSNtlBa66VV0MeSooBa2p+E/RgoRwkypHi
         qjczD4EeTziuw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/10/20 8:30 PM, Christian Brauner wrote:
> On Tue, Mar 10, 2020 at 08:21:53PM -0700, John Hubbard wrote:
>> Commit 8deb24dcb89cb ("pid: make ENOMEM return value more obvious")
>> left the return value uninitialized in one error case. The justification
>> for the above commit included a statement that retval is "initialized on
>> ever[y] failure path in the loop". However, that is not quite good
>> enough because there is an earlier case that is before the loop. And
>> also, it's more maintenance and merge-safe to initialize it once at the
>> top, as evidenced by this build warning that we now have.
>>
>> Therefore, restore the top-level initialization of retval.
>>
>> Also move the descriptive comment up, and remove the now-redundant
>> later initialization of retval.
>>
>> Fixes: 8deb24dcb89cb ("pid: make ENOMEM return value more obvious")
>> Cc: Christian Brauner <christian.brauner@ubuntu.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Thanks. I already have a fixed-up version in my tree after Stephen
> reported it earlier today:
> https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=fixes&id=10dab84caf400f2f5f8b010ebb0c7c4272ec5093
> 
> (Fwiw, we can't just move the it back up. It needs to be set after the
> loop too because it can be set to EPERM before. See


OK, yes. Sounds good.

thanks,
-- 
John Hubbard
NVIDIA

> https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=fixes&id=b26ebfe12f34f372cf041c6f801fa49c3fb382c5
> for the motiviation for the comment.)
> 
> Christian
> 
