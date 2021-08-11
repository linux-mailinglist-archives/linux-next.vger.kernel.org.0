Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BA83E8D7D
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 11:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbhHKJs1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 05:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbhHKJs1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2021 05:48:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A5FC061765
        for <linux-next@vger.kernel.org>; Wed, 11 Aug 2021 02:48:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id h13so2218138wrp.1
        for <linux-next@vger.kernel.org>; Wed, 11 Aug 2021 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ODZcfL88nEna9jnx6MeSXB765F0RXBgR99zQotJA1Pg=;
        b=RySFRDAgx0nFdxb2V3wpXVxMXPO/SiilkFlctM/MlDhtqARVV/T3BUY7IoiL7ZDyCo
         AF2JRnrcTlJOEvAfLumcYXSk9pQFcidFuRqOjwN+BUJcSsQG2coOxeDkgJUh51055TPv
         0doA2RAX1UwtY71jv1jDib0GBGGgLOjRoLt4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ODZcfL88nEna9jnx6MeSXB765F0RXBgR99zQotJA1Pg=;
        b=kQoPoy8EGp4nvMNx9++6WUYfjDRIYTqbGRCuYrefqUquJzDOgC+f9FUncXswTJlt+g
         E3/tC99Tyt4luhCLaKvNbqdV86d+bl0k5/8Qf7qw+ZDQ5xm4XaLVBCrlEQcr//rxHG0Q
         Yqxd0VQDWwnmuMthznqa2LdT6ac+McvS1GSYi+N2KRm98tOQ5C9arCd1JGw17sJsvizd
         pw9uK2XJTRXCijO2D67hm30WLhxqv6Nk/lENCK8jNot/6c4jN62JoPMw8v5RLXwAiCkq
         o8/efi1QSINmwPBqjbU/s/udKpu8fKYBqYQg6/XdTYd96j6MsIWhkL9+WoCq6lpSsAKL
         w1Pg==
X-Gm-Message-State: AOAM533peYeTFTqDg49yhsxFAc+0YEuswAlcSu4JYuBekPhOzj1Xw9qG
        /743m3IXItm9u7HZi+aOzfAGAw==
X-Google-Smtp-Source: ABdhPJxSalMkFMHC3mOT3puaFVGTb6omXC7nqX4zfFlwQf7LNl1KZTQjAqi7Rn8bt6sOQIlc3u0HPg==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr2791183wrc.171.1628675282490;
        Wed, 11 Aug 2021 02:48:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i21sm5641963wrb.62.2021.08.11.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:48:01 -0700 (PDT)
Date:   Wed, 11 Aug 2021 11:48:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Message-ID: <YROc0KkBbuAwrx0f@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
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
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

Ah yes if the merge is applied directly instead of using apply-pull then
that's not good. I guess that's why we have the rule that only maintainers
should handle topic branches ...

Not sure how we can fix this in dim? Maybe a check whether the patches
your pushing contain a merge commit, which prompts an additional query
like

"Merge commits should only be done by repo maintainers, not committers.
Confirm that you are a maintainer of $repo?"

It's not the first time this slipped through and caused some fun. Similar
to how we have the confirmation check if you push a lot of patches.

Thoughts?
-Daniel


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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
