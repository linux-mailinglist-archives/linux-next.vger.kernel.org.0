Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C313D9700
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 18:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfJPQWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Oct 2019 12:22:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50864 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfJPQWK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2019 12:22:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so3620289wmg.0;
        Wed, 16 Oct 2019 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l/TRSD+YkWPaNUUn33x7sao3wMEgezx4EPVX8O4dORw=;
        b=bckKbSoF+xwh3uLEe632e7xuUyKCRII4rfj1izMdfWtvt46KNOmXLb7S7QUiQQTXJy
         uW8wrd9/NBR3Qq1F0RJcG8JHjuw7c/+Z6ndq+BDzbc4KF2ve4G9+sjuIGT52zjA0tUJq
         BbkwlOPoBhg5svDSEdAIrXWLvIm3fFAUPy0tKQfWBpChhUSg55zlPkphHfXktZ+0QJWa
         iNcGbZxcxPA65yup7kbiFp0JxUhRyeN5e/svFSXjJMLOWern68JL5QPEyssbyxWG0LwS
         GyOvDyRbQn6+vrRbbgi17g70YiA12z+eywYrJjRrpfJzW1lnkCQrwLmmND9GL4257l8r
         KPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l/TRSD+YkWPaNUUn33x7sao3wMEgezx4EPVX8O4dORw=;
        b=lIa9mNFxx6omJPlUThiODdMkRlJg7odIfQ6Yf7WLiCtVdhepAejc+M2zJqyaJ3Vgcs
         IhGkaZ8NH+XOTt3mATp6gQSfUXMoWwTuLvVjCNWYQwuyXZ8taBZFjvfGDbq8du6QOKwC
         3WhTu6Shqp11zHjJy8Ex5fDEE3qpqUOlcvSVOh9RH4xtbIQICtI8TuLq+bk16U/Nxc36
         zoAeZscQCvB5PHD6mh3apO2xRq7Dut1xQq7/JnIP9ga5vcz3J7ExyuFc+eX4DVI+QnMY
         OyAEUI+a6FDDu2iwWL8qv8RQF53qDBo0AoT4yBTdX9MTMLU7mmCoTJ37/sA2Tlpe35tL
         vfCQ==
X-Gm-Message-State: APjAAAX11nwjDXy1nDMd7pM/QWd5vcAHZGJtPIGAGVX7x77TDEY3Eaxs
        nxE1cw/QwJ+jawk72rrMlMSMB4fkQXlwp6EoolA=
X-Google-Smtp-Source: APXvYqxfjSJnIf2HAoJqhYgjYiqvi3mdiZMozruMItnEd9McAZs3QLLYtUdqBaWHzBEfWer05MBD9psE9paKR+HKLDw=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr4412507wmb.127.1571242928310;
 Wed, 16 Oct 2019 09:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191016112207.1ade14af@canb.auug.org.au>
In-Reply-To: <20191016112207.1ade14af@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 16 Oct 2019 12:21:55 -0400
Message-ID: <CADnq5_OG5B6TJzkCwdLjR17G-7JEgf90pyC6NRCsjS7TZf8YBg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huang Rui <ray.huang@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, Oct 15, 2019 at 8:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c:23:10: fatal error: drm/drmP.h: No such file or directory
>    23 | #include <drm/drmP.h>
>       |          ^~~~~~~~~~~~
>
> Caused by commit
>
>   4e98f871bcff ("drm: delete drmP.h + drm_os_linux.h")
>
> interacting with commit
>
>   8b8c294c5d37 ("drm/amdgpu: add function to check tmz capability (v4)")
>
> from the amdgpu tree.
>
> I applied the following merge fix patch for today (which should also
> apply to the amdgpu tree).
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 16 Oct 2019 11:17:32 +1100
> Subject: [PATCH] drm/amdgpu: fix up for amdgpu_tmz.c and removal of drm/drmP.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c
> index 14a55003dd81..823527a0fa47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c
> @@ -20,7 +20,10 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>
> -#include <drm/drmP.h>
> +#include <linux/device.h>
> +
> +#include <drm/amd_asic_type.h>
> +
>  #include "amdgpu.h"
>  #include "amdgpu_tmz.h"
>
> --
> 2.23.0
>
> --
> Cheers,
> Stephen Rothwell
