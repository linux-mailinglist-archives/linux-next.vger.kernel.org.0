Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C981171406
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 10:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgB0JUi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 04:20:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45982 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728634AbgB0JUi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 04:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582795235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=gCbzF8ngsNt1OcNGVzqGmt1wtHoxk50uFJRTwLjSVxc=;
        b=fhl42HTmVQWy98U3WESfeW1vOSvuYr0SOBahtAtrFrxvHcRVEZAdvSYJpKCY9XZszUBDgu
        islIP/Fe3noO3ZSqLfC/LIAbgANmAjmcQ5xvUMIIOY5oyw3EGCNdA5EuX/G0xt4rtuVFps
        sOamzInzi588zXTqlcbs0MZPo4NR4YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-uzIyAS1gNn6CQxkiZgJSZw-1; Thu, 27 Feb 2020 04:20:26 -0500
X-MC-Unique: uzIyAS1gNn6CQxkiZgJSZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648BD1005514;
        Thu, 27 Feb 2020 09:20:25 +0000 (UTC)
Received: from [10.36.116.36] (ovpn-116-36.ams2.redhat.com [10.36.116.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7903B5C57C;
        Thu, 27 Feb 2020 09:20:20 +0000 (UTC)
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kvms390 tree
To:     John Hubbard <jhubbard@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20200227141148.05d7d502@canb.auug.org.au>
 <1217420e-42e4-9179-883f-125cf278caec@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <adf233cd-9c7a-1c2e-82bc-83bc8572faa2@redhat.com>
Date:   Thu, 27 Feb 2020 10:20:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1217420e-42e4-9179-883f-125cf278caec@nvidia.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Yes. Changes to mm/gup.c really should normally go through linux-mm and=
=20
> Andrew's tree, if at all possible. This would have been caught, and fig=
ured out
> on linux-mm, had that been done--instead of leaving the linux-next main=
tainer
> trying to guess at how to resolve the conflict.
>=20
> +Cc David Hildenbrand, who I see looked at the kvms390 proposed patch a=
 bit.
> Maybe he has some opinions, especially about my questions below.

I'll leave figuring out the details to Christian/Claudio (-EBUSY) :)

>=20
> The fix-up below may (or may not) need some changes:
>=20
>=20
> diff --cc mm/gup.c
> index 354bcfbd844b,f589299b0d4a..000000000000
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@@ -269,18 -470,11 +468,19 @@@ retry
>   		goto retry;
>   	}
>  =20
> + 	/* try_grab_page() does nothing unless FOLL_GET or FOLL_PIN is set. =
*/
> + 	if (unlikely(!try_grab_page(page, flags))) {
> + 		page =3D ERR_PTR(-ENOMEM);
> + 		goto out;
> + 	}
>  +	if (flags & FOLL_GET) {
>=20
>=20
> If I'm reading the diff correctly, I believe that line should *maybe* b=
e changed to:
>=20
> 	if (flags & (FOLL_GET | FOLL_PIN)) {
>=20
> ...because each of those flags has a similar effect: pinned pages for D=
MA or RDMA
> use. So either flag will require a call to arch_make_page_accessible().=
..except that
> I'm not sure that's what you want. Would the absence of a call to=20
> arch_make_page_accessible() cause things like pin_user_pages() to not w=
ork correctly?
> Seems like it would, to me.

Yes, it's required. From the commit message "enable paging, file backing
etc, it is also necessary to protect the host against a malicious user
space. For example a bad QEMU could simply start direct I/O on such
protected memory.". So we really want to convert the page from
unencrypted/inaccessible to encrypted/accessible at this point (iow,
make it definitely accessible, and make sure it stays accessible).

>=20
> (I'm pretty unhappy that we have to ask this at the linux-next level.)

Yeah, I *think* this fell through the cracks (on linux-mm, but also in
Andrew's inbox) because the series has a big fat "KVM: s390:" as prefix.
Christian decided to pull it in to give it some churn yesterday (I think
he originally wanted to have this patch and the other KVM protvirt
patches in 5.7 [2] ... but not sure what will happen due to this conflict=
).

At least now this patch has attention ... although it would have been
better if linux-next admins wouldn't have to mess with this :)

[1] https://lkml.kernel.org/r/20200224114107.4646-2-borntraeger@de.ibm.co=
m
[2] https://lkml.kernel.org/r/20200224114107.4646-1-borntraeger@de.ibm.co=
m

--=20
Thanks,

David / dhildenb

