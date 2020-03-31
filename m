Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08B9199F16
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 21:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgCaTaT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 15:30:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30090 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726290AbgCaTaT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 15:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585683017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UpUD1JgEMbiTeKuDtcfbarlvunPYOvi5RMSv8hFzL24=;
        b=ITEqrRvR342ja9Z0GhkIzHxmgcYj3fWDORmYT966ZmxdvK5AXTKAg44OdVSQmSbdKVDzzL
        6Vg1mVnwhusy2SfvMLvvgtQuWyVnyZsEvAQ1zAmHBA1HtcMc1KLr2IkqIebbhzUo45+Veq
        qQBrT+woLmNLL+aphxmdtg+wyFm/xJs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Slh-sP29PD-HLdaa9s0A0g-1; Tue, 31 Mar 2020 15:30:16 -0400
X-MC-Unique: Slh-sP29PD-HLdaa9s0A0g-1
Received: by mail-lf1-f69.google.com with SMTP id s6so9227561lfp.15
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 12:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UpUD1JgEMbiTeKuDtcfbarlvunPYOvi5RMSv8hFzL24=;
        b=nB4suAdWEXK8U66j9XD8V9yvsy3VaQYjB+g4fXGL08RAEZ9+YwrnvjEiUQFr2aXe3C
         JkjEGLxFQIoq7DtOzYUU223WWe29dt5asthseXJaniy2+8LzxXEaIgJ6DClFxmFM0rdl
         E17vc2pWd41VV2K6NfD8cGnfhBNssfVmicm+FHw6/430U28EUlY80BK4gJz5dsgw4aFC
         9vSmDI6MgQlB5KYP0bF6eo5VMGyxDhYE2Ydjv8kIUx3brqCZERXmk+DPGAQneTDJ7pjx
         seriA++SuQVsli9dryu53ptVVUFpNLaYtwcaAahXnntKt2LJgcKw2cBFA9edVbtOHYfp
         BiUg==
X-Gm-Message-State: AGi0PubWYkIjYAjd29WkmNCVQj8jFmciB7j7smabx3NJlEuSKRwSMH9Y
        32x/TlxBQA9Zx0nGwRbS/GCMAWicvIbvG1xbRZUJ8+483/Rw1S1fz7ccNFbySvwGTxI+sNGWs+q
        KLPBUkE1t/AZ+Mm+l+R4bEJ8eSDDPjSbCi37TNg==
X-Received: by 2002:ac2:4199:: with SMTP id z25mr12316651lfh.90.1585683014301;
        Tue, 31 Mar 2020 12:30:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypJhWHR1e3yFKlW02voYvvq7yPGRxklHTLnYsbNB5eexsLfQZB5Gq+0Qo0MSOyWCKWui5xHhfhrh7QYm8fcFEMM=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr12316641lfh.90.1585683014001;
 Tue, 31 Mar 2020 12:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200331180006.25829-1-eperezma@redhat.com> <20200331180006.25829-2-eperezma@redhat.com>
 <20200331141244-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200331141244-mutt-send-email-mst@kernel.org>
