Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10EF323510
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 02:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhBXBOx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 20:14:53 -0500
Received: from mga07.intel.com ([134.134.136.100]:63176 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234668AbhBXBMi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 20:12:38 -0500
IronPort-SDR: Vj4XR2QglwdpQMhBAzMB+3aTZcTfRCLvlKlIJxb0an04bFqlx6vvSEg+GxNX3XXCuizL6nEcHu
 qyPpITEHi0Ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="249065603"
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="scan'208";a="249065603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 17:11:51 -0800
IronPort-SDR: WaACZKmiY0IRR9yOQtd09Mbo11q6wWM3zuPagSCaqco92Vn8GlIr6Tbj1KJm5pNZ37BSlMmvly
 eZGWDG1yCsGg==
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="scan'208";a="499373345"
Received: from shuo-intel.sh.intel.com (HELO localhost) ([10.239.154.30])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 17:11:49 -0800
Date:   Wed, 24 Feb 2021 09:11:47 +0800
From:   Shuo A Liu <shuo.a.liu@intel.com>
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Thomas Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH RESEND v2 2/2] virt: acrn: Make remove_cpu sysfs
 invisible with !CONFIG_HOTPLUG_CPU
Message-ID: <20210224011147.GD30008@shuo-intel.sh.intel.com>
References: <20210221134339.57851-1-shuo.a.liu@intel.com>
 <20210221134339.57851-2-shuo.a.liu@intel.com>
 <20210223152530.y2qfyozdaowmfcat@e107158-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210223152530.y2qfyozdaowmfcat@e107158-lin>
User-Agent: Mutt/1.8.3 (2017-05-23)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue 23.Feb'21 at 15:25:30 +0000, Qais Yousef wrote:
>On 02/21/21 21:43, shuo.a.liu@intel.com wrote:
>> From: Shuo Liu <shuo.a.liu@intel.com>
>>
>> Without cpu hotplug support, vCPU cannot be removed from a Service VM.
>> Don't expose remove_cpu sysfs when CONFIG_HOTPLUG_CPU disabled.
>>
>> Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Qais Yousef <qais.yousef@arm.com>
>> ---
>>  drivers/virt/acrn/hsm.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
>> index 1f6b7c54a1a4..6996ea6219e5 100644
>> --- a/drivers/virt/acrn/hsm.c
>> +++ b/drivers/virt/acrn/hsm.c
>> @@ -404,6 +404,14 @@ static ssize_t remove_cpu_store(struct device *dev,
>>  }
>>  static DEVICE_ATTR_WO(remove_cpu);
>>
>> +static umode_t acrn_attr_visible(struct kobject *kobj, struct attribute *a, int n)
>> +{
>> +       if (a == &dev_attr_remove_cpu.attr)
>> +               return IS_ENABLED(CONFIG_HOTPLUG_CPU) ? a->mode : 0;
>> +
>> +       return a->mode;
>> +}
>> +
>
>I can't find this code in Linus' master. But this looks fine from my narrow

Now, the code is still in linux-next tree only.

>PoV. Protecting the attribute with ifdef CONFIG_HOTPLUG_CPU is easier to read
>for me, but this doesn't mean this approach is not fine.

Just FYI, Greg prefers this solution.
https://lore.kernel.org/lkml/20210212045724.77846-1-shuo.a.liu@intel.com/

Thanks
shuo
