Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C870B14C1FD
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 22:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgA1VSy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 16:18:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40862 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgA1VSx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 16:18:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id j104so1873038wrj.7;
        Tue, 28 Jan 2020 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vqrFGl4DYQ6rBDtmgmAyCIFwbIeB0lM4NEh8e6KqoQY=;
        b=SDdQka3jB7cfln27F1gTq4Fx8sx4W8EYxf/E3vwRlzZODWF0xXkomBM2O0FIIMhFpt
         qB9QJjMwEqxYdqthj1WOSAo05ZbnWUALLUzmHbRaCkAN5JaeKheGJMN3x9OSTRece0Zx
         +IaVhN8fve0gmbNXRIgJelEbysxd8xfSfJhMg1lfOimQJmW7ngJQegYwdigGJrD7mD2x
         jIymh1wyYeTy2mfMFlTWBdFCDH9UwRCJBhQAsAGGCmQkk9Wo8rGoKgLnhxp23OafbYuy
         xyrzYR6p3fksBmI11NS/7w95JMQgn64rzoggMMdRtWJlsxC57lp3ZgE2kVeVJt3O9ECr
         Ujgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqrFGl4DYQ6rBDtmgmAyCIFwbIeB0lM4NEh8e6KqoQY=;
        b=IaZQYT8j0h7qL9L9paq6wVzqSZ+oe8s076wygtMlcD0sgdIS7ICdc1q5OGxoBzzvFU
         JvjOfojNuht7NUsM1Bsnr/agkZkldRniFa/6de+xVAe3w2ZttNH/I8C/nLUwl8I2kWoB
         YrM9TBmgB1q0yI/B4QDKI2UbKkstji7citJVsYk+Q8hdRn6NdST9znh5KeXaFlj1CYz1
         B74mEnPi2Z9Rh4s8DwoVbCQn35q3n9mt7arv7nzsNC/0+RheE+qSbolmu6UKPcIJOWBZ
         N+dn1YiiZbQtWb9vCdzz8memjztSbCp3wUcRri7cgvHvBwxbarrnBwlVpCh61JlP8j5Q
         QJJQ==
X-Gm-Message-State: APjAAAU3W+0kxYGLP+x2JbtEPRUboUe2YQhreU22oDA6fnp9aAhZ2oon
        nGN52dA0HUuB/nDdopXCNrYw/1fmM9/YaKHn8X0=
X-Google-Smtp-Source: APXvYqzU39n+7gDP5IecAKJU2PwwUD3Oq2p0BtGAC6k1BXDb1seK0Kzycq+zX8/RWXr46l71QQTb6vYsiRjS4KjZvOg=
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr32033070wrq.419.1580246331794;
 Tue, 28 Jan 2020 13:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20200128154227.43f15a1f@canb.auug.org.au>
In-Reply-To: <20200128154227.43f15a1f@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 28 Jan 2020 16:18:40 -0500
Message-ID: <CADnq5_Pc8SCfek7D86qwt1bWut-RD6SUVZzH=ccK+BsdDcvN2g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Tianci.Yin" <tianci.yin@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 27, 2020 at 11:42 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c: In function 'psp_v11_0_memory_training':
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1047:9: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
>  1047 |   buf = vmalloc(sz);
>       |         ^~~~~~~
>       |         kvmalloc
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1047:7: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>  1047 |   buf = vmalloc(sz);
>       |       ^
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1057:4: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
>  1057 |    vfree(buf);
>       |    ^~~~~
>       |    kvfree
>
> Caused by commit
>
>   240c811ccde4 ("drm/amdgpu: fix VRAM partially encroached issue in GDDR6 memory training(V2)")
>
> I have applied this patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 28 Jan 2020 15:33:44 +1100
> Subject: [PATCH] amdgpu: using vmalloc requires includeing vmalloc.h
>
> Fixes: 240c811ccde4 ("drm/amdgpu: fix VRAM partially encroached issue in GDDR6 memory training(V2)")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index ac173d2eb809..0829188c1a5c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -22,6 +22,7 @@
>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
> +#include <linux/vmalloc.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_psp.h"
> --
> 2.24.1
>
> --
> Cheers,
> Stephen Rothwell
