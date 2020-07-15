Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF23D2210B0
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 17:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgGOPRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 11:17:49 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:41830 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgGOPRt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 11:17:49 -0400
Received: by mail-oo1-f65.google.com with SMTP id z23so532764ood.8;
        Wed, 15 Jul 2020 08:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07w6zT5p/JCkvgft7yXEC/Da1EqLXDyJjPcjdIL2ruY=;
        b=KoMvZJ1RW4uWbsZKFZ9bC1+dI5SSa8lqHPWx75S0zYDU89uIOn06moxwurD+92arSZ
         zGVnhrSKaCuVkLJ59DWZiDJ/eX9/xipW2zQ0GCsKdb4iJn4G+OblwNVorj3baaFGzrmW
         fBPRalF9btvo4Kl1ad7+PLRMArDaHrRHSERVR6QSWnz7DJhAiKQfUpDAWiBuFjnhq5zk
         +QVBy1+GLKJ0wpGrfLBNApN7aG9EwNIwAOXKLK/SguCgcxVnw4B2udohI74kwz+1cuxX
         yTGfkHK6oDzfBIjvOKzjUpQ5kqwVRQj3GlB1EfLUDB9JsnDGn1OVruIgDfAmmG18hfEQ
         kTtQ==
X-Gm-Message-State: AOAM530FqIOrvxhWTC+rUVbJ25PhboNH3dIP6yttCfPcGVvpKqBMETF5
        9bWOMkf7uRIrsYsxNP+yNsYF7kHe2ab/I3WSZ/LtpFLTSb0=
X-Google-Smtp-Source: ABdhPJzcvtdOKs6/rlkfC19wWNicku4ArAC1wkLz5s5+/Yr9O9b5VZw4xWj+dHNs3IyqCFesO3GORRMCWTrweiBD89g=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr9977302oob.40.1594826268060;
 Wed, 15 Jul 2020 08:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200715121423.6c20731b@canb.auug.org.au> <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
 <6bc36827-83a7-3695-530d-4b90c08b92c7@kernel.dk>
In-Reply-To: <6bc36827-83a7-3695-530d-4b90c08b92c7@kernel.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 17:17:36 +0200
Message-ID: <CAMuHMdU3uRV+8ep0YRKuqBitkfVchh1L7=+RVxCAL0rMrQHAiQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jens,

On Wed, Jul 15, 2020 at 5:08 PM Jens Axboe <axboe@kernel.dk> wrote:

> On 7/15/20 3:24 AM, Geert Uytterhoeven wrote:
> > On Wed, Jul 15, 2020 at 4:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> After merging the block tree, today's linux-next build (arm
> >> multi_v7_defconfig) failed like this:
> >>
> >> block/blk-timeout.c: In function 'blk_round_jiffies':
> >> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
> >>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
> >>       |              ^~~~~~~~~~~~~~~~~~~~
> >>
> >> Caused by commit
> >>
> >>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
> >>
> >> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
> >> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
> >>
> >> I have reverted that commit for today.
> >
> > (as I don't have the original patch in my email, I'm commenting here)
> >
> >     +config HZ_ROUGH_MASK
> >     +       int
> >     +       default 127 if HZ_100
> >     +       default 255 if HZ_250 || HZ_300
> >     +       default 1023 if HZ_1000
> >
> > What about other HZ_* values?
>
> Which other ones do we have?

$ git grep "\<HZ_[0-9]" -- "*Kconf*"
arch/alpha/Kconfig:     default HZ_128 if ALPHA_QEMU
arch/alpha/Kconfig:     default HZ_1200 if ALPHA_RAWHIDE
arch/alpha/Kconfig:     default HZ_1024
arch/alpha/Kconfig:     config HZ_32
arch/alpha/Kconfig:     config HZ_64
arch/alpha/Kconfig:     config HZ_128
arch/alpha/Kconfig:     config HZ_256
arch/alpha/Kconfig:     config HZ_1024
arch/alpha/Kconfig:     config HZ_1200
arch/alpha/Kconfig:     default 32 if HZ_32
arch/alpha/Kconfig:     default 64 if HZ_64
arch/alpha/Kconfig:     default 128 if HZ_128
arch/alpha/Kconfig:     default 256 if HZ_256
arch/alpha/Kconfig:     default 1200 if HZ_1200
arch/arm/Kconfig:config HZ_100
arch/arm/Kconfig:config HZ_200
arch/arm/Kconfig:config HZ_250
arch/arm/Kconfig:config HZ_300
arch/arm/Kconfig:config HZ_500
arch/arm/Kconfig:config HZ_1000
arch/arm/Kconfig:       default 100 if HZ_100
arch/arm/Kconfig:       default 200 if HZ_200
arch/arm/Kconfig:       default 250 if HZ_250
arch/arm/Kconfig:       default 300 if HZ_300
arch/arm/Kconfig:       default 500 if HZ_500
arch/mips/Kconfig:      default HZ_250
arch/mips/Kconfig:      config HZ_24
arch/mips/Kconfig:      config HZ_48
arch/mips/Kconfig:      config HZ_100
arch/mips/Kconfig:      config HZ_128
arch/mips/Kconfig:      config HZ_250
arch/mips/Kconfig:      config HZ_256
arch/mips/Kconfig:      config HZ_1000
arch/mips/Kconfig:      config HZ_1024
arch/mips/Kconfig:      default 24 if HZ_24
arch/mips/Kconfig:      default 48 if HZ_48
arch/mips/Kconfig:      default 100 if HZ_100
arch/mips/Kconfig:      default 128 if HZ_128
arch/mips/Kconfig:      default 250 if HZ_250
arch/mips/Kconfig:      default 256 if HZ_256
arch/mips/Kconfig:      default 1000 if HZ_1000
arch/mips/Kconfig:      default 1024 if HZ_1024
kernel/Kconfig.hz:      default HZ_250
kernel/Kconfig.hz:      config HZ_100
kernel/Kconfig.hz:      config HZ_250
kernel/Kconfig.hz:      config HZ_300
kernel/Kconfig.hz:      config HZ_1000
kernel/Kconfig.hz:      default 100 if HZ_100
kernel/Kconfig.hz:      default 250 if HZ_250
kernel/Kconfig.hz:      default 300 if HZ_300
kernel/Kconfig.hz:      default 1000 if HZ_1000

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
