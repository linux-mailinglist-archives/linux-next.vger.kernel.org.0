Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43871AD2E1
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgDPWeK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:34:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52976 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729206AbgDPWeJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 18:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587076447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A1bma2gluq3HGOu3CaCHez8AlHNyzwOb99nKMYoTBrs=;
        b=TK12xLQWP67Pn5vksjYhoT/eqqfWtPYWXqOLmxzz6QQ60AE6iR0Zz7taPRd3ZS3nizHX/6
        7DvLBS6ubf/Dx/xI6QsxNjP0qvZedeQNP09zVttCEma8eQu4Y91iB93cVN6TTzAi6fOEUD
        WAe6gNTvQxLCktMwNeOx+WfDVCU3Xv0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-mAeT4iJQN_K4ISgS39vBew-1; Thu, 16 Apr 2020 18:34:04 -0400
X-MC-Unique: mAeT4iJQN_K4ISgS39vBew-1
Received: by mail-wr1-f72.google.com with SMTP id j16so2468945wrw.20
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 15:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A1bma2gluq3HGOu3CaCHez8AlHNyzwOb99nKMYoTBrs=;
        b=IVBhUy++K4IoxcJlg7dDmcx5Y/sQ/mH7w+jrwkOg4GeJSTpGUzcZloycR0e2t99hJg
         H+khDnpeJb5Wncl/CkwIilF7DjsDUc4TTRf1eP2MQod9fk6ol6gE+vapjQuJCXjg0kLb
         L4AOC81eXvzHw6VaXKIGlpO/Uppg8/1NIF+FJUnurmVnKvVRsRKuEpyn/QtwSn8R40C9
         SstTvc9p1DwNvx4QNwEKDkNny/YRYOGwvFaUohGeANEV8GIt2yBpQk71ZoLaoXjLwb2H
         3IQ2dRJMos0gnkQ1HbboGC9kGy7PayCXPBUsbxrS2Enq321P29TvEWaDUir2RnMiTbwP
         lteg==
X-Gm-Message-State: AGi0PuY21rGNA0TQJRwzEjj0OCQPwn3Aje3YMNFkJZ6D2Q64QWIno7c9
        LA/it7oAnEusnQ0kuu/LGLUCCasNDlkH7qohkbnf1f/swy8oqQRjTYS6TJqW5jjaPMxfqoxrrJg
        j3CloM5q6GjQKW5PO9bpaYA==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr98429wma.162.1587076442805;
        Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypKXN83gnjbKOoJt6yPtsWQIwZwD4bOGlfUuqfOI5ajKzWnkQM8hnZuZwWeeXGxrvKUUk0sKdg==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr98410wma.162.1587076442597;
        Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id m15sm5010453wmc.35.2020.04.16.15.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 15:34:02 -0700 (PDT)
Date:   Thu, 16 Apr 2020 18:33:59 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
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
Message-ID: <20200416183324-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-8-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416075643.27330-8-eperezma@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 16, 2020 at 09:56:42AM +0200, Eugenio P�rez wrote:
> This way behavior for vhost is more like a VM.
> 
> Signed-off-by: Eugenio P�rez <eperezma@redhat.com>

I dropped --reset from 5.7 since Linus felt it's unappropriate.
I guess I should squash this in with --reset?

> ---
>  tools/virtio/virtio_test.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 18d5347003eb..dca64d36a882 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -20,7 +20,6 @@
>  #include "../../drivers/vhost/test.h"
>  
>  #define RANDOM_BATCH -1
> -#define RANDOM_RESET -1
>  
>  /* Unused */
>  void *__kmalloc_fake, *__kfree_ignore_start, *__kfree_ignore_end;
> @@ -49,6 +48,7 @@ struct vdev_info {
>  
>  static const struct vhost_vring_file no_backend = { .fd = -1 },
>  				     backend = { .fd = 1 };
> +static const struct vhost_vring_state null_state = {};
>  
>  bool vq_notify(struct virtqueue *vq)
>  {
> @@ -174,14 +174,19 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  	unsigned len;
>  	long long spurious = 0;
>  	const bool random_batch = batch == RANDOM_BATCH;
> +
>  	r = ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >= 0);
> +	if (!reset_n) {
> +		next_reset = INT_MAX;
> +	}
> +
>  	for (;;) {
>  		virtqueue_disable_cb(vq->vq);
>  		completed_before = completed;
>  		started_before = started;
>  		do {
> -			const bool reset = reset_n && completed > next_reset;
> +			const bool reset = completed > next_reset;
>  			if (random_batch)
>  				batch = (random() % vq->vring.num) + 1;
>  
> @@ -224,10 +229,24 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  			}
>  
>  			if (reset) {
> +				struct vhost_vring_state s = { .index = 0 };
> +
> +				vq_reset(vq, vq->vring.num, &dev->vdev);
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
>  				while (completed > next_reset)
>  					next_reset += completed;
>  			}
> @@ -249,7 +268,9 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
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
> @@ -312,7 +333,7 @@ static void help(void)
>  		" [--no-virtio-1]"
>  		" [--delayed-interrupt]"
>  		" [--batch=random/N]"
> -		" [--reset=random/N]"
> +		" [--reset=N]"
>  		"\n");
>  }
>  
> @@ -360,11 +381,9 @@ int main(int argc, char **argv)
>  		case 'r':
>  			if (!optarg) {
>  				reset = 1;
> -			} else if (0 == strcmp(optarg, "random")) {
> -				reset = RANDOM_RESET;
>  			} else {
>  				reset = strtol(optarg, NULL, 10);
> -				assert(reset >= 0);
> +				assert(reset > 0);
>  				assert(reset < (long)INT_MAX + 1);
>  			}
>  			break;
> -- 
> 2.18.1

