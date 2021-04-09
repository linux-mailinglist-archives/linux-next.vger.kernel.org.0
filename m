Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D318A35955E
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 08:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDIGXw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 02:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhDIGXw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 02:23:52 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1618CC061762
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 23:23:40 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n2so6841305ejy.7
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 23:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/0WMp8MwKJ/u3qX7Dv8XtiWzb8xXHglsszw5dF/53Js=;
        b=RSzU/8fTXW2zL+EO/inJbfSmLIUvORZ+0ncpCjsA5xwox5jMW+/13995cQ1BG3+drn
         IZLu1plLrnt4tTK9456EABz/OGQNBErWwlNrkad+Xu2ynqUdG049uL1nGgvDOpkN5YQF
         Z5VxJ8a24qmf8sTw08PZCOYyjRLbLc3aSYuEVLbcrzIzisS19Y+MvrZRe4EsB/OXp7Zc
         Nduhl29srfd0adZ5Np0cthNChuCC60bAfT50gGRfWDz28GU052SKiHM22kDt34JNpaSP
         j+zO42c44T9gPxiY1sPbQ8GzIO4UTE4AKDK4iq42bImf4aZVY+wH3fXj/mbLqLnaRAzL
         UY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/0WMp8MwKJ/u3qX7Dv8XtiWzb8xXHglsszw5dF/53Js=;
        b=ONZJtAk99UnQxeG1Yiu28kLGPiQkh6VDiERpHb+6SKJrCs573dyqCRzJ9NkwezQ0HF
         mIFaGXfrMQZaWmM4F+4EWOtf5snXKXUcQmO/+QtmTK1yjkxk6mqK57h1nmrrythYNLig
         M9A3JzoLgs4Zkk+jgmo6nLCY+Gg/vsMOPhjkMMBEauGQuSIRJRKReVQh4a/luNXsNXvG
         PBX5UskANFMk4CcVD0dxzLy8x1ZFklwliLZo6O2aVmF4qzH8trMWv+eie6y74qB1owtm
         FvVOzGOY2W6H0sXSsUUC1oongkb8XI0YJ0PNnoux1d8jU+bVQ9PKZ5cqaQ46Hk164xbZ
         Rupg==
X-Gm-Message-State: AOAM530DltA1P2QWelrSC//UYOYauPGttpLBiXMBCf1/sfmkTAI6cCni
        oxo4a8JkB1bLn94RnkKH6dFeBuFPQboBZt9SLPNatg==
X-Google-Smtp-Source: ABdhPJyNW8FA7KCEbD2ruFaUWyLqipptmdm8sQ3TknahXLmC9cmxEHhJE+UDIIR9xnnqW2/0yG2B0wUwPtpsfi7AkfM=
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr14338784ejc.133.1617949418711;
 Thu, 08 Apr 2021 23:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
 <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
In-Reply-To: <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Apr 2021 11:53:27 +0530
Message-ID: <CA+G9fYt30EZOv2mUOf+xGh3R3A0SMJhvVtHFwZuKyBgB75UTTw@mail.gmail.com>
Subject: Re: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Chaitanya,

On Fri, 9 Apr 2021 at 11:01, Chaitanya Kulkarni
<Chaitanya.Kulkarni@wdc.com> wrote:
>
> On 4/8/21 22:21, Naresh Kamboju wrote:
> > Linux next tag 20210408 architecture sh builds failed due to these errors.
> >
> > # to reproduce this build locally:
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=sh
> > CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
> > 'HOSTCC=sccache gcc'
> >
> >
> > In file included from /builds/linux/include/linux/scatterlist.h:9,
> >                  from /builds/linux/include/linux/dma-mapping.h:10,
> >                  from /builds/linux/drivers/cdrom/gdrom.c:16:
> > /builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':
> > /builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
> > (first use in this function)
> >   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
> >       |                                                             ^~
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >
> > Regressions found on sh:
> >   - build/gcc-9-dreamcast_defconfig
> >   - build/gcc-10-dreamcast_defconfig
> >   - build/gcc-8-dreamcast_defconfig
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
> >
>
> This can be fixed by following :-
>
> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
> index e7717d090868..742b4a0932e3 100644
> --- a/drivers/cdrom/gdrom.c
> +++ b/drivers/cdrom/gdrom.c
> @@ -583,7 +583,7 @@ static blk_status_t gdrom_readdisk_dma(struct
> request *req)
>         read_command->cmd[1] = 0x20;
>         block = blk_rq_pos(req)/GD_TO_BLK + GD_SESSION_OFFSET;
>         block_cnt = blk_rq_sectors(req)/GD_TO_BLK;
> -       __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
> +       __raw_writel(page_to_phys(bio_page(req->bio)) +
> bio_offset(req->bio),
>                         GDROM_DMA_STARTADDR_REG);
>         __raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG);
>         __raw_writel(1, GDROM_DMA_DIRECTION_REG);

Thanks for your patch.
After applying this typo fix, the build pass now.

- Naresh
