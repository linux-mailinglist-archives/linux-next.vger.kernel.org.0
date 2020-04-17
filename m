Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7951AD886
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 10:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgDQI24 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 04:28:56 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51202 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729166AbgDQI2z (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 04:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587112132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mJ8xriwhJnwxVRszo7sZYDjt+bqPl2dFP/ChGE8P0zA=;
        b=dQ5tQf9TN1/lkub+aQ2RfjRmfvoC4+vTE6TdcAN8yRvGUa/QX+gKMkCmJFQUXjfS6s6omc
        362gN5Wb1fXtQOGnFZ8gfAyZ4Q16FNeEaZCfvep5onP8ZcZkWCMHnCcYMvTT4PTns1kMJ9
        TNJjHKJPUDISL4143MLbWvY/QV/ckoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-cXsv72LzNlWTQ1QQsLM6Gw-1; Fri, 17 Apr 2020 04:28:51 -0400
X-MC-Unique: cXsv72LzNlWTQ1QQsLM6Gw-1
Received: by mail-wr1-f72.google.com with SMTP id f15so642558wrj.2
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 01:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mJ8xriwhJnwxVRszo7sZYDjt+bqPl2dFP/ChGE8P0zA=;
        b=Kv1gITS4x7JnVPUZeRE7VyjD8jOPB86Pct8p1O416RZYtAD7qsyTHPnQAci/daX/Bj
         LnK3pROQBzHA17XnFh7s87NFgoHLxXYO45O5kaq3R+L7Yodhk5TpC6Rb0daxI7aVQOOY
         UjPIik7YU6Sp6S6+dUgzGD44L8ZnAb5YfldGtInI82vp5uqdK7JkXAgdYiReRyU3DqjO
         2qj225KetbS8UWS7wxyStTY1Gg05b+gWm3wJ1Mkzj1l3yNSa4yyuZQQ64j0TvgFMR+9Q
         XF3cOAS9VXlQ5/DF0WncD2q6HsgqiX6BFLFluqaH0Zwnsn5r//fKmzA6j+1M22VsaGem
         xDtw==
X-Gm-Message-State: AGi0Pub6wgA4omBfzDURS6jTUwgxaMNMHzB5cPn0VIvw6q5AFBTLomaE
        /7gZhXcS7KytVQecS37ptlmzLOEJshSK7aYxNHmyNyMTafm0n1lKgMgz547szxGp3X9POtqdOXF
        W5eRxUppHUTY62uZuySW4Mw==
X-Received: by 2002:a05:600c:2c04:: with SMTP id q4mr2078497wmg.7.1587112130080;
        Fri, 17 Apr 2020 01:28:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2Sn7FUvpE07r59sGuE5XHGLLO0BakznVfq9gjnT4uADElM12aSKCTNB609s6nmfxAJ2jCoQ==
X-Received: by 2002:a05:600c:2c04:: with SMTP id q4mr2078477wmg.7.1587112129750;
        Fri, 17 Apr 2020 01:28:49 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id u7sm7319215wmg.41.2020.04.17.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 01:28:49 -0700 (PDT)
Date:   Fri, 17 Apr 2020 04:28:46 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio Perez Martin <eperezma@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] tools/virtio: Reset index in virtio_test --reset.
Message-ID: <20200417042551-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-8-eperezma@redhat.com>
 <20200416183324-mutt-send-email-mst@kernel.org>
 <CAJaqyWcBTnXvkzaqfSOWODK=+jddeVpee-4ZuqfWc+zj0UsZLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWcBTnXvkzaqfSOWODK=+jddeVpee-4ZuqfWc+zj0UsZLA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 09:04:04AM +0200, Eugenio Perez Martin wrote:
> On Fri, Apr 17, 2020 at 12:34 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Apr 16, 2020 at 09:56:42AM +0200, Eugenio Pérez wrote:
> > > This way behavior for vhost is more like a VM.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >
> > I dropped --reset from 5.7 since Linus felt it's unappropriate.
> > I guess I should squash this in with --reset?
> >
> 
> Yes please.
> 
> If you prefer I can do it using the base you want, so all commits
> messages are right.
> 
> Thanks!

OK so I dropped new tests from vhost for now, pls rebased on
top of that.

