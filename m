Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01342F9729
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 02:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbhARBHv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 20:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbhARBHk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2021 20:07:40 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20805C061573;
        Sun, 17 Jan 2021 17:07:00 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id s11so8434225edd.5;
        Sun, 17 Jan 2021 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNeNqacM4fDdIsWWQviI9y4JI0WUsFuQcZN1AB5dFMI=;
        b=Hd1cVzAEGu5jJcKoiStC0RnBjbGRaO7Q1RiiNNTjeJ160oiuhJ2xO1EO122GEoOXyy
         rUDSKoaV2scep62pUTvBbxnhoCLPduIJked07qOL67Mi4HM4ref0rVFD+cMH0w/OTE11
         nZ2ugkvkg49h7vc34844Tv185Hz1LY1A4FzokwdKijNCU6O4ws571ec/qi+i94gfEwWF
         /BeZXF6j4rqigFIwBT+Ewq7zsbnWBif2bVQNHoD4iPcGdbAOo5bTPviWFKVX7WseIkvN
         lYyBY37ViJCCJdkofkQnVrpvMwy2rm0ZNvgE0ix59DBpfwN9BmcQkXMnzwLoephzVkTB
         x1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNeNqacM4fDdIsWWQviI9y4JI0WUsFuQcZN1AB5dFMI=;
        b=KEdkxlip1CeXNTZczoFzdqIXLHRL50EsYYAWlEfPr17kMWW+cruVvcwhZIYooa8Qvb
         5TrMS6Lc4+lWWxt+6BviWMDBfIa37YR6dL/bGC8UsLzgh+CtzecGLv0MCCxoWGlcaZBn
         tiMUSu4LoF9Qyjm8KQDEGlpMLFazsZlpDY2qY0QjcCe0ibWf+2Ksf3/SnygRD1AbKpPm
         9Aw5nmY2zyoHnhlDSzp/NXf7m/QS+TtxoE/eF+1Mj/dKXkA0g/64QtYUbVV+l5EYKJdR
         VafevksmXECi1TsTwo2z4tKLn0TW6yWo4KXAVF4TGrnTDw8QHDPxC/aYe5xbk/sYO1cr
         /ufg==
X-Gm-Message-State: AOAM53135/yMFu3cqt2Wgxd+cB4o8u0N1G+3QXavKJ+5wpX4dWLLFQX+
        nnvcGPSDhoEg6OC8BJ9jildd6LQbdY1mtOcjkwWb+XvWkgA=
X-Google-Smtp-Source: ABdhPJwAePDjuhUUYO6a4u8g4U2/QpbxiekOvKUUN1d0YFQrEefJnbWGYr/xu2+cps9CjGk7pgLQfFqyT6ySDEy2xRs=
X-Received: by 2002:a50:b742:: with SMTP id g60mr17169711ede.113.1610932018848;
 Sun, 17 Jan 2021 17:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20210108115518.2b3fdf58@canb.auug.org.au> <20210108122540.657501b2@canb.auug.org.au>
 <20210111105654.17e3aa76@canb.auug.org.au> <20210118115924.6ee14fd3@canb.auug.org.au>
In-Reply-To: <20210118115924.6ee14fd3@canb.auug.org.au>
From:   Dave Airlie <airlied@gmail.com>
Date:   Mon, 18 Jan 2021 11:06:47 +1000
Message-ID: <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
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

On Mon, 18 Jan 2021 at 10:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 11 Jan 2021 10:56:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 8 Jan 2021 12:25:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> > > >
> > > > error: the following would cause module name conflict:
> > > >   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
> > > >   drivers/gpu/drm/panel/panel-dsi-cm.ko
> > > >
> > > > Maybe caused by commit
> > > >
> > > >   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> > > >
> > > > I have used the drm tree from next-20210107 for today.
> > >
> > > This has affected the drm-misc tree as well (since it merged in the drm
> > > tree).
> > >
> > > I have used the drm-misc tree from next-20210107 for today.
> >
> > And now the drm-intel tree.
> >
> > I have used the drm-intel tree from next-20210108 for today.
>
> This is still affecting the drm and drm-intel trees.

I think the fix for this is in drm-misc-next, Maarten can you send me
a -next PR to fix this?

Dave.
