Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFF22FD09E
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 13:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbhATMql (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 07:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731438AbhATMNN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 07:13:13 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338B8C0613CF
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 04:12:33 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id f6so13931799ots.9
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hD1HawmEClOJ27r0GX30v0QKKxXQVQE5i1tHxMOMmNc=;
        b=hKkZSQzL5sjvaAXJLUHwokzSagQnpFCjgMj5vVlXrvdtqgTy9PlGR/9lqEgREZXmAI
         0VsETZV3ZG8TGD/aaAtcLyi8XSLYXIClLVbbDqMR4X23BKiHV/Ml9je7VHLhNUD7kNla
         Npw/zjpoBQOErQ0l0I7tZUPNpCssE85vRzn0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hD1HawmEClOJ27r0GX30v0QKKxXQVQE5i1tHxMOMmNc=;
        b=UH/R+EvS6sLPzJDO1raEhs7x1L0XmbJLHSLeDNfhP45F1nXzpfeB1GoSI/NV2KqTnF
         diBbgKqO+odoQoYEGd/yXZvZI0XnggERnjtShtdGj6FznrILhyKtfRTWjnN1NVkMEZny
         S6XVoJI7fZcYfnRsvQSkHvSEgikrxIxGmN/I4q2jLDR36BTWINKjkvlQKWp9wWXyvVbZ
         Rk+NpBbSaagAWGhfDmbXH5YW2CxNoUpKrzz4c8iYRS5LF5BAuAQBSfps1SF+Q7vYoZRi
         QH4b3nyYl67aiuV0mKzKMgH1l/U5FHhbFIJRgj9/yz3DEWnqN08BxbznFXpe1tu2voyy
         5zjA==
X-Gm-Message-State: AOAM532Wf9T3fxC2isvSzc+7ZdINCPhuftrv0axLrxoX70CkCv9OIhEW
        ++3NTmRgrMmCrBMfcYSds5U/0YJ8pOJKSE/6/8hJdw==
X-Google-Smtp-Source: ABdhPJxN4e7pxvgB00qQH6R3k3PZ5lVut4BMuNJQ+CqfUb/Pnb/8RPiMXbS8EeohqA1lQD/s2x0tfMsCwbDWW1uWq1I=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr6742495otj.188.1611144752644;
 Wed, 20 Jan 2021 04:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20210108115518.2b3fdf58@canb.auug.org.au> <20210108122540.657501b2@canb.auug.org.au>
 <20210111105654.17e3aa76@canb.auug.org.au> <20210118115924.6ee14fd3@canb.auug.org.au>
 <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
In-Reply-To: <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 20 Jan 2021 13:12:21 +0100
Message-ID: <CAKMK7uEtpi+20rEp4zg5P+d=qS7XcPi0VCp2OdHirX_Fm9TX7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Dave Airlie <airlied@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Dave Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 18, 2021 at 2:06 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 18 Jan 2021 at 10:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Mon, 11 Jan 2021 10:56:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 8 Jan 2021 12:25:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > >
> > > > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > > failed like this:
> > > > >
> > > > > error: the following would cause module name conflict:
> > > > >   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
> > > > >   drivers/gpu/drm/panel/panel-dsi-cm.ko
> > > > >
> > > > > Maybe caused by commit
> > > > >
> > > > >   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> > > > >
> > > > > I have used the drm tree from next-20210107 for today.
> > > >
> > > > This has affected the drm-misc tree as well (since it merged in the drm
> > > > tree).
> > > >
> > > > I have used the drm-misc tree from next-20210107 for today.
> > >
> > > And now the drm-intel tree.
> > >
> > > I have used the drm-intel tree from next-20210108 for today.
> >
> > This is still affecting the drm and drm-intel trees.
>
> I think the fix for this is in drm-misc-next, Maarten can you send me
> a -next PR to fix this?

I've pulled drm-misc-next into drm-next now, so as long as all other
drm trees are merged after drm, this should be solved now.
drm-intel-next also has their msm build breakage fixed (I acked the
patch already), so hopefully we should be all clean again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
