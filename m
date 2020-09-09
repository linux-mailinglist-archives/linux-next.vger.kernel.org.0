Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9133F263702
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 22:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgIIUEl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 16:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgIIUEk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 16:04:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9903AC061573;
        Wed,  9 Sep 2020 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Jvm77/90HJwYlfYPmRWddMCR1SEU0mTsLpsMQ1Ko468=; b=qD/yDq3DH2haYhqEJ+5QHtsEP9
        ad4v7Ils7MwCrW3lZqFPjpk8dNcZWVDqGuNfwwjFzlI3aAztH+dHxVoR4WMVGVjAvKrCqKcXGyaF2
        KalLAJbKAvE45F8oVW8szWLyVl0Hz07dsINhg7Ut4LHR2enTGbg8aszl1U8TpJdQ9OXtC8ygbB+vM
        8rQJIZi0WLpt1q9LzfHCZSQZoUydYfN8SQQ/TCf4dDh/++G7Tp89QtTcSfCqjtpdgNrx30xw/QPT2
        PDQD3kl+D/f2CUKABTtW/JzWgackM6lmfvKgaOnE5BFSKUqFPZxqbz5WnR6LpIwdV3G4koMFzofQx
        ev5ED+zQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kG6KS-0001V9-Aq; Wed, 09 Sep 2020 20:04:28 +0000
Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Stephen Rothwell' <sfr@canb.auug.org.au>,
        'Linux Next Mailing List' <linux-next@vger.kernel.org>
Cc:     'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        'linux-scsi' <linux-scsi@vger.kernel.org>,
        'Santosh Yaraganavi' <santosh.sy@samsung.com>,
        'Vinayak Holikatti' <h.vinayak@samsung.com>,
        'Seungwon Jeon' <essuuj@gmail.com>
References: <20200720194225.17de9962@canb.auug.org.au>
 <CGME20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4@epcas5p2.samsung.com>
 <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
 <06a601d65f86$3d8aeee0$b8a0cca0$@samsung.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f72b8022-1ebd-c5a1-2fe2-a3e93854fd0e@infradead.org>
Date:   Wed, 9 Sep 2020 13:04:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <06a601d65f86$3d8aeee0$b8a0cca0$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/21/20 10:41 AM, Alim Akhtar wrote:
> Hi Randy,
> 
>> -----Original Message-----
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Sent: 20 July 2020 22:11
>> To: Stephen Rothwell <sfr@canb.auug.org.au>; Linux Next Mailing List <linux-
>> next@vger.kernel.org>
>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; linux-scsi <linux-
>> scsi@vger.kernel.org>; Santosh Yaraganavi <santosh.sy@samsung.com>;
>> Vinayak Holikatti <h.vinayak@samsung.com>; Alim Akhtar
>> <alim.akhtar@samsung.com>; Seungwon Jeon <essuuj@gmail.com>
>> Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
>>
>> On 7/20/20 2:42 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200717:
>>>
>>
>> on x86_64:
>>
>> WARNING: unmet direct dependencies detected for PHY_SAMSUNG_UFS
>>   Depends on [n]: OF [=n] && (ARCH_EXYNOS || COMPILE_TEST [=y])
>>   Selected by [y]:
>>   - SCSI_UFS_EXYNOS [=y] && SCSI_LOWLEVEL [=y] && SCSI [=y] &&
>> SCSI_UFSHCD_PLATFORM [=y] && (ARCH_EXYNOS || COMPILE_TEST [=y])
>>
> Thanks, will post a patch shortly.

Hi Alim,
I am still seeing this in linux-next of 20200909.
Was there a patch posted that I missed and is not applied anywhere yet?


>> There are no build errors since <linux/of.h> provides stubs for functions when
>> CONFIG_OF is not enabled.
>>
>> But new warnings are not OK.
>>
>> thanks.
>> --
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 

thanks.
-- 
~Randy

