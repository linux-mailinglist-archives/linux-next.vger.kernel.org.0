Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D72F506D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 16:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfKHP71 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 10:59:27 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52171 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbfKHP70 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2019 10:59:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id q70so6707216wme.1;
        Fri, 08 Nov 2019 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eu4oX7xYfa5MEOO1wKRiehoOBepBzuAtMWUC++GMKtE=;
        b=O3EhIS0N4Mze/93XT+emgHlgTwiEdn9OmkMPFV2qdEc5qMhzCvrwLQPPJgS33bfyI1
         IcipeV0LpTcRCXghFTvpyrjHpYWt8ifpiY1XJZaUhGkxoz8APXsGEnCeNzVt5JvRzZm9
         P9L41Cwd+ChvKUppQJV7pCqMw9hyWjRiYUFhqS9og7Ex1qzkeS0AlpFTrfV/DZCCyc3h
         pCqCt6vgCDSLQsOuhPTMUohx8By7pbJQ58YK86z6TstqwRKzjsWe/F3A8VPIdSPQAW4F
         17Mjyj04SvXeusPbrkr7yy54QfEScGG2XWE2kkqa5TIVMPK8NTSysc13Fsx8eWW8myKV
         nTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eu4oX7xYfa5MEOO1wKRiehoOBepBzuAtMWUC++GMKtE=;
        b=YCceqBsTiuoKpeHP5+rtACMKySqiEEU7YbkTYWu5Go0TmJBulrgRul9Oa9boOA+aED
         qY/bubEEjFDCOIH2VgFEW0zs/Prcx0AKN1k3uQtoD3GGZbeWD5PPiAAKu+aLBA0oMF6h
         sPE/GIO83lkhtLk1uznGXTPf4DaG9hILwBgmou2CizLR+7H/MntJ7iLLrY7rZfnBZ7h5
         dSEEn0zPPKG7DHzOpB+//m26i9UrJtNex0R+EE2E/FBYK9XudSRp1w3IqfCYXyZEeA/W
         j82fMlY/eNoe64LPijXDC5TbwQnuraooxHL1BCcZpBHnT81t1SiRU4GQg6QI3zgAAM2D
         /0Fg==
X-Gm-Message-State: APjAAAXgMQSQKWX+49wACgwF66WQhmAIxLvsl2fuH290CqsxSC0D8cCh
        qeBfvUUcyQ40yyQ5c+yQ549Gb3mGNKXb0xp494k=
X-Google-Smtp-Source: APXvYqyEmUfcU1PW2fm96T31Va0NOmni7iNU//QiUgaoi1CjjVsFn1p8BeZm43843cv7FWTvU9yhl3zmTMCNsup0ZQ0=
X-Received: by 2002:a1c:790b:: with SMTP id l11mr9302935wme.127.1573228764346;
 Fri, 08 Nov 2019 07:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20191108163110.32c19752@canb.auug.org.au>
In-Reply-To: <20191108163110.32c19752@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 8 Nov 2019 10:59:12 -0500
Message-ID: <CADnq5_M3dMPm3vr9xV1wK2bHJs123nG39z3sbxkBdWdonmVjPA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 8, 2019 at 12:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> In file included from <command-line>:
> include/drm/gpu_scheduler.h:98:21: error: field 'entity_idle' has incomplete type
>    98 |  struct completion  entity_idle;
>       |                     ^~~~~~~~~~~
>
> followed by lots of similar errors.
>
> Caused by commit
>
>   83a7772ba223 ("drm/sched: Use completion to wait for sched->thread idle v2.")
>
> I added the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 8 Nov 2019 16:21:32 +1100
> Subject: [PATCH] drm/sched: struct completion requires linux/completion.h
>  inclusion
>
> Fixes: 83a7772ba223 ("drm/sched: Use completion to wait for sched->thread idle v2.")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied.  Thanks!

Alex

> ---
>  include/drm/gpu_scheduler.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 6619d2ac6fa3..684692a8ed76 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -26,6 +26,7 @@
>
>  #include <drm/spsc_queue.h>
>  #include <linux/dma-fence.h>
> +#include <linux/completion.h>
>
>  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>
> --
> Cheers,
> Stephen Rothwell
