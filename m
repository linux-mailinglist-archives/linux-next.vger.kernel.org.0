Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00DF2FFD40
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 08:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbhAVHSv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 02:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbhAVHSv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jan 2021 02:18:51 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4E4C061756
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 23:18:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id x71so5033469oia.9
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 23:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBop7RTwFZUlkXdwz2L/SZMu0KIaBvM9tTFwilxFZIE=;
        b=ESKN50Qx1jWj4eYZ4nVBlkkf25dGN8tnEg/svLx1fdiY7CZHRVwBbTrEyaVoCiVwfM
         /WKGgShTUfOsu2mGe1lpeS2aJFf7u+cKNTOW7DzlKE6RjcUcPc6t+0e0S4/W5e7x9wjL
         MknetX89AQ4UC9FvHZrPNmqgNo8AJoPNwB7lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBop7RTwFZUlkXdwz2L/SZMu0KIaBvM9tTFwilxFZIE=;
        b=OyE+gnKB4phV0825B/S1SW982cody59PjJP2+uvapzB6zRo/7uPB5vK+swr3Dr9ZL1
         hgwXWjiOoxibl6LPzUkjSTfF5cBwK5n0OBVBhezmbjzn2V2tODSiSStazHs96YTCM8oE
         wlnZAckQKTaaq584PMBHaPtNjG56cvGERCzPFFXwFatwHNokkHUKXGYbZQt34+u+aSaD
         FC2hojDk5/ExT1e2Q2V0o4sTSczgwf3xWLdRJE/D3UjaMqFUzHZQMCQTCLiCDrQ60D/M
         2j8J1fqYvqMypiJtaBu9CFg70CKJux8n3GGEc+lDtE1gfymvvipeUOv5W97PU3RlAU5V
         giww==
X-Gm-Message-State: AOAM532eIBkhw88WHlyGgW7/GLsqX9hNJuQAQ4ygGEVr70ePPi01hudk
        QOPsHxQ3BSXkK/58MMLFBAHvYvnz/NJZSyuncHE8qA==
X-Google-Smtp-Source: ABdhPJxhcoMkh/eQ09cpexkSmm1MY4WiNK1KKSNsTW/U0VYpD8AAYcqLTNNLivy7TLGo86ft5ohCg9Wh1WRf2uAD+fk=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr2453097oie.128.1611299889390;
 Thu, 21 Jan 2021 23:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20210122115918.63b56fa1@canb.auug.org.au>
In-Reply-To: <20210122115918.63b56fa1@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 22 Jan 2021 08:17:58 +0100
Message-ID: <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 22, 2021 at 1:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> Maybe introduced by commit
>
>   4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")

Hm that has been in drm-intel-gt-next for a few days, is that tree not
in linux-next?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
