Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBA21CECD3
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 08:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgELGFR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 02:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726161AbgELGFR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 02:05:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C06DC061A0C;
        Mon, 11 May 2020 23:05:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 05DE42A0BD1
Subject: Re: next/master bisection: baseline.login on jetson-tk1
To:     Joerg Roedel <jroedel@suse.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
Cc:     iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
Date:   Tue, 12 May 2020 07:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please see the bisection report below about a kernel panic.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

See the kernel Oops due to a NULL pointer followed by a panic:

    https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html#L573

Stack trace:

<0>[    2.953683] [<c05624f4>] (__iommu_probe_device) from [<c05633f0>] (iommu_probe_device+0x18/0x124)
<0>[    2.962810] [<c05633f0>] (iommu_probe_device) from [<c0566704>] (of_iommu_configure+0x154/0x1b8)
<0>[    2.971853] [<c0566704>] (of_iommu_configure) from [<c07e9958>] (of_dma_configure+0x144/0x2c8)
<0>[    2.980722] [<c07e9958>] (of_dma_configure) from [<c0568c24>] (host1x_attach_driver+0x148/0x2c4)
<0>[    2.989763] [<c0568c24>] (host1x_attach_driver) from [<c0568e10>] (host1x_driver_register_full+0x70/0xcc)
<0>[    2.999585] [<c0568e10>] (host1x_driver_register_full) from [<c102652c>] (host1x_drm_init+0x14/0x50)
<0>[    3.008973] [<c102652c>] (host1x_drm_init) from [<c010206c>] (do_one_initcall+0x50/0x2b0)
<0>[    3.017405] [<c010206c>] (do_one_initcall) from [<c1001000>] (kernel_init_freeable+0x188/0x200)
<0>[    3.026361] [<c1001000>] (kernel_init_freeable) from [<c0b1808c>] (kernel_init+0x8/0x114)
<0>[    3.034794] [<c0b1808c>] (kernel_init) from [<c01001a8>] (ret_from_fork+0x14/0x2c)

Guillaume


