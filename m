Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493F83E49A0
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 18:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhHIQVL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 12:21:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:50344 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232874AbhHIQUS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Aug 2021 12:20:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="201899277"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="201899277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 09:19:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="588935639"
Received: from mdroper-desk1.fm.intel.com (HELO mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 09:19:41 -0700
Date:   Mon, 9 Aug 2021 09:19:39 -0700
From:   Matt Roper <matthew.d.roper@intel.com>
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel
 tree
Message-ID: <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > Hi Matt,
> > 
> > Always use the dim tooling when applying patches, it will do the right
> > thing with regards to adding the S-o-b.
> 
> fd.o server rejects any pushes that haven't been done by dim, so how did
> this get through?

I definitely used dim for all of these patches, but I'm not sure how I
lost my s-o-b on this one.  Maybe when I edited the commit message after
'dim extract-tags' I accidentally deleted an extra line when I removed
the extract-tags marker?  It's the only patch where the line is missing,
so it's almost certainly human error on my part rather than something
dim did wrong.

> Matt, can you pls figure out and type up the patch to
> plug that hole?

Are you referring to a patch for dim here?  The i915 patch has already
landed, so we can't change its commit message now.


Matt

> 
> Thanks, Daniel
> 
> > 
> > Regards, Joonas
> > 
> > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > > 
> > > is missing a Signed-off-by from its committer.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
