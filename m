Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAE11989EA
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 04:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgCaC2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 22:28:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23185 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729358AbgCaC2A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 22:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585621678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q2t+J3lF5AuQxznbMUm1nciYFyVRK4OogfDMwj7plOg=;
        b=ZIHIB8heW+xBsxMoCvlRqaqH/EyLjpknxUY1Yx/RoNlj9nzGd0P1xF7mOWIu76iAXbHPaT
        q4Ko1hteb3ZMNJiT59618uyKBCBAeMH4yWTD+GosS4r301WBslzxTJrsrhIYjotqLP8whY
        FYPWYmzhTRKzciKml2tkRydQ+CLpbUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5evQtK8jNxSPzYKNQlUjZA-1; Mon, 30 Mar 2020 22:27:56 -0400
X-MC-Unique: 5evQtK8jNxSPzYKNQlUjZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA66800D5B;
        Tue, 31 Mar 2020 02:27:54 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 402E01001B3F;
        Tue, 31 Mar 2020 02:27:49 +0000 (UTC)
Subject: Re: linux-next: Tree for Mar 30 (vhost)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        KVM <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <649927d4-9851-c369-2ad2-bf25527b057a@redhat.com>
Date:   Tue, 31 Mar 2020 10:27:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2020/3/31 =E4=B8=8A=E5=8D=881:22, Randy Dunlap wrote:
> On 3/30/20 2:43 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> The merge window has opened, so please do not add any material for the
>> next release into your linux-next included trees/branches until after
>> the merge window closes.
>>
>> Changes since 20200327:
>>
>> The vhost tree gained a conflict against the kvm-arm tree.
>>
> (note: today's linux-next is on 5.6-rc7.)
>
> on x86_64:
>
> # CONFIG_EVENTFD is not set
>
> ../drivers/vhost/vhost.c: In function 'vhost_vring_ioctl':
> ../drivers/vhost/vhost.c:1577:33: error: implicit declaration of functi=
on 'eventfd_fget'; did you mean 'eventfd_signal'? [-Werror=3Dimplicit-fun=
ction-declaration]
>     eventfp =3D f.fd =3D=3D -1 ? NULL : eventfd_fget(f.fd);
>                                   ^~~~~~~~~~~~
>                                   eventfd_signal
> ../drivers/vhost/vhost.c:1577:31: warning: pointer/integer type mismatc=
h in conditional expression
>     eventfp =3D f.fd =3D=3D -1 ? NULL : eventfd_fget(f.fd);


Will fix.

VHOST should depend on EVENTFD now.

Thanks


>                                 ^
>

