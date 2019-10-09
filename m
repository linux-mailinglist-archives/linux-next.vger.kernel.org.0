Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C0AD13CE
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 18:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731173AbfJIQRy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 12:17:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37756 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIQRy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Oct 2019 12:17:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id p14so3764096wro.4;
        Wed, 09 Oct 2019 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;
        b=mZTMp25p5tZ0QS0QQn2WdAs83YNBwqRMFSxTq86nFaKIOCf6chuWTaKlENsao9OeDa
         CgKnDADSE7Dx8ODu0JgVhrgWjnRKMJ8mLWF8hwOvWD1fTLSGiLKWDozvjerIiL8V3Ggr
         5OTCrQ+ZGZUaMshEx0AyLZjb3p5dwvfgKoTZMynJGZHvgMuW74cqgCYYF4gZuClipIAM
         Pf7+SfYjBr3ipQG9Znp04j3nKycyUWT6604f5EZRVDocOU441jop29clCIKCU6wIbhLK
         Mt1OomC3eSIhfyaEWnQcS2UPXs4KhsBEJnGw1+YGgowp/9LnB1Pu+IEu0ednFtBwIGyD
         goEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;
        b=Ftiw+9F+MH/ywgIozgawOO8+jmiUnYVZK5Tt8r65COGVwd1OPi83EULgGHhsGaNxuh
         herrydCEz23540MU12ELJv073lxFFSsFuXcf/LwB51Ti14JJKPaZOU3sie/VV6E3H2Fu
         bmPo1hveh9XAhFzo+zlBVw+yY2moAhJjlglWyn6d6OY+pa4TrAWyFNn4fiIXE9o81P/0
         4eHSnKhRYBTo3NoGDmYtfWvgJY874WARm8dlxp8Ex5Df7Xz10ptQc1r4pHbvuPAI2wr5
         ojI/8kEngMtULmBn+y1OWqt3EO48ltFzkEeZHLcgtpSJkem9zXatwLDsgnYFbhrQ0rh3
         v10w==
X-Gm-Message-State: APjAAAW65xIUsZ1O55sqnNQ+pd1HFbr5k+QkP06vbVZU0rMYzokNnCDY
        mZwnAO0JJrx1zV+qz1QuDv4qrMNuNFvxNMwXxtFliQ==
X-Google-Smtp-Source: APXvYqwuFxizJIc608t7uMIyzZUpg60M7UXO170bbTV8WWpxvxozUM5YuBaV9KuuipR2H0z6C97a1BSFfNMask+sQyg=
X-Received: by 2002:adf:db43:: with SMTP id f3mr2544310wrj.11.1570637872054;
 Wed, 09 Oct 2019 09:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191009113557.41ced49e@canb.auug.org.au>
In-Reply-To: <20191009113557.41ced49e@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 9 Oct 2019 12:17:36 -0400
Message-ID: <CADnq5_M0+PqajRUxgho2WVLq4ykdHJh=4-mWKrR25_93HMj68Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Applied.  thanks!

Alex

On Tue, Oct 8, 2019 at 8:36 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.c:25:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drmP.h: No such file or directory
>    40 | #include <drm/drmP.h>
>       |          ^~~~~~~~~~~~
> In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:38:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drmP.h: No such file or directory
>    40 | #include <drm/drmP.h>
>       |          ^~~~~~~~~~~~
> In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.c:26:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drmP.h: No such file or directory
>    40 | #include <drm/drmP.h>
>       |          ^~~~~~~~~~~~
> In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:34:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drmP.h: No such file or directory
>    40 | #include <drm/drmP.h>
>       |          ^~~~~~~~~~~~
>
>
> Caused by commit
>
>   4e98f871bcff ("drm: delete drmP.h + drm_os_linux.h")
>
> interacting with commit
>
>   6b855f7b83d2 ("drm/amdkfd: Check against device cgroup")
>
> from the amdgpu tree.
>
> I added the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 9 Oct 2019 11:24:38 +1100
> Subject: [PATCH] drm/amdkfd: update for drmP.h removal
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index b8b4485c8f74..41bc0428bfc0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -37,7 +37,9 @@
>  #include <linux/kref.h>
>  #include <linux/sysfs.h>
>  #include <linux/device_cgroup.h>
> -#include <drm/drmP.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_device.h>
>  #include <kgd_kfd_interface.h>
>
>  #include "amd_shared.h"
> @@ -49,8 +51,6 @@
>  /* GPU ID hash width in bits */
>  #define KFD_GPU_ID_HASH_WIDTH 16
>
> -struct drm_device;
> -
>  /* Use upper bits of mmap offset to store KFD driver specific information.
>   * BITS[63:62] - Encode MMAP type
>   * BITS[61:46] - Encode gpu_id. To identify to which GPU the offset belongs to
> --
> 2.23.0
>
> --
> Cheers,
> Stephen Rothwell
