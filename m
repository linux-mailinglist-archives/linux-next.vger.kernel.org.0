Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63E42FE512
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 09:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhAUIeB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 03:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbhAUIdm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 03:33:42 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EF0C0613C1
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 00:33:01 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 9so1364906oiq.3
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uX11i9ntHKvjXSr2VUaKfVVivjbrt/oL5DMR5Av1mfQ=;
        b=Waj5/Hh9QiVwxjR4nEz5y7b01uPWEmRMy/6wqmXtXcfpKDHMGBiKtBZRZfHBNYRvsS
         8G1lfiJ1/4cmnM3eKji6pjpCYGh9STOXBBPHdEQmT3Q3g3wWwmGnWDoYL56mbi1XU2iI
         bpUQccinaAKzE9oQk31XcfFtfv6GDskoDLYNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uX11i9ntHKvjXSr2VUaKfVVivjbrt/oL5DMR5Av1mfQ=;
        b=k6p4q1Z2/p0B+b/pf5PROzzhEdS5uk56kOPvzWOi6tiZQzngnTCfxpG3gmUGdPc673
         qNnJnM4upGCXgDzireyoTpk6L090Yfli/1Bt6RpYFdZNET6QpF5EU5iEnwA8WgGlX3+6
         UWpgh4xrCRqAM8Bt6XkEaWNsdAfD2cCKV8ZwpTtwo6OOi0uEIAh/wXMXi8Qi9NoSx6TI
         tLyVY/OHdTqwoW2d30kb4HryChILXScyP5waXwEfixKfSmLX32phgjiTR3xAo1Yw611y
         zupBne8JaVnMOwWqX1RPUOR8jrg82d+xysBmIZ0WXY3HQi2IhuVH281cRdyZE7FgsNz2
         7KGQ==
X-Gm-Message-State: AOAM532wNMmvSJ5DnmslIR4in/WRinU7ifdAYGRpIHvoyDFnYRplP2Hm
        9PzI6pNU/nT/wDvope1eXFYp4MTsC3bOhpHom2LMzg==
X-Google-Smtp-Source: ABdhPJw+4IsAgRHo2MtvXqtNHIi15f7EcB4J/2s7VVzDrmrcmIIQo+1zUjeULyIuUrzgvFuyBO2o90wnLGPb4+F9yEY=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr5164573oia.14.1611217981254;
 Thu, 21 Jan 2021 00:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20210115120014.4211dec6@canb.auug.org.au> <20210120171501.61aa0786@canb.auug.org.au>
 <20210121115341.012c1a55@canb.auug.org.au> <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
In-Reply-To: <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 21 Jan 2021 09:32:50 +0100
Message-ID: <CAKMK7uF8U8X54DFjRpovw1UO6B2xv16nzBrX1t2HQ6bZOmskcw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 21, 2021 at 4:07 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jan 20, 2021 at 7:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Wed, 20 Jan 2021 17:15:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_set_vblank':
> > > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warning: unused variable 'dm' [-Wunused-variable]
> > > >  5380 |  struct amdgpu_display_manager *dm = &adev->dm;
> > > >       |                                 ^~
> > > >
> > > > Caused by commit
> > > >
> > > >   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")
> > >
> > > I am still getting this warning.
> >
> > I now get this warning from the drm tree merge.

Drat, I missed that when merging.

> Bhawan sent out the fix today:
> https://patchwork.freedesktop.org/patch/415092/

Applied directly to drm-next, thanks.
-Daniel

>
> Alex
>
> >
> > --
> > Cheers,
> > Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
