Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109BF1ADD47
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 14:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgDQMZQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 08:25:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44751 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728751AbgDQMZP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 08:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587126314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6SYQc5vlhk7XbIz6vBeT6lWe63ZtgKx7c9HrEfLpD3c=;
        b=G3oqAw238qdty2bAz0iFINi0vj7+gviPks4SvXAX/bGWppn7E9LrE12B+8FHQ575F4lVud
        ZlNjeFvxU41u4HPXbt3Gks5caFcdziTJXQXBzPELAcuc0Ay4Rv3d2ZPaafhbb6d2gklb+I
        US58fxvKcmPQ25V6bBSomGmydATrNzM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-gu9bGgRfPhGj8DBXDqhIag-1; Fri, 17 Apr 2020 08:25:12 -0400
X-MC-Unique: gu9bGgRfPhGj8DBXDqhIag-1
Received: by mail-qv1-f72.google.com with SMTP id ck5so2008540qvb.18
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 05:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6SYQc5vlhk7XbIz6vBeT6lWe63ZtgKx7c9HrEfLpD3c=;
        b=ViFRkicElEyYhqQnXXadAIRIfqQAT/wO25cErN+062UAz/YVk5MBZMmP1YpaFBubry
         l7KFT891K7KOR3fV/TmE4qYL7aXPkGuMn8vOorX5x4P/LikZ7Dd24xd95tKFWdnQN8g3
         dp3okhVnWXdeJy0vlGu0TVCdfxqJLEeGny981QNVwmpipf+w4BzH2Mrpv1desobXRl/O
         IJjS/0bUT068MUN7DPNpIdGd/RCUbbPzUDyKDbHrcTh1NfNPJ2UZMS8KiBof4fE56VhL
         e3UeMjPUXcIKkm2qojqSgHR22x2NXhFpK+V4i/It3d1EYl2IAsFpKqOLnNDgZEJWlM3a
         RNQw==
X-Gm-Message-State: AGi0PuZhQ4C5bcjL//2DSa+XCSjXjRqkUdRd9u5Gz/ileFNYLRKQ93Ln
        rft0sinNXLX90jug8X2KEjtnXsZG04SplvgHTlhRstJEpSJE3K1hWqiHDoSYbu8ehG5wrvXdlT+
        ExMJ1xrArNVtoDBfwkg2gZpRyGc/354hmAfX8KA==
X-Received: by 2002:a37:7786:: with SMTP id s128mr2986059qkc.497.1587126307611;
        Fri, 17 Apr 2020 05:25:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypKBfWZGJeymkb2lYpO2MfszDQFTMR0yiJ30RKxU2YF4NbhBMAq5PZqSKtDRB05J3D3z30Fv7G/YFuiyJNOVrTM=
X-Received: by 2002:a37:7786:: with SMTP id s128mr2986028qkc.497.1587126307322;
 Fri, 17 Apr 2020 05:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200416075643.27330-1-eperezma@redhat.com> <20200416075643.27330-6-eperezma@redhat.com>
 <20200416183244-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200416183244-mutt-send-email-mst@kernel.org>
From:   Eugenio Perez Martin <eperezma@redhat.com>
Date:   Fri, 17 Apr 2020 14:24:31 +0200
Message-ID: <CAJaqyWcuxG03+J+BW=fPb=JFKLPi0h5sRGv9cjWv63eyspS4Qg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] tools/virtio: Use __vring_new_virtqueue in virtio_test.c
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 12:33 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Apr 16, 2020 at 09:56:40AM +0200, Eugenio P=C3=A9rez wrote:
> > As updated in ("2a2d1382fe9d virtio: Add improved queue allocation API"=
)
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Pls add motivation for these changes.
>

The original motivation was to make code as close as possible to
virtio_net. Also, it skips a (probably not expensive) initialization
in vring_new_virtqueue.

With the recent events, I think that this could be useful to test when
userspace and kernel use different struct layout, maybe with some
sanitizer. I can drop it if you don't see it the same way (or if I
didn't understand the problem and this does not help).

Thanks!

> > ---
> >  tools/virtio/virtio_test.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> > index 1d5144590df6..d9827b640c21 100644
> > --- a/tools/virtio/virtio_test.c
> > +++ b/tools/virtio/virtio_test.c
> > @@ -106,10 +106,9 @@ static void vq_info_add(struct vdev_info *dev, int=
 num)
> >       assert(r >=3D 0);
> >       memset(info->ring, 0, vring_legacy_size(num, 4096));
> >       vring_legacy_init(&info->vring, num, info->ring, 4096);
> > -     info->vq =3D vring_new_virtqueue(info->idx,
> > -                                    info->vring.num, 4096, &dev->vdev,
> > -                                    true, false, info->ring,
> > -                                    vq_notify, vq_callback, "test");
> > +     info->vq =3D
> > +             __vring_new_virtqueue(info->idx, info->vring, &dev->vdev,=
 true,
> > +                                   false, vq_notify, vq_callback, "tes=
t");
> >       assert(info->vq);
> >       info->vq->priv =3D info;
> >       vhost_vq_setup(dev, info);
> > --
> > 2.18.1
>

