Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3B22A5AFD
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 01:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgKDAXp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 19:23:45 -0500
Received: from mga18.intel.com ([134.134.136.126]:8008 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbgKDAXp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Nov 2020 19:23:45 -0500
IronPort-SDR: seCcHLDLOITHkpd7Ky/Y0exdNAvBdzQutTPFIPDdLjbc0qs2NBOHDNh9MAsj20WQIaq0NdYK59
 ePZsWszlXpIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156920785"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; 
   d="scan'208";a="156920785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 16:23:44 -0800
IronPort-SDR: Jff7IlV79j1jQMkLh8k4p93F+1d+yFxSliiIUcZ8FDi862LIN4rimgC7/+CQJyDIYYqiuOhgqh
 lYdPC5Llv4yA==
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; 
   d="scan'208";a="538691531"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.165.21.201])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 16:23:44 -0800
Date:   Tue, 3 Nov 2020 19:25:08 -0500
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20201104002508.GG30349@intel.com>
References: <20201104093705.10b43959@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104093705.10b43959@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 04, 2020 at 09:37:05AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'gen12_emit_fini_breadcrumb':
> drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: error: implicit declaration of function '__gen8_emit_flush_dw'; did you mean 'gen8_emit_flush'? [-Werror=implicit-function-declaration]
>  4998 |  cs = emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
>       |                               ^~~~~~~~~~~~~~~~~~~~
>       |                               gen8_emit_flush
> drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: warning: passing argument 2 of 'emit_xcs_breadcrumb' makes pointer from integer without a cast [-Wint-conversion]
>  4998 |  cs = emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                               |
>       |                               int
> drivers/gpu/drm/i915/gt/intel_lrc.c:4902:63: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'int'
>  4902 | static u32 *emit_xcs_breadcrumb(struct i915_request *rq, u32 *cs)
>       |                                                          ~~~~~^~
> 
> Caused by commit
> 
>   c94d65d2ff6d ("drm/i915/gt: Flush xcs before tgl breadcrumbs")
> 
> I have reverted that commit for today.

Sorry for the trouble. Dependency picked to drm-intel-fixes now.

Thanks for reporting,
Rodrigo.

> 
> -- 
> Cheers,
> Stephen Rothwell



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

