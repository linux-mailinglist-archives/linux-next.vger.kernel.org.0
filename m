Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994D231844E
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 05:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhBKEVc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 23:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhBKEVZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 23:21:25 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F35DC06174A;
        Wed, 10 Feb 2021 20:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=OP7k+oB+CairSZPQtHWATfpHL2M4+Deh2bbt9KTU5e4=; b=tMYwT9VVe6kUhkn6iB6cZpb1Gx
        Cmqh2E+kJMocCskpYeZRjc28s1bO3jqXhGpQmyWt/zU1CMVsEA2TwAQkD6+2jOqPONbAQvb74DpqA
        EwbKMGrCdjvqMMNrI3eEHFY1I4BHoTnBMq8z1rppGXy+TaKMh4x/HQUk5zz4ekrK/Bw7bmKEo5izu
        xV5YxlPA+ZWNIyyKIN3T/6eFjZHU5mE9qN0w4HuULDHto9yYDaJZ8vAhU409rYgSFxBtyWzhJ6UCG
        hnSCEZNLh3Em605vu+xh8vOCYFH7Mt793+ZLOV2Gk8uX7evXUWyW/J3x8WLQaKy8f7949SicSDGf2
        TIy8Swiw==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lA3T4-0005wz-8g; Thu, 11 Feb 2021 04:20:38 +0000
Subject: Re: linux-next: Tree for Feb 10 (acrn)
To:     "Liu, Shuo A" <shuo.a.liu@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        acrn-dev@lists.projectacrn.org
References: <20210210224220.28657128@canb.auug.org.au>
 <f13e97f3-88b9-294a-71d7-024478c13223@infradead.org>
 <eedf6122-ec76-c25a-8d57-4ee0fa9f55d3@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2728d6d9-7cb0-c9a3-c5b8-cbc9858e4c10@infradead.org>
Date:   Wed, 10 Feb 2021 20:20:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eedf6122-ec76-c25a-8d57-4ee0fa9f55d3@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/10/21 7:29 PM, Liu, Shuo A wrote:
> 
> 
> On 2/11/2021 01:52, Randy Dunlap wrote:
>> On 2/10/21 3:42 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210209:
>>>
>>
>> ../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
>> ../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; did you mean ‘register_cpu’? [-Werror=implicit-function-declaration]
>>    remove_cpu(cpu);
>>
>> ../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; did you mean ‘task_cpu’? [-Werror=implicit-function-declaration]
>>   add_cpu(cpu);
>>
>>
>> Full randconfig file is attached.
>>
> 
> Thanks.
> The vCPU removing depends on CONFIG_HOTPLUG_CPU. Below change could fix.

Yes, it does, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> ---
> 
> diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
> index 1f6b7c54a1a4..e340788aacdf 100644
> --- a/drivers/virt/acrn/hsm.c
> +++ b/drivers/virt/acrn/hsm.c
> @@ -372,6 +372,7 @@ static int acrn_dev_release(struct inode *inode,
> struct file *filp)
>         return 0;
>  }
> 
> +#ifdef CONFIG_HOTPLUG_CPU
>  static ssize_t remove_cpu_store(struct device *dev,
>                                 struct device_attribute *attr,
>                                 const char *buf, size_t count)
> @@ -403,9 +404,12 @@ static ssize_t remove_cpu_store(struct device *dev,
>         return ret;
>  }
>  static DEVICE_ATTR_WO(remove_cpu);
> +#endif
> 
>  static struct attribute *acrn_attrs[] = {
> +#ifdef CONFIG_HOTPLUG_CPU
>         &dev_attr_remove_cpu.attr,
> +#endif
>         NULL
>  };
> 


-- 
~Randy

