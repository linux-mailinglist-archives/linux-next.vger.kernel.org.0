Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3148316931
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 15:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhBJOcz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 09:32:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:1095 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhBJOcy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 09:32:54 -0500
IronPort-SDR: D40Zc3DGVrt9bQTmqVlD9tJeynD4CCPXpja715CFqTRuguPlAnVomcoh8eTSaxL9awxT2ccQvf
 lyutunM/AC8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="246144354"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="246144354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 06:31:07 -0800
IronPort-SDR: iokoZIAq5W+IsiPfGY0fW94n0g4TrEXc4wSF8e5IDWFjF0IZb6ZkO1c5yyZCXpUkztDKNPTE2o
 0h/LtnmMMKkA==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="380123320"
Received: from bartoszo-mobl1.ger.corp.intel.com (HELO [10.252.56.156]) ([10.252.56.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 06:31:05 -0800
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210210141138.11a6ad09@canb.auug.org.au>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <670f6c7e-1f71-ffce-f9dd-07c7f6164c22@linux.intel.com>
Date:   Wed, 10 Feb 2021 15:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210141138.11a6ad09@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Op 2021-02-10 om 04:11 schreef Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/v3d/v3d_sched.c:263:1: error: return type is an incomplete type
>   263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_gpu_reset_for_timeout':
> drivers/gpu/drm/v3d/v3d_sched.c:289:9: error: 'return' with a value, in function returning void [-Werror=return-type]
>   289 |  return DRM_GPU_SCHED_STAT_NOMINAL;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:263:1: note: declared here
>   263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:298:1: error: return type is an incomplete type
>   298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>       | ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_cl_job_timedout':
> drivers/gpu/drm/v3d/v3d_sched.c:309:10: error: 'return' with a value, in function returning void [-Werror=return-type]
>   309 |   return DRM_GPU_SCHED_STAT_NOMINAL;
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:298:1: note: declared here
>   298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>       | ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:316:1: error: return type is an incomplete type
>   316 | v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:325:1: error: return type is an incomplete type
>   325 | v3d_render_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:334:1: error: return type is an incomplete type
>   334 | v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:342:1: error: return type is an incomplete type
>   342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_csd_job_timedout':
> drivers/gpu/drm/v3d/v3d_sched.c:353:10: error: 'return' with a value, in function returning void [-Werror=return-type]
>   353 |   return DRM_GPU_SCHED_STAT_NOMINAL;
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:342:1: note: declared here
>   342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:362:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   362 |  .timedout_job = v3d_bin_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:362:18: note: (near initialization for 'v3d_bin_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:369:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   369 |  .timedout_job = v3d_render_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:369:18: note: (near initialization for 'v3d_render_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:376:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   376 |  .timedout_job = v3d_generic_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:376:18: note: (near initialization for 'v3d_tfu_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:383:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   383 |  .timedout_job = v3d_csd_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:383:18: note: (near initialization for 'v3d_csd_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:390:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   390 |  .timedout_job = v3d_generic_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:390:18: note: (near initialization for 'v3d_cache_clean_sched_ops.timedout_job')
>
> Caused by commit
>
>   c10983e14e8f ("drm/scheduler: Job timeout handler returns status (v3)")
>
> I have used the drm-misc tree from next-20210209 for today.
>
Hey,

I reverted the commit in drm-misc-next-fixes. It should be good now. :)

I must have accidentally cherry picked it when grabbing all fixes.

~Maarten

