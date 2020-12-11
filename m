Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3D82D7B52
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 17:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbgLKQrF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Dec 2020 11:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35324 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389752AbgLKQqv (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Dec 2020 11:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607705123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bRiADumk9vvfb6+78YVWiTdGlJMqeBFewFK1nJKLGKs=;
        b=i2KgeUiQgBW7FFGDMEz1ALzwzuGMuGgHRpoSG8Xre9ZcBQM7b/GGUjpCp2QiNvhrh0gtUa
        24xChcz0jyHDLKjNTiK5cT0Zoj6sjroVzW1pFUpWyWNdE2BnAOSOaVMs5CYH2ZwoI/W5cQ
        ds/bEaJNeSclYVq6sgEXvg0+UyEd8Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-E4ONbMsQPJ6ImPPylj5y7w-1; Fri, 11 Dec 2020 11:45:18 -0500
X-MC-Unique: E4ONbMsQPJ6ImPPylj5y7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DCC0180A087;
        Fri, 11 Dec 2020 16:45:17 +0000 (UTC)
Received: from ovpn-114-43.rdu2.redhat.com (ovpn-114-43.rdu2.redhat.com [10.10.114.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41F405F708;
        Fri, 11 Dec 2020 16:45:15 +0000 (UTC)
Message-ID: <8b8eaefd5a6555742cf0384dd14bb864d8aac1f8.camel@redhat.com>
Subject: Re: [PATCH 3/3] driver core: platform: use bus_type functions
From:   Qian Cai <qcai@redhat.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Fri, 11 Dec 2020 11:45:14 -0500
In-Reply-To: <20201119124611.2573057-3-u.kleine-koenig@pengutronix.de>
References: <20201119124611.2573057-1-u.kleine-koenig@pengutronix.de>
         <20201119124611.2573057-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2020-11-19 at 13:46 +0100, Uwe Kleine-König wrote:
> This works towards the goal mentioned in 2006 in commit 594c8281f905
> ("[PATCH] Add bus_type probe, remove, shutdown methods.").
> 
> The functions are moved to where the other bus_type functions are
> defined and renamed to match the already established naming scheme.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reverting this commit from today's linux-next fixed a crash during shutdown.

.config: https://cailca.coding.net/public/linux/mm/git/files/master/x86.config

[ 9771.596916][T113465] BUG: unable to handle page fault for address: ffffffffffffffe8
[ 9771.604627][T113465] #PF: supervisor read access in kernel mode
[ 9771.610581][T113465] #PF: error_code(0x0000) - not-present page
[ 9771.616533][T113465] PGD 19c1e17067 P4D 19c1e17067 PUD 19c1e19067 PMD 0 
[ 9771.623279][T113465] Oops: 0000 [#1] SMP KASAN PTI
[ 9771.628098][T113465] CPU: 22 PID: 113465 Comm: reboot Tainted: G          IO      5.10.0-rc7-next-20201211 #1
[ 9771.638071][T113465] Hardware name: HPE ProLiant DL560 Gen10/ProLiant DL560 Gen10, BIOS U34 11/13/2019
[ 9771.647431][T113465] RIP: 0010:platform_shutdown+0x44/0x70
platform_shutdown at drivers/base/platform.c:1357
[ 9771.652956][T113465] Code: fa 48 c1 ea 03 80 3c 02 00 75 3d 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 68 48 8d 7d e8 48 89 fa 48 c1 ea 03 80 3c 02 00 75 17 <48> 8b 45 e8 48 85 c0 74 0b 48 8d 7b f0 5b 5d e9 08 45 6c 00 5b 5d
[ 9771.672623][T113465] RSP: 0018:ffffc90008a77d38 EFLAGS: 00010246
[ 9771.678665][T113465] RAX: dffffc0000000000 RBX: ffff888860d78810 RCX: ffff888860d78870
[ 9771.686628][T113465] RDX: 1ffffffffffffffd RSI: 0000000000000001 RDI: ffffffffffffffe8
[ 9771.694591][T113465] RBP: 0000000000000000 R08: ffffed110c1af166 R09: ffffed110c1af166
[ 9771.702555][T113465] R10: ffff888860d78b2b R11: ffffed110c1af165 R12: ffff888860d78810
[ 9771.710516][T113465] R13: ffff888860d78920 R14: fffffbfff2db0008 R15: ffff888860d78818
[ 9771.718478][T113465] FS:  00007f3434549540(0000) GS:ffff88901f500000(0000) knlGS:0000000000000000
[ 9771.727402][T113465] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 9771.733966][T113465] CR2: ffffffffffffffe8 CR3: 000000092e9c0004 CR4: 00000000007706e0
[ 9771.741929][T113465] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 9771.749890][T113465] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 9771.757852][T113465] PKRU: 55555554
[ 9771.761359][T113465] Call Trace:
[ 9771.764604][T113465]  device_shutdown+0x2ec/0x540
[ 9771.769335][T113465]  kernel_restart+0xe/0x40
[ 9771.773721][T113465]  __do_sys_reboot+0x143/0x2b0
[ 9771.778450][T113465]  ? kernel_power_off+0xa0/0xa0
[ 9771.783269][T113465]  ? debug_object_deactivate+0x3b0/0x3b0
[ 9771.788877][T113465]  ? syscall_enter_from_user_mode+0x17/0x40
[ 9771.794747][T113465]  ? rcu_read_lock_sched_held+0xa1/0xd0
[ 9771.800267][T113465]  ? lockdep_hardirqs_on_prepare+0x27c/0x3d0
[ 9771.806221][T113465]  ? syscall_enter_from_user_mode+0x1c/0x40
[ 9771.812087][T113465]  do_syscall_64+0x33/0x40
[ 9771.816472][T113465]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9771.822340][T113465] RIP: 0033:0x7f343379b857
[ 9771.826724][T113465] Code: 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 01 86 2c 00 f7 d8 64 89 02 b8
[ 9771.846392][T113465] RSP: 002b:00007ffef9f85e58 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
[ 9771.854791][T113465] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f343379b857
[ 9771.862752][T113465] RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
[ 9771.870713][T113465] RBP: 00007ffef9f85ea0 R08: 0000000000000002 R09: 0000000000000000
[ 9771.878673][T113465] R10: 000000000000004b R11: 0000000000000246 R12: 0000000000000001
[ 9771.886635][T113465] R13: 00000000fffffffe R14: 0000000000000006 R15: 0000000000000000
[ 9771.894596][T113465] Modules linked in: isofs cdrom fuse loop nls_ascii nls_cp437 vfat fat kvm_intel kvm ses enclosure irqbypass efivarfs ip_tables x_tables sd_mod tg3 nvme firmware_class smartpqi nvme_core libphy scsi_transport_sas dm_mirror dm_region_hash dm_log dm_mod [last unloaded: dummy_del_mod]
[ 9771.921472][T113465] CR2: ffffffffffffffe8
[ 9771.925590][T113465] ---[ end trace 8a3c9cffc1068bd2 ]---
[ 9771.931017][T113465] RIP: 0010:platform_shutdown+0x44/0x70
[ 9771.936535][T113465] Code: fa 48 c1 ea 03 80 3c 02 00 75 3d 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 68 48 8d 7d e8 48 89 fa 48 c1 ea 03 80 3c 02 00 75 17 <48> 8b 45 e8 48 85 c0 74 0b 48 8d 7b f0 5b 5d e9 08 45 6c 00 5b 5d
[ 9771.956204][T113465] RSP: 0018:ffffc90008a77d38 EFLAGS: 00010246

