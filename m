Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E18B42EE35
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 11:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhJOJ7L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 05:59:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:54697 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233716AbhJOJ7K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Oct 2021 05:59:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="215049129"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="215049129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 02:57:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="492394407"
Received: from tzahur-mobl.ger.corp.intel.com (HELO localhost) ([10.251.211.201])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 02:57:01 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20211015202648.258445ef@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015202648.258445ef@canb.auug.org.au>
Date:   Fri, 15 Oct 2021 12:56:58 +0300
Message-ID: <87h7divcet.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 15 Oct 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types for '__stack_depot_save'
>   111 | static depot_stack_handle_t __stack_depot_save(void)
>       |                             ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/page_ext.h:7,
>                  from include/linux/mm.h:25,
>                  from include/linux/kallsyms.h:13,
>                  from include/linux/bpf.h:20,
>                  from include/linux/bpf-cgroup.h:5,
>                  from include/linux/cgroup-defs.h:22,
>                  from include/linux/cgroup.h:28,
>                  from include/linux/memcontrol.h:13,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from include/linux/regulator/consumer.h:35,
>                  from include/linux/i2c.h:18,
>                  from include/drm/drm_crtc.h:28,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/drm_modeset_lock.c:24:
> include/linux/stackdepot.h:18:22: note: previous declaration of '__stack_depot_save' was here
>    18 | depot_stack_handle_t __stack_depot_save(unsigned long *entries,
>       |                      ^~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
>
> This may only have been revealed because of another fix I have had to
> apply today.
>
> I have applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Oct 2021 20:17:52 +1100
> Subject: [PATCH] drm/locking: fix for name conflict
>
> Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

My bad, what was I thinking using stack depot's "namespace".

The fix looks good, but I'd rename __stack_depot_print too added in the
same commit. Do you want to respin or shall I take it from here?

Thanks,
Jani.



> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index 4d32b61fa1fd..ee36dd20900d 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -79,7 +79,7 @@
>  static DEFINE_WW_CLASS(crtc_ww_class);
>  
>  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
> -static noinline depot_stack_handle_t __stack_depot_save(void)
> +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	unsigned long entries[8];
>  	unsigned int n;
> @@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_handle_t stack_depot)
>  	kfree(buf);
>  }
>  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> -static depot_stack_handle_t __stack_depot_save(void)
> +static depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	return 0;
>  }
> @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
>  		ret = 0;
>  	} else if (ret == -EDEADLK) {
>  		ctx->contended = lock;
> -		ctx->stack_depot = __stack_depot_save();
> +		ctx->stack_depot = __drm_stack_depot_save();
>  	}
>  
>  	return ret;
> -- 
> 2.33.0

-- 
Jani Nikula, Intel Open Source Graphics Center
