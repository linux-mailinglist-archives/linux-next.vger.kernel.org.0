Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD0B19BD60
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 10:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387698AbgDBIPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Apr 2020 04:15:09 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35327 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726211AbgDBIPI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2020 04:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585815307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sya16GgscQWBGe8FVvcdkczCb3z+w5XFXS8649TwHeM=;
        b=bxcwX6KrYA+ODuKogiqqEnCYmXi4zYSKjbUCNQToVdo/BmFDAUA3bLhtbX4RV1ESE1Uyrp
        Z2pqupmsEojcLhK9BS/3ygFNxRHmY1o9IUQXYdiG1ZL3D8XbWGgxr/6m7kF+Po9yk3nFGa
        PjIWbti0NR9qAHzjn8MEwplnoXjIHHw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-d3VakBr2Nu65ESRYgnjViw-1; Thu, 02 Apr 2020 04:15:05 -0400
X-MC-Unique: d3VakBr2Nu65ESRYgnjViw-1
Received: by mail-wm1-f70.google.com with SMTP id f128so101994wmf.2
        for <linux-next@vger.kernel.org>; Thu, 02 Apr 2020 01:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=sya16GgscQWBGe8FVvcdkczCb3z+w5XFXS8649TwHeM=;
        b=DLo1D6H5sBWCnVHrdUXauK19XlSv6ZgB6YUJl+8A0QZSGijZ6FC7OkKXyDeqfXVohZ
         bpXm4Mcof/uVL6r+dOpuOggi6hPW8J6zge8jZ5ym8mU5evrubGarTDHMnjO5LIpIIR/N
         0gzSJC/oP3mBN3HTTIJPGgdlQ/PGZXJuycSYbgus3ljC1AiZYDbsKAcFKbYUOix6H2eR
         ky9AtqKmz1TOwKZXRSxuEszdLbgSOMnbFjxzAjtTZIfvHOjXmsA2/mNrGVoA8TY0fdyv
         s2GQKolFXvRsFLT3d3oYFRlB4gYs5dtFlckVHf/zNjVn5NQr72WM8Gsu0jwPoPC6OUmk
         RcgA==
X-Gm-Message-State: AGi0PubXomSA0cJ6sPJBDmxS60gDTliHk4k07S4oWsBF6tI2ATVcNP39
        +Nx31A9PUpZHnlkRInUHDcCdrblJQzRsvRICuMJUpQloLV9XANfPRM+JxmTkmG3FTNoltBsaasX
        cx6WTyYEP5rKz85szw/veAA==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr1448323wme.178.1585815304265;
        Thu, 02 Apr 2020 01:15:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKrVCvCu2TCJw9Lc9tHS5eH8r8weVzmyktk9rGmdg9mOVC7Tj0K5fqv9S8zIbPLu4KJEGJ0bw==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr1448286wme.178.1585815303858;
        Thu, 02 Apr 2020 01:15:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1868:42dd:216c:2c09? ([2001:b07:6468:f312:1868:42dd:216c:2c09])
        by smtp.gmail.com with ESMTPSA id g2sm6289801wrs.42.2020.04.02.01.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 01:15:03 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Haiwei Li <lihaiwei.kernel@gmail.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Joerg Roedel <jroedel@suse.de>
References: <20200402133637.296e70a9@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2cdc7a3e-d516-70d5-9bfb-d077d40b07ed@redhat.com>
Date:   Thu, 2 Apr 2020 10:15:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402133637.296e70a9@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BxqdilmDw8NfJrdybYlCOjBMxClEdTdaG"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BxqdilmDw8NfJrdybYlCOjBMxClEdTdaG
Content-Type: multipart/mixed; boundary="qoP0eidW5UXD2MMeQYcjy7cD7ZVgpOqFc"

--qoP0eidW5UXD2MMeQYcjy7cD7ZVgpOqFc
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/04/20 04:36, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the kvm tree got a conflict in:
>=20
>   arch/x86/kvm/svm/svm.c
>=20
> between commits:
>=20
>   aaca21007ba1 ("KVM: SVM: Fix the svm vmexit code for WRMSR")
>   2da1ed62d55c ("KVM: SVM: document KVM_MEM_ENCRYPT_OP, let userspace d=
etect if SEV is available")
>   2e2409afe5f0 ("KVM: SVM: Issue WBINVD after deactivating an SEV guest=
")
>=20
> from Linus' tree and commits:
>=20
>   83a2c705f002 ("kVM SVM: Move SVM related files to own sub-directory")=

>   41f08f0506c0 ("KVM: SVM: Move SEV code to separate file")
>=20
> (at least)
>=20
> from the kvm tree.
>=20
> Its a bit of a pain this code movement appearing during the merge
> window.  Is it really intended for v5.7?

Yes, it's just due to code movement (a file was split, which I left last
to avoid pain for contributors and minimal room for regressions).
Unfortunately, git ends up being confused, but "git merge -X histogram"
actually does the right thing.

Paolo


--qoP0eidW5UXD2MMeQYcjy7cD7ZVgpOqFc--

--BxqdilmDw8NfJrdybYlCOjBMxClEdTdaG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl6FnwUACgkQv/vSX3jH
roNcuQf+Pnwk8LWzhHjlkw+o2KkL4PGRDA/BdTHLccdoHWWnmGUQzwhlp31eIQP5
4bccMDyxPhL/0y1a/zfto428r6kWHv6n/WevUKCkA44yHxVEPOY7r5mfB0oM0Q7D
g56VanOOkTkT/iZ3IsAFvsR6YxsoWTok6i8Kq6DlPEtepGaYyvzJkiJojj3Wj5Co
KSNoGFk9+1B4UvtButNuBxITfKbYIDiu78SYTzx5/EMQ4mvfVuYJHdF/tZGGq4vx
2WJs5bB8cbd0BGomA6ITNJ/ar+WvzK+GQ5UNRQ7FTdelHqTQ0pUSGwhXc9PoST9A
FSXeI+dBrwbXmwO8hTCBmqZUFpCHPQ==
=sLmu
-----END PGP SIGNATURE-----

--BxqdilmDw8NfJrdybYlCOjBMxClEdTdaG--

