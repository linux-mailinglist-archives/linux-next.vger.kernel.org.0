Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2922D30D6E8
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 11:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhBCKAT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 05:00:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:41135 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233357AbhBCKAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 05:00:06 -0500
IronPort-SDR: 0QixbLO9czKIwar1qYViLFUg4qNPyc8rlTc0Lp7ll3vvexARreoABgM4ET6P/mWfvgpMuzYeCS
 XgQSL4hTeJhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="178455881"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="178455881"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 01:59:21 -0800
IronPort-SDR: NG5291++Cy2sMhSE2A0mYKI6OjVjRQ5A4gDkciiNYzDqWzZK0bV3BH4IDj8W535b+z8uS/K21f
 3hj0Ex324kQw==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="392362970"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.54.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 01:59:17 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel-fixes tree
In-Reply-To: <20210203070241.657dfd46@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210203070241.657dfd46@canb.auug.org.au>
Date:   Wed, 03 Feb 2021 11:59:14 +0200
Message-ID: <87lfc5fp59.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 03 Feb 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   44c5bd08518c ("*** HAX FOR CI *** Revert "rtc: mc146818: Detect and handle broken RTCs"")
>
> is missing a Signed-off-by from its author and committer.
>
> Reverts are commits as well.

It's a hack on top of the tree to unblock CI results, and will be
dropped before sending the pull request.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
