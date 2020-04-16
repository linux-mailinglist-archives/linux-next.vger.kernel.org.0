Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0A11AD2D2
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgDPWdF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:33:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27935 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725770AbgDPWdE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2020 18:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587076382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qUf9DXimPD8UBiVLdfnQM98oUkmHdl6eiPE6mf0vIko=;
        b=QGYscq2tEhrGiJZYRgf1Xh8FECU/1XoUkRtV1Nr+DcYaYsHaWjFHKHQ99MmWni24fYvBkC
        lQhvFhoeFz1gV+PDU+yXlmwfSqT2T5qEvtwCFQuLRrUpWo4ugZ7rnqCn7dnvAe0jbzlYwi
        nGUGN/hGfIW8qEk1GSrU14Fv6ofCz1s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-XS5_JuSsOt6Lzi6oUbVoXQ-1; Thu, 16 Apr 2020 18:33:01 -0400
X-MC-Unique: XS5_JuSsOt6Lzi6oUbVoXQ-1
Received: by mail-wm1-f70.google.com with SMTP id b203so91137wmd.6
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 15:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qUf9DXimPD8UBiVLdfnQM98oUkmHdl6eiPE6mf0vIko=;
        b=QDH6k43zJbK+9Q5TA/TWgsnpDCvPNOAvbF7BEBAr4YXhg6fsIsTBl/a3qCT+Q4J0pC
         7j+noTWwRbMgOb6xCeNxdvytLPsQJe68oT0EOOi5bK5+NR+28zvUaUSLmjiSIFqb43Gd
         q1PSts5nqaW74Pwm0+WWE17Vu1NaXbpFCmfNJn8YobuljzSwSVXU38ePbAOHTjc2Oyau
         Px3i/Yj9sadsQPT5FfNMb38V5TyxQ6lIriHAM6LLFcJsTmH8xcq15ZQ6WXFYIP62n8DD
         4jhd6rrBSAMYyTPMTYtMP4arYSPRIkGJuPS5Q1WQNYsDsKQQ3VH368qrvbHL9i3uSwOc
         vazw==
X-Gm-Message-State: AGi0PubRPqPMx7eVgia4Wi6rE+934faXnDq7ryhENz11OHNS/17xGm5A
        P34YSAW1Ubwaaeu/Dy4j6/+BJxo7ePRtrOtXD3k+JFgsEBb8SzsXfxpR9mfsyXx9830O+mUKMjT
        5M7xszzdTJ31tqQx3wRBpGA==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr106312wmj.156.1587076380275;
        Thu, 16 Apr 2020 15:33:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIy+rWP6GLwQOV39yuKvCoJ5WM3R60eHJj8M3PsMQSHsFk9lyxG27YOo0I93W1RyqT/v7nwTQ==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr106300wmj.156.1587076380092;
        Thu, 16 Apr 2020 15:33:00 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id h137sm6135220wme.0.2020.04.16.15.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 15:32:59 -0700 (PDT)
Date:   Thu, 16 Apr 2020 18:32:56 -0400
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
Subject: Re: [PATCH v2 5/8] tools/virtio: Use __vring_new_virtqueue in
 virtio_test.c
Message-ID: <20200416183244-mutt-send-email-mst@kernel.org>
References: <20200416075643.27330-1-eperezma@redhat.com>
 <20200416075643.27330-6-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416075643.27330-6-eperezma@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 16, 2020 at 09:56:40AM +0200, Eugenio Pérez wrote:
> As updated in ("2a2d1382fe9d virtio: Add improved queue allocation API")
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Pls add motivation for these changes.

> ---
>  tools/virtio/virtio_test.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 1d5144590df6..d9827b640c21 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -106,10 +106,9 @@ static void vq_info_add(struct vdev_info *dev, int num)
>  	assert(r >= 0);
>  	memset(info->ring, 0, vring_legacy_size(num, 4096));
>  	vring_legacy_init(&info->vring, num, info->ring, 4096);
> -	info->vq = vring_new_virtqueue(info->idx,
> -				       info->vring.num, 4096, &dev->vdev,
> -				       true, false, info->ring,
> -				       vq_notify, vq_callback, "test");
> +	info->vq =
> +		__vring_new_virtqueue(info->idx, info->vring, &dev->vdev, true,
> +				      false, vq_notify, vq_callback, "test");
>  	assert(info->vq);
>  	info->vq->priv = info;
>  	vhost_vq_setup(dev, info);
> -- 
> 2.18.1