> ---
>  drivers/base/platform.c | 132 ++++++++++++++++++++--------------------
>  1 file changed, 65 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index b847f5f8f992..8ad06daa2eaa 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -743,70 +743,6 @@ struct platform_device *platform_device_register_full(
>  }
>  EXPORT_SYMBOL_GPL(platform_device_register_full);
>  
> -static int platform_probe_fail(struct platform_device *pdev);
> -
> -static int platform_drv_probe(struct device *_dev)
> -{
> -	struct platform_driver *drv = to_platform_driver(_dev->driver);
> -	struct platform_device *dev = to_platform_device(_dev);
> -	int ret;
> -
> -	/*
> -	 * A driver registered using platform_driver_probe() cannot be bound
> -	 * again later because the probe function usually lives in __init code
> -	 * and so is gone. For these drivers .probe is set to
> -	 * platform_probe_fail in __platform_driver_probe(). Don't even
> -	 * prepare clocks and PM domains for these to match the traditional
> -	 * behaviour.
> -	 */
> -	if (unlikely(drv->probe == platform_probe_fail))
> -		return -ENXIO;
> -
> -	ret = of_clk_set_defaults(_dev->of_node, false);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = dev_pm_domain_attach(_dev, true);
> -	if (ret)
> -		goto out;
> -
> -	if (drv->probe) {
> -		ret = drv->probe(dev);
> -		if (ret)
> -			dev_pm_domain_detach(_dev, true);
> -	}
> -
> -out:
> -	if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
> -		dev_warn(_dev, "probe deferral not supported\n");
> -		ret = -ENXIO;
> -	}
> -
> -	return ret;
> -}
> -
> -static int platform_drv_remove(struct device *_dev)
> -{
> -	struct platform_driver *drv = to_platform_driver(_dev->driver);
> -	struct platform_device *dev = to_platform_device(_dev);
> -	int ret = 0;
> -
> -	if (drv->remove)
> -		ret = drv->remove(dev);
> -	dev_pm_domain_detach(_dev, true);
> -
> -	return ret;
> -}
> -
> -static void platform_drv_shutdown(struct device *_dev)
> -{
> -	struct platform_driver *drv = to_platform_driver(_dev->driver);
> -	struct platform_device *dev = to_platform_device(_dev);
> -
> -	if (drv->shutdown)
> -		drv->shutdown(dev);
> -}
> -
>  /**
>   * __platform_driver_register - register a driver for platform-level devices
>   * @drv: platform driver structure
> @@ -817,9 +753,6 @@ int __platform_driver_register(struct platform_driver *drv,
>  {
>  	drv->driver.owner = owner;
>  	drv->driver.bus = &platform_bus_type;
> -	drv->driver.probe = platform_drv_probe;
> -	drv->driver.remove = platform_drv_remove;
> -	drv->driver.shutdown = platform_drv_shutdown;
>  
>  	return driver_register(&drv->driver);
>  }
> @@ -1349,6 +1282,68 @@ static int platform_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	return 0;
>  }
>  
> +static int platform_probe(struct device *_dev)
> +{
> +	struct platform_driver *drv = to_platform_driver(_dev->driver);
> +	struct platform_device *dev = to_platform_device(_dev);
> +	int ret;
> +
> +	/*
> +	 * A driver registered using platform_driver_probe() cannot be bound
> +	 * again later because the probe function usually lives in __init code
> +	 * and so is gone. For these drivers .probe is set to
> +	 * platform_probe_fail in __platform_driver_probe(). Don't even prepare
> +	 * clocks and PM domains for these to match the traditional behaviour.
> +	 */
> +	if (unlikely(drv->probe == platform_probe_fail))
> +		return -ENXIO;
> +
> +	ret = of_clk_set_defaults(_dev->of_node, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = dev_pm_domain_attach(_dev, true);
> +	if (ret)
> +		goto out;
> +
> +	if (drv->probe) {
> +		ret = drv->probe(dev);
> +		if (ret)
> +			dev_pm_domain_detach(_dev, true);
> +	}
> +
> +out:
> +	if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
> +		dev_warn(_dev, "probe deferral not supported\n");
> +		ret = -ENXIO;
> +	}
> +
> +	return ret;
> +}
> +
> +static int platform_remove(struct device *_dev)
> +{
> +	struct platform_driver *drv = to_platform_driver(_dev->driver);
> +	struct platform_device *dev = to_platform_device(_dev);
> +	int ret = 0;
> +
> +	if (drv->remove)
> +		ret = drv->remove(dev);
> +	dev_pm_domain_detach(_dev, true);
> +
> +	return ret;
> +}
> +
> +static void platform_shutdown(struct device *_dev)
> +{
> +	struct platform_driver *drv = to_platform_driver(_dev->driver);
> +	struct platform_device *dev = to_platform_device(_dev);
> +
> +	if (drv->shutdown)
> +		drv->shutdown(dev);
> +}
> +
> +
>  int platform_dma_configure(struct device *dev)
>  {
>  	enum dev_dma_attr attr;
> @@ -1375,6 +1370,9 @@ struct bus_type platform_bus_type = {
>  	.dev_groups	= platform_dev_groups,
>  	.match		= platform_match,
>  	.uevent		= platform_uevent,
> +	.probe		= platform_probe,
> +	.remove		= platform_remove,
> +	.shutdown	= platform_shutdown,
>  	.dma_configure	= platform_dma_configure,
>  	.pm		= &platform_dev_pm_ops,
>  };

