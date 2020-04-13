Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225761A685A
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 16:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbgDMOuy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 10:50:54 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46430 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730882AbgDMOuw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 10:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586789450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kr9KTKBU+/+uofMSqlPA49Feo8xCOB4FV94CTTUBStM=;
        b=QEWa1GZ9o4KTolclM69LWpjpY+yg+8D1qRy81DWOJhuwqe78TsqESuCmEjF9P19Nh6EoHl
        HW6BlL4I9YC2Fp9Rz+QbVny9sNXizR9kBRsndZm+5F3T0ZQr1n8SD2QQCZ6E422LYaWJ5I
        t6vWUWtNUG992JBl6vX6S0yKGpV5znY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-VuuJATpSPIuGGZVanZVWLg-1; Mon, 13 Apr 2020 10:50:43 -0400
X-MC-Unique: VuuJATpSPIuGGZVanZVWLg-1
Received: by mail-qv1-f69.google.com with SMTP id v4so8256586qvt.3
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kr9KTKBU+/+uofMSqlPA49Feo8xCOB4FV94CTTUBStM=;
        b=VLU7/9UlWl42Q5YGqawCOdT67cHM8Df0b1cx25ZHrr8LfgQkQW86waG9F2KiEIEO7s
         v/hGptfmv8T9NW35GaY7d3J5u/+0KObszeOxLQqst8YfvHIuAZL8ajNMvoBJcdlIfUbO
         wwfLsT3r66udW9aIPToFXqI8dugJU1TeHB9Zx20e+7dreUrAJ3wREWR4k/IrlwTWIUdK
         ketjryaKGY0SvITJ0F1V2at3boPjCzLVW/PenVLp3TeWmkp31s+GbtYcvbr+VzBeXEZ1
         s8vpqjrMkUiV3HDNiCh/nDFuyzmbTPee0ZjA4upLreNw1GU9yYTvBVKe9cTJKmEg8Jw0
         MZcw==
X-Gm-Message-State: AGi0PuZBy9giNgbn/6cM0MpLYoFd5nMvCSBtnrcWosfUxyhwPdpbFZDq
        7eVZnzcBNl2Axpg9G/ckEfBNJ43t1LN5MC21W94jmvAP3DdrhARYoo6RShEkQCkKDVuNggRuHb9
        RF7SNM+2A6MjKp5jz8fUhu/h9nQlt1ck3HjXxVQ==
X-Received: by 2002:a37:a090:: with SMTP id j138mr17159951qke.168.1586789443343;
        Mon, 13 Apr 2020 07:50:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypIS1bM7/cnw0/cmr0zxcGu/p79bSOTSNpyLGH30P81IUc3vIXTO+mjh49kiiytoU5bQ/OGlrY1RcCqeUjyOqso=
X-Received: by 2002:a37:a090:: with SMTP id j138mr17159916qke.168.1586789443027;
 Mon, 13 Apr 2020 07:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200403165119.5030-1-eperezma@redhat.com> <20200413071044-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200413071044-mutt-send-email-mst@kernel.org>
From:   Eugenio Perez Martin <eperezma@redhat.com>
Date:   Mon, 13 Apr 2020 16:50:06 +0200
Message-ID: <CAJaqyWcOmzxfOodudSjrZa1SeYDZKiO3MFMy_w44cL_eaBhYDA@mail.gmail.com>
Subject: Re: [PATCH 0/8] tools/vhost: Reset virtqueue on tests
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 13, 2020 at 1:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Apr 03, 2020 at 06:51:11PM +0200, Eugenio P=C3=A9rez wrote:
> > This series add the tests used to validate the "vhost: Reset batched
> > descriptors on SET_VRING_BASE call" series, with a small change on the
> > reset code (delete an extra unneded reset on VHOST_SET_VRING_BASE).
> >
> > They are based on the tests sent back them, the ones that were not
> > included (reasons in that thread). This series changes:
> >
> > * Delete need to export the ugly function in virtio_ring, now all the
> > code is added in tools/virtio (except the one line fix).
> > * Add forgotten uses of vhost_vq_set_backend. Fix bad usage order in
> > vhost_test_set_backend.
> > * Drop random reset, not really needed.
> > * Minor changes updating tests code.
> >
> > This serie is meant to be applied on top of
> > 5de4e0b7068337cf0d4ca48a4011746410115aae in
> > git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.
>
> Is this still needed?

("tools/virtio: fix virtio_test.c") indentation is actually cosmetic.
("vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl")
just avoid to clean batches descriptors for a third time (they are
cleaned on backend removal and addition).

("vhost: Fix bad order in vhost_test_set_backend at enable") is
actually a fix, the test does not work properly without it. And
("tools/virtio: Reset index in virtio_test --reset.") Makes the test
work more similar than the actual VM does in a reset.

("tools/virtio: Use __vring_new_virtqueue in virtio_test.c") and
("tools/virtio: Extract virtqueue initialization in vq_reset") are
convenience commits to reach the previous two.

Lastly, ("tools/virtio: Use tools/include/list.h instead of stubs")
just removes stub code, I did it when I try to test vdpa code and it
seems to me a nice to have, but we can drop it from the patchset if
you don't see that way.

> The patches lack Signed-off-by and
> commit log descriptions, reference commit Ids without subject.
> See Documentation/process/submitting-patches.rst
>

Sorry, I will try to keep an eye on that from now on. I will send a v2
with Signed-off-by and extended descriptions if you see it ok.

Thanks!

> > Eugenio P=C3=A9rez (8):
> >   tools/virtio: fix virtio_test.c indentation
> >   vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl
> >   vhost: Replace vq->private_data access by backend accesors
> >   vhost: Fix bad order in vhost_test_set_backend at enable
> >   tools/virtio: Use __vring_new_virtqueue in virtio_test.c
> >   tools/virtio: Extract virtqueue initialization in vq_reset
> >   tools/virtio: Reset index in virtio_test --reset.
> >   tools/virtio: Use tools/include/list.h instead of stubs
> >
> >  drivers/vhost/test.c        |  8 ++---
> >  drivers/vhost/vhost.c       |  1 -
> >  tools/virtio/linux/kernel.h |  7 +----
> >  tools/virtio/linux/virtio.h |  5 ++--
> >  tools/virtio/virtio_test.c  | 58 +++++++++++++++++++++++++++----------
> >  tools/virtio/vringh_test.c  |  2 ++
> >  6 files changed, 51 insertions(+), 30 deletions(-)
> >
> > --
> > 2.18.1
>

