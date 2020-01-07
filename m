Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD476132523
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 12:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgAGLr7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 06:47:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51786 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727894AbgAGLr7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2020 06:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578397677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ajwwg1tTuaqvf2+iTZv4F7nVRs4fx4vlQX7SEEZvm5I=;
        b=DZgoJYmZNJ3FmMRl/rHqxtw4+6HPduNl0WtgdLkJMQQbE3+PNVV3HnYstXkhOUPnRX5oYR
        bw6OwuIQ5Ybzkvzs9qv7KGkSdKAjksS4RlG0ba3Hs5AVoLXd3xp/eq+GpIxizD04dmdATY
        qrS3tSJbFEWCF7psE1nZnScbhfO/W1w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-6-Z0iuEOO6Cg01PeXzQ0og-1; Tue, 07 Jan 2020 06:47:57 -0500
X-MC-Unique: 6-Z0iuEOO6Cg01PeXzQ0og-1
Received: by mail-qv1-f70.google.com with SMTP id d7so36349139qvq.12
        for <linux-next@vger.kernel.org>; Tue, 07 Jan 2020 03:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ajwwg1tTuaqvf2+iTZv4F7nVRs4fx4vlQX7SEEZvm5I=;
        b=PXVZ1VqxmftlAzfoC2PJH8ZzdysJtCySrXZKO5hkeWb2eb0Hn65PVme0x5GwBIOyXL
         Rrs744gedw9VPk0j0lamlPU6XjPyZS+SqseXUimq2TigjbsUEEmNiaeJFxCIbTgHtavK
         hy6f5haT2BT6Nbv97TmPMzBAncrt+MlPLejKbd/JiM/SAk6I89KZcsKBtX29RcPL+Dns
         Ki2zedJwBF4V/U7WKeTd6/Q5cb+BxoozcGeGm8d20TIJMudHzaK+x7Mvq4i0+qkNRiyT
         euTrHHQo/WlO+4AU/SelF8Z6pka4YWic+VT3xRXZyIA68bHs8mRyt2yEAXLa2Y9LWX1y
         LhCg==
X-Gm-Message-State: APjAAAUpGY8oDgK9lLBEOquUc06oRPYAoKTEGnv+TgZuydo5wSfawp0b
        Stqf7GqoOyUnOkZ+cbyUqQmdWl1cZrQLSSdwnleB8K5TVR+nDbfx7/jWLrdfMEdq3hvtryUXTAv
        1qYhcAX0QZtpqaIyLxdQbHg==
X-Received: by 2002:a05:620a:548:: with SMTP id o8mr89001517qko.490.1578397676015;
        Tue, 07 Jan 2020 03:47:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPdW3bN5Qrk8jx6DNFsiQ6HbJh5wOHP1je7PYJ8IDXlHg3qat/Sw8UC73f0mXWvj1+oj563Q==
X-Received: by 2002:a05:620a:548:: with SMTP id o8mr89001491qko.490.1578397675714;
        Tue, 07 Jan 2020 03:47:55 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
        by smtp.gmail.com with ESMTPSA id f19sm22090879qkk.69.2020.01.07.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 03:47:54 -0800 (PST)