Thanks!

> > > ---
> > >  tools/virtio/virtio_test.c | 33 ++++++++++++++++++++++++++-------
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> > > index 18d5347003eb..dca64d36a882 100644
> > > --- a/tools/virtio/virtio_test.c
> > > +++ b/tools/virtio/virtio_test.c
> > > @@ -20,7 +20,6 @@
> > >  #include "../../drivers/vhost/test.h"
> > >
> > >  #define RANDOM_BATCH -1
> > > -#define RANDOM_RESET -1
> > >
> > >  /* Unused */
> > >  void *__kmalloc_fake, *__kfree_ignore_start, *__kfree_ignore_end;
> > > @@ -49,6 +48,7 @@ struct vdev_info {
> > >
> > >  static const struct vhost_vring_file no_backend = { .fd = -1 },
> > >                                    backend = { .fd = 1 };
> > > +static const struct vhost_vring_state null_state = {};
> > >
> > >  bool vq_notify(struct virtqueue *vq)
> > >  {
> > > @@ -174,14 +174,19 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
> > >       unsigned len;
> > >       long long spurious = 0;
> > >       const bool random_batch = batch == RANDOM_BATCH;
> > > +
> > >       r = ioctl(dev->control, VHOST_TEST_RUN, &test);
> > >       assert(r >= 0);
> > > +     if (!reset_n) {
> > > +             next_reset = INT_MAX;
> > > +     }
> > > +
> > >       for (;;) {
> > >               virtqueue_disable_cb(vq->vq);
> > >               completed_before = completed;
> > >               started_before = started;
> > >               do {
> > > -                     const bool reset = reset_n && completed > next_reset;
> > > +                     const bool reset = completed > next_reset;
> > >                       if (random_batch)
> > >                               batch = (random() % vq->vring.num) + 1;
> > >
> > > @@ -224,10 +229,24 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
> > >                       }
> > >
> > >                       if (reset) {
> > > +                             struct vhost_vring_state s = { .index = 0 };
> > > +
> > > +                             vq_reset(vq, vq->vring.num, &dev->vdev);
> > > +
> > > +                             r = ioctl(dev->control, VHOST_GET_VRING_BASE,
> > > +                                       &s);
> > > +                             assert(!r);
> > > +
> > > +                             s.num = 0;
> > > +                             r = ioctl(dev->control, VHOST_SET_VRING_BASE,
> > > +                                       &null_state);
> > > +                             assert(!r);
> > > +
> > >                               r = ioctl(dev->control, VHOST_TEST_SET_BACKEND,
> > >                                         &backend);
> > >                               assert(!r);
> > >
> > > +                             started = completed;
> > >                               while (completed > next_reset)
> > >                                       next_reset += completed;
> > >                       }
> > > @@ -249,7 +268,9 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
> > >       test = 0;
> > >       r = ioctl(dev->control, VHOST_TEST_RUN, &test);
> > >       assert(r >= 0);
> > > -     fprintf(stderr, "spurious wakeups: 0x%llx\n", spurious);
> > > +     fprintf(stderr,
> > > +             "spurious wakeups: 0x%llx started=0x%lx completed=0x%lx\n",
> > > +             spurious, started, completed);
> > >  }
> > >
> > >  const char optstring[] = "h";
> > > @@ -312,7 +333,7 @@ static void help(void)
> > >               " [--no-virtio-1]"
> > >               " [--delayed-interrupt]"
> > >               " [--batch=random/N]"
> > > -             " [--reset=random/N]"
> > > +             " [--reset=N]"
> > >               "\n");
> > >  }
> > >
> > > @@ -360,11 +381,9 @@ int main(int argc, char **argv)
> > >               case 'r':
> > >                       if (!optarg) {
> > >                               reset = 1;
> > > -                     } else if (0 == strcmp(optarg, "random")) {
> > > -                             reset = RANDOM_RESET;
> > >                       } else {
> > >                               reset = strtol(optarg, NULL, 10);
> > > -                             assert(reset >= 0);
> > > +                             assert(reset > 0);
> > >                               assert(reset < (long)INT_MAX + 1);
> > >                       }
> > >                       break;
> > > --
> > > 2.18.1
> >

