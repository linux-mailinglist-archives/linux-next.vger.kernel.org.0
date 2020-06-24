Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D98206BED
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 07:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388861AbgFXFsE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 01:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgFXFsE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 01:48:04 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EE8C061573;
        Tue, 23 Jun 2020 22:48:03 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e22so570908edq.8;
        Tue, 23 Jun 2020 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCVczq9jeytjg0iXZ0Ms0EAwn8o1xeP0E8gSbiKjVYc=;
        b=pekx7gKl8X5Nm8n2yDSv4PtloQ3kGlanN+rnTGZSvPXXzE20vtVyQHAYTjN+WNgKjW
         JK73I8W4Dpmc7qCizC38HoISfcJYI23SFa157Ci8dwtFXeNsHWqdkJ2ROKSfA98xyQJ+
         V7sDmKfH/UmhgJAdt3DbCO42Nl4q83FYtElyoRuREhThEfGOJ8fLMIDS1/IMoS6Ujx5J
         8tANcQiYw5hcjrOqY7MxI++rbcxPPz8nat9qT53rJ1aP2nFGeG6yJ16G8o3N58D3sa5f
         vFYcuiQX0GgGsO5+iGevGCc6LkwMe16JvXg5+TiD2AHhIBS9zKy6d9IUTmXE2JwA6TSV
         VSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCVczq9jeytjg0iXZ0Ms0EAwn8o1xeP0E8gSbiKjVYc=;
        b=jxH4ViR+3pvlGH7Xgxj65UUGAnQPV3h0tvWqtUc4W/f5cGxKnPrkZBG5ukLO11im6E
         lyfurRkkruSNOIdiCBw1E5/MJGKJK9/8zLrfbmYkZkUwKlkdz7QtI6t1Hw0Z80ia19xo
         RbzBFE0zj5FIi4sz5i9LXSG88woVysrlBYcx2sXhtuw64qsrudfDcLM2wnE11jkqaCBq
         yR5ym3dqSXTpR000Y2EW9n+CHqhXTPb8HjxWbEp6FSUT2feSs45/ksvMhrvBRx7Umyt/
         7Y0TO9xHqm+krIOcNbh/mjk76xQ9CqR74lhLE9ijFU9/i1VdGk5sTUeeOe026thVgJEr
         ycyw==
X-Gm-Message-State: AOAM533uFSh7Gtyj00S6mmmsF3gSJ+tydmMLtkPXqXFasom+vdXuqZrM
        UREDU5CRhteruyr8s338Tehnfw86sqsumPj9IIGA5EpF
X-Google-Smtp-Source: ABdhPJz6lUsVAyNQDB1oZsYZGg9wmtAQPwNKHeMK7rsYNBqVTjNTplKqWGlw0uYl1JMxqjmkrQhme5kk1R2pBYG0FzQ=
X-Received: by 2002:a50:fa07:: with SMTP id b7mr5401576edq.298.1592977681772;
 Tue, 23 Jun 2020 22:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105929.534edd34@canb.auug.org.au> <20200624113452.54b72fcc@canb.auug.org.au>
In-Reply-To: <20200624113452.54b72fcc@canb.auug.org.au>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 24 Jun 2020 15:47:49 +1000
Message-ID: <CAPM=9tx5b1RaN5R4awqQ-BFpDrEZL1z05ZFv2MnGGS2t3mpBhQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Jun 2020 at 11:36, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 17 Jun 2020 10:59:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: In function 'amdgpu_amdkfd_gpuvm_free_memory_of_gpu':
> > drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1357:2: error: implicit declaration of function 'drm_gem_object_put_unlocked'; did you mean 'drm_gem_object_put_locked'? [-Werror=implicit-function-declaration]
> >  1357 |  drm_gem_object_put_unlocked(&mem->bo->tbo.base);
> >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |  drm_gem_object_put_locked
> >
> > Caused by commit
> >
> >   ab15d56e27be ("drm: remove transient drm_gem_object_put_unlocked()")
> >
> > interacting with commit
> >
> >   fd9a9f8801de ("drm/amdgpu: Use GEM obj reference for KFD BOs")
> >
> > from Linus' tree.
> >
> > I have applied the following merge fix up patch for today.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 17 Jun 2020 10:55:32 +1000
> > Subject: [PATCH] drm/amdgpu: remove stray drm_gem_object_put_unlocked
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > index b91b5171270f..9015c7b76d60 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > @@ -1354,7 +1354,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
> >       }
> >
> >       /* Free the BO*/
> > -     drm_gem_object_put_unlocked(&mem->bo->tbo.base);
> > +     drm_gem_object_put(&mem->bo->tbo.base);
> >       mutex_destroy(&mem->lock);
> >       kfree(mem);
> >
> > --
> > 2.26.2
>
> This fix is now needed when I merge the drm tree :-(
>
> Given that the drm tree is based on v5.8-rc2 and the commit from Linus'
> tree above was merged before v5.8-rc1, the above patch should be
> applied to the drm tree (and should have been part of the patch that
> merged the drm-misc tree).  I am a bit suprised that the drm tree
> currently passes CI.

My bad, my local builds passed, as I had made the change but forgot
the commit --amend

Pushed out a new head with it in it now.

Dave.
