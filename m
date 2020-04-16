Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FBB1AB681
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 06:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDPEHw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 00:07:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23344 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726373AbgDPEHu (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 00:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587010068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OTMaR92SihjV5ChuxWQeel8tadAmxm943VhVpwb3Ti0=;
        b=gecUyLKd24iGSWQgXTMtgwGBgr0odhlAFp9iEpQ//lDNLRYkX4Ci09bDX74+/GZ4Kw+JIr
        MTrLrz2Mxdan1tOJMbaUz6V06ANdce2Nub72EyjpuWe0sgrItc/oMhUDfDI8lK32qf4kqH
        GvSM9xnmagVOIDdhYpdSHddFwKf6GGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-7eV2h5M0OHOPzkEfEcYyJw-1; Thu, 16 Apr 2020 00:07:44 -0400
X-MC-Unique: 7eV2h5M0OHOPzkEfEcYyJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67ACC800D5C;
        Thu, 16 Apr 2020 04:07:13 +0000 (UTC)
Received: from [10.72.13.240] (ovpn-13-240.pek2.redhat.com [10.72.13.240])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 480FFD7664;
        Thu, 16 Apr 2020 04:07:07 +0000 (UTC)
Subject: Re: linux-next: Tree for Apr 15 (vdpa)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org
References: <20200415152240.2422e06c@canb.auug.org.au>
 <620e1646-5899-a077-b9de-95443887364d@infradead.org>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
Date:   Thu, 16 Apr 2020 12:07:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <620e1646-5899-a077-b9de-95443887364d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2020/4/16 =E4=B8=8A=E5=8D=8812:16, Randy Dunlap wrote:
> On 4/14/20 10:22 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200414:
>>
> on x86_64:
>
> ERROR: modpost: "vringh_set_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] =
undefined!
> ERROR: modpost: "vringh_init_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko]=
 undefined!
> ERROR: modpost: "vringh_iov_push_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim=
.ko] undefined!
> ERROR: modpost: "vringh_iov_pull_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim=
.ko] undefined!
> ERROR: modpost: "vringh_complete_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim=
.ko] undefined!
> ERROR: modpost: "vringh_getdesc_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.=
ko] undefined!
>
>
> Full randconfig file is attached.
>

The config has

CONFIG_VHOST_IOTLB=3Dm
CONFIG_VHOST_RING=3Dy

But we don't select VHOST_IOTLB in VHOST_RING after commit=20
e6faeaa128417("vhost: drop vring dependency on iotlb"). Which seems wrong=
.

Thanks

