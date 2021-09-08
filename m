Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795CC403692
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 11:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348350AbhIHJIX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Sep 2021 05:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348242AbhIHJIW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Sep 2021 05:08:22 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CB4C061757
        for <linux-next@vger.kernel.org>; Wed,  8 Sep 2021 02:07:15 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w19so2228910oik.10
        for <linux-next@vger.kernel.org>; Wed, 08 Sep 2021 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRwcd/2UOKTqhghCO0rYGQDQocd3n1lo0frI4efs54s=;
        b=Q55DSa5sCHU8EnDeHUgLydtlZ4Fbz4Nppjat38nh6VwQ8r1sOTEZBwkVNjDa+jUuPI
         fWyzNWTbjVL0sovYL5cni0bbvPZ6Ffk42Lj7DjfzKeKzzbf4jV1b0nNdU4aYOTNqcv6K
         EFEZeOcGQoi8o71BFSyoGzwCzT5Gny8lG6hEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRwcd/2UOKTqhghCO0rYGQDQocd3n1lo0frI4efs54s=;
        b=ZsYRB38ptS5MgfNNFp2bOK0GxMZv3m9BUI5zBvwlYhUjXEM5bvTXtrEe4vK6/M571E
         curd4ttDMs3LS7yISJe/wuA90fcFfcH1EeAgfhHzDHy3m+uZTW5IxJCElCTRRrIcs7m/
         fCp9NRdWXawkMy1rbRiifT1UIbfmgrQwP7ngswcqO7mKWXHZJyG7iWv5B9lOQD8V+9xd
         Nwz+BggES2Ov0wE+S/8BiHGOTdn6P0TnPTQvb5quBuyuyWD8AtYZVnnsZbqPZ0QKKOUd
         wsap0JDA5n5vvcj5+aK3zNxShdbmgkfHu6yZ7pDbGn3yWLNqYFokhjHuynAHod39da/8
         KhGQ==
X-Gm-Message-State: AOAM531LVTwWuoglTPCI3CkvpkOKJYb6L9QL+7T7nDuwqZpkhrdM9675
        5lW/6GQP9X3JwzIVC2nVvfAfQjAicA/XDdN4Se46KA==
X-Google-Smtp-Source: ABdhPJxUOsi7Xekf2m6ONTAtRDQsLdU7reFN7AYckKBI+x/+5mAY35qtPw9WV3x4caxiCh9hmckLu0w7xJRvDUYFAQ0=
X-Received: by 2002:a05:6808:2116:: with SMTP id r22mr1632623oiw.128.1631092034216;
 Wed, 08 Sep 2021 02:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210820123348.6535a87e@canb.auug.org.au> <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
 <20210902075038.7461d3c8@canb.auug.org.au> <20210906084947.4f65761d@canb.auug.org.au>
 <CAKMK7uF6K+gdWVT09wL0sPBQs8RRixggk01e291veE0VecD=TQ@mail.gmail.com> <CAK7LNAQdgr7pn0j9mdAGfB_0fGOVMn+uq=Kv7buRaCOcoF+p7A@mail.gmail.com>
In-Reply-To: <CAK7LNAQdgr7pn0j9mdAGfB_0fGOVMn+uq=Kv7buRaCOcoF+p7A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 8 Sep 2021 11:07:03 +0200
Message-ID: <CAKMK7uEjGA01bhPYVJt5aHfvh1i6roV0w-P5Bq9-tohS65esdA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, Sep 8, 2021 at 5:14 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Sep 6, 2021 at 4:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Sep 6, 2021 at 12:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Hi all,
> > >
> > > On Thu, 2 Sep 2021 07:50:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > On Fri, 20 Aug 2021 15:23:34 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > > On Fri, Aug 20, 2021 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > >
> > >  > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > > > failed like this:
> > > > > >
> > > > > > In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
> > > > > > drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef.h: No such file or directory
> > > > > >     9 | #include <stddef.h>
> > > > > >       |          ^~~~~~~~~~
> > > > > >
> > > > > > Caused by commit
> > > > > >
> > > > > >   564f963eabd1 ("isystem: delete global -isystem compile option")
> > > > > >
> > > > > > from the kbuild tree interacting with commit
> > > > > >
> > > > > >   b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> > > > > >
> > > > > > I have applied the following patch for today.
> > > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > > This fix-up does not depend on my kbuild tree in any way.
> > > > >
> > > > > So, the drm maintainer can apply it to his tree.
> > > > >
> > > > > Perhaps with
> > > > >
> > > > > Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to
> > > > > work with GuC")
> > > >
> > > > OK, so that didn't happen so I will now apply the merge fix up to the
> > > > merge of the kbuild tree.
> > > >
> > > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > Date: Fri, 20 Aug 2021 12:24:19 +1000
> > > > > > Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/fixup stdarg.h and other headers"
> > > > > >
> > > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > ---
> > > > > >  drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > > index 51dbe0e3294e..d2969f68dd64 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > > > > > @@ -6,7 +6,7 @@
> > > > > >  #ifndef INTEL_GT_REQUESTS_H
> > > > > >  #define INTEL_GT_REQUESTS_H
> > > > > >
> > > > > > -#include <stddef.h>
> > > > > > +#include <linux/stddef.h>
> > > > > >
> > > > > >  struct intel_engine_cs;
> > > > > >  struct intel_gt;
> > > > > > --
> > > > > > 2.32.0
> > >
> > > Ping?  I am still applying this ...
> >
> > Apologies, this fell through a lot of cracks. I applied this to drm-next now.
>
>
>
> Rather, I was planning to apply this fix to my kbuild tree.
>
> Since you guys did not fix the issue in time,
> I ended up with dropping [1] from my pull request.
>
> I want to get [1] merged in this MW.
>
> If I postponed it, somebody would add new
> <stddef.h> or <stdint.h> inclusion in the next development
> cycle, I will never make it in the mainline.
>
> [1] https://lore.kernel.org/linux-kernel/YQhY40teUJcTc5H4@localhost.localdomain/

Yeah no problem if you apply it too. For that:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I just figured I make sure this is at least not lost.
-Daniel

>
>
>
>
>
> > Matt/John, as author/committer it's your job to make sure issues and
> > fixes for the stuff you're pushing don't get lost. I'd have expected
> > John to apply this to at least drm-intel-gt-next (it's not even
> > there).
> >
> > Joonas, I think this is the 2nd or 3rd or so issue this release cycle
> > where some compile fix got stuck a bit because drm-intel-gt-next isn't
> > in linux-next. Can we please fix that? It probably needs some changes
> > to the dim script.
> >
> > Cheers, Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
