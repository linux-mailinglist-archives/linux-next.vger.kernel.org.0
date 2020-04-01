Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D38419A73F
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgDAI1K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:27:10 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45114 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgDAI1K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 04:27:10 -0400
Received: by mail-ot1-f66.google.com with SMTP id c9so25035573otl.12;
        Wed, 01 Apr 2020 01:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8PWg6iL0RHDv3oeRI76vFJ9XdDEyjVI5/xkAD0j0fj0=;
        b=kDzYxx38wK4dX1g7csnk6susgl0kMoY6gjnlu+klerEJbk8dze54Pq0hoN4ih4vpaZ
         oSHl6ICBa1858xnEi6X22DruSM3R2/8Ux8+sS+z0uh1FYOohsWksCMYpVAnS2YybZ0zq
         ECe7DxMMGE1kl+/hftLSoGiAapnZ1TFZjFGXtMeMbBKdOp6KNIJv33T8k1NBLSrjrZCA
         hArB1Lh5votq8NqX5JKpa5xewuYSmi/XTuvoNkbXAQ4d9X0kkSBGbKVe6l5YPTXCLkom
         YHd8Jwh+ud0NpVEPOuQJ+XXqmnE8n8a2RYS3oA3IdNRhQt0V6gF2thnAVvWdpwOKYRV1
         0FEA==
X-Gm-Message-State: ANhLgQ02gbsXGbEGrdeHvYlqpKo/bq+cPLKH3AY+4taUn857vrH3aorz
        h2WBtabALTwnvny9DjEBXG7GmSYJtgZpwN+hnaY=
X-Google-Smtp-Source: ADFU+vu5WCM8zr8UCxmvvPoHlaAcgIaE2nkkFI0Wude6ubPSLKcv/F/AiyEuwwF11uWc1fLXdqIdiOyHeUQC8aBj8T4=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr15135322otr.107.1585729629608;
 Wed, 01 Apr 2020 01:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200401190810.7a2cfa07@canb.auug.org.au> <20200401191810.1c06ead6@canb.auug.org.au>
In-Reply-To: <20200401191810.1c06ead6@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Apr 2020 10:26:58 +0200
Message-ID: <CAMuHMdVqexMZKj8xtMb3NdV64xrq4ppiq0sLMfHdtft4stZZTQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: turn of_pinctrl_get() into a static inline
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Apr 1, 2020 at 10:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 1 Apr 2020 19:08:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
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

Indeed :-(

Just realized this myself, while reviewing your patch.
Sorry for the bad suggestion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
