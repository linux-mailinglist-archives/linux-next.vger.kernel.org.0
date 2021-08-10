Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE543E5981
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 13:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237770AbhHJL4q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 07:56:46 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35821 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhHJL4q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 07:56:46 -0400
Received: by mail-ua1-f41.google.com with SMTP id x19so623061uat.2;
        Tue, 10 Aug 2021 04:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTRTCfqQ7bKYYtx3wTVwrv32a2MPEzZV5U+TIgC3RG0=;
        b=J9NxPwfmyG2Uvylp9hfu4YfzMBO1vy7w06+m0OC02rDEotuil0WWmZrE8GzBKktyg3
         8yv6LB7DbkRnsZkNDcOllI/+YbNhm67YLD0QD4djchIlXW+DZGgp9MIk/X4veb8EMdWc
         9fp+aVnwcjVz8g3xoJUZlwUWHnK9xn86b3eE3U0M46DPimsBnD+2lI2h/+wYTGxAGWI/
         w1G9XVomXb7cHu2tBsMNs99TQMmJKCud9cVAGfwievHOJSyoUyL3GrPRv28xJsy9YrNG
         p7DNBDy2Xy6kHhI9gkEJJYDrCJZ2xyLub6stVh5lQeLwgxo89xHLn7leNqGfyMMPUpRW
         CchQ==
X-Gm-Message-State: AOAM530+vgCmQNmsAxHIXsfdeVhLMbQTBmQYNg2V4+2OxTI7rB8L9IN6
        l33bt9yt1NUxNHUkiOFldCQC5DqQbuq2dn0Z/ZY=
X-Google-Smtp-Source: ABdhPJyR2Wvm/hKsOkev5kLwifwC9ps3gs3wke1iEGJOM8WXZs2YY+H/TR/IYi2UOLmV4+KtCuV/PadScY60L640eDY=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr20053424uam.106.1628596584126;
 Tue, 10 Aug 2021 04:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210806120417.49878-1-broonie@kernel.org>
In-Reply-To: <20210806120417.49878-1-broonie@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 13:56:12 +0200
Message-ID: <CAMuHMdXNAe3_TK-YWDwxjQ1uRMb0zLSSgx7w7FYCXvRmxG3pAQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-fixes tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chengming Gui <Jack.Gui@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark, Stephen,

On Fri, Aug 6, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>
> between commit:
>
>   e00f543d3596 ("drm/amdgpu: add DID for beige goby")
>
> from the drm-fixes tree and commit:
>
>   a8f706966b92 ("drm/amdgpu: add pci device id for cyan_skillfish")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 5ed8381ae0f5,d637b0536f84..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@@ -1213,13 -1212,9 +1212,16 @@@ static const struct pci_device_id pciid
>         {0x1002, 0x740F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
>         {0x1002, 0x7410, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
>
>  +      /* BEIGE_GOBY */
>  +      {0x1002, 0x7420, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7421, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7422, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7423, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x743F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +
> +       /* CYAN_SKILLFISH */
> +       {0x1002, 0x13FE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_CYAN_SKILLFISH|AMD_IS_APU},
> +
>         {0, 0, 0}
>   };

next-20210806 and later have a different resolution, duplicating the
BEIGE_GOBY entries before and after the CYAN_SKILLFISH entry.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
