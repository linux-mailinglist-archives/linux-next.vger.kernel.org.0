Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2196CB4598
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 04:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391292AbfIQCno (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 22:43:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43627 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbfIQCno (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 22:43:44 -0400
Received: by mail-io1-f66.google.com with SMTP id v2so3884644iob.10;
        Mon, 16 Sep 2019 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8i6y9BcswUwxDG8PRuSI4um6ADi5O8L1cEP8Y4YnQbM=;
        b=CuA6rqyv0kHYgLtz1aSpPSoR7yFN4Eza0QUI6d1In3kgKq15yj+7RO4K6Ow4DyWyg/
         945CDD8FjbZlskpwVxaj2g2KdG0DhzsPCvbnwVe605mcLMVt9KOS1ok/xoRE6LO0CvKR
         shqWF25DsggrCMKpzFOUjWQyW51QMa8n6uAebwgZ6ta4HtPryiXJ4bMEepplWhr99COe
         jNw70hW2Is30/OUAEuOPub7AYYNtpYHMRGTMyWFt9wRKAIN5SDelH0grgitCTMkkKg4+
         i23wAAc0W60MS8j3HzuPqL8Wy45ZeFschcc++5hls0dgX8JGmlISGyCoaCr8Py/J0aRs
         l5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8i6y9BcswUwxDG8PRuSI4um6ADi5O8L1cEP8Y4YnQbM=;
        b=Zn7HhcTo1/+/OTFO5n4IeywfzmgUzv+DTFKKoqUyBLRoxKrisJ2nZYGp+b8QaG8gG/
         Cy+mLa1BFAzVdNnpfHe5XuX0FWdTZHcnBNLNfP9KA+GnF2rz6lJimLZhA2xEgR9AVs+J
         nzVwAdqH+B9F+NXKyyW2tY/KmClqMBjEdeKEpWKbHoDDEqyeqsP3Z7nUeCAUse8Osw+u
         vKgRW5vKP0BKuOHioVfLTcVsAk7QtwAitizn9tzi6lBjtRpnLgNEh+m6yZZAGiL6t5Pm
         plAGjnQjCoW3akRGkg5avXB9EXCThc34OkZlYH7LkZIwxKfPpZF/h+wV0yPYQGguwHc3
         1CFw==
X-Gm-Message-State: APjAAAVg2ZkrcqQfIVuPTSjKZ9azjhvvPyzTXAoRz1mOyDVUVoWaONJJ
        2GDZj6O23Kl82kuxtBgGpYjSyBW/U8mzcZCWOdY=
X-Google-Smtp-Source: APXvYqzeJ+TNQWUjrodNrq8QcCsOV7BTjocJNcMZELwoxBqqTm0m2jUCi4tBN4jl2viWNfUXSX12dO5NB6pU9tUsgg0=
X-Received: by 2002:a5d:9b02:: with SMTP id y2mr1207664ion.146.1568688223539;
 Mon, 16 Sep 2019 19:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190915211818.GH4352@sirena.co.uk> <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
In-Reply-To: <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
From:   Qiang Yu <yuq825@gmail.com>
Date:   Tue, 17 Sep 2019 10:43:32 +0800
Message-ID: <CAKGbVbvXD1XatAbC=yMO4X3usQSXMqHXCXhycU8afiKez_CHmA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
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

On Mon, Sep 16, 2019 at 1:30 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Sun, Sep 15, 2019 at 2:18 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
>
> Hi Mark,
>
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   drivers/gpu/drm/lima/lima_gem.c
> >
> > between commit:
> >
> >   21670bd78a25001cf8e ("drm/lima: fix lima_gem_wait() return value")
> >
> > from the drm-misc-fixes tree and commit:
> >
> >   52791eeec1d9f4a7e7f ("dma-buf: rename reservation_object to dma_resv")
> >
> > from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Fix looks correct to me. Sorry for not testing my patch with
> linux-next, I'll make sure it at least compiles next time.

This is merge conflict, not compile fail, because linux-next and drm-misc-fixes
are based on different code base, so drm-misc-fixes do not contain latest drm
commits.

This conflict solve change is also OK for me.

Thanks,
Qiang

>
> > diff --cc drivers/gpu/drm/lima/lima_gem.c
> > index b609dc030d6ca,ff3d9acc24fcf..0000000000000
> > --- a/drivers/gpu/drm/lima/lima_gem.c
> > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > @@@ -341,8 -341,8 +341,8 @@@ int lima_gem_wait(struct drm_file *file
> >
> >         timeout = drm_timeout_abs_to_jiffies(timeout_ns);
> >
> > -       ret = drm_gem_reservation_object_wait(file, handle, write, timeout);
> > +       ret = drm_gem_dma_resv_wait(file, handle, write, timeout);
> >  -      if (ret == 0)
> >  +      if (ret == -ETIME)
> >                 ret = timeout ? -ETIMEDOUT : -EBUSY;
> >
> >         return ret;
