Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA232DAA53
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 10:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgLOJng (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 04:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgLOJn1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 04:43:27 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0CAC0617A7
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 01:42:47 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id w3so18714526otp.13
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nrfZzU8i2XI5TReL11FPZCA/DbKh6MmkKEx+RvfbNo0=;
        b=dLTcIZbmqXjw8OiNhLJT1Ued66pU3oyhulfg+tGUp4w/1OLIaRLdvkLDV73Dh6gWu/
         6nRHfpqmnVVihgRe5iyrDWu3KY3QX72LyXXg7naKkSCK6vf0EYcpPipqwbpul7mILvbw
         6RfB7mRva/KJopM6kHFoYfm2Zt10K8sGCjrsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nrfZzU8i2XI5TReL11FPZCA/DbKh6MmkKEx+RvfbNo0=;
        b=X87pXdIfWXXDbGsCr/fJ0U5mzEMdoxAYM3+M17aSzUqXZJhHWzhDATj89dyv8K7PMD
         GssGLBo9hllUdUY+g/Ylnu3HLQlkbOHO1lsX14HM4jgOHoMDGCsLmGOlArmwJPGflw5j
         IcUZb9o8xxoRv3X5Mu1WoQ22ND7n5YJxTyO7e1zTWTOuV3t7C2TA2xU4/jDDEHJnipC4
         HA3ifHAdeZkM2hGWdncI5VzpgnvA4Degye42to5faWZlbL9kav1Xu332G+KRLXNYtr2j
         lkJIuonyzopv39v8OBkGIo/lFdPS+3o4kg6gUSQmiKk+dyjQtyXtQNnSctQ68t5AofTD
         H09A==
X-Gm-Message-State: AOAM531bw0/NpoNB5ZB0m03ErOpnaOnrNgW6tbMvWGLZVPcGo+SCLoJ1
        llLTPHtNGac21z1pWIf2NfX8X4sfsZA93lPwwApDfNN86ys=
X-Google-Smtp-Source: ABdhPJzqz52kCcy3Sd/fp9IWZ2qXtHhaK/T3eI017Kprgk6vEXCoVAsTgaMPPVLtQ2gCS/U3TYMOqnT0/0cx+e7+SLU=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr22774532otb.281.1608025366091;
 Tue, 15 Dec 2020 01:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20201105175031.00e0b081@canb.auug.org.au> <20201116104444.044486ea@canb.auug.org.au>
 <20201215065045.66421c34@canb.auug.org.au> <20201215134702.37a12a03@canb.auug.org.au>
In-Reply-To: <20201215134702.37a12a03@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 15 Dec 2020 10:42:34 +0100
Message-ID: <CAKMK7uECzCHd-q5T4P8F02jppLP+kuMWc9Nznp-65kgKBGPSEg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 3:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 15 Dec 2020 06:50:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 16 Nov 2020 10:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm tree, today's linux-next build (htmldocs) produced
> > > > these warnings:
> > > >
> > > > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > > > include/linux/dma-buf-map.h:106: warning: Function parameter or member 'vaddr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> > > > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > > >
> > > > Introduced by commit
> > > >
> > > >   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces")
> > >
> > > I am still getting these warnings.
> >
> > I am still getting these warnings.
>
> These warnings are now from Linus' tree.

We had a stuck pull request which should have been included in the
main merge pull. This should be fixed now in drm-next. Well in a few
minutes when the compile testing is done.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
