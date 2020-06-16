Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0568E1FAC4D
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 11:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgFPJWn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 16 Jun 2020 05:22:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:56734 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgFPJWm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 05:22:42 -0400
IronPort-SDR: XCKym7EzRp63osPBzxA4JzRCX9Dg48YGyKPECGc1XJrV0jtuPFunRmWSO0jgxo5vu8ZWYPSDAX
 i4lUbd/jcMVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 02:22:42 -0700
IronPort-SDR: eA0x/VqDskuTKgeLmngYdGcDDDgAJQjFs934NzqW4ZS6C6/H5Wt318GMQheZZoPShHoGfAz0Xh
 ohx8FnggmGhg==
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="449736538"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost) ([10.251.94.207])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 02:22:39 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200616093912.4dffcc71@canb.auug.org.au>
References: <20200616093912.4dffcc71@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date:   Tue, 16 Jun 2020 12:22:36 +0300
Message-ID: <159229935689.7727.9085291204498542933@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-06-16 02:39:12)
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5972:
> drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'live_timeslice_nopreempt':
> drivers/gpu/drm/i915/gt/selftest_lrc.c:1333:3: error: too few arguments to function 'engine_heartbeat_disable'
>  1333 |   engine_heartbeat_disable(engine);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:54:13: note: declared here
>    54 | static void engine_heartbeat_disable(struct intel_engine_cs *engine,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:1402:3: error: too few arguments to function 'engine_heartbeat_enable'
>  1402 |   engine_heartbeat_enable(engine);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/selftest_lrc.c:64:13: note: declared here
>    64 | static void engine_heartbeat_enable(struct intel_engine_cs *engine,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   04dc41776145 ("drm/i915/gt: Prevent timeslicing into unpreemptable requests")
> 
> I have reverted that commit for today.

Thanks for reporting. I had my drm-intel-fixes build tree configured
without selftests. I've now corrected that and added a missing dependency
patch.

Regards, Joonas

> 
> -- 
> Cheers,
> Stephen Rothwell
