Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F24B3E2350
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 08:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhHFGhY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 6 Aug 2021 02:37:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:14217 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhHFGhX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 02:37:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214048145"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; 
   d="scan'208";a="214048145"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 23:37:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; 
   d="scan'208";a="586579542"
Received: from imccann-mobl.ger.corp.intel.com (HELO localhost) ([10.252.9.82])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 23:36:58 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210715141854.1ad4a956@canb.auug.org.au>
References: <20210715141854.1ad4a956@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Matt Roper <matthew.d.roper@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel tree
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Fri, 06 Aug 2021 09:36:56 +0300
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Matt,

Always use the dim tooling when applying patches, it will do the right
thing with regards to adding the S-o-b.

Regards, Joonas

Quoting Stephen Rothwell (2021-07-15 07:18:54)
> Hi all,
> 
> Commit
> 
>   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> 
> is missing a Signed-off-by from its committer.
> 
> -- 
> Cheers,
> Stephen Rothwell
