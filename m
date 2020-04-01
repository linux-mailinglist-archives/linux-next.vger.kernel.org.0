Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F43419A71A
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731995AbgDAIUl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:20:41 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45132 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731997AbgDAIUl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 04:20:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id t17so24852811ljc.12
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2020 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIxdPs3PCWGrE1rhEKnhI29WwowDoOmXYLKku7/kqhU=;
        b=LSe3YHd9F0nJBdAnd2M0pbyKcOUuxrYfkAZbfzzavXnm/vf5pui4cy40QMGXuBXw6O
         PtrWohZnOdZ5krIl66URyEvd+OREL2CCVHPq3aJhrnE7VYL8cTw47hQYwd7LNrnRCavU
         w5eDZW8jjfLCVT0Qr0E7O62Mi53S6BDadlRiF4lFbbj3gfbQFi33oDyCkfXpM872Rhh+
         KryuliO0WWpRTdwZgUuuc/rmxL7yAg+ewDy6Oq7ezq+1WpxSooKL86cQgsvUwFNha6Gb
         6ZTdxkV0KXDMKrvrtH05Rrk7LO04sSRZ4oKfy05jk/m20jxdgdeth3GxA0TMZPVS8zX+
         g3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIxdPs3PCWGrE1rhEKnhI29WwowDoOmXYLKku7/kqhU=;
        b=DLTJ0j3nozELjO4SoZbPYGMdHkbJqjt9J1xRucqOGMPP5SZFFzLkczxjY2Fv14NxdU
         oXoTKTmd/1Dc25ZD1+IXI6Rd6wGuxFl8+nTS3acS3Mk269ABzRtzbFJOLk1e6v4L87jq
         mtvwwnFmyzimxd90IfcvpABmX1UIurmvjQaK66Wb8jbSKpzUskjUbAe0DT+r7EzqJBDE
         54y8irYpssHBP6KIQZEHS+zcrT/4H+qMDJOOQxTXQz3YcQGKRtbUcJ3RRML32zsC7FR6
         MvqJcPWMMKQjvFvT8hUI41ArJ2j7nyDwXyn4pjHJXLHcAomQ6qDorDwwMWlgAwSVRDAj
         rw+w==
X-Gm-Message-State: AGi0PuZ0+fjoDW9LTwlEPaKplKrDmqUfBqc8FA9dS1+d4NJrKG2SWwmG
        WiFJuMeJydTY43e8QVhxwmc7MemhFzqniZQWIKbT/A==
X-Google-Smtp-Source: APiQypJsnLDmKh1yBBjZBhguP/v9RUaTCpgsNrdRcuHpGcqAeZsCIOj74BvrzWIRMq/PR8riGPHyMNgylYL7/zlVGPE=
X-Received: by 2002:a2e:9d85:: with SMTP id c5mr998983ljj.168.1585729237735;
 Wed, 01 Apr 2020 01:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200401190810.7a2cfa07@canb.auug.org.au> <20200401191810.1c06ead6@canb.auug.org.au>
In-Reply-To: <20200401191810.1c06ead6@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Apr 2020 10:20:26 +0200
Message-ID: <CACRpkdaHdr_TwVES2+hZ9PMTryybHrbYgi0RL3ihkRERsTmV2Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: turn of_pinctrl_get() into a static inline
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thierry Reding <treding@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 10:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 1 Apr 2020 19:08:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > This avoids the overheads of an EXPORTed function.
> >
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/pinctrl/devicetree.c    | 6 ------
> >  include/linux/pinctrl/pinctrl.h | 9 +++------
> >  2 files changed, 3 insertions(+), 12 deletions(-)
> >
> > This is not even build tested, but is this what you meant, Geert?
>
> Actually this won't work because get_pinctrl_dev_from_of_node() is
> declared in the private header file drivers/pinctrl/core.h :-(

No big deal. We keep your other fix for now.

Yours,
Linus Walleij
