Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E14B3467
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 07:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfIPFaD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 01:30:03 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40405 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfIPFaD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 01:30:03 -0400
Received: by mail-ot1-f67.google.com with SMTP id y39so34513574ota.7;
        Sun, 15 Sep 2019 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uaOfZgiRYci8brLu6u70UJApCKOz1WkeM0Sygqw8wnU=;
        b=dUaPMDJFgfbOyjiqlaeT54gDZiCJCSwKcGkpSShd2Bdb0E+fFnqdlfyolHVesJCpMs
         W3XA4yH4Y3xF7vw4Rrm3Yq/YvufvF5YCuGx0s4Bx5i2LZ4xkfAVeJLiTSmMJU5Am6g81
         TK0VtTndZobK6Ygt+fyZPeHVCurxCsCTYWKj7nbJRPAt7XwrOr7lDNw2VZtrjY4SbZ5h
         mgSDt+X5ssdM9BYvoupdRoKyL/LS9iDpdLUrlfazIYC/sdA9WYr9llrwSidsRb45A4Il
         X7sBCYO8dEuUdm0itK1/zcH+xLaJc9b5mpz+jKoXgKEdPsNUVd2VXn1GLI6h6FlgeDYp
         FcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uaOfZgiRYci8brLu6u70UJApCKOz1WkeM0Sygqw8wnU=;
        b=qmah2Z3pYWgi8GuuPcWrlf3TyXh5oDr1H+ajKxAviV5JbjNLF/nTsVrQe7ipFq1nbn
         EgECcU4ekNjj+fTG1O3BdZiJUvs828BejvIrzPwt2q4IsfKhPEg8IaAgesxc04evsoOC
         Kg8R8iD2jklxyxJQgC3QhhDia1BFjEl6J0P8X4VP5ke33BK7oQdhAf+iqWuDmoIkhfxA
         mkTnQb+Izu6msmYXNK7GOKDTgr6ZIpZQfMisKn8aDRA1skrv0eKDIQ8Y+YbofhsvVeoE
         6McCsnmP4dI+rT/VASGd7bT0mdPeIibNlXEoWZSToyxfttCCYCWzYp+fuSP2D3Qp9trG
         vRPA==
X-Gm-Message-State: APjAAAXy7guzBg76CwtTGnz2Sztg/4Uw82nMCxjYbuVNah/EQcXjPvr2
        m5KqWPNNhVQ20HVS31Jd2kqxZGG+SnzVAhZa2nKxVg==
X-Google-Smtp-Source: APXvYqx9+/nthixP8A0pvQOeOP0zB3tjJ0mrqn4bOMi28alYMwtwVeyWhFVx9mdDHRY0hI1r9dz1fpHzngfdU0hjWqA=
X-Received: by 2002:a9d:7859:: with SMTP id c25mr18945488otm.371.1568611801814;
 Sun, 15 Sep 2019 22:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190915211818.GH4352@sirena.co.uk>
In-Reply-To: <20190915211818.GH4352@sirena.co.uk>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Sun, 15 Sep 2019 22:29:35 -0700
Message-ID: <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Qiang Yu <yuq825@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Sep 15, 2019 at 2:18 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,

Hi Mark,

> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/lima/lima_gem.c
>
> between commit:
>
>   21670bd78a25001cf8e ("drm/lima: fix lima_gem_wait() return value")
>
> from the drm-misc-fixes tree and commit:
>
>   52791eeec1d9f4a7e7f ("dma-buf: rename reservation_object to dma_resv")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Fix looks correct to me. Sorry for not testing my patch with
linux-next, I'll make sure it at least compiles next time.

> diff --cc drivers/gpu/drm/lima/lima_gem.c
> index b609dc030d6ca,ff3d9acc24fcf..0000000000000
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@@ -341,8 -341,8 +341,8 @@@ int lima_gem_wait(struct drm_file *file
>
>         timeout = drm_timeout_abs_to_jiffies(timeout_ns);
>
> -       ret = drm_gem_reservation_object_wait(file, handle, write, timeout);
> +       ret = drm_gem_dma_resv_wait(file, handle, write, timeout);
>  -      if (ret == 0)
>  +      if (ret == -ETIME)
>                 ret = timeout ? -ETIMEDOUT : -EBUSY;
>
>         return ret;
