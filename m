Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F326B8FADD
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 08:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfHPGYH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 02:24:07 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:41087 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfHPGYG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 02:24:06 -0400
Received: by mail-ot1-f43.google.com with SMTP id o101so8661005ota.8
        for <linux-next@vger.kernel.org>; Thu, 15 Aug 2019 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UbemS0Z3+J8HDXKXNZjWi7HzzaHw4A8dNiqBV6V1Rck=;
        b=aP6TnlrWiVWmS2YmWqIbc6ujqbBXxF1RRQmqDdEDynDuT8y8e2+stArtXrzJF+NFCx
         ZpokzqOSnc2/SQ6T8ZJAvrwtp6xgbO/JPQQzVva9vWLalVQ2fjTke74PJiLH4nLAqGj9
         W+pc8NTOqySX8gyUKXzeeb3sQsIRngfvJIhzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UbemS0Z3+J8HDXKXNZjWi7HzzaHw4A8dNiqBV6V1Rck=;
        b=K9L+75XD7rmkKwBcjMcfneiKT5dCCfVveFX/FTgYCimp9FmOttT+3ZE/O0y8WHtfjY
         w1W1UP7buhUZjU2aKyt6f75liRf2wkjlyd5nxrrXBqYSrww/IN2MEdaYiH7hyxwYiMCM
         jY9Y/Lw4krBzkjr9TbhtHyUl4qG4e02Fu2aOrTji3FxJfxAgkBLbZ6hqT5HgcgWd26ZK
         sxiChke1QhPtMKLh1yEpXXWllU7K1GcnA+o6Iy29hAm2AdBy0JgX3qe3W07NAAgLFSU1
         IJg56JigQEAu/EhWn+P6j2tD4f2grE4O89cfyqe3UdksawjkLBfgdF7IzTc8myWg7vYb
         dRdA==
X-Gm-Message-State: APjAAAVIpq0dFD9P6bFNiml0uH+dwV4n2c1CSEC0AZSMq3ngNfTBgAZB
        9MyHyDl5CcqpBfKL+s2MJ7JqfBnSE5O4UwgHRQW7Dg==
X-Google-Smtp-Source: APXvYqym4oO06UAaqAKOdwMX9+ZXUpuUmFqkjQr53j2qEVTw6wqvTfv6JC/8+4MTWKM7ZLy4wXnYnyZPWJJHKs0fIjE=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr6769456oth.281.1565936646046;
 Thu, 15 Aug 2019 23:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190816133132.6b37d7fa@canb.auug.org.au> <20190816044846.GA27781@ravnborg.org>
In-Reply-To: <20190816044846.GA27781@ravnborg.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 16 Aug 2019 08:23:54 +0200
Message-ID: <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 16, 2019 at 6:48 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Stephen.
>
> On Fri, Aug 16, 2019 at 01:31:32PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > warning: same module names found:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.ko
> >   drivers/gpu/drm/panel/panel-nec-nl8048hl11.ko
> > warning: same module names found:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.ko
> >   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.ko
> > warning: same module names found:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.ko
> >   drivers/gpu/drm/panel/panel-sony-acx565akm.ko
> > warning: same module names found:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.ko
> >   drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> > warning: same module names found:
> >   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.ko
> >   drivers/gpu/drm/panel/panel-tpo-td043mtea1.ko
> >
> > Introduced by commits
> >
> >   df439abe6501 ("drm/panel: Add driver for the NEC NL8048HL11 panel")
> >   c9cf4c2a3bd3 ("drm/panel: Add driver for the Sharp LS037V7DW01 panel")
> >   1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
> >   415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
> >   dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 panel")
>
> Ups, had not seen this one coming.
> We are in the process of removing the drivers in drivers/video/fbdev/omap2/omapfb/
> and decided to introduce the new drivers early to get them out of a
> longer patch series.

Should we have a config dependency to not allow the old fbdev omap
when the drm omap driver is enabled? I think that would take care of
all this.

Or too annoying for development?

Also note that fbdev is in drm-misc now, so we should be able to fix
this all without cross-tree conflicts.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