On 12/05/2020 02:24, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> next/master bisection: baseline.login on jetson-tk1
> 
> Summary:
>   Start:      4b20e7462caa6 Add linux-next specific files for 20200511
>   Plain log:  https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html
>   Result:     3eeeb45c6d044 iommu: Remove add_device()/remove_device() code-paths
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     jetson-tk1
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     tegra_defconfig
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 3eeeb45c6d0444b368cdeba9bdafa8bbcf5370d1
> Author: Joerg Roedel <jroedel@suse.de>
> Date:   Wed Apr 29 15:37:10 2020 +0200
> 
>     iommu: Remove add_device()/remove_device() code-paths
>     
>     All drivers are converted to use the probe/release_device()
>     call-backs, so the add_device/remove_device() pointers are unused and
>     the code using them can be removed.
>     
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
>     Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>     Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>     Link: https://lore.kernel.org/r/20200429133712.31431-33-joro@8bytes.org
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 397fd4fd0c320..7f99e5ae432c6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -220,12 +220,20 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
>  	return ret;
>  }
>  
> -static int __iommu_probe_device_helper(struct device *dev)
> +int iommu_probe_device(struct device *dev)
>  {
>  	const struct iommu_ops *ops = dev->bus->iommu_ops;
>  	struct iommu_group *group;
>  	int ret;
>  
> +	if (!dev_iommu_get(dev))
> +		return -ENOMEM;
> +
> +	if (!try_module_get(ops->owner)) {
> +		ret = -EINVAL;
> +		goto err_out;
> +	}
> +
>  	ret = __iommu_probe_device(dev, NULL);
>  	if (ret)
>  		goto err_out;
> @@ -259,75 +267,23 @@ static int __iommu_probe_device_helper(struct device *dev)
>  
>  err_release:
>  	iommu_release_device(dev);
> +
>  err_out:
>  	return ret;
>  
>  }
>  
> -int iommu_probe_device(struct device *dev)
> +void iommu_release_device(struct device *dev)
>  {
>  	const struct iommu_ops *ops = dev->bus->iommu_ops;
> -	struct iommu_group *group;
> -	int ret;
> -
> -	WARN_ON(dev->iommu_group);
> -
> -	if (!ops)
> -		return -EINVAL;
> -
> -	if (!dev_iommu_get(dev))
> -		return -ENOMEM;
> -
> -	if (!try_module_get(ops->owner)) {
> -		ret = -EINVAL;
> -		goto err_free_dev_param;
> -	}
> -
> -	if (ops->probe_device)
> -		return __iommu_probe_device_helper(dev);
> -
> -	ret = ops->add_device(dev);
> -	if (ret)
> -		goto err_module_put;
>  
> -	group = iommu_group_get(dev);
> -	iommu_create_device_direct_mappings(group, dev);
> -	iommu_group_put(group);
> -
> -	if (ops->probe_finalize)
> -		ops->probe_finalize(dev);
> -
> -	return 0;
> -
> -err_module_put:
> -	module_put(ops->owner);
> -err_free_dev_param:
> -	dev_iommu_free(dev);
> -	return ret;
> -}
> -
> -static void __iommu_release_device(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	if (!dev->iommu)
> +		return;
>  
>  	iommu_device_unlink(dev->iommu->iommu_dev, dev);
> -
>  	iommu_group_remove_device(dev);
>  
>  	ops->release_device(dev);
> -}
> -
> -void iommu_release_device(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> -
> -	if (!dev->iommu)
> -		return;
> -
> -	if (ops->release_device)
> -		__iommu_release_device(dev);
> -	else if (dev->iommu_group)
> -		ops->remove_device(dev);
>  
>  	module_put(ops->owner);
>  	dev_iommu_free(dev);
> @@ -1560,23 +1516,6 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
>  	if (ret)
>  		goto out_put_group;
>  
> -	/*
> -	 * Try to allocate a default domain - needs support from the
> -	 * IOMMU driver. There are still some drivers which don't support
> -	 * default domains, so the return value is not yet checked. Only
> -	 * allocate the domain here when the driver still has the
> -	 * add_device/remove_device call-backs implemented.
> -	 */
> -	if (!ops->probe_device) {
> -		iommu_alloc_default_domain(dev);
> -
> -		if (group->default_domain)
> -			ret = __iommu_attach_device(group->default_domain, dev);
> -
> -		if (ret)
> -			goto out_put_group;
> -	}
> -
>  	return group;
>  
>  out_put_group:
> @@ -1591,21 +1530,6 @@ struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
>  	return group->default_domain;
>  }
>  
> -static int add_iommu_group(struct device *dev, void *data)
> -{
> -	int ret = iommu_probe_device(dev);
> -
> -	/*
> -	 * We ignore -ENODEV errors for now, as they just mean that the
> -	 * device is not translated by an IOMMU. We still care about
> -	 * other errors and fail to initialize when they happen.
> -	 */
> -	if (ret == -ENODEV)
> -		ret = 0;
> -
> -	return ret;
> -}
> -
>  static int probe_iommu_group(struct device *dev, void *data)
>  {
>  	const struct iommu_ops *ops = dev->bus->iommu_ops;
> @@ -1793,47 +1717,41 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group)
>  
>  int bus_iommu_probe(struct bus_type *bus)
>  {
> -	const struct iommu_ops *ops = bus->iommu_ops;
> +	struct iommu_group *group, *next;
> +	LIST_HEAD(group_list);
>  	int ret;
>  
> -	if (ops->probe_device) {
> -		struct iommu_group *group, *next;
> -		LIST_HEAD(group_list);
> -
> -		/*
> -		 * This code-path does not allocate the default domain when
> -		 * creating the iommu group, so do it after the groups are
> -		 * created.
> -		 */
> -		ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
> -		if (ret)
> -			return ret;
> +	/*
> +	 * This code-path does not allocate the default domain when
> +	 * creating the iommu group, so do it after the groups are
> +	 * created.
> +	 */
> +	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
> +	if (ret)
> +		return ret;
>  
> -		list_for_each_entry_safe(group, next, &group_list, entry) {
> -			/* Remove item from the list */
> -			list_del_init(&group->entry);
> +	list_for_each_entry_safe(group, next, &group_list, entry) {
> +		/* Remove item from the list */
> +		list_del_init(&group->entry);
>  
> -			mutex_lock(&group->mutex);
> +		mutex_lock(&group->mutex);
>  
> -			/* Try to allocate default domain */
> -			probe_alloc_default_domain(bus, group);
> +		/* Try to allocate default domain */
> +		probe_alloc_default_domain(bus, group);
>  
> -			if (!group->default_domain) {
> -				mutex_unlock(&group->mutex);
> -				continue;
> -			}
> +		if (!group->default_domain) {
> +			mutex_unlock(&group->mutex);
> +			continue;
> +		}
>  
> -			iommu_group_create_direct_mappings(group);
> +		iommu_group_create_direct_mappings(group);
>  
> -			ret = __iommu_group_dma_attach(group);
> +		ret = __iommu_group_dma_attach(group);
>  
> -			mutex_unlock(&group->mutex);
> +		mutex_unlock(&group->mutex);
>  
> -			if (ret)
> -				break;
> -		}
> -	} else {
> -		ret = bus_for_each_dev(bus, NULL, NULL, add_iommu_group);
> +		if (ret)
> +			break;
>  	}
>  
>  	return ret;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index fea1622408adb..dd076366383fc 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -223,8 +223,6 @@ struct iommu_iotlb_gather {
>   * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
>   *            queue
>   * @iova_to_phys: translate iova to physical address
> - * @add_device: add device to iommu grouping
> - * @remove_device: remove device from iommu grouping
>   * @probe_device: Add device to iommu driver handling
>   * @release_device: Remove device from iommu driver handling
>   * @probe_finalize: Do final setup work after the device is added to an IOMMU
> @@ -277,8 +275,6 @@ struct iommu_ops {
>  	void (*iotlb_sync)(struct iommu_domain *domain,
>  			   struct iommu_iotlb_gather *iotlb_gather);
>  	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
> -	int (*add_device)(struct device *dev);
> -	void (*remove_device)(struct device *dev);
>  	struct iommu_device *(*probe_device)(struct device *dev);
>  	void (*release_device)(struct device *dev);
>  	void (*probe_finalize)(struct device *dev);
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> git bisect good 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8
> # bad: [4b20e7462caa697f8a2cdab04ed8a5881cc65427] Add linux-next specific files for 20200511
> git bisect bad 4b20e7462caa697f8a2cdab04ed8a5881cc65427
> # good: [8d06abbd3c806aa7b5a25a3ae455349b88f1ee85] Merge remote-tracking branch 'crypto/master'
> git bisect good 8d06abbd3c806aa7b5a25a3ae455349b88f1ee85
> # bad: [ee471063218348604d1ce36984ca912fa1bfd42f] Merge remote-tracking branch 'spi/for-next'
> git bisect bad ee471063218348604d1ce36984ca912fa1bfd42f
> # good: [0a7a42754678fd20454c8b376922dac9a88d67e0] Merge remote-tracking branch 'drm/drm-next'
> git bisect good 0a7a42754678fd20454c8b376922dac9a88d67e0
> # good: [c3ffe334cbcf35024f0744d3a173443d5dfed164] Merge remote-tracking branch 'modules/modules-next'
> git bisect good c3ffe334cbcf35024f0744d3a173443d5dfed164
> # good: [859687014bb39409b351aba56fb3fd58571b003b] Merge remote-tracking branch 'battery/for-next'
> git bisect good 859687014bb39409b351aba56fb3fd58571b003b
> # bad: [4446915af3dd417222fe56c0fa77bc6eefa4449b] Merge remote-tracking branch 'audit/next'
> git bisect bad 4446915af3dd417222fe56c0fa77bc6eefa4449b
> # good: [bdf4ae4c3f5fcd95a9405f1484da496b8d80ba01] Merge remote-tracking branch 'selinux/next'
> git bisect good bdf4ae4c3f5fcd95a9405f1484da496b8d80ba01
> # good: [b287ba73789906fc4f4ee821e1014b13e2814849] iommu/tegra: Convert to probe/release_device() call-backs
> git bisect good b287ba73789906fc4f4ee821e1014b13e2814849
> # bad: [a1ae3ea82d8be294d3399c6bd288d7a45890b4fc] Merge branches 'iommu/fixes' and 'core' into next
> git bisect bad a1ae3ea82d8be294d3399c6bd288d7a45890b4fc
> # good: [66ae88e71ecb93bafaacaeef233971eacd10e749] iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
> git bisect good 66ae88e71ecb93bafaacaeef233971eacd10e749
> # bad: [3eeeb45c6d0444b368cdeba9bdafa8bbcf5370d1] iommu: Remove add_device()/remove_device() code-paths
> git bisect bad 3eeeb45c6d0444b368cdeba9bdafa8bbcf5370d1
> # good: [3c51c05479c577ea4235d46366d6181a2d6aff2d] iommu/exynos: Convert to probe/release_device() call-backs
> git bisect good 3c51c05479c577ea4235d46366d6181a2d6aff2d
> # first bad commit: [3eeeb45c6d0444b368cdeba9bdafa8bbcf5370d1] iommu: Remove add_device()/remove_device() code-paths
> -------------------------------------------------------------------------------
> 

