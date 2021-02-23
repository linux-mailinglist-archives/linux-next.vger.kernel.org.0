Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D382322D74
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 16:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhBWP0X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 10:26:23 -0500
Received: from foss.arm.com ([217.140.110.172]:55778 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233022AbhBWP0W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 10:26:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52C31FB;
        Tue, 23 Feb 2021 07:25:33 -0800 (PST)
Received: from e107158-lin (unknown [10.1.195.80])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3A653F73B;
        Tue, 23 Feb 2021 07:25:32 -0800 (PST)
Date:   Tue, 23 Feb 2021 15:25:30 +0000
From:   Qais Yousef <qais.yousef@arm.com>
To:     shuo.a.liu@intel.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH RESEND v2 2/2] virt: acrn: Make remove_cpu sysfs
 invisible with !CONFIG_HOTPLUG_CPU
Message-ID: <20210223152530.y2qfyozdaowmfcat@e107158-lin>
References: <20210221134339.57851-1-shuo.a.liu@intel.com>
 <20210221134339.57851-2-shuo.a.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210221134339.57851-2-shuo.a.liu@intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 02/21/21 21:43, shuo.a.liu@intel.com wrote:
> From: Shuo Liu <shuo.a.liu@intel.com>
> 
> Without cpu hotplug support, vCPU cannot be removed from a Service VM.
> Don't expose remove_cpu sysfs when CONFIG_HOTPLUG_CPU disabled.
> 
> Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
>  drivers/virt/acrn/hsm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
> index 1f6b7c54a1a4..6996ea6219e5 100644
> --- a/drivers/virt/acrn/hsm.c
> +++ b/drivers/virt/acrn/hsm.c
> @@ -404,6 +404,14 @@ static ssize_t remove_cpu_store(struct device *dev,
>  }
>  static DEVICE_ATTR_WO(remove_cpu);
>  
> +static umode_t acrn_attr_visible(struct kobject *kobj, struct attribute *a, int n)
> +{
> +       if (a == &dev_attr_remove_cpu.attr)
> +               return IS_ENABLED(CONFIG_HOTPLUG_CPU) ? a->mode : 0;
> +
> +       return a->mode;
> +}
> +

I can't find this code in Linus' master. But this looks fine from my narrow
PoV. Protecting the attribute with ifdef CONFIG_HOTPLUG_CPU is easier to read
for me, but this doesn't mean this approach is not fine.

Thanks

--
Qais Yousef

>  static struct attribute *acrn_attrs[] = {
>  	&dev_attr_remove_cpu.attr,
>  	NULL
> @@ -411,6 +419,7 @@ static struct attribute *acrn_attrs[] = {
>  
>  static struct attribute_group acrn_attr_group = {
>  	.attrs = acrn_attrs,
> +	.is_visible = acrn_attr_visible,
>  };
>  
>  static const struct attribute_group *acrn_attr_groups[] = {
> -- 
> 2.28.0
> 
