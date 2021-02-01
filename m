Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9366730A4B9
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 10:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhBAJyi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 04:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbhBAJyg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 04:54:36 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88080C061786
        for <linux-next@vger.kernel.org>; Mon,  1 Feb 2021 01:53:55 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id g69so18141580oib.12
        for <linux-next@vger.kernel.org>; Mon, 01 Feb 2021 01:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BrZXKfbjstxOcrlNaiNl80AXrkVjIpfkHPEMEISrv+o=;
        b=beZSsJP2hnqpZStyyz3UHDllMvpfc29if9M85bGORSoJwFPvJPsZBmDDFALSikQEus
         jl6NPI10gEAYFDzVG/EzlS3dPpW/Zyn+kvEgrPAJ/s3weN3cGNUYWpGnCUn6CQGC7xMH
         bZImgZeZqEscxpjWUOIsH1NCx0i5hHLeeR+H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BrZXKfbjstxOcrlNaiNl80AXrkVjIpfkHPEMEISrv+o=;
        b=n/j0wxGzSkaZmri4ZloeBw26QPyAmEm/OHQfN9j8crrdtK616B556C8LxkjXKGaWLk
         fVsdAEys+00SL86BzBXyvwzQzNPH51yOFvMG2Ic6Kf0AMER0trmNPbJfZU7hNb86QC90
         RIPBzWtiw8RziglkLN3aUGObGsEe8ufaMYrXw9PXU+ZhVCYROpu/Z92eywvbs6tNNLFk
         BGvEOvSdlmpaV5L4oLl4+SJ+zXCPPdzK28/wJjCAwZBVPXY+uThGPequso8GTkL5M861
         ocIdSmswCMwzk5ja94zFQVqN4CtBv8dDCmKcnb1Bnd5Sze4OHxcuoMqwYihYHobLO/nh
         I3ew==
X-Gm-Message-State: AOAM530+5thXtYCtKgSDmQpoI6p43NsWL6SFQH3bS3/19uNpS57cf4Va
        Xr4f+9IYzu1gSjdVJ24ATv5CThOwc/cK2fQ89ft2Bw==
X-Google-Smtp-Source: ABdhPJzUVffym1tm5Dx5k0lNb7UuglCx1tOzxgpR1VYtEMm9UIjQ/fKu2xoczOpvl4/4mwZlRaXyBM3pGD2wqQsAJrE=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr9685258oia.14.1612173234956;
 Mon, 01 Feb 2021 01:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20210201091159.177853-1-christian.koenig@amd.com>
In-Reply-To: <20210201091159.177853-1-christian.koenig@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 1 Feb 2021 10:53:43 +0100
Message-ID: <CAKMK7uG71ErttouViDp-GxH83VvqcAzG7P643P1Ed3N46hQj6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d/v3d_sched: fix scheduler callbacks return status
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Luben Tuikov <luben.tuikov@amd.com>,
        linux-next <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 1, 2021 at 10:12 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Looks like this was not correctly adjusted.

shoulda compile test before pushing :-)

> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: a6a1f036c74e ("drm/scheduler: Job timeout handler returns status (=
v3)")

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index ef2338a294ca..ceb33f8e4379 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_j=
ob)
>         return NULL;
>  }
>
> -static enum drm_gpu_sched_status
> +static enum drm_gpu_sched_stat
>  v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sch=
ed_job)
>  {
>         enum v3d_queue q;
> @@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct=
 drm_sched_job *sched_job)
>   * could fail if the GPU got in an infinite loop in the CL, but that
>   * is pretty unlikely outside of an i-g-t testcase.
>   */
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>                     u32 *timedout_ctca, u32 *timedout_ctra)
>  {
> @@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, =
enum v3d_queue q,
>         return v3d_gpu_reset_for_timeout(v3d, sched_job);
>  }
>
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>  {
>         struct v3d_bin_job *job =3D to_bin_job(sched_job);
> @@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>                                    &job->timedout_ctca, &job->timedout_ct=
ra);
>  }
>
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_render_job_timedout(struct drm_sched_job *sched_job)
>  {
>         struct v3d_render_job *job =3D to_render_job(sched_job);
> @@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_j=
ob)
>                                    &job->timedout_ctca, &job->timedout_ct=
ra);
>  }
>
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>  {
>         struct v3d_job *job =3D to_v3d_job(sched_job);
> @@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_=
job)
>         return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
>  }
>
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>  {
>         struct v3d_csd_job *job =3D to_csd_job(sched_job);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
