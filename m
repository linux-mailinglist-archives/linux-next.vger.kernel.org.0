Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A6F1974DE
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 09:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgC3HIj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 03:08:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:47131 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728766AbgC3HIg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 03:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585552116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZGH1z3Liep+aojQUBt0mjpc4ZGlP+CR9NlLTQMcuEaQ=;
        b=SZXSAGZ6P0Fgg45Sgq5SkGeS+mCbcVCz9v1rTpzIzkiaT2tQxWNivFgJehgqEqvoVRutC0
        F8yl0HVK8amyia+9ortXNspWRaTsYXnICIS61oUCuFlgneWHAyBq8GSFk9quTA6I+NrgUV
        vrpqhrbQscrn4Hl64i629VQpll+chYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-d-TeSxdnPO2JX-VYwSwmig-1; Mon, 30 Mar 2020 03:08:32 -0400
X-MC-Unique: d-TeSxdnPO2JX-VYwSwmig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 305A7107ACC7;
        Mon, 30 Mar 2020 07:08:31 +0000 (UTC)
Received: from [10.72.13.226] (ovpn-13-226.pek2.redhat.com [10.72.13.226])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66C7D100EBAF;
        Mon, 30 Mar 2020 07:08:23 +0000 (UTC)
Subject: Re: linux-next: manual merge of the vhost tree with the kvm-arm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200330165614.4973a4bc@canb.auug.org.au>
 <20200330165701.4e1b8039@canb.auug.org.au>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <ca62a297-1834-ffcc-41ae-5cb3009e56b1@redhat.com>
Date:   Mon, 30 Mar 2020 15:08:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200330165701.4e1b8039@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2020/3/30 =E4=B8=8B=E5=8D=881:57, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 30 Mar 2020 16:56:14 +1100 Stephen Rothwell<sfr@canb.auug.org.a=
u>  wrote:
>> Today's linux-next merge of the vhost tree got a conflict in:
>>
>>    arch/arm/kvm/Kconfig
>>
>> between commit:
>>
>>    541ad0150ca4 ("arm: Remove 32bit KVM host support")
>>
>> from the kvm-arm tree and commit:
>>
>>    ec9d8449a99b ("vhost: refine vhost and vringh kconfig")
>>
>> from the vhost tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>                   ^^^^^^^^^
> I just removed the file, of course.


Hi Stephen:

If you meant arch/arm/kvm/Kconfig I think it's correct.

Thakns

