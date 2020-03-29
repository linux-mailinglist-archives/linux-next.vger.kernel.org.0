Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DFD196D3D
	for <lists+linux-next@lfdr.de>; Sun, 29 Mar 2020 14:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgC2MUi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 08:20:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:49721 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727935AbgC2MUi (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Mar 2020 08:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585484436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JV+swSpDvLiRyfF8zduIYF+N/77uMAWPzm2YG1hsv6E=;
        b=a2lGXucnr0oYXe/l1KoX6tzXbtnoB/ZFJnr4tTK1ALU2MJ7JwsCTDFk8AjMLYuXgseW+rl
        PygIBWN7fUwuaLIY+3eelsoB2lt/JOzBRFYv/Wif5nK8M79YX9b2KFZ7ctHV0jchl7GcxY
        rmvlQKp8RXB0GlqsKE/EDRRDwaVpFw4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-t0p_RwAnO42vyN0rqX0E6g-1; Sun, 29 Mar 2020 08:20:32 -0400
X-MC-Unique: t0p_RwAnO42vyN0rqX0E6g-1
Received: by mail-qv1-f72.google.com with SMTP id z2so11938784qvw.7
        for <linux-next@vger.kernel.org>; Sun, 29 Mar 2020 05:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JV+swSpDvLiRyfF8zduIYF+N/77uMAWPzm2YG1hsv6E=;
        b=abXcnfwubOMxJlv/YRSCkEmEvzOI/YGRX/UwZAU2NUNjk7ZOUcwlD9Vsl5uyUPO4Cm
         J/iNi56s5nOTp/dovF804IU1Dotl3f0Dcb8VgPM6Z/muL0dKUFjImnvkgFWFCvLkdB4a
         DFCFy+j6h+hy9fXcPy+T5jfn8M53ag0Yyk6zYM6WeqL9hwaI986NACiw0sa2KL8OLjFX
         Ir5r6Svts8upFGdSoE6jt+r7UAw+SP1sR8JvECu7oM51xrBdb8XaHH7cJ7QbgXy0gGPa
         v3uLVhAaQIqWBhQ3rluhLrT8mfSRdmLdOamNAAFfWMCwpDQB37nWy8nrYBdPwTIF1JBr
         kpTw==
X-Gm-Message-State: ANhLgQ3Xi03Iysk2sxgtz2wfW+SHi9pqvB3h5OGMfpTbBzfsKL5E9QHY
        mazLB6PnHSbuHf1VaGnpMBl7cbaBeylCsmjEMK+D7szb8P6sSSPuPV9/EzNPDlGUsJ4/nKrjcmQ
        fJwSobIM4qWlHRxTQQvfcENgK8facXvDrrLa5gA==
X-Received: by 2002:a37:648:: with SMTP id 69mr7654541qkg.353.1585484432325;
        Sun, 29 Mar 2020 05:20:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtuKBV3ksCZe4Rr2ouEcNs/zf3hutRMu9QCFjAIZrqsuNifj5DJq+Vsezn48JCHiYyh/9SYn2/cqGNyipdDUvA=
X-Received: by 2002:a37:648:: with SMTP id 69mr7654519qkg.353.1585484432049;
 Sun, 29 Mar 2020 05:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200329113359.30960-1-eperezma@redhat.com> <20200329074023-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200329074023-mutt-send-email-mst@kernel.org>
From:   Eugenio Perez Martin <eperezma@redhat.com>
Date:   Sun, 29 Mar 2020 14:19:55 +0200
Message-ID: <CAJaqyWdO8CHuWFJv+TRgYJ7a3Cb06Ln3prnQZs69L1PPw4Rj1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] vhost: Reset batched descriptors on SET_VRING_BASE call
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Mar 29, 2020 at 1:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Mar 29, 2020 at 01:33:53PM +0200, Eugenio P=C3=A9rez wrote:
> > Vhost did not reset properly the batched descriptors on SET_VRING_BASE =
event. Because of that, is possible to return an invalid descriptor to the =
guest.
> > This series ammend this, and creates a test to assert correct behavior.=
 To do that, they need to expose a new function in virtio_ring, virtqueue_r=
eset_free_head. Not sure if this can be avoided.
>
> Question: why not reset the batch when private_data changes?
> At the moment both net and scsi poke at private data directly,
> if they do this through a wrapper we can use that to
> 1. check that vq mutex is taken properly
> 2. reset batching
>
> This seems like a slightly better API
>

I didn't do that way because qemu could just SET_BACKEND to -1 and
SET_BACKEND to the same one, with no call to SET_VRING. In this case,
I think that qemu should not change the descriptors already pushed. I
do agree with the interface to modify private_data properly (regarding
the mutex).

However, I can see how your proposal is safer, so we don't even need
to check if private_data is !=3D NULL when we have descriptors in the
batch_descs array. Also, this ioctls should not be in the hot path, so
we can change to that mode anyway.

> >
> > Also, change from https://lkml.org/lkml/2020/3/27/108 is not included, =
that avoids to update a variable in a loop where it can be updated once.
> >
> > This is meant to be applied on top of eccb852f1fe6bede630e2e4f1a121a81e=
34354ab in git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git, and some =
commits should be squashed with that series.
>
> Thanks a lot! I'll apply this for now so Christian can start testing,
> but I'd like the comment above addressed before I push this to Linus.
>
> > Eugenio P=C3=A9rez (6):
> >   tools/virtio: Add --batch option
> >   tools/virtio: Add --batch=3Drandom option
> >   tools/virtio: Add --reset=3Drandom
> >   tools/virtio: Make --reset reset ring idx
> >   vhost: Delete virtqueue batch_descs member
> >   fixup! vhost: batching fetches
> >
> >  drivers/vhost/test.c         |  57 ++++++++++++++++
> >  drivers/vhost/test.h         |   1 +
> >  drivers/vhost/vhost.c        |  12 +++-
> >  drivers/vhost/vhost.h        |   1 -
> >  drivers/virtio/virtio_ring.c |  18 +++++
> >  include/linux/virtio.h       |   2 +
> >  tools/virtio/linux/virtio.h  |   2 +
> >  tools/virtio/virtio_test.c   | 123 +++++++++++++++++++++++++++++++----
> >  8 files changed, 201 insertions(+), 15 deletions(-)
> >
> > --
> > 2.18.1
>

