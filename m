Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC771DAF73
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 11:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgETJyt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 05:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgETJys (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 05:54:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAADC061A0E;
        Wed, 20 May 2020 02:54:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 33A912A2A94
Subject: Re: next/master bisection: baseline.login on panda
To:     Joerg Roedel <jroedel@suse.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <5ec4eb8e.1c69fb81.19b63.0b07@mx.google.com>
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>, linux-next@vger.kernel.org
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <d30e5ea4-85ae-75c2-2334-f9f951026afd@collabora.com>
Date:   Wed, 20 May 2020 10:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5ec4eb8e.1c69fb81.19b63.0b07@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please see the bisection report below about a boot failure.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

Unfortunately there isn't anything in the kernel log, it's
probably crashing very early on.  The bisection was run on
omap4-panda, and there seems to be the same issue on
omap3-beagle-xm as it's also failing to boot.

Please let us know if anyone is able to debug the issue or if we
need to rerun the KernelCI job with earlyprintk enabled or any
debug config option.

Thanks,
Guillaume

On 20/05/2020 09:34, kernelci.org bot wrote:
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
> next/master bisection: baseline.login on panda
> 
> Summary:
>   Start:      fb57b1fabcb28 Add linux-next specific files for 20200519
>   Plain log:  https://storage.kernelci.org/next/master/next-20200519/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20200519/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
>   Result:     ce574c27ae275 iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     panda
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     omap2plus_defconfig
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit ce574c27ae275bc51b6437883fc9cd1c46b498e5
> Author: Joerg Roedel <jroedel@suse.de>
> Date:   Wed Apr 29 15:36:50 2020 +0200
> 
>     iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()
>     
>     After the previous changes the iommu group may not have a default
>     domain when iommu_group_add_device() is called. With no default domain
>     iommu_group_create_direct_mappings() will do nothing and no direct
>     mappings will be created.
>     
>     Rename iommu_group_create_direct_mappings() to
>     iommu_create_device_direct_mappings() to better reflect that the
>     function creates direct mappings only for one device and not for all
>     devices in the group. Then move the call to the places where a default
>     domain actually exists.
>     
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
>     Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>     Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>     Link: https://lore.kernel.org/r/20200429133712.31431-13-joro@8bytes.org
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 7de0e29db3338..834a45da0ed0f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -89,6 +89,8 @@ static int __iommu_attach_group(struct iommu_domain *domain,
>  				struct iommu_group *group);
>  static void __iommu_detach_group(struct iommu_domain *domain,
>  				 struct iommu_group *group);
> +static int iommu_create_device_direct_mappings(struct iommu_group *group,
> +					       struct device *dev);
>  
>  #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
>  struct iommu_group_attribute iommu_group_attr_##_name =		\
> @@ -243,6 +245,8 @@ static int __iommu_probe_device_helper(struct device *dev)
>  	if (group->default_domain)
>  		ret = __iommu_attach_device(group->default_domain, dev);
>  
> +	iommu_create_device_direct_mappings(group, dev);
> +
>  	iommu_group_put(group);
>  
>  	if (ret)
> @@ -263,6 +267,7 @@ static int __iommu_probe_device_helper(struct device *dev)
>  int iommu_probe_device(struct device *dev)
>  {
>  	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	struct iommu_group *group;
>  	int ret;
>  
>  	WARN_ON(dev->iommu_group);
> @@ -285,6 +290,10 @@ int iommu_probe_device(struct device *dev)
>  	if (ret)
>  		goto err_module_put;
>  
> +	group = iommu_group_get(dev);
> +	iommu_create_device_direct_mappings(group, dev);
> +	iommu_group_put(group);
> +
>  	if (ops->probe_finalize)
>  		ops->probe_finalize(dev);
>  
> @@ -736,8 +745,8 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
>  }
>  EXPORT_SYMBOL_GPL(iommu_group_set_name);
>  
> -static int iommu_group_create_direct_mappings(struct iommu_group *group,
> -					      struct device *dev)
> +static int iommu_create_device_direct_mappings(struct iommu_group *group,
> +					       struct device *dev)
>  {
>  	struct iommu_domain *domain = group->default_domain;
>  	struct iommu_resv_region *entry;
> @@ -841,8 +850,6 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>  
>  	dev->iommu_group = group;
>  
> -	iommu_group_create_direct_mappings(group, dev);
> -
>  	mutex_lock(&group->mutex);
>  	list_add_tail(&device->list, &group->devices);
>  	if (group->domain)
> @@ -1736,6 +1743,7 @@ static void probe_alloc_default_domain(struct bus_type *bus,
>  		gtype.type = iommu_def_domain_type;
>  
>  	iommu_group_alloc_default_domain(bus, group, gtype.type);
> +
>  }
>  
>  static int iommu_group_do_dma_attach(struct device *dev, void *data)
> @@ -1760,6 +1768,21 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
>  					  iommu_group_do_dma_attach);
>  }
>  
> +static int iommu_do_create_direct_mappings(struct device *dev, void *data)
> +{
> +	struct iommu_group *group = data;
> +
> +	iommu_create_device_direct_mappings(group, dev);
> +
> +	return 0;
> +}
> +
> +static int iommu_group_create_direct_mappings(struct iommu_group *group)
> +{
> +	return __iommu_group_for_each_dev(group, group,
> +					  iommu_do_create_direct_mappings);
> +}
> +
>  static int bus_iommu_probe(struct bus_type *bus)
>  {
>  	const struct iommu_ops *ops = bus->iommu_ops;
> @@ -1792,6 +1815,8 @@ static int bus_iommu_probe(struct bus_type *bus)
>  				continue;
>  			}
>  
> +			iommu_group_create_direct_mappings(group);
> +
>  			ret = __iommu_group_dma_attach(group);
>  
>  			mutex_unlock(&group->mutex);
> @@ -2632,7 +2657,7 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
>  		iommu_domain_free(group->default_domain);
>  	group->default_domain = domain;
>  
> -	iommu_group_create_direct_mappings(group, dev);
> +	iommu_create_device_direct_mappings(group, dev);
>  
>  	dev_info(dev, "Using iommu %s mapping\n",
>  		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [642b151f45dd54809ea00ecd3976a56c1ec9b53d] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> git bisect good 642b151f45dd54809ea00ecd3976a56c1ec9b53d
> # bad: [fb57b1fabcb28f358901b2df90abd2b48abc1ca8] Add linux-next specific files for 20200519
> git bisect bad fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> # good: [8b3dd8b61115d665572dcac44bc6b3e95c8f34f2] Merge remote-tracking branch 'crypto/master'
> git bisect good 8b3dd8b61115d665572dcac44bc6b3e95c8f34f2
> # bad: [144c0fb86d53982ba156b518e7b3fbee71f56655] Merge remote-tracking branch 'spi/for-next'
> git bisect bad 144c0fb86d53982ba156b518e7b3fbee71f56655
> # good: [1a90af6b9ad8a56d9929e69a28b21aa1132fc42c] Merge remote-tracking branch 'amdgpu/drm-next'
> git bisect good 1a90af6b9ad8a56d9929e69a28b21aa1132fc42c
> # good: [a27ba83aed2e6a01f16fd56dd322839c9c179c38] Merge remote-tracking branch 'block/for-next'
> git bisect good a27ba83aed2e6a01f16fd56dd322839c9c179c38
> # good: [7f58fc25a6c6c9ac84701be427c477d4a09f197e] Merge remote-tracking branch 'integrity/next-integrity'
> git bisect good 7f58fc25a6c6c9ac84701be427c477d4a09f197e
> # good: [59ffe4ed0725de96f4710013c34de387fbeac90c] dt-bindings: ehci/ohci: Allow iommus property
> git bisect good 59ffe4ed0725de96f4710013c34de387fbeac90c
> # bad: [f74794b89196349ad42fce396d3537672b4db157] Merge remote-tracking branch 'iommu/next'
> git bisect bad f74794b89196349ad42fce396d3537672b4db157
> # bad: [14b3526d5909f01e1d1baa05f50952788bb7418e] iommu/vt-d: Allow PCI sub-hierarchy to use DMA domain
> git bisect bad 14b3526d5909f01e1d1baa05f50952788bb7418e
> # bad: [21acf6599cfb4407e9745b36f69c93cf99a3d189] iommu/virtio: Convert to probe/release_device() call-backs
> git bisect bad 21acf6599cfb4407e9745b36f69c93cf99a3d189
> # good: [cf193888bfbd3d57e03a511e49d26f7d9c6f76df] iommu: Move new probe_device path to separate function
> git bisect good cf193888bfbd3d57e03a511e49d26f7d9c6f76df
> # bad: [dce8d6964ebdb333383bacf5e7ab8c27df151218] iommu/amd: Convert to probe/release_device() call-backs
> git bisect bad dce8d6964ebdb333383bacf5e7ab8c27df151218
> # bad: [ce574c27ae275bc51b6437883fc9cd1c46b498e5] iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()
> git bisect bad ce574c27ae275bc51b6437883fc9cd1c46b498e5
> # good: [deac0b3bed26bb5d04486696b1071d8ec3851100] iommu: Split off default domain allocation from group assignment
> git bisect good deac0b3bed26bb5d04486696b1071d8ec3851100
> # first bad commit: [ce574c27ae275bc51b6437883fc9cd1c46b498e5] iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()
> -------------------------------------------------------------------------------
> 

