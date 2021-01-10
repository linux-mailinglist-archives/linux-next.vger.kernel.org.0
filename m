Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B321D2F09FC
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 23:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbhAJWPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 17:15:09 -0500
Received: from ozlabs.org ([203.11.71.1]:60683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbhAJWPI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 17:15:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDWN003mwz9sWj;
        Mon, 11 Jan 2021 09:14:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610316864;
        bh=s2XpAHrduM2oG3p2MwcDtNCui6wvP6Mnlh73Fvcb0B0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DVF5S7nNz0NXGTlfvqVgcqhtyrKhy0ydDCFS333W3OlpK18ZCfP+Sj4QeVqw3WuaV
         CXeQn7dOtq0II6sOrRztKBNpiJ7dLSFNMF67t2gVqgSZIbYqEpppvFOcJ/tSA8l0He
         /Bk/jIewsTnry3OWDLAxt0oJARfTY11XmQYE4Oa8+xSWu0cBCs2s4KrpuPpY7bUJtW
         QcsxPv6w1Z281c/6TH6jcJYsUFr4nCc7y7Vb9RnYZxh1/BwlLIw3ax+/IEarVHbJEq
         Re7XY/wKD7zxW+w71/0a+Q76thSxbL/NvKJqzWyRq/DDQe0efpl4d3gQjKYQKzb9zb
         PBGwyvidPcMnw==
Date:   Mon, 11 Jan 2021 09:14:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build warning after merge of the scsi-fixes tree
Message-ID: <20210111091423.693ed631@canb.auug.org.au>
In-Reply-To: <20210111083145.523d4ca8@canb.auug.org.au>
References: <20210111083145.523d4ca8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wEtgBzYHONARdd0Hw=8YAc=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wEtgBzYHONARdd0Hw=8YAc=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just cc'ing James]

On Mon, 11 Jan 2021 08:31:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the scsi-fixes tree, today's linux-next build (KCONFIG_NAME)
> produced this warning:
>=20
> Documentation/ABI/testing/sysfs-driver-ufs:915: WARNING: Malformed table.
> Text in column margin in table line 15.
>=20
> =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> 0   UFS device will stay active, UIC link will
>     stay active
> 1   UFS device will stay active, UIC link will
>     hibernate
> 2   UFS device will be moved to sleep, UIC link will
>     stay active
> 3   UFS device will be moved to sleep, UIC link will
>     hibernate
> 4   UFS device will be powered off, UIC link will
>     hibernate
> 5   UFS device will be powered off, UIC link will
>     be powered off
> 6   UFS device will be moved to deep sleep, UIC link
> will be powered off. Note, deep sleep might not be
> supported in which case this value will not be accepted
> =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> Documentation/ABI/testing/sysfs-driver-ufs:956: WARNING: Malformed table.
> Text in column margin in table line 15.
>=20
> =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> 0   UFS device will stay active, UIC link will
>     stay active
> 1   UFS device will stay active, UIC link will
>     hibernate
> 2   UFS device will be moved to sleep, UIC link will
>     stay active
> 3   UFS device will be moved to sleep, UIC link will
>     hibernate
> 4   UFS device will be powered off, UIC link will
>     hibernate
> 5   UFS device will be powered off, UIC link will
>     be powered off
> 6   UFS device will be moved to deep sleep, UIC link
> will be powered off. Note, deep sleep might not be
> supported in which case this value will not be accepted
> =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>=20
> Introduced by commit
>=20
>   0b2894cd0fdf ("scsi: docs: ABI: sysfs-driver-ufs: Add DeepSleep power m=
ode")

--=20
Cheers,
Stephen Rothwell

--Sig_/wEtgBzYHONARdd0Hw=8YAc=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7fD8ACgkQAVBC80lX
0GwWzQgAkf/6JAu91CDhFGNRXSob1x/x75rB/v9AB2DdWNOS8lgLla2sbwg63pRC
CI4yu6JmnTCQePrMl35YXglP6xrT6/IInsOO0AZj7TpGtQodMQtANf21PflrwmYY
x0LNCvnk9dH6ZkEmDFyVfNjIM64b9Rc/PnK8LMlcmrz7egii98ZOn919j/NDGpgh
xq4nx/6vF1R2uGyLV3DuvZAjeBVyQiCsdHfZHLujFyx6LUVGPMw0wumC6+6np1Ia
8h934XyG51hPcxNMpSxFIAGoQ+tgEw+kx+vfGrkLoBHf7gnr2gZ87d9pWfBicEOW
hpNxIghhWILtvlCHnHoVSDWHBuZIBg==
=/+uB
-----END PGP SIGNATURE-----

--Sig_/wEtgBzYHONARdd0Hw=8YAc=--
