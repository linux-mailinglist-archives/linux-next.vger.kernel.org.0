Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB40819C29D
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 15:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388565AbgDBN1r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Apr 2020 09:27:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21014 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387752AbgDBN1q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2020 09:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585834065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1eX8MBJ9dVspbC5Z01wrbH0AdjiWCbWXslfX6OZ6hs=;
        b=X073aojub94Upl6/d54MHh8luUumvIlR/kYvIKhaMCFefMv4Ej7X3AE+d5G4N8qLiaafyC
        ObLJF31EBKDIt6JewWNXz4BPsdtIBqpT4osFwJMNIU0pcsqTn2uA43aL7lg8i0nPfYApvG
        5tZRraKkQpJ0l5gA9dBlLf+YFsSa61Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-F3WkkVPbOiarLpFGwsA3lA-1; Thu, 02 Apr 2020 09:27:44 -0400
X-MC-Unique: F3WkkVPbOiarLpFGwsA3lA-1
Received: by mail-qv1-f71.google.com with SMTP id p6so2637993qvo.18
        for <linux-next@vger.kernel.org>; Thu, 02 Apr 2020 06:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/1eX8MBJ9dVspbC5Z01wrbH0AdjiWCbWXslfX6OZ6hs=;
        b=ltZWdNDfGXtns7RQmYqnwoN4KekPO5MQEIfjWR6dt4X3yBKV2PoEAQyIKHZ2mOif8h
         tDvERgbLPslCuDD8P8pHckHlacHC5d9GjHaSdI8ePsYZY0gE/Kl1m1SUmVSwlo2mrZHi
         cSSDTs/uYlHJng9Kg817xQcsSkXXsTKZauV3wZd5j6gHEVOWbIu36DEZynNbe8P7BijW
         7XOg+tjyiMW0IOzdDMtkmm/aftdEkUiAwKO7lvwZAa5SNvFBcCr4Ba1cXe2E/tBSEc2a
         awvKDwc0cC1kLQI80KT/chFxvIIJMKQEH/MbEav6wbqgzGxyijyaLHU6e93vK8+wsMM1
         oPFg==
X-Gm-Message-State: AGi0PuYjkbbGSLzJbgii6OAHA5fUbp2oS3YoyBPQqTzs+ZS1eTW6GNvu
        HUlAfnc5SqqWRSXJ41DTdorF90Zxa7L3N8Pt4gPWzkD//q2z4D9Pi494AHKs9pCUUDtSgps04Ul
        jMj6vbTXbGsvMJnR2TNgpdA==
X-Received: by 2002:a37:7a84:: with SMTP id v126mr3349828qkc.423.1585834063878;
        Thu, 02 Apr 2020 06:27:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLxHjkaUsVorVDqnHwIHws97AjgXm5AAgFlj0iL+yJ0ouEjkj3oZQka7/SWWzBEH9hp1R5KqA==
X-Received: by 2002:a37:7a84:: with SMTP id v126mr3349804qkc.423.1585834063566;
        Thu, 02 Apr 2020 06:27:43 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id 31sm3619643qta.56.2020.04.02.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 06:27:42 -0700 (PDT)
Date:   Thu, 2 Apr 2020 09:27:37 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc:     "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v4 7/7] tools/virtio: Make --reset reset ring idx
Message-ID: <20200402092529-mutt-send-email-mst@kernel.org>
References: <20200401183118.8334-1-eperezma@redhat.com>
 <20200401183118.8334-8-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200401183118.8334-8-eperezma@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 01, 2020 at 08:31:18PM +0200, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

I'm still a bit puzzled by this one - could you
explain what the rationale here is?

