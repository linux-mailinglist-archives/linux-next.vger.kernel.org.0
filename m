Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADF028ED7F
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 09:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgJOHUz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 03:20:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbgJOHUz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 03:20:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBgg93sf8z9sT6;
        Thu, 15 Oct 2020 18:20:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602746453;
        bh=fPES9oVN6qFtk/XxCC87jYUUfFDo8T6Id5MPOtE9TZM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GWhPmBthTyA6NR/D/Y2RBrOa9W3npQGWTktZSvIshU2J4PP/Uf1EPygW5581CYGeW
         LZmKeDdVy0Dlzf9XGzKayFAW/mUqwY1SZS/SEZQSj0C+aOvWDsm44EUztPnaQcCOPk
         iHHVk1PuJ0NJzxeQP3cKI8yOMbhQj+Qx/yODCHJT+1PH9gnEotSHNWr5FSRnNxIpOk
         FP83R44LImABqSL2t/n7g3wQblN7xNE7rqiXifnT6EqQZYLJJ99J9ZbPsBSeAKYBTN
         BobNPae7md83RrAbm7RNslWrPTs4ZUhXR+brJD+pO9hWheWd5vCl6QLGQTz/5kIYDN
         KYdAqgfvHlHaA==
Date:   Thu, 15 Oct 2020 18:20:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20201015182047.28c739da@canb.auug.org.au>
In-Reply-To: <20201008203559.735dd600@canb.auug.org.au>
References: <20200922181126.3cae159a@canb.auug.org.au>
        <20201001194337.35f881af@canb.auug.org.au>
        <20201008203559.735dd600@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PPDlN_Nm9zDeHq1d311joHt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PPDlN_Nm9zDeHq1d311joHt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Oct 2020 20:35:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> On Thu, 1 Oct 2020 19:43:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Tue, 22 Sep 2020 18:11:26 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the pm tree, today's linux-next build (i386 defconfig)
> > > produced this warning:
> > >=20
> > > In file included from include/acpi/acpi.h:24,
> > >                  from drivers/acpi/acpica/hwgpe.c:10:
> > > drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_read':
> > > include/acpi/actypes.h:501:48: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
> > >   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_=
t) (p))
> > >       |                                                ^
> > > drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'AC=
PI_CAST_PTR'
> > >    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (p=
tr))
> > >       |                                         ^~~~~~~~~~~~~
> > > drivers/acpi/acpica/acmacros.h:22:43: note: in expansion of macro 'AC=
PI_CAST8'
> > >    22 | #define ACPI_GET8(ptr)                  (*ACPI_CAST8 (ptr))
> > >       |                                           ^~~~~~~~~~
> > > drivers/acpi/acpica/hwgpe.c:50:17: note: in expansion of macro 'ACPI_=
GET8'
> > >    50 |   *value =3D (u64)ACPI_GET8(reg->address);
> > >       |                 ^~~~~~~~~
> > > drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_write':
> > > include/acpi/actypes.h:501:48: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
> > >   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_=
t) (p))
> > >       |                                                ^
> > > drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'AC=
PI_CAST_PTR'
> > >    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (p=
tr))
> > >       |                                         ^~~~~~~~~~~~~
> > > drivers/acpi/acpica/acmacros.h:26:43: note: in expansion of macro 'AC=
PI_CAST8'
> > >    26 | #define ACPI_SET8(ptr, val)             (*ACPI_CAST8 (ptr) =
=3D (u8) (val))
> > >       |                                           ^~~~~~~~~~
> > > drivers/acpi/acpica/hwgpe.c:85:3: note: in expansion of macro 'ACPI_S=
ET8'
> > >    85 |   ACPI_SET8(reg->address, value);
> > >       |   ^~~~~~~~~
> > >=20
> > > Introduced by commit
> > >=20
> > >   7a8379eb41a4 ("ACPICA: Add support for using logical addresses of G=
PE blocks")   =20
> >=20
> > I am still getting these warnings ... =20
>=20
> Still there :-(

This is now in Linus' tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/PPDlN_Nm9zDeHq1d311joHt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H+E8ACgkQAVBC80lX
0Gy59QgAlFRpZRGahi6CmxwJ6Fwb2EsaAj+Rna/DkoUhaNZWuFWaFUlTCUDLGdjA
1PEmNCoClakbOkpkVWPA8/C5U9fqhaX2HJSHsAvOU0Rwhb8R6dwyakMvzaRArT/Y
lvxBFMg9Afe/Aue92spFnYELLktsVOElx3dcjFacde7O2/0gcYbwXJ6eycF5PPpN
JlogI+xaFKdgmt4QGTq7jgS8uYNe3cGRaVsklqbiuTEDjdS9ILilJAwL547pZA+K
osjwQ35SEKGaJ6rjkZbuowQsaJxKXv3l6nj9BkQ37YT3stp29m0UrDP6ERpjYLiP
DPh+U1WthzBFhz7X6c59MeZ/lA2n6w==
=KPa6
-----END PGP SIGNATURE-----

--Sig_/PPDlN_Nm9zDeHq1d311joHt--
