Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4990E3388D0
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 10:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhCLJiy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Mar 2021 04:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42433 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232590AbhCLJiX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Mar 2021 04:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615541903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mpHmkAmgeNh6Uudp5GOdEHuyeyiu4LHNc87R2DZlEKg=;
        b=BKq7Gd0c1SkBnPYVk3EeyFIAkyq1REB3ZFyyNSP8/A/7fYZyJAzA8rmZuQVGrPXllh4qw5
        06DY5ZLOf8IHXzbBN8KJcqmnMFjS5IsS0M+8vpqEofeD1O0NbOlh+6qf/Gov3X+9QNgaoZ
        mFhZqoroqBJAsUtrumiqiB1TT9FAC7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-m9MHugSjOduLBfBo7siBCg-1; Fri, 12 Mar 2021 04:38:19 -0500
X-MC-Unique: m9MHugSjOduLBfBo7siBCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDBC802B7E;
        Fri, 12 Mar 2021 09:38:17 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-47.pek2.redhat.com [10.72.13.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45F9419106;
        Fri, 12 Mar 2021 09:38:06 +0000 (UTC)
Subject: Re: linux-next: Tree for Mar 11 [drivers/vdpa/virtio_pci/vp_vdpa.ko]
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org
References: <20210311161449.7f58e7a3@canb.auug.org.au>
 <197e3f0f-9e16-3597-f2c7-ab988e3e0a4d@infradead.org>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <eeecbd7e-a11f-8fc7-400b-6aec3919b8f9@redhat.com>
Date:   Fri, 12 Mar 2021 17:38:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <197e3f0f-9e16-3597-f2c7-ab988e3e0a4d@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2021/3/12 2:18 上午, Randy Dunlap wrote:
> On 3/10/21 9:14 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Warning: Some of the branches in linux-next are still based on v5.12-rc1,
>> so please be careful if you are trying to bisect a bug.
>>
>> News: if your -next included tree is based on Linus' tree tag
>> v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
>> consider rebasing it onto v5.12-rc2. Also, please check any branches
>> merged into your branch.
>>
>> Changes since 20210310:
>>
> on i386:
>
> ERROR: modpost: "vp_modern_get_queue_notify_off" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_get_num_queues" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_probe" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_queue_address" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_set_queue_size" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_set_queue_enable" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_get_queue_enable" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_get_features" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_set_features" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_set_status" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_get_status" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_config_vector" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_queue_vector" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_generation" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
> ERROR: modpost: "vp_modern_remove" [drivers/vdpa/virtio_pci/vp_vdpa.ko] undefined!
>
>
> Full randconfig file is attached.

Fix sent.

Thanks.

>

