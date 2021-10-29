Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A1243F792
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 08:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhJ2HBZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 29 Oct 2021 03:01:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:55284 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhJ2HBY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Oct 2021 03:01:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="211375315"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="211375315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 23:52:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="448274796"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO localhost) ([10.249.254.23])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 23:52:18 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20211029114840.6a3a78bd@canb.auug.org.au>
References: <20211029114840.6a3a78bd@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     John Harrison <John.C.Harrison@Intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163549033603.4317.6416900804800927743@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Fri, 29 Oct 2021 09:52:16 +0300
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2021-10-29 03:48:40)
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/drm/i915/i915_trace.h
> 
> between commit:
> 
>   9a4aa3a2f160 ("drm/i915: Revert 'guc_id' from i915_request tracepoint")
> 
> from Linus' tree and commit:
> 
>   3cb3e3434b9f ("drm/i915/guc: Move fields protected by guc->contexts_lock into sub structure")
> 
> from the drm tree.
> 
> I fixed it up (I used the former version) and can carry the fix as
> necessary.

The resolution for the conflict is to drop the guc_id field completely
in linux-next.

Regards, Joonas

> This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
