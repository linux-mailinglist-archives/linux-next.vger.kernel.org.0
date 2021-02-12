Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE5031A611
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 21:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhBLUby (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 15:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhBLUbw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 15:31:52 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BDBC061574;
        Fri, 12 Feb 2021 12:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=yRPqDT7WJiah8xiUj0TWBlWk749TUWjLjAH2yqjcZoo=; b=Zz+wAP4oOxHLYjcSDNhkFk1Xos
        hQyjFErwHEP3a2htQQtleH03vL+4Rt2NI5qMtvTlR6nB1PIxlwJTRpkFLfSXqVxzQF6lm7I3bEelx
        DQvdUJezUCVR1dMJvF/TjLsOebjPz4NwpcLH8oPislmgNC0TfivqRRBOx+d4hX0Skwavp/8d1GpFr
        13NqZouVroBDqCEhb+JFHWQ1EY+gymVveS/vafnS0HfMCUo4Uqtk6lx6aEcyTGUpCX0m4l8asNW34
        beDxKTK8048jjP14CjJZP5eas8IX1ivM8zndVvVsearxFKLNHbwXFCigwjSlpg5YtNy+dt1wnMuRW
        SJOSVFTA==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lAf5o-0007hp-81; Fri, 12 Feb 2021 20:31:08 +0000
Subject: Re: [PATCH v2 2/2] virt: acrn: Make remove_cpu sysfs invisible with
 !CONFIG_HOTPLUG_CPU
To:     shuo.a.liu@intel.com, linux-next@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>, linux-kernel@vger.kernel.org
References: <20210212165519.82126-1-shuo.a.liu@intel.com>
 <20210212165519.82126-2-shuo.a.liu@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6ebd2b16-2a16-96fd-af80-9162a2aee4d1@infradead.org>
Date:   Fri, 12 Feb 2021 12:31:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212165519.82126-2-shuo.a.liu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/12/21 8:55 AM, shuo.a.liu@intel.com wrote:
> From: Shuo Liu <shuo.a.liu@intel.com>
> 
> Without cpu hotplug support, vCPU cannot be removed from a Service VM.
> Don't expose remove_cpu sysfs when CONFIG_HOTPLUG_CPU disabled.
> 
> Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

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
> 


-- 
~Randy


