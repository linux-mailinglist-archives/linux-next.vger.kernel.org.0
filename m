Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF54A323377
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 22:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhBWVu4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 16:50:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231721AbhBWVu4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 16:50:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlXll3kslz9sTD;
        Wed, 24 Feb 2021 08:50:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614117011;
        bh=LeqYiL6xDMx+PuUPfQq9szKPfh7MEt+rtWM9ht8WzPM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=crmZcab5kShsglH/hXDLN/dJ1kre4F0WFwW/4hpdTkBnMP+UNfSmOG9C7eMF/7RsA
         5xN8h0MeYGFpr9fNxX7o3TF2PtKzz+kIKNvLvJG4l93z4jq5YUC1o+iyWFo0/wDfQo
         u/9ZE5Xb+09FtBm1pFepPKySFrpzIjEjsYR+PP1EptoVJ1P79tnMzC7PlGAKZYjuRx
         MAT4sPqikPG9aCHRIUI/AWm5L+3gbrfbKNVMfehVzcP98VYYHdkgbVjtwzcjLpWsbt
         X8HgfAqL4VdczHFFurzudtrOhEfqaXorbGOL4VMWbD3C2JQwS/W8rwaNYXOlKgLlyH
         hcY/2y/KkkpYA==
Date:   Wed, 24 Feb 2021 08:50:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "Ernst, Justin" <justin.ernst@hpe.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Message-ID: <20210224085010.28c66ba8@canb.auug.org.au>
In-Reply-To: <AT5PR8401MB130092CFAECCDB469375063487859@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210219075853.0514c9f9@canb.auug.org.au>
        <AT5PR8401MB130092CFAECCDB469375063487859@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nh3ZNsiWHn1O+CfbD7BXQhl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nh3ZNsiWHn1O+CfbD7BXQhl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Feb 2021 22:47:57 +0000 "Ernst, Justin" <justin.ernst@hpe.com> w=
rote:
>
> Hi,
> We made a special effort to squash the unexpected indentation warnings in=
 c159376490ee (https://lore.kernel.org/lkml/20201130214304.369348-1-justin.=
ernst@hpe.com/), so I was surprised to see this again.
> Commit:
>=20
> 	c9624cb7db1c ("x86/platform/uv: Update sysfs documentation")
>=20
> is the culprit here. I suspect it was written and submitted before we mad=
e the effort to fix the Unexpected indentation in c159376490ee, so it mispl=
aced the first line of a codeblock, the original problem that was reported =
and fixed.
>=20
> The fix:
>=20
> diff --git a/Documentation/ABI/testing/sysfs-firmware-sgi_uv b/Documentat=
ion/ABI/testing/sysfs-firmware-sgi_uv
> index 637c668cbe45..12ed843e1d3e 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-sgi_uv
> +++ b/Documentation/ABI/testing/sysfs-firmware-sgi_uv
> @@ -39,8 +39,8 @@ Description:
>=20
>                 The uv_type entry contains the hub revision number.
>                 This value can be used to identify the UV system version::
> -                       "0.*" =3D Hubless UV ('*' is subtype)
>=20
> +                       "0.*" =3D Hubless UV ('*' is subtype)
>                         "3.0" =3D UV2
>                         "5.0" =3D UV3
>                         "7.0" =3D UV4
>=20
> Thanks,
> Justin
>=20
> > Building Linus' tree, today's linux-next build (htmldocs) produced
> > this warning:
> >=20
> > Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected =
indentation.
> >=20
> > Introduced by commit
> >=20
> >   c159376490ee ("x86/platform/uv: Update ABI documentation of /sys/firm=
ware/sgi_uv/")
> >=20
> > Or maybe an ealier one.
> >=20
> > This has been around for some time.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nh3ZNsiWHn1O+CfbD7BXQhl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1eJIACgkQAVBC80lX
0GySvwf/U1KZBGh6FI7PTs0ra/huW36XhzhrjTfWjiEa+xwpv8jkkUHkvBK9aHK2
+a7iQYNpq5q1W9i5/RgoI79oXhll5JfEpE3uND2pGQ9jv3dsTHO8F7tWojCQrmdh
NqLPVRtf9j/P29Oux+xJVn+QFN2VaNjZfCIOy8RNjY9SyQhEVaJhHXAWSbATfHfl
HG7zt0hgLL4Hwl1u7ZTvF0Rk1OMoPo7+b9djNnBnYJ3P+d8ycexahFZsC7AmnuwI
20nVeo3Xqs1BE1TKYr/V795btRiL/bHwbhA2twbzVaUhG+EEMMsXI9x54ftAXHzO
HDWRgfo8sd40oYjfjeeN+pnacBU9iA==
=D+lG
-----END PGP SIGNATURE-----

--Sig_/Nh3ZNsiWHn1O+CfbD7BXQhl--
