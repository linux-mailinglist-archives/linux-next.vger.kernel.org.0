Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F051A34E249
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 09:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhC3Hh3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 03:37:29 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:36372 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhC3HhJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 03:37:09 -0400
Received: by mail-vk1-f175.google.com with SMTP id d82so3356958vkd.3;
        Tue, 30 Mar 2021 00:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvQNG7MoGzFYXtjqbLKR5ZoQOrdPV7hI4S5BKtxl8bw=;
        b=rGYGgYTih5Uo2/LE2JLJ/wAZYzopMtFL3ebMQRerah9g+915+i8/iu/WZwjFW2p2jM
         nQhYpkVr16nmWOCR0OooSaZ0qppkdkh5wTeL7acTbuXBZkilP/IRgwbCDFzpzt5to+e9
         1nlXJ2WnfdB33vWzFl8X1v5sMLVM2OwO431wyHU6i81p6cN2us01rwVJmgSCzEASr325
         y0X9cC4mgpKrwV+PWrZizNBHBEwpYog1u6NX27EzR9pZ2SZ4h/jaMiPdnyxKZ8vyTWJg
         oqm6Q8ry9OtE/2j21QtwatXy2CeWGwZGziHvhq1t420UhN+Jce87OwJAvscOtYN1rG4P
         BifA==
X-Gm-Message-State: AOAM533akIS5osjrMxlsFAwRO7I2rDOcFC5YY0dDXoHwUHGmUud0+vRM
        YhsjajBHBkIQbtNFZzJerrVSZj14A5K0bzQYYBiTtYRA9do=
X-Google-Smtp-Source: ABdhPJxPLly45TgC6QKXizIcqd1cjiPQH0CtyhWUI5AhbVx3eCiOGrlDOEM2Bzut8wOVPvzfiO4RoVF21DSV2kwPAw0=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr16591580vkh.2.1617089828934;
 Tue, 30 Mar 2021 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210329131401.15724766@canb.auug.org.au>
In-Reply-To: <20210329131401.15724766@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Mar 2021 09:36:57 +0200
Message-ID: <CAMuHMdXtjy4HDzK2y2+3Fb788=OQAv_OQJaw31FRL0pkjLXb4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Mar 29, 2021 at 4:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>
> between commits:
>
>   9adb125dde69 ("drm/amdgpu: re-enable suspend phase 2 for S0ix")
>   4021229e32bd ("drm/amdgpu/swsmu: skip gfx cgpg on s0ix suspend")
>   9bb735abcbd8 ("drm/amdgpu: update comments about s0ix suspend/resume")
>
> from Linus' tree and commit:
>
>   e3c1b0712fdb ("drm/amdgpu: Reset the devices in the XGMI hive duirng probe")
>
> from the drm tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 8a5a8ff5d362,0f82c5d21237..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@@ -2743,16 -2712,15 +2720,25 @@@ static int amdgpu_device_ip_suspend_pha
>                         continue;
>                 }
>
>  +              /* skip suspend of gfx and psp for S0ix
>  +               * gfx is in gfxoff state, so on resume it will exit gfxoff just
>  +               * like at runtime. PSP is also part of the always on hardware
>  +               * so no need to suspend it.
>  +               */
>  +              if (adev->in_s0ix &&
>  +                  (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP ||
>  +                   adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX))
>  +                      continue;
>  +
> +               /* skip unnecessary suspend if we do not initialize them yet */
> +               if (adev->gmc.xgmi.pending_reset &&
> +                   !(adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH)) {
> +                       adev->ip_blocks[i].status.hw = false;
> +                       continue;
> +               }
>                 /* XXX handle errors */
>                 r = adev->ip_blocks[i].version->funcs->suspend(adev);
>                 /* XXX handle errors */

The above is not what you have in next-20210329?
Your tree has a second copy of the first conflict block after the second:

                /* skip suspend of gfx and psp for S0ix
                [...]
                /* skip unnecessary suspend if we do not initialize them yet */
                [...]
                /* skip suspend of gfx and psp for S0ix

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
