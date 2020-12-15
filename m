Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48312DAB07
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 11:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgLOKp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 05:45:58 -0500
Received: from foss.arm.com ([217.140.110.172]:32798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgLOKpt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 05:45:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 681B91FB;
        Tue, 15 Dec 2020 02:44:55 -0800 (PST)
Received: from [10.57.22.20] (unknown [10.57.22.20])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383143F66E;
        Tue, 15 Dec 2020 02:44:54 -0800 (PST)
Subject: Re: [PATCH] thermal/drivers/devfreq: Fix missing dependency with the
 energy model
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rui.zhang@intel.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
References: <20201215125806.31495950@canb.auug.org.au>
 <20201215083520.601988-1-daniel.lezcano@linaro.org>
 <20201215194811.0505c1c5@canb.auug.org.au>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <2110a2c5-50ac-7cc9-57e8-eb22dde5bb32@arm.com>
Date:   Tue, 15 Dec 2020 10:44:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201215194811.0505c1c5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 12/15/20 8:48 AM, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 15 Dec 2020 09:35:20 +0100 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> The devfreq cooling device has been converted to use the energy model.
>>
>> Add the dependency on the ENERGY_MODEL option to reflect this change
>> and prevent build failure if the option is not set.
>>
>> Fixes: 615510fe13bd2 ("thermal: devfreq_cooling: remove old power model and use EM")
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>   drivers/thermal/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index 7edc8dc6bbab..ee62d51ef351 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -193,6 +193,7 @@ config DEVFREQ_THERMAL
>>   	bool "Generic device cooling support"
>>   	depends on PM_DEVFREQ
>>   	depends on PM_OPP
>> +	depends on ENERGY_MODEL
>>   	help
>>   	  This implements the generic devfreq cooling mechanism through
>>   	  frequency reduction for devices using devfreq.
> 
> Looks good to me.
> 

My apologies. I've tested it on odroidxu3 with
exynos_defconfig which has the energy model set.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Regards,
Lukasz
