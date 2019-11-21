Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8C01059AE
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 19:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfKUShX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 13:37:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38362 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbfKUShW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 13:37:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id i12so5699786wro.5;
        Thu, 21 Nov 2019 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DP2863yACbff5i+RB3eZcwhNt5zRZsKWECbY34JBcgA=;
        b=TqCL0T6NAWRZxDvpie2AstfsSje6ENUuHqVWYhyMpDwMihvL3IVbv4lfh7bRYOxeDC
         OAm9kjeRqp63n1gZP92JqXyABQxJk8jE6A53cdPJQrQkGj33N9Ero1yWvfbsVVKFNa8/
         YPYJQDJuUetzBzUj/8coik4Q2EvmX5srQLQ+1B0pTx5XmNqsfKW8hPG9ErbIBTwhBj+F
         xUHwgCmXC8zwX+oKI5OGaLs4sumgIvpTk1LNPiHa7slWqezoG6W0nFdpwkkepiyeWUs/
         ob5zd1b/O3gBtP8EUCPpmOaj+AFABXFnyEyDUpJX7Lu6aADQ/QfrLWZzDLiw7isPBCdJ
         mMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DP2863yACbff5i+RB3eZcwhNt5zRZsKWECbY34JBcgA=;
        b=Sz2LF6p9a98PubE2ZzuJa9IKshhwsEuXjRSnsfrMGBBo0q4a9tDAxQJQV/3MX/jEyh
         BfNwbwI1SgS9gdbiepbslBmK+4T81vAXhSTTdUpK5eKGGfCFeCbonvkAYp/jLYWFBdIN
         EccH7NmuH6dvHJK2tNjihiEQRnGLioNv1dgJloJmtQeWsdoGR9gPAEHme1OqwpCYTncK
         QrfZGlF1iu9yVDiEE+PK5pgEH8C6K9HyLg8IPJr9YL2w2i8/Ltmeb/wx+ZMF4YtAzBXh
         l8To7lcaBP3s+3JJNZj61ZGTqwsBdxIwLRXmil8f3/CbOgLWaO60m0eAyWZ3IqLepDXW
         oAyw==
X-Gm-Message-State: APjAAAWRJUUy0znfquLX/qSg4Wj/GZq2yeyx0uJmH7At/xLkyqilyP6M
        OnXgyaEu2OyDDXbXQuQfe/aZ8aXQiQmH758Ejac=
X-Google-Smtp-Source: APXvYqw0gk8+IPXr82CnrP23ZVlU698/XaqMec5S9dwPM2xvZo/BgowQ0jIeqLBr0yaDtAygzcPKTGG5mcm9rFvHOmU=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr12610035wrq.40.1574361441116;
 Thu, 21 Nov 2019 10:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20191121145403.46789cb5@canb.auug.org.au>
In-Reply-To: <20191121145403.46789cb5@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 21 Nov 2019 13:37:09 -0500
Message-ID: <CADnq5_O+J3pVR_SxP8cYnkwJo9LK8uQTXrFtpMbz9c8NYmOGnA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 20, 2019 at 10:54 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from include/trace/define_trace.h:102,
>                  from drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:502,
>                  from drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c:29:
> include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:476:52: error: expected expression before ';' token
>   476 |         __string(ring, sched_job->base.sched->name);
>       |                                                    ^
> include/trace/trace_events.h:435:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
>   435 |  tstruct        \
>       |  ^~~~~~~
> include/trace/trace_events.h:77:9: note: in expansion of macro 'PARAMS'
>    77 |         PARAMS(tstruct),         \
>       |         ^~~~~~
> include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:472:1: note: in expansion of macro 'TRACE_EVENT'
>   472 | TRACE_EVENT(amdgpu_ib_pipe_sync,
>       | ^~~~~~~~~~~
> include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:475:6: note: in expansion of macro 'TP_STRUCT__entry'
>   475 |      TP_STRUCT__entry(
>       |      ^~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   2c2fdb8bca29 ("drm/amdgpu: fix amdgpu trace event print string format error")
>
> from the drm tree interacting with commit
>
>   60fdad00827c ("ftrace: Rework event_create_dir()")
>
> from the tip tree.
>
> I have added the following merge fix patch:

Applied.  Thanks!

Alex

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 21 Nov 2019 14:46:00 +1100
> Subject: [PATCH] merge fix for "ftrace: Rework event_create_dir()"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index f940526c5889..63e734a125fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -473,7 +473,7 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>             TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
>             TP_ARGS(sched_job, fence),
>             TP_STRUCT__entry(
> -                            __string(ring, sched_job->base.sched->name);
> +                            __string(ring, sched_job->base.sched->name)
>                              __field(uint64_t, id)
>                              __field(struct dma_fence *, fence)
>                              __field(uint64_t, ctx)
> --
> 2.23.0
>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
