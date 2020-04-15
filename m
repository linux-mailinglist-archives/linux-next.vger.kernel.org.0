Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947C21AB0EE
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 21:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407638AbgDOTGu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 15:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1415254AbgDOSdg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 14:33:36 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8341EC061A0C
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 11:33:36 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id z17so894751oto.4
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IjN2cfckWwRkfbS7XU00KIUMIKLX4Wdlf2r7BY/MpoU=;
        b=GhWnPlDj+Qectn7Cu5WYof7/rXloObaEIEmna79tfBWA+K795pqczniB8/SOm51I4h
         EWL0EjEsAT5LU1vO2xzE3YmU5HqoB4hynATLCpHoEgNpI79rFwedUISkDgQD4VgekmFt
         o1cg4JnINwDv6CK7So8A461BxLidoRIXhd974=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjN2cfckWwRkfbS7XU00KIUMIKLX4Wdlf2r7BY/MpoU=;
        b=ptutX8nF82Nf0x2CRx9R+6p2JwuiQvMhJBsIo2py8Qv1bmMJoIY2Wah6CPnY8IdA/+
         edeZ/UDQV8sLZR9e7IQcY5x04KriP/sdvR5gyVSuBMSTPouA0yALFiQ+WkJwoPYefezP
         NNq7M18YSMesq1VtZqgdSyVCyzk7S1OSx/s9ptx5kxRI1O/RH994Zd4Jc1O14a92joLq
         cA8GmvnpfmQAKi7hXUggJgbqbZ+h1P4PVq+TI4iIliihh5/EmWwd1EV8xfPCLq27rm0F
         zHvZlhfQQCk+nwCGorm+yywpafkXmRLrzVddPUCNzloKpR+yulJC3xeT4sPHHkxAYraH
         355Q==
X-Gm-Message-State: AGi0PuaYnsZAbyfJUFR3cA1C1ul2w5vEIUh4hweNdRig9tSUe+lyGGRV
        M6m+kdgSQjzRcozIgs7cJyUgnOuwqUYoRRrqZsuT7A==
X-Google-Smtp-Source: APiQypLcoTeoZg2JhqqjZ+E6GpmzTcaeVkonpPRR43cBhK1zuJHwCOmsI30WxF1xVHKBxmeHXXziHmbzQQJ468rh3Gk=
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr14519714ota.303.1586975615775;
 Wed, 15 Apr 2020 11:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <202004150853.FD574CDD@keescook> <20200415171901.23914-1-andrzej.p@collabora.com>
In-Reply-To: <20200415171901.23914-1-andrzej.p@collabora.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 15 Apr 2020 20:33:24 +0200
Message-ID: <CAKMK7uG3zQBVh_b+mwz4o8x29cWHnsPaR9kvP9OtCFisSUgeYg@mail.gmail.com>
Subject: Re: [PATCH] drm: Don't free a struct never allocated by drm_gem_fb_init()
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     dri-devel@lists.freedsktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        James Qian Wang <james.qian.wang@arm.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        linux-next <linux-next@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 15, 2020 at 7:19 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> drm_gem_fb_init() is passed the fb and never allocates it, so it should be
> not the one freeing it. As it is now the second call to kfree() is possible
> with the same fb. Coverity reported the following:
>
> *** CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
> /drivers/gpu/drm/drm_gem_framebuffer_helper.c: 230 in drm_gem_fb_create_with_funcs()
> 224             fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> 225             if (!fb)
> 226                     return ERR_PTR(-ENOMEM);
> 227
> 228             ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
> 229             if (ret) {
> vvv     CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
> vvv     Calling "kfree" frees pointer "fb" which has already been freed. [Note: The source code implementation of the function has been overridden by a user model.]
> 230                     kfree(fb);
> 231                     return ERR_PTR(ret);
> 232             }
> 233
> 234             return fb;
> 235     }
>
> drm_gem_fb_init_with_funcs() calls drm_gem_fb_init()
> drm_gem_fb_init() calls kfree(fb)
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492613 ("Memory - corruptions")
> Fixes: f2b816d78a94 ("drm/core: Allow drivers allocate a subclass of struct drm_framebuffer")
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index cac15294aef6..ccc2c71fa491 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -76,10 +76,8 @@ drm_gem_fb_init(struct drm_device *dev,
>                 fb->obj[i] = obj[i];
>
>         ret = drm_framebuffer_init(dev, fb, funcs);
> -       if (ret) {
> +       if (ret)
>                 drm_err(dev, "Failed to init framebuffer: %d\n", ret);
> -               kfree(fb);
> -       }
>
>         return ret;
>  }
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
