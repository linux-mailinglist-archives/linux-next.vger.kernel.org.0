Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2946B4032D9
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 05:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbhIHDPX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 23:15:23 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64426 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbhIHDPW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Sep 2021 23:15:22 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1883DvF6011711;
        Wed, 8 Sep 2021 12:13:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1883DvF6011711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631070838;
        bh=DiTP/AS3T3vq4JaeKSJu2Ri/qt3KnM6Fx/+72YJ6xGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uq24T7VOY9DzMY2Ttse8IMfSKSJ3nAzJEww51VcTiGop5IKF9mXMZoEJE8g+oB25J
         H8FXrW273mevkmofLJZdPfyWYc7pVppc52cATl3m3HQR+Gbp2A46519A8xON0MtMat
         WCZdIstesFb5Hc212QXqESmLXSp6bZ7HLWJy3VCA3v952l+bZD02aJFWB2W9en3ZVY
         EGhJzWA9IbCxNqGyycrcBGMJs6uKzPeKuM5EZ9KjI3hYnltsimRBj7f5uwhX2jTHbi
         tEJIOmIrTqFFHa5TDe+OF8CU7Ty9FDvzDKanrRSMdxfajodpXa150TF0+tG+22ez/a
         DPe2n7cd1ZXRQ==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id r2so1036615pgl.10;
        Tue, 07 Sep 2021 20:13:58 -0700 (PDT)
X-Gm-Message-State: AOAM5325ATKtSm4a78nwrsqcM7Is4/yBLZENrun6b3d1MDOYJM9nI+Jk
        fDNqt8wtjjl0f1okWpEzdf0ns8Ay0lJrpCpAQHI=
X-Google-Smtp-Source: ABdhPJyPU4uh1o2NcT/aR4ZPGLpv6t2vzuzFEOmM8q5aihG3cwIUJLm6ZYqb445avfVEnp26Ym0k8VmPnUWDt0gqMjM=
X-Received: by 2002:aa7:949d:0:b0:416:4555:3021 with SMTP id
 z29-20020aa7949d000000b0041645553021mr1560140pfk.36.1631070837441; Tue, 07
 Sep 2021 20:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210820123348.6535a87e@canb.auug.org.au> <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
 <20210902075038.7461d3c8@canb.auug.org.au> <20210906084947.4f65761d@canb.auug.org.au>
 <CAKMK7uF6K+gdWVT09wL0sPBQs8RRixggk01e291veE0VecD=TQ@mail.gmail.com>
In-Reply-To: <CAKMK7uF6K+gdWVT09wL0sPBQs8RRixggk01e291veE0VecD=TQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Sep 2021 12:13:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdgr7pn0j9mdAGfB_0fGOVMn+uq=Kv7buRaCOcoF+p7A@mail.gmail.com>
Message-ID: <CAK7LNAQdgr7pn0j9mdAGfB_0fGOVMn+uq=Kv7buRaCOcoF+p7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        "Nikula, Jani" <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        John Harrison <John.C.Harrison@intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 6, 2021 at 4:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Sep 6, 2021 at 12:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > On Thu, 2 Sep 2021 07:50:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 20 Aug 2021 15:23:34 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Fri, Aug 20, 2021 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > >
> >  > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > > failed like this:
> > > > >
> > > > > In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
> > > > > drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef.h: No such file or directory
> > > > >     9 | #include <stddef.h>
> > > > >       |          ^~~~~~~~~~
> > > > >
> > > > > Caused by commit
> > > > >
> > > > >   564f963eabd1 ("isystem: delete global -isystem compile option")
> > > > >
> > > > > from the kbuild tree interacting with commit
> > > > >
> > > > >   b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> > > > >
> > > > > I have applied the following patch for today.
> > > >
> > > >
> > > > Thanks.
> > > >
> > > > This fix-up does not depend on my kbuild tree in any way.
> > > >
> > > > So, the drm maintainer can apply it to his tree.
> > > >
> > > > Perhaps with
> > > >
> > > > Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to
> > > > work with GuC")
> > >
> > > OK, so that didn't happen so I will now apply the merge fix up to the
> > > merge of the kbuild tree.
> > >
> > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Date: Fri, 20 Aug 2021 12:24:19 +1000
> > > > > Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/fixup stdarg.h and other headers"
> > > > >
> > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > index 51dbe0e3294e..d2969f68dd64 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > @@ -6,7 +6,7 @@
> > > > >  #ifndef INTEL_GT_REQUESTS_H
> > > > >  #define INTEL_GT_REQUESTS_H
> > > > >
> > > > > -#include <stddef.h>
> > > > > +#include <linux/stddef.h>
> > > > >
> > > > >  struct intel_engine_cs;
> > > > >  struct intel_gt;
> > > > > --
> > > > > 2.32.0
> >
> > Ping?  I am still applying this ...
>
> Apologies, this fell through a lot of cracks. I applied this to drm-next now.



Rather, I was planning to apply this fix to my kbuild tree.

Since you guys did not fix the issue in time,
I ended up with dropping [1] from my pull request.

I want to get [1] merged in this MW.

If I postponed it, somebody would add new
<stddef.h> or <stdint.h> inclusion in the next development
cycle, I will never make it in the mainline.

[1] https://lore.kernel.org/linux-kernel/YQhY40teUJcTc5H4@localhost.localdomain/





> Matt/John, as author/committer it's your job to make sure issues and
> fixes for the stuff you're pushing don't get lost. I'd have expected
> John to apply this to at least drm-intel-gt-next (it's not even
> there).
>
> Joonas, I think this is the 2nd or 3rd or so issue this release cycle
> where some compile fix got stuck a bit because drm-intel-gt-next isn't
> in linux-next. Can we please fix that? It probably needs some changes
> to the dim script.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Best Regards
Masahiro Yamada
