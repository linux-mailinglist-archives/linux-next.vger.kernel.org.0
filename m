Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386619BBE5
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2019 07:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfHXFGV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Aug 2019 01:06:21 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42923 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfHXFGV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Aug 2019 01:06:21 -0400
Received: by mail-lj1-f172.google.com with SMTP id l14so10650648ljj.9
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 22:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b54ed8P+GOfbb9XCrH1tk9TTfO2Mo3ikOCutAZLr98I=;
        b=KxTepgc0UP2zRQaxxNfC1vKUfrPn9sfTF5/1Lyx+xcNyD5INsLgRMhffR8SxBPqD/T
         WkI4TF5y0JldI1PiHmK7wHAJaj+faas1ytTTrrnyC5SKDZuguGEpJPsQ+PH3A8wab4Dm
         mGq5TGnru4EVLJRjea6qkCKY1ChtItoEPy2hpeLKyqZw7GOopmP+1Ap6/6DY962hC5t3
         ACe3tA0hDVyiQooncb36Blv6dzFfHObbymrENDwtuq+HhK0rET1r5OAwIkzDanAhAccu
         eryX16z5lTBey5TUgj9mgk+Zq1ciUkBQswF87mf4mRzAUaJYCgREmiaIs/fGuoARNMzq
         cHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b54ed8P+GOfbb9XCrH1tk9TTfO2Mo3ikOCutAZLr98I=;
        b=uBktARrG3zFJzrL04d8f8qfRgEqFUC0Qw5kQQUfR3l9Z8nUh/HrldOToWXDFauHQ0Y
         8UGQEUPf/KMhpXygO7eGuKyuk27f7vsiXcSt5iz9cY9wN9FNjHkb/ZalxoYjBLcDdZrq
         +RSHVvxaR60tXVz2aigkQ5Gq57uXQ3b8bjNAtz6X7qM+Hr9XefkoL3k3WlbLNq79Gb2D
         8J+J/Q9l+IDAXfu95+2FwO7YKfhESXkx2MNTYqbyH7xlpWjSdLxVNPz1j9fx2JG2YlDq
         wV3BNdyGxR+1rpmAMuBU5iFd72yzbjSI1HWH874n4v3yLdtOes3SL/us6Tqslj05XpYF
         +3OQ==
X-Gm-Message-State: APjAAAX/WPKREGJtoojl/Xq+jfGNbvX6gANaDGymf+Zu+QFIWclacguq
        HxQZtLzxyrHKCwNacXMMkIfA63YaAQWp3eoXFOY=
X-Google-Smtp-Source: APXvYqzE9ZELWFmem42Dlt+IaOJCFbhzPxO80m1Y/MB1CAh+9g2qYs2Iw0R6rqR9mI9vkf//LxTUvIBCYQHrW62ITy8=
X-Received: by 2002:a2e:6342:: with SMTP id x63mr4844822ljb.95.1566623178548;
 Fri, 23 Aug 2019 22:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com> <20190824135300.23a5fcb4@canb.auug.org.au>
In-Reply-To: <20190824135300.23a5fcb4@canb.auug.org.au>
From:   Dave Airlie <airlied@gmail.com>
Date:   Sat, 24 Aug 2019 15:06:07 +1000
Message-ID: <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
Subject: Re: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        linux-next <linux-next@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 24 Aug 2019 at 13:53, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Fri, 23 Aug 2019 17:00:39 -0700 (PDT) "kernelci.org bot" <bot@kernelci.org> wrote:
> >
> >     2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declaration of function 'dma_set_max_seg_size'; did you mean 'drm_rect_adjust_size'? [-Werror=implicit-function-declaration]
> >     2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declaration of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=implicit-function-declaration]
> >     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
> >     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declaration of function 'dma_set_max_seg_size' [-Werror,-Wimplicit-function-declaration]
> >     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
> >     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declaration of function 'DMA_BIT_MASK' [-Werror,-Wimplicit-function-declaration]
>
> Caused by commit
>
>   070955558e82 ("drm/mediatek: set DMA max segment size")
>
> (from the drm-fixes tree) which should have included linux/dma-mapping.h
>

must be some Kconfig cases, it builds here fine (in -fixes at least).

Maybe something in next whacked the include file.

I'll add the include anyways and send to Linus,

Dave.

> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
