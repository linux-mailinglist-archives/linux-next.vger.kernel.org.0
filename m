Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE79C3E8F38
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhHKLCx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 07:02:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:61663 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhHKLCx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 07:02:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="276137096"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="276137096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 04:02:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="484829327"
Received: from fbrausse-mobl.ger.corp.intel.com (HELO localhost) ([10.251.209.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 04:02:25 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the drm-intel tree
In-Reply-To: <YROc0KkBbuAwrx0f@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210715141854.1ad4a956@canb.auug.org.au> <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com> <YRE2RwQ6XlUqbgmn@phenom.ffwll.local> <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com> <YRIcTTsEF0Kg7F8K@phenom.ffwll.local> <8735rgo3hi.fsf@intel.com> <YROc0KkBbuAwrx0f@phenom.ffwll.local>
Date:   Wed, 11 Aug 2021 14:02:22 +0300
Message-ID: <87o8a4megx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Aug 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Aug 11, 2021 at 10:16:41AM +0300, Jani Nikula wrote:
>> On Tue, 10 Aug 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>> > On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
>> >> On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
>> >> > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
>> >> > > Hi Matt,
>> >> > > 
>> >> > > Always use the dim tooling when applying patches, it will do the right
>> >> > > thing with regards to adding the S-o-b.
>> >> > 
>> >> > fd.o server rejects any pushes that haven't been done by dim, so how did
>> >> > this get through?
>> >> 
>> >> I definitely used dim for all of these patches, but I'm not sure how I
>> >> lost my s-o-b on this one.  Maybe when I edited the commit message after
>> >> 'dim extract-tags' I accidentally deleted an extra line when I removed
>> >> the extract-tags marker?  It's the only patch where the line is missing,
>> >> so it's almost certainly human error on my part rather than something
>> >> dim did wrong.
>> >
>> > Yeah that's an expected failure model, and dim is supposed to catch that
>> > by rechecking for sobs when you push. See dim_push_branch ->
>> > checkpatch_commit_push_range in dim. So you can hand-edit stuff however
>> > you want, dim /should/ catch it when pushing. That it didn't is kinda
>> > confusing and I'd like to know why that slipped through.
>> 
>> One of the failures that happened here was that the commit was part of a
>> topic branch that was merged and pushed directly. All merges should
>> happen via pull requests on the list, and applied (preferrably by
>> maintainers or at least with their acks recorded on the merge) using dim
>> apply-pull which should also have the checks.
>
> Ah yes if the merge is applied directly instead of using apply-pull then
> that's not good. I guess that's why we have the rule that only maintainers
> should handle topic branches ...
>
> Not sure how we can fix this in dim? Maybe a check whether the patches
> your pushing contain a merge commit, which prompts an additional query
> like
>
> "Merge commits should only be done by repo maintainers, not committers.
> Confirm that you are a maintainer of $repo?"
>
> It's not the first time this slipped through and caused some fun. Similar
> to how we have the confirmation check if you push a lot of patches.

I sent an untested patch to this effect. It's a start. I guess there
could be more detailed automated checks, but frankly dim is getting
pretty complicated for a bash script. Or because it's a bash script.

BR,
Jani.


>
> Thoughts?
> -Daniel
>
>
>> 
>> 
>> BR,
>> Jani.
>> 
>> >
>> >> > Matt, can you pls figure out and type up the patch to
>> >> > plug that hole?
>> >> 
>> >> Are you referring to a patch for dim here?  The i915 patch has already
>> >> landed, so we can't change its commit message now.
>> >
>> > Yeah dim, not drm-intel, that can't be fixed anymore because it's all
>> > baked in.
>> > -Daniel
>> >
>> >> 
>> >> 
>> >> Matt
>> >> 
>> >> > 
>> >> > Thanks, Daniel
>> >> > 
>> >> > > 
>> >> > > Regards, Joonas
>> >> > > 
>> >> > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
>> >> > > > Hi all,
>> >> > > > 
>> >> > > > Commit
>> >> > > > 
>> >> > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
>> >> > > > 
>> >> > > > is missing a Signed-off-by from its committer.
>> >> > > > 
>> >> > > > -- 
>> >> > > > Cheers,
>> >> > > > Stephen Rothwell
>> >> > 
>> >> > -- 
>> >> > Daniel Vetter
>> >> > Software Engineer, Intel Corporation
>> >> > http://blog.ffwll.ch
>> >> 
>> >> -- 
>> >> Matt Roper
>> >> Graphics Software Engineer
>> >> VTT-OSGC Platform Enablement
>> >> Intel Corporation
>> >> (916) 356-2795
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
