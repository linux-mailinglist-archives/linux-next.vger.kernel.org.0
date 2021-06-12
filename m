Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085A33A4DCB
	for <lists+linux-next@lfdr.de>; Sat, 12 Jun 2021 10:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhFLI4t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 12 Jun 2021 04:56:49 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:41774 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLI4t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 12 Jun 2021 04:56:49 -0400
Received: by mail-vs1-f43.google.com with SMTP id c1so5119990vsh.8;
        Sat, 12 Jun 2021 01:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GD2Olda9AmSNWAvIUnqMGuloWkjPAxn/zDHn8rCyeik=;
        b=WMZIqcJpKrCtTBxTrQuhxSryloSzbak5D0o0I862v8EGdRs791HlhJKBqo6dsJhDl8
         O66sEJS3CG9kxXYHskZlKX8K4sSu9+P4CeHtUu1OF0qRoAeIBA5km9bHwNX8ji52SjTp
         OMlaVZFmft7jz3XIROSwM0j53Lp08GL0eUfCurIeGlFK5rx3qmwG2jSQ8GrQwcpteTV9
         AEYfLpc3Jka4eHdIT6qVvNYmKSLc6Sv3/lCGyoHY8bg3qFMRPiyBZ5qG46pPXgayBi6J
         Cjr/lvhKa57mJTOWqhxIx18StzTPN4iEkq1REZ4GJY+K8OPL3RQUSEZpsiaLse/wgqx/
         EJZA==
X-Gm-Message-State: AOAM532TRuMEaTDZ12b7pz2oHz6lnmZ4q35iOHQe3k056qHNqhFpqY5a
        31eT2wqwB+D8a8cQBH+z4hiJqbb1hsMrYxBVVAU=
X-Google-Smtp-Source: ABdhPJwQqVoaYjc0es2Y8dX/xEIoI5ZH3RdFJKE9qfsQHMDXtt6noFdUluHDMrZeJgyKIb7/kZOxucdlD8ELeejk3nU=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr13429864vsp.3.1623488074285;
 Sat, 12 Jun 2021 01:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210610110001.2805317-1-geert@linux-m68k.org>
 <20210610220155.GQ664593@dread.disaster.area> <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
 <20210611224638.GT664593@dread.disaster.area>
In-Reply-To: <20210611224638.GT664593@dread.disaster.area>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 12 Jun 2021 10:54:23 +0200
Message-ID: <CAMuHMdU1f5QD9J9Hz5m97arhF6gKQTFqz5EqrskD+cnWpYbX1Q@mail.gmail.com>
Subject: Re: [PATCH] xfs: Fix 64-bit division on 32-bit in xlog_state_switch_iclogs()
To:     Dave Chinner <david@fromorbit.com>
Cc:     Dave Chinner <dchinner@redhat.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Allison Henderson <allison.henderson@oracle.com>,
        Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        noreply@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Dave,

On Sat, Jun 12, 2021 at 12:46 AM Dave Chinner <david@fromorbit.com> wrote:
> On Fri, Jun 11, 2021 at 08:55:24AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 11, 2021 at 12:02 AM Dave Chinner <david@fromorbit.com> wrote:
> > > On Thu, Jun 10, 2021 at 01:00:01PM +0200, Geert Uytterhoeven wrote:
> > > > On 32-bit (e.g. m68k):
> > > >
> > > >     ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!
> > > >
> > > > Fix this by using a uint32_t intermediate, like before.
> > > >
> > > > Reported-by: noreply@ellerman.id.au
> > > > Fixes: 7660a5b48fbef958 ("xfs: log stripe roundoff is a property of the log")
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > ---
> > > > Compile-tested only.
> > > > ---
> > > >  fs/xfs/xfs_log.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > <sigh>
> > >
> > > 64 bit division on 32 bit platforms is still a problem in this day
> > > and age?
> >
> > They're not a problem.  But you should use the right operations from
> > <linux/math64.h>, iff you really need these expensive operations.
>
> See, that's the whole problem. This *isn't* obviously a 64 bit
> division - BBTOB is shifting the variable down by 9 (bytes to blocks)
> and then using that as the divisor.

BTOBB, not BBTOB ;-)

> The problem is that BBTOB has an internal cast to a 64 bit size,
> and roundup() just blindly takes it and hence we get non-obvious
> compile errors only on 32 bit platforms.

Indeed. Perhaps the macros should be fixed?

    #define BBSHIFT         9
    #define BBSIZE          (1<<BBSHIFT)
    #define BBMASK          (BBSIZE-1)
    #define BTOBB(bytes)    (((__u64)(bytes) + BBSIZE - 1) >> BBSHIFT)
    #define BTOBBT(bytes)   ((__u64)(bytes) >> BBSHIFT)

Why are these two casting bytes to u64? The result will be smaller
due to the shift.
if the type holding bytes was too small, you're screwed anyway.

    #define BBTOB(bbs)      ((bbs) << BBSHIFT)

Why does this one lack the cast? If the passed bbs is ever 32-bit,
it may overflow due to the shift.

> We have type checking macros for all sorts of generic functionality
> - why haven't these generic macros that do division also have type
> checking to catch this? i.e. so that when people build kernels on
> 64 bit machines find out that they've unwittingly broken 32 bit
> builds the moment they use roundup() and/or friends incorrectly?
>
> That would save a lot of extra work having fix crap like this up
> after the fact...

While adding checks would work for e.g. roundup(), it wouldn't work
for plain divisions not involving rounding, as we don't have a way to
catch this for "a / b", except for the link error on 32-bit platforms.

Perhaps the build bots are not monitoring linux-xfs?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
