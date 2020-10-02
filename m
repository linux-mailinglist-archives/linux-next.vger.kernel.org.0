Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27654281076
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 12:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387652AbgJBKSI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 2 Oct 2020 06:18:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:39471 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgJBKSI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Oct 2020 06:18:08 -0400
IronPort-SDR: UPtcRLHPIFbbRcJe8g+gBokhr3U33Rt+Ej3SldYT96T5NTfSBlbRmJVYMgIOO15e0aozbe88N0
 BtZg+5EaZ4pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="227086149"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="227086149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 03:18:05 -0700
IronPort-SDR: Kpb/rqFqmSgxMZ4YWprkCaqyOLxzOBf8PbxJHor6TSCx8aEaj9za0YElyU6zOOTrndHXeMhDe9
 epkoor/PzNvA==
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="507888968"
Received: from dkiely1x-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.86.194])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 03:18:01 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAKMK7uFOuFEOjrLGpB+oejs=J9kEvrRb6K9Ng6nBt+WS4gwKtQ@mail.gmail.com>
References: <20201001203917.43d46a3d@canb.auug.org.au> <20201001135350.GA14869@lst.de> <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com> <87h7rem1aj.fsf@intel.com> <CAKMK7uFOuFEOjrLGpB+oejs=J9kEvrRb6K9Ng6nBt+WS4gwKtQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160163387773.9343.3110431248747048197@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Fri, 02 Oct 2020 13:17:58 +0300
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Daniel Vetter (2020-10-01 18:13:26)
> On Thu, Oct 1, 2020 at 5:08 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Thu, 01 Oct 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
> > >>
> > >> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> > >> > Hi all,
> > >> >
> > >> > Today's linux-next merge of the akpm tree got a conflict in:
> > >> >
> > >> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> > >> >
> > >> > between commit:
> > >> >
> > >> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
> > >> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
> > >
> > > Uh these patches shouldn't be in linux-next because they're for 5.11,
> > > not the 5.10 merge window that will open soon. Joonas?
> >
> > I don't know anything else, but both are tagged Cc: stable.
> 
> Uh right I got confused, they're on -fixes now. Well -next-fixes,
> which seems like the wrong one for a cc: stable, I guess this should
> go into 5.9 even. Apologies for my confusion.

Yep, they happen to be Fixes: (Cc: stable even) so I asked Rodrigo to
pull them to drm-intel-next-fixes.

If they weren't Fixes: then indeed they would only have been queued for
5.11.

With regards to 5.9, due to the hiccup of doing the split PR, all the
-fixes for GT area were in limbo until -rc7. We didn't feel comfortable
including all the new commits this late in the cycle, so we agreed stable
porting those will be more appropriate.

Regards, Joonas

> -Daniel
> 
> >
> > BR,
> > Jani.
> >
> > >
> > >> > from the drm-intel tree and patch:
> > >> >
> > >> >   "drm/i915: use vmap in i915_gem_object_map"
> > >> >
> > >> > from the akpm tree.
> > >> >
> > >> > I fixed it up (I just dropped the changes in the former commits) and
> > >>
> > >> Sigh.  The solution is a bit more complicated, but I just redid my
> > >> patches to not depend on the above ones.  I can revert back to the old
> > >> version, though.  Andrew, let me know what works for you.
> > >
> > > Imo ignore, rebasing onto linux-next without those intel patches was
> > > the right thing for the 5.10 merge window.
> > > -Daniel
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
