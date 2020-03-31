Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB905199FA8
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 22:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgCaUBX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 16:01:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29978 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728124AbgCaUBW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 16:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585684881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b2UFMAgHLjerJ9NMZry/HpffFH2cpApwyp5N9quNxNg=;
        b=bPHGESyhiJX0x9oWCIwcDgwXXJ69c9Fu5hCOS7Hsidobenfs58/N/9ExrTuRYeqapuk29H
        EeD/Dm6Xz6RR/lqtAEQ1DCka0U7l+QEgvAGPOaQyExtd46osCQpWilQ2mn2BiaPw92Nkz0
        xG/2iSml8PUO2a8iX1O/S2JFS3dbpGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-_9k2oN2zN0W9jI6smaAp2Q-1; Tue, 31 Mar 2020 15:51:15 -0400
X-MC-Unique: _9k2oN2zN0W9jI6smaAp2Q-1
Received: by mail-wm1-f72.google.com with SMTP id l13so754582wme.7
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 12:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b2UFMAgHLjerJ9NMZry/HpffFH2cpApwyp5N9quNxNg=;
        b=tBHy+z9KZlbSsf9DhkRUAAJE4Pm5pdKPxXXYmOJ5j1rZPLuGeCGldEWx9I7jTVLxPH
         drgveajQ5/rdXFL/QzKlz8dZMkU/C+lUoyJP4+nDUq823SNB5YPU7K6YqkoLPoX4Svs3
         nlw/Wsnk0/iEqC7yCUeqpWMzh5kNddR8aZUiq78oZibJe+T7etsnHZLYb8UwTcVye9rC
         xPlqHTjSCOwb/drSbbd0/gRWWvbuzstsy55uU5X0uQiMZ397o+lQO8a3Bm8O8F73RMPq
         4odTRhVoKurVNO6O/dlxpQdnMRZB5CI8onjK5xeMAIPI+Ua/HGB4oppbbbRGDeN4Qmp9
         RN2A==
X-Gm-Message-State: ANhLgQ3RtRddfLenFbra7+YJmcnxBPCjrt76dGX4DCOqYXbSOCKNiHNA
        at0txeHNFuvUd+yTjxI0utUsAAjgyYBzNX6weiV6nWDZXoQ0Y7ohHu+qOFmZwO0gfnwYnSI4+qo
        8+VEFlIM6+LStxC+wg8XzYQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr21178492wri.88.1585684273178;
        Tue, 31 Mar 2020 12:51:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsBF9cECw6xLYUjwBS31gILdZtjJFvdt8FOUuQyT0OA1wSrJbotTajrFFZAFpWOR4/ADVtrdQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr21178477wri.88.1585684272926;
        Tue, 31 Mar 2020 12:51:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id y15sm1290983wrh.50.2020.03.31.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:51:12 -0700 (PDT)
Date:   Tue, 31 Mar 2020 15:51:09 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kvm list <kvm@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 0/8] vhost: Reset batched descriptors on
 SET_VRING_BASE call
Message-ID: <20200331155049-mutt-send-email-mst@kernel.org>
References: <20200331192804.6019-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200331192804.6019-1-eperezma@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 31, 2020 at 09:27:56PM +0200, Eugenio Pérez wrote:
> Vhost did not reset properly the batched descriptors on SET_VRING_BASE
> event. Because of that, is possible to return an invalid descriptor to
> the guest.
> 
> This series ammend this, resetting them every time backend changes, and
> creates a test to assert correct behavior. To do that, they need to
> expose a new function in virtio_ring, virtqueue_reset_free_head, only
> on test code.
> 
> Another useful thing would be to check if mutex is properly get in
> vq private_data accessors. Not sure if mutex debug code allow that,
> similar to C++ unique lock::owns_lock. Not acquiring in the function
> because caller code holds the mutex in order to perform more actions.

I pushed vhost branch with patch 1, pls send patches on top of that!

> v3:
> * Rename accesors functions.
> * Make scsi and test use the accesors too.
> 
> v2:
> * Squashed commits.
> * Create vq private_data accesors (mst).
> 
> This is meant to be applied on top of
> c4f1c41a6094582903c75c0dcfacb453c959d457 in
> git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.
> 
> Eugenio Pérez (5):
>   vhost: Create accessors for virtqueues private_data
>   tools/virtio: Add --batch option
>   tools/virtio: Add --batch=random option
>   tools/virtio: Add --reset=random
>   tools/virtio: Make --reset reset ring idx
> 
> Michael S. Tsirkin (3):
>   vhost: option to fetch descriptors through an independent struct
>   vhost: use batched version by default
>   vhost: batching fetches
> 
>  drivers/vhost/net.c          |  28 ++--
>  drivers/vhost/scsi.c         |  14 +-
>  drivers/vhost/test.c         |  69 ++++++++-
>  drivers/vhost/test.h         |   1 +
>  drivers/vhost/vhost.c        | 271 +++++++++++++++++++++++------------
>  drivers/vhost/vhost.h        |  44 +++++-
>  drivers/vhost/vsock.c        |  14 +-
>  drivers/virtio/virtio_ring.c |  29 ++++
>  tools/virtio/linux/virtio.h  |   2 +
>  tools/virtio/virtio_test.c   | 123 ++++++++++++++--
>  10 files changed, 456 insertions(+), 139 deletions(-)
> 
> -- 
> 2.18.1

