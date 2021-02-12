Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45083319AE6
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 08:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhBLHxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 02:53:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhBLHxQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 02:53:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E732F64E13;
        Fri, 12 Feb 2021 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613116356;
        bh=HpQHk0OqD+sZW6SvknIg2+jOr/x2orf6nVRPBzChn2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mNRabWq6nE7HhAVGwLKpYDNptcxDLgLj4LcBHF2ySyfcVBC8SY4bF6fb2cMF7Ury+
         z0HyrfWtG2HIDvcoIXstx5x/JRW2J9TjvrywenHeLsZWipcH6AKgSknfaWwwDl8VhG
         rnWLcHYucyQOsIl/Pxd3fNu7MwAeYyskImDcN67w=
Date:   Fri, 12 Feb 2021 08:52:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     shuo.a.liu@intel.com
Cc:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virt: acrn: Fix vCPU removing code build error
Message-ID: <YCYzwVE0wm5osXGF@kroah.com>
References: <20210212045724.77846-1-shuo.a.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210212045724.77846-1-shuo.a.liu@intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 12, 2021 at 12:57:24PM +0800, shuo.a.liu@intel.com wrote:
> From: Shuo Liu <shuo.a.liu@intel.com>
> 
> vCPU removing code depends on CONFIG_HOTPLUG_CPU as it uses remove_cpu()
> and add_cpu(). Make the vCPU removing interface building with
> CONFIG_HOTPLUG_CPU.
> 
> ../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
> ../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; [-Werror=implicit-function-declaration]
>    remove_cpu(cpu);
> 
> ../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; [-Werror=implicit-function-declaration]
>    add_cpu(cpu);
> 
> Fixes: 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
> ---
>  drivers/virt/acrn/hsm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
> index 1f6b7c54a1a4..e340788aacdf 100644
> --- a/drivers/virt/acrn/hsm.c
> +++ b/drivers/virt/acrn/hsm.c
> @@ -372,6 +372,7 @@ static int acrn_dev_release(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_HOTPLUG_CPU
>  static ssize_t remove_cpu_store(struct device *dev,
>  				struct device_attribute *attr,
>  				const char *buf, size_t count)
> @@ -403,9 +404,12 @@ static ssize_t remove_cpu_store(struct device *dev,
>  	return ret;
>  }
>  static DEVICE_ATTR_WO(remove_cpu);
> +#endif
>  
>  static struct attribute *acrn_attrs[] = {
> +#ifdef CONFIG_HOTPLUG_CPU
>  	&dev_attr_remove_cpu.attr,
> +#endif
>  	NULL
>  };
>  
> 

Shouldn't the real solution for this be that remove_cpu() and add_cpu()
have function prototypes for when this is not enabled in the kernel
build?

Putting #ifdef in .c files like this is not a good idea at all.

Then, at runtime, you can determine if you need to create this sysfs
file or not, as you do not want to expose it to userspace if the kernel
can not handle it, right?

thanks,

greg k-h
