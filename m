Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A37195288
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 09:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgC0IDn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 04:03:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45602 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726804AbgC0IDn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Mar 2020 04:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585296222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s3wT6nFybrS3qXNqSectqAHi2tg9aj7KFPNVsR/+fuQ=;
        b=ATJZsc91E8swZ7A4rOmfURMHOarwLaj1sT3XCH2+J20yawX1CNgjpYZmT3jdSudKJxKPy+
        StcEP0zdgnL6eoXbHa+MsKiC5CtgUPxuJAvu04yxDlxMQ59Mx7M/Y7wIp97ZsPjKCB2NnL
        dmTAhCm0Csb8QOHyb1VdTtId7L+gK9w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-SCumTFX9NCCGjGphR287ag-1; Fri, 27 Mar 2020 04:03:39 -0400
X-MC-Unique: SCumTFX9NCCGjGphR287ag-1
Received: by mail-qk1-f200.google.com with SMTP id c130so7511995qke.20
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2020 01:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s3wT6nFybrS3qXNqSectqAHi2tg9aj7KFPNVsR/+fuQ=;
        b=JL7NyYoUVGHbczU66GJECOCtNngc57wzR4oNccKivZCikoiZ9GlIac3xCeKetlSXmw
         nC/2cJ9gCDCjJZ2megCYO0Vv5sqTopTMNzFjJTvrVvAOosDbKJ8nzL+pT2pmV8aJdd/k
         DjE+JosxNKCLzyU71p8VNDcWTkXIIQPBlWb6BO81UyYaxcnI1KYfXNAr1Con7dOLlAlq
         eoDcfTPrwuZdntDn8Xt7P5yP6XAjWRo+O6ALq0q6RaO3JbigqFbFlrLDK2mekGThCZTu
         zkrn4+N1St0cRRhowLqNzlC4gplW1C/Ze8grH85roGwK6tGyPIIHXdvSMmKE6IfukXRJ
         MB8g==
X-Gm-Message-State: ANhLgQ2hVlLBT/nMe4tcGTcu/CUzSsYo1opLKTnSe23orfOuItF0+dKS
        dSBNbu0gHrrVUtDwX/ofNuLO3WdY7KYgWkK3zEYWqJuwc+Y1K5CJxGrtEl1F7g5vONFflCNzeUF
        gUmEV8yG6Ta710NQuRau37NF1pcKLj6ZxUu3j5w==
X-Received: by 2002:ac8:740b:: with SMTP id p11mr1079296qtq.379.1585296219311;
        Fri, 27 Mar 2020 01:03:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/4SQy0FyOub1InlLW148p3ySSy5TgUr8hk4E+oBfeAUrNqvwpku0dpmQMLavKQGXEsGX2v72ZtQaUhPEdb2g=
X-Received: by 2002:ac8:740b:: with SMTP id p11mr1079281qtq.379.1585296219048;
 Fri, 27 Mar 2020 01:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com> <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com> <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com> <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com> <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
 <20200211085736-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200211085736-mutt-send-email-mst@kernel.org>
From:   Eugenio Perez Martin <eperezma@redhat.com>
Date:   Fri, 27 Mar 2020 09:03:02 +0100
Message-ID: <CAJaqyWdpA-M3M3AJWuY9z7yHKbX3-zbSzssWrjur3ok8BuFR9A@mail.gmail.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 11, 2020 at 2:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 11, 2020 at 02:04:54PM +0100, Eugenio P=C3=A9rez wrote:
> > On Mon, 2020-02-10 at 12:01 +0100, Christian Borntraeger wrote:
> > >
> > > On 10.02.20 10:47, Eugenio Perez Martin wrote:
> > > > Hi Christian.
> > > >
> > > > I'm not able to reproduce the failure with eccb852f1fe6bede630e2e4f=
1a121a81e34354ab commit. Could you add more data?
> > > > Your configuration (libvirt or qemu line), and host's dmesg output =
if any?
> > > >
> > > > Thanks!
> > >
> > > If it was not obvious, this is on s390x, a big endian system.
> > >
> >
> > Hi Christian. Thank you very much for your fast responses.
> >
> > Could you try this patch on top of eccb852f1fe6bede630e2e4f1a121a81e343=
54ab?
> >
> > Thanks!
> >
> > >From 71d0f9108a18aa894cc0c0c1c7efbad39f465a27 Mon Sep 17 00:00:00 2001
> > From: =3D?UTF-8?q?Eugenio=3D20P=3DC3=3DA9rez?=3D <
> > eperezma@redhat.com>
> > Date: Tue, 11 Feb 2020 13:19:10 +0100
> > Subject: [PATCH] vhost: fix return value of vhost_get_vq_desc
> >
> > Before of the batch change, it was the chain's head. Need to keep that
> > way or we will not be able to free a chain of descriptors.
>
> I think it's cleaner to have all descriptors in the chain
> have the same id.
>

Hi Michael.

Not sure if I understood you correctly. All the descriptors in the
chain still have the same id, this just returns the first one instead
of update it in every loop iteration. Can left unapplied in the final
version though, is up to you.

> > Fixes: eccb852f1fe6 ("vhost: batching fetches")
> > ---
> >  drivers/vhost/vhost.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index b5a51b1f2e79..fc422c3e5c08 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2409,12 +2409,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *v=
q,
> >                       *out_num +=3D ret;
> >               }
> >
> > -             ret =3D desc->id;
> > -
> >               if (!(desc->flags & VRING_DESC_F_NEXT))
> >                       break;
> >       }
> >
> > +     ret =3D vq->descs[vq->first_desc].id;
> >       vq->first_desc =3D i + 1;
> >
> >       return ret;
> > --
> > 2.18.1
>

