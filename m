Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21C845450F
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 11:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhKQKiz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 17 Nov 2021 05:38:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:24522 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhKQKiy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Nov 2021 05:38:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233756630"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="233756630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 02:35:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="506858473"
Received: from sorenthe-mobl2.ger.corp.intel.com (HELO localhost) ([10.249.254.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 02:35:53 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20211117100223.52c7460a@canb.auug.org.au>
References: <20211117100223.52c7460a@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel-gt tree
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org
To:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163714535048.4529.4694769143307309201@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Wed, 17 Nov 2021 12:35:50 +0200
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ intel-gfx mailing list (Stephen, can you include this going forward?)

Adding Thomas for this specific patch.

Regards, Joonas

Quoting Stephen Rothwell (2021-11-17 01:02:23)
> Hi all,
> 
> After merging the etnaviv tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'vm_fault_ttm':
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:862:9: error: too many arguments to function 'ttm_bo_vm_fault_reserved'
>   862 |   ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/drm/ttm/ttm_bo_driver.h:42,
>                  from drivers/gpu/drm/i915/gem/i915_gem_ttm.c:6:
> include/drm/ttm/ttm_bo_api.h:585:12: note: declared here
>   585 | vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   ebd4a8ec7799 ("drm/i915/ttm: move shrinker management into adjust_lru")
> 
> interacting with commit
> 
>   0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")
> 
> from Linus' tree.
> 
> I applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Nov 2021 09:57:09 +1100
> Subject: [PATCH] fix up for "drm/ttm: remove ttm_bo_vm_insert_huge()"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index d08a270b0921..68cfe6e9ceab 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -860,7 +860,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>  
>         if (drm_dev_enter(dev, &idx)) {
>                 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -                                              TTM_BO_VM_NUM_PREFAULT, 1);
> +                                              TTM_BO_VM_NUM_PREFAULT);
>                 drm_dev_exit(idx);
>         } else {
>                 ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> -- 
> 2.33.0
> 
> -- 
> Cheers,
> Stephen Rothwell
