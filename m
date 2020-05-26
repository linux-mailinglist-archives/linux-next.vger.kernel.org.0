Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587AC1A6585
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 13:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgDMLNe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 07:13:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22917 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728128AbgDMLNd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2020 07:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586776411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RyXK4jTSyCrBgQI/g3NhhWf4Cadu8DGaHr+KG4J9oBY=;
        b=hgHaYEtUl9ptOKad4D14mcsmxP7Oz4omdWPBR1ieb/dc+kyhnwlgEpGJRRat+sFtblposo
        6btaospBujDDTFk5BIGfYjN8o+PWvr/7eau2eKv4yLqvXKq+8slOEcD0X5JT4/Dyrs1hP8
        LVuuw+SONqNp7aj5J+vEK0ikggFb5Ks=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-94wG7ymvNIeC8SsuEAUXEg-1; Mon, 13 Apr 2020 07:13:28 -0400
X-MC-Unique: 94wG7ymvNIeC8SsuEAUXEg-1
Received: by mail-wr1-f70.google.com with SMTP id d4so6540975wrq.10
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 04:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RyXK4jTSyCrBgQI/g3NhhWf4Cadu8DGaHr+KG4J9oBY=;
        b=rihguxquD3C5g9B/B0QoRBjeTUmgFY9L77do+UlKIvQpbxBgVJ374EX1z/Q9HwyCt+
         4vURAZn9HmiTZtrUFDLFXeFjVgfMZ+arUThzSLmpbtu12hgBadxWRDFDcfDAlbVYQhf9
         0IGA2VhjeG7RD//wcJjZfoQANftAVWjl+xTlgc3KoqNhrMxXSMHmQOP+5TY9BWVuRLlW
         X6R9pgWxat9PDAnJ/XrkmbJ7MD1FMyN/o4E+CGChrVC4q4SdsmrEu4LtKjG8Pme73N8U
         yVY3SA+eY+WsOPSC+d086ojBBB19OZJfOQMR+WgiQwZeTKYSmQDn95ndboAfXz2zGmUF
         ryYw==
X-Gm-Message-State: AGi0PuYfw16nUMWCz7xVnyb8bdZDuLB2j/IjHnfJtGeucsTJFOjOYKHF
        OqGINIoVIPNrFN2twCneE+EGTh8sQYuohrx7sA2ZQuphiRylrVCNRojdoDRhR1kFyTIhm+Ae6Ae
        2GErtw3dTxp9EHYikIYzO4g==
X-Received: by 2002:a5d:4442:: with SMTP id x2mr181622wrr.101.1586776407144;
        Mon, 13 Apr 2020 04:13:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJm7VAiU/q6lVzMdgLKKb2HWEjxDtZshQBgoe1KapbTIJWgwwS+QMx+dIDjpKr+0KXFEhxl+g==
X-Received: by 2002:a5d:4442:: with SMTP id x2mr181605wrr.101.1586776406923;
        Mon, 13 Apr 2020 04:13:26 -0700 (PDT)
Received: from redhat.com ([185.107.45.41])
        by smtp.gmail.com with ESMTPSA id b82sm15257603wme.25.2020.04.13.04.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 04:13:26 -0700 (PDT)
Date:   Mon, 13 Apr 2020 07:13:23 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
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
Message-ID: <20200413071044-mutt-send-email-mst@kernel.org>
References: <20200403165119.5030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403165119.5030-1-eperezma@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 03, 2020 at 06:51:11PM +0200, Eugenio P�rez wrote:
> This series add the tests used to validate the "vhost: Reset batched
> descriptors on SET_VRING_BASE call" series, with a small change on the
> reset code (delete an extra unneded reset on VHOST_SET_VRING_BASE).
> 
> They are based on the tests sent back them, the ones that were not
> included (reasons in that thread). This series changes:
> 
> * Delete need to export the ugly function in virtio_ring, now all the
> code is added in tools/virtio (except the one line fix).
> * Add forgotten uses of vhost_vq_set_backend. Fix bad usage order in
> vhost_test_set_backend.
> * Drop random reset, not really needed.
> * Minor changes updating tests code.
> 
> This serie is meant to be applied on top of
> 5de4e0b7068337cf0d4ca48a4011746410115aae in
> git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.

Is this still needed? The patches lack Signed-off-by and
commit log descriptions, reference commit Ids without subject.
See Documentation/process/submitting-patches.rst

> Eugenio P�rez (8):
>   tools/virtio: fix virtio_test.c indentation
>   vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl
>   vhost: Replace vq->private_data access by backend accesors
>   vhost: Fix bad order in vhost_test_set_backend at enable
>   tools/virtio: Use __vring_new_virtqueue in virtio_test.c
>   tools/virtio: Extract virtqueue initialization in vq_reset
>   tools/virtio: Reset index in virtio_test --reset.
>   tools/virtio: Use tools/include/list.h instead of stubs
> 
>  drivers/vhost/test.c        |  8 ++---
>  drivers/vhost/vhost.c       |  1 -
>  tools/virtio/linux/kernel.h |  7 +----
>  tools/virtio/linux/virtio.h |  5 ++--
>  tools/virtio/virtio_test.c  | 58 +++++++++++++++++++++++++++----------
>  tools/virtio/vringh_test.c  |  2 ++
>  6 files changed, 51 insertions(+), 30 deletions(-)
> 
> -- 
> 2.18.1

