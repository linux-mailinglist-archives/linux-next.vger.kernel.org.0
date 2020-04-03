Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756CC19D2E4
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 11:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgDCJAm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 05:00:42 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12612 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390533AbgDCJAl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Apr 2020 05:00:41 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5E980234BFB7F53E05DE;
        Fri,  3 Apr 2020 17:00:36 +0800 (CST)
Received: from [127.0.0.1] (10.173.223.234) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 17:00:33 +0800
Subject: Re: linux-next: Tree for Apr 3
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200403162926.3ff57e99@canb.auug.org.au>
 <62438df4-3546-bfea-6e7f-825faaacfaff@huawei.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
        <paulus@samba.org>, <benh@kernel.crashing.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <97daf9ff-fff9-0fd2-6121-73eba88a50f4@huawei.com>
Date:   Fri, 3 Apr 2020 17:00:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <62438df4-3546-bfea-6e7f-825faaacfaff@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+cc linuxppc-dev@lists.ozlabs.org

On 2020/4/3 16:54, Yuehaibing wrote:
> 
> 
> On 2020/4/3 13:29, Stephen Rothwell wrote:
>> Hi all,
>>
>> The merge window has opened, so please do not add any material for the
>> next release into your linux-next included trees/branches until after
>> the merge window closes.
>>
>> Changes since 20200402:
>>
> 
> On PPC32, randcondfig warning this:
> 
> WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
>   Selected by [y]:
>   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]
> 

