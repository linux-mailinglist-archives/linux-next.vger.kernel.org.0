Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11423E934C
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 16:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhHKOKF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 10:10:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:5689 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231661AbhHKOKE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 10:10:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="195396850"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="195396850"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 07:09:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="503506436"
Received: from gdthomps-mobl.amr.corp.intel.com (HELO intel.com) ([10.255.37.76])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 07:09:18 -0700
Date:   Wed, 11 Aug 2021 10:09:17 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Message-ID: <YRPaDYtUxXO4hzTI@intel.com>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
 <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
 <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
 <8735rgo3hi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735rgo3hi.fsf@intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 11, 2021 at 10:16:41AM +0300, Jani Nikula wrote:
> On Tue, 10 Aug 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
> >> On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> >> > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> >> > > Hi Matt,
> >> > > 
> >> > > Always use the dim tooling when applying patches, it will do the right
> >> > > thing with regards to adding the S-o-b.
> >> > 
> >> > fd.o server rejects any pushes that haven't been done by dim, so how did
> >> > this get through?
> >> 
> >> I definitely used dim for all of these patches, but I'm not sure how I
> >> lost my s-o-b on this one.  Maybe when I edited the commit message after
> >> 'dim extract-tags' I accidentally deleted an extra line when I removed
> >> the extract-tags marker?  It's the only patch where the line is missing,
> >> so it's almost certainly human error on my part rather than something
> >> dim did wrong.
> >
> > Yeah that's an expected failure model, and dim is supposed to catch that
> > by rechecking for sobs when you push. See dim_push_branch ->
> > checkpatch_commit_push_range in dim. So you can hand-edit stuff however
> > you want, dim /should/ catch it when pushing. That it didn't is kinda
> > confusing and I'd like to know why that slipped through.
> 
> One of the failures that happened here was that the commit was part of a
> topic branch that was merged and pushed directly. All merges should
> happen via pull requests on the list, and applied (preferrably by
> maintainers or at least with their acks recorded on the merge) using dim
> apply-pull which should also have the checks.

My bad. I have asked Matt to go ahead with the topic branch.
So it is an ack, which didn't get recorded.
But I didn't expect this case of missing dim checks with this flow.

Sorry,
Rodrigo.

> 
> 
> BR,
> Jani.
> 
> >
> >> > Matt, can you pls figure out and type up the patch to
> >> > plug that hole?
> >> 
> >> Are you referring to a patch for dim here?  The i915 patch has already
> >> landed, so we can't change its commit message now.
> >
> > Yeah dim, not drm-intel, that can't be fixed anymore because it's all
> > baked in.
> > -Daniel
> >
> >> 
> >> 
> >> Matt
> >> 
> >> > 
> >> > Thanks, Daniel
> >> > 
> >> > > 
> >> > > Regards, Joonas
> >> > > 
> >> > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> >> > > > Hi all,
> >> > > > 
> >> > > > Commit
> >> > > > 
> >> > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> >> > > > 
> >> > > > is missing a Signed-off-by from its committer.
> >> > > > 
> >> > > > -- 
> >> > > > Cheers,
> >> > > > Stephen Rothwell
> >> > 
> >> > -- 
> >> > Daniel Vetter
> >> > Software Engineer, Intel Corporation
> >> > http://blog.ffwll.ch
> >> 
> >> -- 
> >> Matt Roper
> >> Graphics Software Engineer
> >> VTT-OSGC Platform Enablement
> >> Intel Corporation
> >> (916) 356-2795
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