From:   Eugenio Perez Martin <eperezma@redhat.com>
Date:   Tue, 31 Mar 2020 21:29:37 +0200
Message-ID: <CAJaqyWe2xxSR5GpV8c-mPoOizwe8nw-HrKPdjvr4ykOL_garKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] vhost: Create accessors for virtqueues private_data
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 31, 2020 at 8:14 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 31, 2020 at 07:59:59PM +0200, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  drivers/vhost/net.c   | 28 +++++++++++++++-------------
> >  drivers/vhost/vhost.h | 28 ++++++++++++++++++++++++++++
> >  drivers/vhost/vsock.c | 14 +++++++-------
> >  3 files changed, 50 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> > index e158159671fa..6c5e7a6f712c 100644
> > --- a/drivers/vhost/net.c
> > +++ b/drivers/vhost/net.c
> > @@ -424,7 +424,7 @@ static void vhost_net_disable_vq(struct vhost_net *=
n,
> >       struct vhost_net_virtqueue *nvq =3D
> >               container_of(vq, struct vhost_net_virtqueue, vq);
> >       struct vhost_poll *poll =3D n->poll + (nvq - n->vqs);
> > -     if (!vq->private_data)
> > +     if (!vhost_vq_get_backend_opaque(vq))
> >               return;
> >       vhost_poll_stop(poll);
> >  }
> > @@ -437,7 +437,7 @@ static int vhost_net_enable_vq(struct vhost_net *n,
> >       struct vhost_poll *poll =3D n->poll + (nvq - n->vqs);
> >       struct socket *sock;
> >
> > -     sock =3D vq->private_data;
> > +     sock =3D vhost_vq_get_backend_opaque(vq);
> >       if (!sock)
> >               return 0;
> >
> > @@ -524,7 +524,7 @@ static void vhost_net_busy_poll(struct vhost_net *n=
et,
> >               return;
> >
> >       vhost_disable_notify(&net->dev, vq);
> > -     sock =3D rvq->private_data;
> > +     sock =3D vhost_vq_get_backend_opaque(rvq);
> >
> >       busyloop_timeout =3D poll_rx ? rvq->busyloop_timeout:
> >                                    tvq->busyloop_timeout;
> > @@ -570,8 +570,10 @@ static int vhost_net_tx_get_vq_desc(struct vhost_n=
et *net,
> >
> >       if (r =3D=3D tvq->num && tvq->busyloop_timeout) {
> >               /* Flush batched packets first */
> > -             if (!vhost_sock_zcopy(tvq->private_data))
> > -                     vhost_tx_batch(net, tnvq, tvq->private_data, msgh=
dr);
> > +             if (!vhost_sock_zcopy(vhost_vq_get_backend_opaque(tvq)))
> > +                     vhost_tx_batch(net, tnvq,
> > +                                    vhost_vq_get_backend_opaque(tvq),
> > +                                    msghdr);
> >
> >               vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, false);
> >
> > @@ -685,7 +687,7 @@ static int vhost_net_build_xdp(struct vhost_net_vir=
tqueue *nvq,
> >       struct vhost_virtqueue *vq =3D &nvq->vq;
> >       struct vhost_net *net =3D container_of(vq->dev, struct vhost_net,
> >                                            dev);
> > -     struct socket *sock =3D vq->private_data;
> > +     struct socket *sock =3D vhost_vq_get_backend_opaque(vq);
> >       struct page_frag *alloc_frag =3D &net->page_frag;
> >       struct virtio_net_hdr *gso;
> >       struct xdp_buff *xdp =3D &nvq->xdp[nvq->batched_xdp];
> > @@ -952,7 +954,7 @@ static void handle_tx(struct vhost_net *net)
> >       struct socket *sock;
> >
> >       mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_TX);
> > -     sock =3D vq->private_data;
> > +     sock =3D vhost_vq_get_backend_opaque(vq);
> >       if (!sock)
> >               goto out;
> >
> > @@ -1121,7 +1123,7 @@ static void handle_rx(struct vhost_net *net)
> >       int recv_pkts =3D 0;
> >
> >       mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
> > -     sock =3D vq->private_data;
> > +     sock =3D vhost_vq_get_backend_opaque(vq);
> >       if (!sock)
> >               goto out;
> >
> > @@ -1344,9 +1346,9 @@ static struct socket *vhost_net_stop_vq(struct vh=
ost_net *n,
> >               container_of(vq, struct vhost_net_virtqueue, vq);
> >
> >       mutex_lock(&vq->mutex);
> > -     sock =3D vq->private_data;
> > +     sock =3D vhost_vq_get_backend_opaque(vq);
> >       vhost_net_disable_vq(n, vq);
> > -     vq->private_data =3D NULL;
> > +     vhost_vq_set_backend_opaque(vq, NULL);
> >       vhost_net_buf_unproduce(nvq);
> >       nvq->rx_ring =3D NULL;
> >       mutex_unlock(&vq->mutex);
> > @@ -1528,7 +1530,7 @@ static long vhost_net_set_backend(struct vhost_ne=
t *n, unsigned index, int fd)
> >       }
> >
> >       /* start polling new socket */
> > -     oldsock =3D vq->private_data;
> > +     oldsock =3D vhost_vq_get_backend_opaque(vq);
> >       if (sock !=3D oldsock) {
> >               ubufs =3D vhost_net_ubuf_alloc(vq,
> >                                            sock && vhost_sock_zcopy(soc=
k));
> > @@ -1538,7 +1540,7 @@ static long vhost_net_set_backend(struct vhost_ne=
t *n, unsigned index, int fd)
> >               }
> >
> >               vhost_net_disable_vq(n, vq);
> > -             vq->private_data =3D sock;
> > +             vhost_vq_set_backend_opaque(vq, sock);
> >               vhost_net_buf_unproduce(nvq);
> >               r =3D vhost_vq_init_access(vq);
> >               if (r)
> > @@ -1575,7 +1577,7 @@ static long vhost_net_set_backend(struct vhost_ne=
t *n, unsigned index, int fd)
> >       return 0;
> >
> >  err_used:
> > -     vq->private_data =3D oldsock;
> > +     vhost_vq_set_backend_opaque(vq, oldsock);
> >       vhost_net_enable_vq(n, vq);
> >       if (ubufs)
> >               vhost_net_ubuf_put_wait_and_free(ubufs);
> > diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> > index a123fd70847e..0808188f7e8f 100644
> > --- a/drivers/vhost/vhost.h
> > +++ b/drivers/vhost/vhost.h
> > @@ -244,6 +244,34 @@ enum {
> >                        (1ULL << VIRTIO_F_VERSION_1)
> >  };
> >
> > +/**
> > + * vhost_vq_set_backend_opaque - Set backend opaque.
> > + *
> > + * @vq            Virtqueue.
> > + * @private_data  The private data.
> > + *
> > + * Context: Need to call with vq->mutex acquired.
> > + */
> > +static inline void vhost_vq_set_backend_opaque(struct vhost_virtqueue =
*vq,
> > +                                            void *private_data)
> > +{
> > +     vq->private_data =3D private_data;
> > +}
> > +
> > +/**
> > + * vhost_vq_get_backend_opaque - Get backend opaque.
> > + *
> > + * @vq            Virtqueue.
> > + * @private_data  The private data.
> > + *
> > + * Context: Need to call with vq->mutex acquired.
> > + * Return: Opaque previously set with vhost_vq_set_backend_opaque.
> > + */
> > +static inline void *vhost_vq_get_backend_opaque(struct vhost_virtqueue=
 *vq)
> > +{
> > +     return vq->private_data;
> > +}
> > +
> >  static inline bool vhost_has_feature(struct vhost_virtqueue *vq, int b=
it)
> >  {
> >       return vq->acked_features & (1ULL << bit);
>
>
> I think I prefer vhost_vq_get_backend and vhost_vq_set_backend.
>
> "opaque" just means that it's void * that is clear from the signature
> anyway.
>

I agree. Changed in sent v3.

Thanks!

>
> > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > index c2d7d57e98cf..6e20dbe14acd 100644
> > --- a/drivers/vhost/vsock.c
> > +++ b/drivers/vhost/vsock.c
> > @@ -91,7 +91,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock=
,
> >
> >       mutex_lock(&vq->mutex);
> >
> > -     if (!vq->private_data)
> > +     if (!vhost_vq_get_backend_opaque(vq))
> >               goto out;
> >
> >       /* Avoid further vmexits, we're already processing the virtqueue =
*/
> > @@ -440,7 +440,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost=
_work *work)
> >
> >       mutex_lock(&vq->mutex);
> >
> > -     if (!vq->private_data)
> > +     if (!vhost_vq_get_backend_opaque(vq))
> >               goto out;
> >
> >       vhost_disable_notify(&vsock->dev, vq);
> > @@ -533,8 +533,8 @@ static int vhost_vsock_start(struct vhost_vsock *vs=
ock)
> >                       goto err_vq;
> >               }
> >
> > -             if (!vq->private_data) {
> > -                     vq->private_data =3D vsock;
> > +             if (!vhost_vq_get_backend_opaque(vq)) {
> > +                     vhost_vq_set_backend_opaque(vq, vsock);
> >                       ret =3D vhost_vq_init_access(vq);
> >                       if (ret)
> >                               goto err_vq;
> > @@ -547,14 +547,14 @@ static int vhost_vsock_start(struct vhost_vsock *=
vsock)
> >       return 0;
> >
> >  err_vq:
> > -     vq->private_data =3D NULL;
> > +     vhost_vq_set_backend_opaque(vq, NULL);
> >       mutex_unlock(&vq->mutex);
> >
> >       for (i =3D 0; i < ARRAY_SIZE(vsock->vqs); i++) {
> >               vq =3D &vsock->vqs[i];
> >
> >               mutex_lock(&vq->mutex);
> > -             vq->private_data =3D NULL;
> > +             vhost_vq_set_backend_opaque(vq, NULL);
> >               mutex_unlock(&vq->mutex);
> >       }
> >  err:
> > @@ -577,7 +577,7 @@ static int vhost_vsock_stop(struct vhost_vsock *vso=
ck)
> >               struct vhost_virtqueue *vq =3D &vsock->vqs[i];
> >
> >               mutex_lock(&vq->mutex);
> > -             vq->private_data =3D NULL;
> > +             vhost_vq_set_backend_opaque(vq, NULL);
> >               mutex_unlock(&vq->mutex);
> >       }
> >
> > --
> > 2.18.1
>

