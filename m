Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3828D2871AA
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 11:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgJHJgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 05:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJHJgH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 05:36:07 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F07C061755;
        Thu,  8 Oct 2020 02:36:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6R0M3TX6z9sSC;
        Thu,  8 Oct 2020 20:36:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602149763;
        bh=Pj2US0szbTXAu9G3VuYoyPI9XJYEZhKpMFhzx7Cle1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ghEqc+v4lSyGgWw76XB62zqIsn/ixoRrlM/D3yvrsbgvfZVe8G6xBu0HXVGY7BGdw
         26Mt2I4/zoLPpFZeFDxWAurtcyB80U3oQBfwZEyn3r3a/LqxIJbVbAe3oFjmoRqHvP
         1iGt8SWIzznStZZiPg9jmeOqWWd0pOvoD3saW6/eaRiJgpVE+0bPw+tjAnyeKjyo/H
         BG4on5JkpQRBoTvzlawq0CJz7zL974igA91sZpSQK/512tJnbImE091IUvqV5RiAtE
         mu1IiR/hOCT+vCd87BFnTO/QB5kUD7GANyY17ap9s3Jbu5c3+mDq1xtqUK65CtLINX
         o/L94JnePF6kg==
Date:   Thu, 8 Oct 2020 20:35:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20201008203559.735dd600@canb.auug.org.au>
In-Reply-To: <20201001194337.35f881af@canb.auug.org.au>
References: <20200922181126.3cae159a@canb.auug.org.au>
        <20201001194337.35f881af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e=PgqzMUTh1MTFIsV7NH+7A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e=PgqzMUTh1MTFIsV7NH+7A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Oct 2020 19:43:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 22 Sep 2020 18:11:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the pm tree, today's linux-next build (i386 defconfig)
> > produced this warning:
> >=20
> > In file included from include/acpi/acpi.h:24,
> >                  from drivers/acpi/acpica/hwgpe.c:10:
> > drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_read':
> > include/acpi/actypes.h:501:48: warning: cast to pointer from integer of=
 different size [-Wint-to-pointer-cast]
> >   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t)=
 (p))
> >       |                                                ^
> > drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI=
_CAST_PTR'
> >    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr=
))
> >       |                                         ^~~~~~~~~~~~~
> > drivers/acpi/acpica/acmacros.h:22:43: note: in expansion of macro 'ACPI=
_CAST8'
> >    22 | #define ACPI_GET8(ptr)                  (*ACPI_CAST8 (ptr))
> >       |                                           ^~~~~~~~~~
> > drivers/acpi/acpica/hwgpe.c:50:17: note: in expansion of macro 'ACPI_GE=
T8'
> >    50 |   *value =3D (u64)ACPI_GET8(reg->address);
> >       |                 ^~~~~~~~~
> > drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_write':
> > include/acpi/actypes.h:501:48: warning: cast to pointer from integer of=
 different size [-Wint-to-pointer-cast]
> >   501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t)=
 (p))
> >       |                                                ^
> > drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI=
_CAST_PTR'
> >    18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr=
))
> >       |                                         ^~~~~~~~~~~~~
> > drivers/acpi/acpica/acmacros.h:26:43: note: in expansion of macro 'ACPI=
_CAST8'
> >    26 | #define ACPI_SET8(ptr, val)             (*ACPI_CAST8 (ptr) =3D =
(u8) (val))
> >       |                                           ^~~~~~~~~~
> > drivers/acpi/acpica/hwgpe.c:85:3: note: in expansion of macro 'ACPI_SET=
8'
> >    85 |   ACPI_SET8(reg->address, value);
> >       |   ^~~~~~~~~
> >=20
> > Introduced by commit
> >=20
> >   7a8379eb41a4 ("ACPICA: Add support for using logical addresses of GPE=
 blocks") =20
>=20
> I am still getting these warnings ...

Still there :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/e=PgqzMUTh1MTFIsV7NH+7A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+3X8ACgkQAVBC80lX
0GzxEAf7ByLzg+psGPtGuLOIyWh4EPlKPN8Rkl73EYwT/+5PItvYyv8RUNiZsl/1
QufRlOYXiyVt0GiENCLJvXuhlXUEYe+FYwXA0jqMktAbqq4KjwHTPs1f1b6tA9XZ
BTDF69JHSBW83IvFJhYsNvT4g8W0ecg6SC1QgkDxR6qDOpWZSkpl1UhvIXWewBWH
4S6ZJrNYTcZT7nnumJ+BbvInxu6PT8Xb2hQSYB2yXPAcBQ8gsQmGb57JTjZ6Iuvo
ghCSF84WPFw4R88/R7Rd8TXQG/q8CZdVCTr1Yt8tssr9ymI+KIcNYuWttVJ1u4ln
JYrVQ/8PJ2tSnBfylZynrHlZf4GX1g==
=d8QS
-----END PGP SIGNATURE-----

--Sig_/e=PgqzMUTh1MTFIsV7NH+7A--
