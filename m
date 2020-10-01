Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488E527FC97
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 11:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbgJAJnp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 05:43:45 -0400
Received: from ozlabs.org ([203.11.71.1]:50541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgJAJnp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 05:43:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C27VP09d9z9sTs;
        Thu,  1 Oct 2020 19:43:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601545421;
        bh=J4X96+CdZJrxFVmnrvuTEdZgARQMFxDjr3Wg7nv6vME=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dcSwWLO7nvRjFCjH7jjzIW4PzmXRPFoFnKyIqs9MIKcrJTT6bSvtRapRgAnEVMF6S
         ZPGqqBWmSyHxkFFp0uOsCQOMmvo4j7QaWOWTfnUmeibQ7Sgk5oO4pHaHV/ek/1qeaH
         gNpxo6cNc+SFkN962SR7L8sTXkfYX9nPCQAVHqb3KUAjSXDGQoqtV2g6hfMTUbp+rz
         bx1gPzLOfP/qRdpfeSIVGoFEtkoa34SmtIl6qb4bDF94nEf7wOnRT2E9pU4SSEDPAz
         uKqXmhTo8p1E3OxuhycKc8dW8Pi9V0D367MaN4x5qY5mYSEXICrLxX0KxhEDjIvv0s
         YJ8pAdrw93sHQ==
Date:   Thu, 1 Oct 2020 19:43:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20201001194337.35f881af@canb.auug.org.au>
In-Reply-To: <20200922181126.3cae159a@canb.auug.org.au>
References: <20200922181126.3cae159a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LiHM.SdF5oFucLpdTGGyPhd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LiHM.SdF5oFucLpdTGGyPhd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Sep 2020 18:11:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the pm tree, today's linux-next build (i386 defconfig)
> produced this warning:
>=20
> In file included from include/acpi/acpi.h:24,
>                  from drivers/acpi/acpica/hwgpe.c:10:
> drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_read':
> include/acpi/actypes.h:501:48: warning: cast to pointer from integer of d=
ifferent size [-Wint-to-pointer-cast]
>   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (=
p))
>       |                                                ^
> drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI_C=
AST_PTR'
>    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr))
>       |                                         ^~~~~~~~~~~~~
> drivers/acpi/acpica/acmacros.h:22:43: note: in expansion of macro 'ACPI_C=
AST8'
>    22 | #define ACPI_GET8(ptr)                  (*ACPI_CAST8 (ptr))
>       |                                           ^~~~~~~~~~
> drivers/acpi/acpica/hwgpe.c:50:17: note: in expansion of macro 'ACPI_GET8'
>    50 |   *value =3D (u64)ACPI_GET8(reg->address);
>       |                 ^~~~~~~~~
> drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_write':
> include/acpi/actypes.h:501:48: warning: cast to pointer from integer of d=
ifferent size [-Wint-to-pointer-cast]
>   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (=
p))
>       |                                                ^
> drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI_C=
AST_PTR'
>    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr))
>       |                                         ^~~~~~~~~~~~~
> drivers/acpi/acpica/acmacros.h:26:43: note: in expansion of macro 'ACPI_C=
AST8'
>    26 | #define ACPI_SET8(ptr, val)             (*ACPI_CAST8 (ptr) =3D (u=
8) (val))
>       |                                           ^~~~~~~~~~
> drivers/acpi/acpica/hwgpe.c:85:3: note: in expansion of macro 'ACPI_SET8'
>    85 |   ACPI_SET8(reg->address, value);
>       |   ^~~~~~~~~
>=20
> Introduced by commit
>=20
>   7a8379eb41a4 ("ACPICA: Add support for using logical addresses of GPE b=
locks")

I am still getting these warnings ...

--=20
Cheers,
Stephen Rothwell

--Sig_/LiHM.SdF5oFucLpdTGGyPhd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91pMkACgkQAVBC80lX
0GwdCgf/RNgZyS5m2LkshdnMmBp+8tesk3stxfbNHOZn+mQIt7Xphxx+9B5UDjcm
K8QrpJi/DgaqwBAOTE1KCOxnPdhefMxfX7+jILbiWT5Vk5gIiJ0zHNkcAxRIzzQS
1qXlzeROOYdmzP+Xa5DtTCSe0teopDT/U6XjF2b70aixLD7ZjZtKQUgLvyfowQuT
yM+JXEAfqDALgDDxHDMgMPWK5RHUBmbZqdIUWLoOokxkHnvAEHrVmDy72F2ASbDU
ZpZhpTH7W+vo57ZWr7Ugy+x0+uChuJ+A8EC5qzbqt0p+IML0hQT0J9To5Pr9A61k
WoWW4ksoSGmym9SkiXEBPykU7ZZFPA==
=aIYk
-----END PGP SIGNATURE-----

--Sig_/LiHM.SdF5oFucLpdTGGyPhd--