Date:   Tue, 7 Jan 2020 06:47:49 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200107064113-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 07, 2020 at 12:34:50PM +0100, Christian Borntraeger wrote:
> 
> 
> On 07.01.20 10:39, Michael S. Tsirkin wrote:
> > On Tue, Jan 07, 2020 at 09:59:16AM +0100, Christian Borntraeger wrote:
> >>
> >>
> >> On 06.01.20 11:50, Michael S. Tsirkin wrote:
> >>> On Wed, Dec 18, 2019 at 04:59:02PM +0100, Christian Borntraeger wrote:
> >>>> On 18.12.19 16:10, Michael S. Tsirkin wrote:
> >>>>> On Wed, Dec 18, 2019 at 03:43:43PM +0100, Christian Borntraeger wrote:
> >>>>>> Michael,
> >>>>>>
> >>>>>> with 
> >>>>>> commit db7286b100b503ef80612884453bed53d74c9a16 (refs/bisect/skip-db7286b100b503ef80612884453bed53d74c9a16)
> >>>>>>     vhost: use batched version by default
> >>>>>> plus
> >>>>>> commit 6bd262d5eafcdf8cdfae491e2e748e4e434dcda6 (HEAD, refs/bisect/bad)
> >>>>>>     Revert "vhost/net: add an option to test new code"
> >>>>>> to make things compile (your next tree is not easily bisectable, can you fix that as well?).
> >>>>>
> >>>>> I'll try.
> >>>>>
> >>>>>>
> >>>>>> I get random crashes in my s390 KVM guests after reboot.
> >>>>>> Reverting both patches together with commit decd9b8 "vhost: use vhost_desc instead of vhost_log" to
> >>>>>> make it compile again) on top of linux-next-1218 makes the problem go away.
> >>>>>>
> >>>>>> Looks like the batched version is not yet ready for prime time. Can you drop these patches until
> >>>>>> we have fixed the issues?
> >>>>>>
> >>>>>> Christian
> >>>>>>
> >>>>>
> >>>>> Will do, thanks for letting me know.
> >>>>
> >>>> I have confirmed with the initial reporter (internal test team) that <driver name='qemu'/> 
> >>>> with a known to be broken linux next kernel also fixes the problem, so it is really the
> >>>> vhost changes.
> >>>
> >>> OK I'm back and trying to make it more bisectable.
> >>>
> >>> I pushed a new tag "batch-v2".
> >>> It's same code but with this bisect should get more information.
> >>
> >> I get the following with this tag
> >>
> >> drivers/vhost/net.c: In function ‘vhost_net_tx_get_vq_desc’:
> >> drivers/vhost/net.c:574:7: error: implicit declaration of function ‘vhost_get_vq_desc_batch’; did you mean ‘vhost_get_vq_desc’? [-Werror=implicit-function-declaration]
> >>   574 |   r = vhost_get_vq_desc_batch(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
> >>       |       ^~~~~~~~~~~~~~~~~~~~~~~
> >>       |       vhost_get_vq_desc
> >>
> > 
> > Not sure why but I pushed a wrong commit. Sorry. Should be good now.
> > 
> 
> during bisect:
> 
> drivers/vhost/vhost.c: In function ‘vhost_get_vq_desc_batch’:
> drivers/vhost/vhost.c:2634:8: error: ‘id’ undeclared (first use in this function); did you mean ‘i’?
>  2634 |  ret = id;
>       |        ^~
>       |        i
> 
> I changed that to i

Hmm no that's wrong I think. Sorry about all the errors. Let me push a
fixed v3.

> 
> The last step then gave me  (on commit 50297a8480b439efc5f3f23088cb2d90b799acef vhost: use batched version by default)
> net enc1: Unexpected TXQ (0) queue failure: -5
> in the guest.
> 
> bisect log so far:
> [cborntra@m83lp52 linux]$ git bisect log
> git bisect start
> # bad: [3131e79bb9e9892a5a6bd33513de9bc90b20e867] vhost: use vhost_desc instead of vhost_log
> git bisect bad 3131e79bb9e9892a5a6bd33513de9bc90b20e867
> # good: [d1281e3a562ec6a08f944a876481dd043ba739b9] virtio-blk: remove VIRTIO_BLK_F_SCSI support
> git bisect good d1281e3a562ec6a08f944a876481dd043ba739b9
> # good: [5b00aab5b6332a67e32dace1dcd3a198ab94ed56] vhost: option to fetch descriptors through an independent struct
> git bisect good 5b00aab5b6332a67e32dace1dcd3a198ab94ed56
> # good: [5b00aab5b6332a67e32dace1dcd3a198ab94ed56] vhost: option to fetch descriptors through an independent struct
> git bisect good 5b00aab5b6332a67e32dace1dcd3a198ab94ed56
> # bad: [1414d7ee3d10d2ec2bc4ee652d1d90ec91da1c79] vhost: batching fetches
> git bisect bad 1414d7ee3d10d2ec2bc4ee652d1d90ec91da1c79
> 
> 
> 

