Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4F2401EE3
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 19:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243461AbhIFRHQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 13:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233888AbhIFRHQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 13:07:16 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243FC061757
        for <linux-next@vger.kernel.org>; Mon,  6 Sep 2021 10:06:11 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id n18so4242963plp.7
        for <linux-next@vger.kernel.org>; Mon, 06 Sep 2021 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9kGlLPSE5ya1mvmcFUC6w8P8vhLXKJTsz+UiH8ESac4=;
        b=F1Tx7nzKN6Io/hBjVwRluHh+6zh8k2abpxCPdUFBuKyU93dEiNagOX+SdSEJK9ptuU
         MuTAvG9BF0knNQ4cdW0AVFiYK/cR+pX4MAF3wfgXgwZ2DHM/t8W0boXChGca9SEKNyzU
         WEBVY/d78s/6chJgT4aaOXAcWDtmQMD6yfedo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9kGlLPSE5ya1mvmcFUC6w8P8vhLXKJTsz+UiH8ESac4=;
        b=lDVYKgi8HN0tZ4+QB3lZVsSvLRbK7XpBsRSndGPog1IYQ0K2mkQUEjkWGu7gpSme1a
         b6EXo7qaikvKpElE6mEOCLdSLk4Qka8HRII98U8rBKYXP77VA4PZLL4YHZKDJfe5HBNh
         XCq0L1HBAxUdRT5ruIsK02cRVoK+FetMCXpRJjJDsQA+tSHG82FOMUkZDKMN2NuTwFTp
         OjsgfsOL5boNFF+kaMkajLTjdY6mKaSYq/1knNQDTDwNJAPPq4oEoflzn15pj1pGNsMy
         zR9diYZGyjWQtsPQL8f/2UmA+JXVHby1d6+539pUa7vwfJB+bfjwrDT53ZdwgxKKHSQp
         CCHQ==
X-Gm-Message-State: AOAM533fperx4uBJlXb2PqrKKLJQxqk1poWv3Jk9hIsIdS5hT6qDnuJ7
        9oKKcXtJ1Mr33ODM4/gIgJzOSA==
X-Google-Smtp-Source: ABdhPJwVKUqAYy4WikpDYS4P7+dFmykK17jxSW/l8iCU0yiFyTEGLyhbvfYiLZuLLTvgWk6/UzTBlg==
X-Received: by 2002:a17:903:22c7:b0:13a:330a:ce83 with SMTP id y7-20020a17090322c700b0013a330ace83mr9861plg.52.1630947971107;
        Mon, 06 Sep 2021 10:06:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 83sm8035988pfw.105.2021.09.06.10.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 10:06:10 -0700 (PDT)
Date:   Mon, 6 Sep 2021 10:06:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <202109061000.79CF310@keescook>
References: <20210830184429.1ee4b4d8@canb.auug.org.au>
 <20210906154151.0aa41a7a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906154151.0aa41a7a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 06, 2021 at 03:41:51PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 30 Aug 2021 18:44:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the kspp tree, today's linux-next build (powerpc
> > allyesconfig) produced this warning:
> > 
> > drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> >   135 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> >       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> > In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> > drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
> >    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
> >       |                       ^~~~~~~~~~~~
> > drivers/gpu/drm/kmb/kmb_plane.c:132:20: warning: array subscript 2 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> >   132 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> >       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> > In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> > drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
> >    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
> >       |                       ^~~~~~~~~~~~
> > drivers/gpu/drm/kmb/kmb_plane.c:129:20: warning: array subscript 1 is above array bounds of 'struct layer_status[1]' [-Warray-bounds]
> >   129 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> >       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> > In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> > drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_status'
> >    48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
> >       |                       ^~~~~~~~~~~~
> > 
> > Exposed by commit
> > 
> >   656256c0d67c ("Makefile: Enable -Warray-bounds")
> > 
> > Introduced by commit
> > 
> >   7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > 
> > from v5.11-rc1.
> 
> Due to Linus -Werror, these are now errors :-(
> 
> I have reverted commit 656256c0d67c for now.

I'm still surprised Linus added -Werror (it seems to go against years of
his earlier mandates on not breaking the build). Seems like
3fe617ccafd6 should be reverted instead. ;)

Linus, warnings are being reported (as above), are you sure -Werror is
the right way to go? (I can't believe I'm saying this, given my past
desire to make various hardening failures break the build -- you
convinced me to always warn instead, and it made good sense: a developer
still gets binary results as well as any new warnings...)

-Kees

-- 
Kees Cook
