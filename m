Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900423B3CB9
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 08:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhFYGhG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 02:37:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50321 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhFYGhF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 02:37:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GB6g74Tk1z9sTD;
        Fri, 25 Jun 2021 16:34:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624602884;
        bh=IIl6x8j2ZhmvAAB4VBYoC6SU7LYFxneW+C5kK69f0/0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KHwJkvCfaZlcdAL2zWEUujVIQ/WZfZ4LXQ4n9BaIl1VnGeLYj6Ysgd7IBOtirPEuw
         qEStWgx16Wj4EUA49/6SDDXdNSL5jYeNwy5ZgLuxmajvM5/95SIQ98nLpBqrlUMMIE
         6zsFoGzn6U2/uye0GcI9Ai1lVFprdh55NAPu+u3tYaeUS7waPz1Gu31MRrgVuKsj7Y
         3+RlVHe3yhEGdVdxnaPiy30e6rzElKwU5BS0gSlU1v1ogvxNxyZ4aqVRSwN8EmPAkc
         X9YoGt25OTJd9jc58DPBrV+vvNuzP2iYfmqP9a+RsJZaEnQ5jo5NoqmCzDrFFxgjBY
         p6HmO0JNXNRDQ==
Date:   Fri, 25 Jun 2021 16:34:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Gavin Shan <gshan@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210625163442.185b8cb0@canb.auug.org.au>
In-Reply-To: <0b1d5003-830e-b284-0fca-cc62d9192b65@redhat.com>
References: <20210624194301.7474ce76@canb.auug.org.au>
        <0b1d5003-830e-b284-0fca-cc62d9192b65@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kw91FsTD=1lQWw1cgnnpnUJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kw91FsTD=1lQWw1cgnnpnUJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, 25 Jun 2021 16:28:15 +1000 Gavin Shan <gshan@redhat.com> wrote:
>
> On 6/24/21 7:43 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > mm/page_reporting.c:14:37: error: initializer element is not constant
> >     14 | unsigned int page_reporting_order =3D pageblock_order;
> >        |                                     ^~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >    223f64d9e679 ("mm/page_reporting: export reporting order as module p=
arameter")
> >=20
> > pageblock_order is defined to be various things depending on CONFIG_
> > symbols.
> >=20
> > I have reverted that commit (and the following three) for today.
> >  =20
>=20
> Yes, Please drop this series for now.
>=20
> The v3 was applied and caused the build error. Actually, we need
> v5, which was posted couple of hours ago.
>=20
>     v5: https://lkml.org/lkml/2021/6/24/1137

Which version is in today's mmotm?

--=20
Cheers,
Stephen Rothwell

--Sig_/Kw91FsTD=1lQWw1cgnnpnUJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVeQIACgkQAVBC80lX
0Gwd1QgAlpNPHbE0X+XSj/+sPtMPZIaBNoMgTv397VTW0/cbAIcO+o2ZWCVIMYB1
j4sGvILX0ziSaEZnnwGiLjy9qmpPvArrovUpWdtnWvIUBUxaChqvXpAIrWYizzsq
N6hZ3cy8i4NN7/dwSCmWexr9f3aOjXRdZ8u8I/EZ/HcR5MvzoJ30bHE3JQAKBOuH
HDuu3YoyY4lGz1bkRUd9ILOFpBdM4VNcdycGS/E23BGvvvagYuTrVM12z0JrCqy7
rai4qrpDV0nXVXjVkPIVf9DqrVCsv/MH03YKTVENGA7s50qw80PKSgt0kSFfmjzj
6UyyGq48gORFtNAB3VTlZcLe7CypHg==
=yI67
-----END PGP SIGNATURE-----

--Sig_/Kw91FsTD=1lQWw1cgnnpnUJ--
