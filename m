Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027E83E89EE
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 07:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhHKF5C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 11 Aug 2021 01:57:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:58594 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233842AbhHKF5C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 01:57:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="211952274"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="211952274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 22:56:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="516413329"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.238])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 22:56:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
References: <20210715141854.1ad4a956@canb.auug.org.au> <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com> <YRE2RwQ6XlUqbgmn@phenom.ffwll.local> <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com> <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the drm-intel tree
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162866138994.4210.10598129488916811422@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Wed, 11 Aug 2021 08:56:29 +0300
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ Dave as FYI

Quoting Daniel Vetter (2021-08-10 09:27:25)
> On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
> > On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > > > Hi Matt,
> > > > 
> > > > Always use the dim tooling when applying patches, it will do the right
> > > > thing with regards to adding the S-o-b.
> > > 
> > > fd.o server rejects any pushes that haven't been done by dim, so how did
> > > this get through?
> > 
> > I definitely used dim for all of these patches, but I'm not sure how I
> > lost my s-o-b on this one.  Maybe when I edited the commit message after
> > 'dim extract-tags' I accidentally deleted an extra line when I removed
> > the extract-tags marker?  It's the only patch where the line is missing,
> > so it's almost certainly human error on my part rather than something
> > dim did wrong.
> 
> Yeah that's an expected failure model, and dim is supposed to catch that
> by rechecking for sobs when you push. See dim_push_branch ->
> checkpatch_commit_push_range in dim. So you can hand-edit stuff however
> you want, dim /should/ catch it when pushing. That it didn't is kinda
> confusing and I'd like to know why that slipped through.
> 
> > > Matt, can you pls figure out and type up the patch to
> > > plug that hole?
> > 
> > Are you referring to a patch for dim here?  The i915 patch has already
> > landed, so we can't change its commit message now.
> 
> Yeah dim, not drm-intel, that can't be fixed anymore because it's all
> baked in.
> -Daniel
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Thanks, Daniel
> > > 
> > > > 
> > > > Regards, Joonas
> > > > 
> > > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > > > Hi all,
> > > > > 
> > > > > Commit
> > > > > 
> > > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > > > > 
> > > > > is missing a Signed-off-by from its committer.
> > > > > 
> > > > > -- 
> > > > > Cheers,
> > > > > Stephen Rothwell
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > VTT-OSGC Platform Enablement
> > Intel Corporation
> > (916) 356-2795
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
