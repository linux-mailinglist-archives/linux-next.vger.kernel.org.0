Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B0C280242
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 17:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732494AbgJAPNi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 11:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732475AbgJAPNi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 11:13:38 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA277C0613E2
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 08:13:37 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id h17so5765031otr.1
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyqBR8rgovZvV1br57kzCLeVLh2BC1/nJFNuCWvX/Hg=;
        b=HWt7G37MzABEhEJzmhYn37I7HQ3nrxFri1BtglWKxVHv8+/mx3PgqLVDr8TJioVn6Z
         VBrO8lu+BrDDf++bBGjpolziIxr53jSkmw6Dl7y+ZEpC6tjtW8qYmqqcqaVVJlKnzxOQ
         dbBNgP25HQUrv/PQjs8tElcIUqDde1j02SHy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyqBR8rgovZvV1br57kzCLeVLh2BC1/nJFNuCWvX/Hg=;
        b=fC5KnW71JthmQ1gB37Stu6ImyFu+hGupcFc1u+DEbwN4VrLOCGQ7ep93aQydCBbDmo
         Zo1H6VpOY9jLqeU0ohv14gXBPA9Q3qkY2jmIK007UrR+WNLA7nKbHbgQ7OfjiDrZwNnU
         VNBd0F9oSgqGZkrbS2x8y4iDzY55IvaMGuO9hN59gSCrzM8MOWIJQ0f34Ayo08tRSzU5
         t1K1J+NL7adzloOX0MwoueEMHG55mIm5xEXyWWDLxSOEbHty7f1deC5nLKptq60uHv5Q
         d9myMhVWLM8FcWXzgo1NogKYvSYejfRl/3fjAG2G2IGlr9gPspCgJJDNXSBOdJI+laZC
         DXrg==
X-Gm-Message-State: AOAM532HyZ0e+XK4ng8EB5MIjQlQemWlMT6GlmtmnK6vB7XG7FBoW0eU
        UVXRr0H6HpEy/D9IE8/kTd6uEtgTRE++KiHz2+czZw==
X-Google-Smtp-Source: ABdhPJwnkX4j2N+uVgeHBKZEsf4a1EiVhC8hXdATqgJLW5d3fzqdEPJfxlIxYzf9TYqPMnVDwuLs9HodRVSnVkw5BC0=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr5484928otf.281.1601565217247;
 Thu, 01 Oct 2020 08:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201001203917.43d46a3d@canb.auug.org.au> <20201001135350.GA14869@lst.de>
 <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com> <87h7rem1aj.fsf@intel.com>
In-Reply-To: <87h7rem1aj.fsf@intel.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 1 Oct 2020 17:13:26 +0200
Message-ID: <CAKMK7uFOuFEOjrLGpB+oejs=J9kEvrRb6K9Ng6nBt+WS4gwKtQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 1, 2020 at 5:08 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 01 Oct 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
> >>
> >> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> >> > Hi all,
> >> >
> >> > Today's linux-next merge of the akpm tree got a conflict in:
> >> >
> >> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> >
> >> > between commit:
> >> >
> >> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
> >> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
> >
> > Uh these patches shouldn't be in linux-next because they're for 5.11,
> > not the 5.10 merge window that will open soon. Joonas?
>
> I don't know anything else, but both are tagged Cc: stable.

Uh right I got confused, they're on -fixes now. Well -next-fixes,
which seems like the wrong one for a cc: stable, I guess this should
go into 5.9 even. Apologies for my confusion.
-Daniel

>
> BR,
> Jani.
>
> >
> >> > from the drm-intel tree and patch:
> >> >
> >> >   "drm/i915: use vmap in i915_gem_object_map"
> >> >
> >> > from the akpm tree.
> >> >
> >> > I fixed it up (I just dropped the changes in the former commits) and
> >>
> >> Sigh.  The solution is a bit more complicated, but I just redid my
> >> patches to not depend on the above ones.  I can revert back to the old
> >> version, though.  Andrew, let me know what works for you.
> >
> > Imo ignore, rebasing onto linux-next without those intel patches was
> > the right thing for the 5.10 merge window.
> > -Daniel
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
