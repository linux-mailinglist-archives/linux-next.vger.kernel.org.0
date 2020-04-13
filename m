Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEDB11A6874
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 17:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgDMPEV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 11:04:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53607 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728601AbgDMPEU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 11:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586790258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=17t47p62WxVqQ3k2XMIaH3GAgbSI+gMIhNKLJVLPfOE=;
        b=Djc4w4UgDkHjannt/RCFQxnUCuBSDiVuO6SQD91GSPcn5VIs2DnJUcG/twMgSy6Rht0PIZ
        z9J0xmqwR/47ovhSikfFyVPYbK9koEE1XxvxU2UuEJU+qa00kW4JtO5aTEj5uso97IWDFr
        ggFwMHE4+UmZGRpMNU6eurfENwar6Io=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-h5Nr85SnMXCdVq3HNCXR5A-1; Mon, 13 Apr 2020 11:04:16 -0400
X-MC-Unique: h5Nr85SnMXCdVq3HNCXR5A-1
Received: by mail-wm1-f70.google.com with SMTP id s15so2679620wmc.0
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 08:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=17t47p62WxVqQ3k2XMIaH3GAgbSI+gMIhNKLJVLPfOE=;
        b=mK2tc8iIUgHbuDQQcjIa5J/Sf3Jq1HmU0QA5t6tuVq6TV0yTeDQj9SuuWpfZFBxQUc
         1Vg/f+G9jK709ZhslG22ZejRm/YwuE0rguV6o1oZZz33+C/gXIxUgGnd9Cz22iwH0EV3
         oQPAzRavMaeQq+q6mV6vvD1aabSiRPNIoz3ORpiZplZwz/q8C0/OsKyqPLvZr3VImyZ1
         E+9Er2ZUEwIcp9N5OM6B6uz1MUPCYsCgr9I2uormyUZ6gVkfHhbeSjKWCL5cRVjKxGL8
         I8hOvEpcL6gxlxa6/V/C6Nbba3HmZ/zq6VrM0OuCh0n+rKJQzZWCoTVv34+td+z2m3sr
         v6OA==
X-Gm-Message-State: AGi0PuYHTj0/IxEzO5duxin15uz15K/TRsxoPBEvlBx/Du0DOek3OI5t
        ZWEqttLHEyMODEzVYds7JezeO4b5mMkFhl98l4+t4s5HlPJmVKPVLPKWLyDjNoiAyH0Gxw2Odn6
        VVGri9ShpJ5x+vUYaaDE3Rw==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr18217357wrr.131.1586790255100;
        Mon, 13 Apr 2020 08:04:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypLb8EpzCSSDu1/k+4HxGtBRat97HSOUEfq2h0YXRdsfzcIOhO5iu2JTbNNJB4PYUfr8gNiRUg==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr18217333wrr.131.1586790254791;
        Mon, 13 Apr 2020 08:04:14 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id o11sm14764690wme.13.2020.04.13.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 08:04:14 -0700 (PDT)
Date:   Mon, 13 Apr 2020 11:04:11 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio Perez Martin <eperezma@redhat.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 0/8] tools/vhost: Reset virtqueue on tests
Message-ID: <20200413110403-mutt-send-email-mst@kernel.org>
References: <20200403165119.5030-1-eperezma@redhat.com>
 <20200413071044-mutt-send-email-mst@kernel.org>
 <CAJaqyWcOmzxfOodudSjrZa1SeYDZKiO3MFMy_w44cL_eaBhYDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWcOmzxfOodudSjrZa1SeYDZKiO3MFMy_w44cL_eaBhYDA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 13, 2020 at 04:50:06PM +0200, Eugenio Perez Martin wrote:
> On Mon, Apr 13, 2020 at 1:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Apr 03, 2020 at 06:51:11PM +0200, Eugenio Pérez wrote:
> > > This series add the tests used to validate the "vhost: Reset batched
> > > descriptors on SET_VRING_BASE call" series, with a small change on the
> > > reset code (delete an extra unneded reset on VHOST_SET_VRING_BASE).
> > >
> > > They are based on the tests sent back them, the ones that were not
> > > included (reasons in that thread). This series changes:
> > >
> > > * Delete need to export the ugly function in virtio_ring, now all the
> > > code is added in tools/virtio (except the one line fix).
> > > * Add forgotten uses of vhost_vq_set_backend. Fix bad usage order in
> > > vhost_test_set_backend.
> > > * Drop random reset, not really needed.
> > > * Minor changes updating tests code.
> > >
> > > This serie is meant to be applied on top of
> > > 5de4e0b7068337cf0d4ca48a4011746410115aae in
> > > git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.
> >
> > Is this still needed?
> 
> ("tools/virtio: fix virtio_test.c") indentation is actually cosmetic.
> ("vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl")
> just avoid to clean batches descriptors for a third time (they are
> cleaned on backend removal and addition).
> 
> ("vhost: Fix bad order in vhost_test_set_backend at enable") is
> actually a fix, the test does not work properly without it. And
> ("tools/virtio: Reset index in virtio_test --reset.") Makes the test
> work more similar than the actual VM does in a reset.
> 
> ("tools/virtio: Use __vring_new_virtqueue in virtio_test.c") and
> ("tools/virtio: Extract virtqueue initialization in vq_reset") are
> convenience commits to reach the previous two.
> 
> Lastly, ("tools/virtio: Use tools/include/list.h instead of stubs")
> just removes stub code, I did it when I try to test vdpa code and it
> seems to me a nice to have, but we can drop it from the patchset if
> you don't see that way.
> 
> > The patches lack Signed-off-by and
> > commit log descriptions, reference commit Ids without subject.
> > See Documentation/process/submitting-patches.rst
> >
> 
> Sorry, I will try to keep an eye on that from now on. I will send a v2
> with Signed-off-by and extended descriptions if you see it ok.
> 
> Thanks!

Sure, pls go ahead.

> > > Eugenio Pérez (8):
> > >   tools/virtio: fix virtio_test.c indentation
> > >   vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl
> > >   vhost: Replace vq->private_data access by backend accesors
> > >   vhost: Fix bad order in vhost_test_set_backend at enable
> > >   tools/virtio: Use __vring_new_virtqueue in virtio_test.c
> > >   tools/virtio: Extract virtqueue initialization in vq_reset
> > >   tools/virtio: Reset index in virtio_test --reset.
> > >   tools/virtio: Use tools/include/list.h instead of stubs
> > >
> > >  drivers/vhost/test.c        |  8 ++---
> > >  drivers/vhost/vhost.c       |  1 -
> > >  tools/virtio/linux/kernel.h |  7 +----
> > >  tools/virtio/linux/virtio.h |  5 ++--
> > >  tools/virtio/virtio_test.c  | 58 +++++++++++++++++++++++++++----------
> > >  tools/virtio/vringh_test.c  |  2 ++
> > >  6 files changed, 51 insertions(+), 30 deletions(-)
> > >
> > > --
> > > 2.18.1
> >