> ---
>  drivers/virtio/virtio_ring.c | 29 +++++++++++++++++++++++++++++
>  tools/virtio/linux/virtio.h  |  2 ++
>  tools/virtio/virtio_test.c   | 28 +++++++++++++++++++++++++++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 58b96baa8d48..f9153a381f72 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1810,6 +1810,35 @@ int virtqueue_add_inbuf_ctx(struct virtqueue *vq,
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_add_inbuf_ctx);
>  
> +#ifndef __KERNEL__
> +
> +/**
> + * virtqueue_reset_free_head - Reset to 0 the members of split ring.
> + * @vq: Virtqueue to reset.
> + *
> + * At this moment, is only meant for debug the ring index change, do not use
> + * in production.
> + */
> +void virtqueue_reset_free_head(struct virtqueue *_vq)
> +{
> +	struct vring_virtqueue *vq = to_vvq(_vq);
> +
> +	// vq->last_used_idx = 0;
> +	vq->num_added = 0;
> +
> +	vq->split.queue_size_in_bytes = 0;
> +	vq->split.avail_flags_shadow = 0;
> +	vq->split.avail_idx_shadow = 0;
> +
> +	memset(vq->split.desc_state, 0, vq->split.vring.num *
> +			sizeof(struct vring_desc_state_split));
> +
> +	vq->free_head = 0;
> +}
> +EXPORT_SYMBOL_GPL(virtqueue_reset_free_head);
> +
> +#endif
> +
>  /**
>   * virtqueue_kick_prepare - first half of split virtqueue_kick call.
>   * @_vq: the struct virtqueue
> diff --git a/tools/virtio/linux/virtio.h b/tools/virtio/linux/virtio.h
> index b751350d4ce8..5d33eab6b814 100644
> --- a/tools/virtio/linux/virtio.h
> +++ b/tools/virtio/linux/virtio.h
> @@ -65,4 +65,6 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
>  				      const char *name);
>  void vring_del_virtqueue(struct virtqueue *vq);
>  
> +void virtqueue_reset_free_head(struct virtqueue *vq);
> +
>  #endif
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 93d81cd64ba0..bf21ece30594 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -49,6 +49,7 @@ struct vdev_info {
>  
>  static const struct vhost_vring_file no_backend = { .fd = -1 },
>  				     backend = { .fd = 1 };
> +static const struct vhost_vring_state null_state = {};
>  
>  bool vq_notify(struct virtqueue *vq)
>  {
> @@ -218,10 +219,33 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  			}
>  
>  			if (reset) {
> +				struct vhost_vring_state s = { .index = 0 };
> +				int i;
> +				vq->vring.avail->idx = 0;
> +				vq->vq->num_free = vq->vring.num;
> +
> +				// Put everything in free lists.
> +				for (i = 0; i < vq->vring.num-1; i++)
> +					vq->vring.desc[i].next =
> +						cpu_to_virtio16(&dev->vdev,
> +								i + 1);
> +				vq->vring.desc[vq->vring.num-1].next = 0;


Poking at vq descriptors like this seems fragile.
I think this calls for a better API that handles everything
internally.


> +				virtqueue_reset_free_head(vq->vq);
> +
> +				r = ioctl(dev->control, VHOST_GET_VRING_BASE,
> +					  &s);
> +				assert(!r);
> +
> +				s.num = 0;
> +				r = ioctl(dev->control, VHOST_SET_VRING_BASE,
> +					  &null_state);
> +				assert(!r);
> +
>  				r = ioctl(dev->control, VHOST_TEST_SET_BACKEND,
>  					  &backend);
>  				assert(!r);
>  
> +				started = completed;
>                                  while (completed > next_reset)
>  					next_reset += completed;
>  			}
> @@ -243,7 +267,9 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  	test = 0;
>  	r = ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >= 0);
> -	fprintf(stderr, "spurious wakeups: 0x%llx\n", spurious);
> +	fprintf(stderr,
> +		"spurious wakeups: 0x%llx started=0x%lx completed=0x%lx\n",
> +		spurious, started, completed);
>  }
>  
>  const char optstring[] = "h";
> -- 
> 2.18.1

