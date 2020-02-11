Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41E6159123
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 14:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgBKN6V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 08:58:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22105 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728091AbgBKN6U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 08:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581429498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WG0Npq/OjpsV9gQYxRWfzFxfkdPt4v/t5ykKU8PVL2k=;
        b=KhvBvuC97C4MY12yCudTQbd1Jr79/g68mzIh1IAz4g32ClOlsGyNWNktHQc3qe04LKp31L
        +ICUfzfPMhyFb1LNCVwzmlHANF3xy2YEjOAjWun45yJSCw9uU1mdjKplRSsFFU2mp8fWPn
        VtyFAteJl2x7fjslI4Q4Ahh3NGWlHx4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-jHow648bNS2vINeEGhLrLw-1; Tue, 11 Feb 2020 08:58:04 -0500
X-MC-Unique: jHow648bNS2vINeEGhLrLw-1
Received: by mail-qk1-f199.google.com with SMTP id a132so7104577qkg.5
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2020 05:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WG0Npq/OjpsV9gQYxRWfzFxfkdPt4v/t5ykKU8PVL2k=;
        b=f7cf3GBqZjLoDeACHmxibuR+0poZfUH80aOwBVAchecfP3ZaXc3W3Er+88vF2McDDv
         O+Ohx0VpovbB4b3z1aXhGp4eBen3/Rau33pyS7nKU28mkMC75APAjw8d8qbpNf+A3NsX
         pzyxF1sZfZ+k3YFi5h6UYOSVzt/Ey2RWA9Tmy2xOiGbVW6RKSxjtPbSWu6OnVdWTYRtW
         IOMAJhEH2g+GK0CKBOoy84K+m+wEqV8da0YWG1qOm3U1WnYrSP1v1tgLnF3KMvyL4LjT
         BFlMnC+i6/T+z/OzMYk/7QhS3wUzdIbWKm/+uWtJ5I+YLwd/ePXUlFwOolXI8aIZPOvV
         vEjQ==
X-Gm-Message-State: APjAAAUC3sBf/W2DO9wiRFKkDem2vRhibSmWTqJsdM5YuMypv6pTS+42
        SjN8zUnaajnkWKnEFwpvkGM2/AcXfdeJ0jqxqh/BKflnWXplpCE7inQKZexHrOjIVu+tTNRC4ef
        oruyRKvuiNsX0r0ZXwmtOLQ==
X-Received: by 2002:ad4:49ca:: with SMTP id j10mr2823701qvy.155.1581429483897;
        Tue, 11 Feb 2020 05:58:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqz11UYC/BUBAy6kXD/YknIJWxgOMbrK5yvh/VgO+Bst7ojYaRjy5EybVs2SGNTw/K86LmEO+w==
X-Received: by 2002:ad4:49ca:: with SMTP id j10mr2823688qvy.155.1581429483704;
        Tue, 11 Feb 2020 05:58:03 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
        by smtp.gmail.com with ESMTPSA id a72sm2102422qkc.121.2020.02.11.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 05:58:02 -0800 (PST)
Date:   Tue, 11 Feb 2020 08:57:58 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200211085736-mutt-send-email-mst@kernel.org>
References: <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 11, 2020 at 02:04:54PM +0100, Eugenio Pérez wrote:
> On Mon, 2020-02-10 at 12:01 +0100, Christian Borntraeger wrote:
> > 
> > On 10.02.20 10:47, Eugenio Perez Martin wrote:
> > > Hi Christian.
> > > 
> > > I'm not able to reproduce the failure with eccb852f1fe6bede630e2e4f1a121a81e34354ab commit. Could you add more data?
> > > Your configuration (libvirt or qemu line), and host's dmesg output if any?
> > > 
> > > Thanks!
> > 
> > If it was not obvious, this is on s390x, a big endian system.
> > 
> 
> Hi Christian. Thank you very much for your fast responses.
> 
> Could you try this patch on top of eccb852f1fe6bede630e2e4f1a121a81e34354ab?
> 
> Thanks!
> 
> >From 71d0f9108a18aa894cc0c0c1c7efbad39f465a27 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <
> eperezma@redhat.com>
> Date: Tue, 11 Feb 2020 13:19:10 +0100
> Subject: [PATCH] vhost: fix return value of vhost_get_vq_desc
> 
> Before of the batch change, it was the chain's head. Need to keep that
> way or we will not be able to free a chain of descriptors.

I think it's cleaner to have all descriptors in the chain
have the same id.

> Fixes: eccb852f1fe6 ("vhost: batching fetches")
> ---
>  drivers/vhost/vhost.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index b5a51b1f2e79..fc422c3e5c08 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2409,12 +2409,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>  			*out_num += ret;
>  		}
>  
> -		ret = desc->id;
> -
>  		if (!(desc->flags & VRING_DESC_F_NEXT))
>  			break;
>  	}
>  
> +	ret = vq->descs[vq->first_desc].id;
>  	vq->first_desc = i + 1;
>  
>  	return ret;
> -- 
> 2.18.1

