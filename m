Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CD22FE014
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 04:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbhAUDhF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 22:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbhAUDIS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 22:08:18 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA68C061575;
        Wed, 20 Jan 2021 19:07:35 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id 15so680660oix.8;
        Wed, 20 Jan 2021 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BG1xLGWcnyY9xQR12boOLCRylQDrIp7cDoolAVHFjIY=;
        b=GcOMpy6ipAWgydQzaw2NMeLsPnmNTu8VU43mYpvLc+MvOT3YxULe4T31AL7VE0WZ7t
         PSwY2DegOZXBphfMoWMp+/qxtmymjpf9D6F+2fIBLyrjLabAzdDVlj38eRGXpJvsj+X7
         UTSlPMYRMCFLP7a4NDbbr8eqZT85YdppPZ2AqT74Pusow2p/onJOCdQWvuT9RjuYH//t
         q2wRZNTWgKOWwaGNqT/UUJSrg20+f4ItRlckLfSec8DWqq2fMM4L0BAMA4mEzkl375MB
         ULn7/qmE8pHD91XWdaWA1GsmTrlB5oNwj81Q44V3UCbnsGSLQt6GO24yCD8EDRMnLHPT
         p3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BG1xLGWcnyY9xQR12boOLCRylQDrIp7cDoolAVHFjIY=;
        b=V5hRlmwmxnLLguGBWHExjoEJxcI//ONuu/nu32Vg64ToQz75JJY3Sa6sBODXLp2c5z
         oCkde0YLowCQMPKo+/7nJEJV6Y73659G9gL/RBKqzk/KfpeTW860046jrzK6H0Yy72vd
         9h/jFRHhFuySAbpznJePNDwrHt4N/9Vh7Gh/WmxdTMyAJTnJm4AKBNc+zRLsQzSCRqN6
         DEm3Ttn+TDlPGcPcYEdlzr2YeVqrH0WnV7TEElyA4AuqPZNjccDaTPyxpph+s3R943D/
         NXPYuCe2dAX0W2lACKTz8sQzinRZHZmUAUgmgW3L7oFRRemvqx7TIYlBCq2n4ydaYXUG
         M8XA==
X-Gm-Message-State: AOAM533lmd6Rpt1rpHukUqAgwF/fnsI1YGPV9XqLQ/dIWvk0YBprDbpp
        2NzCZrm3KqwAaRpEqNAzkMvL7UbIbn9CtVnqrrk=
X-Google-Smtp-Source: ABdhPJzLb2aGPpWZaLInDmWBYV6zXb9BIywLTNbMJZ2rVC4CBpAmeacPihmMLdnl1xm6+LBEpB3z9zH6KUEINwdM2Z0=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr4749105oia.120.1611198454758;
 Wed, 20 Jan 2021 19:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20210115120014.4211dec6@canb.auug.org.au> <20210120171501.61aa0786@canb.auug.org.au>
 <20210121115341.012c1a55@canb.auug.org.au>
In-Reply-To: <20210121115341.012c1a55@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 20 Jan 2021 22:07:23 -0500
Message-ID: <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 20, 2021 at 7:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 20 Jan 2021 17:15:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_set_vblank':
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warning: unused variable 'dm' [-Wunused-variable]
> > >  5380 |  struct amdgpu_display_manager *dm = &adev->dm;
> > >       |                                 ^~
> > >
> > > Caused by commit
> > >
> > >   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")
> >
> > I am still getting this warning.
>
> I now get this warning from the drm tree merge.

Bhawan sent out the fix today:
https://patchwork.freedesktop.org/patch/415092/

Alex

>
> --
> Cheers,
> Stephen Rothwell
