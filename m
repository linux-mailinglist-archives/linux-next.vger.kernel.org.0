Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D78F8BB00
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbfHMOBV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 10:01:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52987 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbfHMOBV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 10:01:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id o4so1497362wmh.2;
        Tue, 13 Aug 2019 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ky/0G1r/E47b3qMLySEW2K0XYi/tp5CsA6kbQT1Docg=;
        b=XQe6qEESNVu+84o4mpV5IxOP2tMWBF13A5AN5TPmm/op1NRmPd4aktWCNwQXabIi7B
         fXY+jgumHgPnZREKODcMeVrB7KU04CuH1SH55gsE02AQWXpSvKBdSXw2iIyyjmMQdfPe
         H4MTrbDzEDVQBgTjLd4kQHxld74QGElq76UZGX5/yhOS9Aw8Q91vfgb5k7gXTVmIywQP
         Y8lzROWvFROz6fJ7Pamrqvb8IgOuoKIpZbxZXQ0PgcYYBN+tmEtVaNODLQxdfSQHbKvZ
         gkNgfQxY9LPnXuU8sR/p2BfmQxvgQ91A8gCzkdKQIkA0IzIknY/wB1rWOkzZmLUIEban
         xYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ky/0G1r/E47b3qMLySEW2K0XYi/tp5CsA6kbQT1Docg=;
        b=aFxwRgRkmihJ7tgZv+Ymf8C1ah2Lu1Dsn2yyUhHYbQAb+Z1RohTrXdSiS0pC83J0fM
         R1OJDDsToP+aX6rqod1BRDJuvZE8khkEUROGSQl0+6PzqVDj81NoReQFohf4T+cr14qY
         oT6lUGT5MbSPFQ6Q0SLxn5TYhKysw3Uytb/CaO7CuygjaUtIr+nkVxNMNBig293tg+Ze
         VmBTXp1bTIvPc811+ck3hvjQP/YBVr4rnT1xQQsg3TBV/+lQ03l2EFFaM2dFRfGfiLjU
         AZmbKoRGl8fzH2Jt+xQjbLvRr8Dg7SjRfkgBQF8PC0mePlONKzM9zgwIXIMUedSa2CYD
         qimQ==
X-Gm-Message-State: APjAAAUQbtDSLmNLpRkZfprEwi3YOHNQdPn43T7r27oz4HqTPN7nDw2N
        ckwzYJ6ruz8U+yAdK+Kx/+nE9zYg9lwVx/i0frMdGw==
X-Google-Smtp-Source: APXvYqw0zbnDhh4DoH9t3jQVCRnpoZ6VJUK22NeN6UMrTRQB4NrXBEh1FXH9qFACsgkt1dFtqQfiMO8ZNbOh03Mn11E=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr3197633wmd.34.1565704878839;
 Tue, 13 Aug 2019 07:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190813181038.2c6aafb9@canb.auug.org.au> <MN2PR12MB3309141545B644DCA7F144B7ECD20@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309141545B644DCA7F144B7ECD20@MN2PR12MB3309.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 13 Aug 2019 10:01:07 -0400
Message-ID: <CADnq5_MA-9pT=cZJYCZ62VXjwNtxaCLH2kb5ig5TLFKx4wsmjA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     "Huang, Ray" <Ray.Huang@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 4:21 AM Huang, Ray <Ray.Huang@amd.com> wrote:
>
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Tuesday, August 13, 2019 4:11 PM
> > To: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> > Mailing List <linux-kernel@vger.kernel.org>; Liu, Aaron
> > <Aaron.Liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>
> > Subject: linux-next: build failure after merge of the amdgpu tree
> >
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/psp_v12_0.c:39:17: error: expected
> > declaration specifiers or '...' before string constant
> > MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
> >                  ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")
> >
> > I have applied the following patch for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 13 Aug 2019 18:03:16 +1000
> > Subject: [PATCH] drm/amdgpu: MODULE_FIRMWARE requires
> > linux/module.h
> >
> > Fixes: 6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Thanks!
>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>

Applied.  thanks!

Alex

> > ---
> >  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > index f37b8af4b986..b474dfb79375 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > @@ -21,6 +21,7 @@
> >   */
> >
> >  #include <linux/firmware.h>
> > +#include <linux/module.h>
> >  #include "amdgpu.h"
> >  #include "amdgpu_psp.h"
> >  #include "amdgpu_ucode.h"
> > --
> > 2.20.1
> >
> > --
> > Cheers,
> > Stephen Rothwell
