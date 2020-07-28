Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DD623042A
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 09:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgG1Hdh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 03:33:37 -0400
Received: from ozlabs.org ([203.11.71.1]:54405 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727996AbgG1Hdh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 03:33:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG7hG1nCKz9sTj;
        Tue, 28 Jul 2020 17:33:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595921614;
        bh=/7AKHiCbpH7BHVjS0hDfofRHEgga2Dx7rWmwTAvMLhA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CcKHElp5n01oIJ85ejksPetpMrwz7fg2huNnffVhLixPXoaRjrrOv1STdQeGmkrel
         oj66Zr6gQVV5Of/FqCUHStmCJlti4pPTZiw9WXmNERkeXUwuvVG84KdcLdnBbjIICT
         J6nYTxNDr4ohKhvV7khhpF0LIKxtOmKh4gD9XtaB96iPBkWirTMRGxHiiP1FoMd2n3
         sRJ4fiH5Sie2ZIs/UoCFmu5sEBbD8t5hFBVsIFD3Qu/1fJ8BFgxnWq1VehcvmkdOJA
         /jILQF7okVFpwggP9PIEMB3+QuCcUnpKhSmHLBB9Dd1kr4sgLhw2ygu5SS+aJy1XkF
         YaQ2oUW3addcQ==
Date:   Tue, 28 Jul 2020 17:33:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200728173331.5bf1f438@canb.auug.org.au>
In-Reply-To: <20200727092448.GB1764157@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
        <20200727092448.GB1764157@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/INkSETqbTX5k7nBLuVIGx7u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/INkSETqbTX5k7nBLuVIGx7u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: =
No such file or directory
> >    12 | #include "habanalabs.h"
> >       |          ^~~~~~~~~~~~~~
> > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: =
No such file or directory
> >    12 | #include "habanalabs.h"
> >       |          ^~~~~~~~~~~~~~
> >=20
> > Presumably caused by commit
> >=20
> >   70b2f993ea4a ("habanalabs: create common folder")
> >=20
> > I have used the char-misc tree from next-20200724 for today. =20
>=20
> Ugh, this is a mess of a merge with this driver.
>=20
> Oded, I'll take Stephen's merge resolutions here and push out a new
> version, and try to resolve this error, but if you could verify I got it
> correct, that would be great.

The conflicts are gone, but I still get these errors.

--=20
Cheers,
Stephen Rothwell

--Sig_/INkSETqbTX5k7nBLuVIGx7u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8f1MsACgkQAVBC80lX
0Gzn4ggAlwPeDU1PJawL/3dmABE3hzjj8uoJwMRQRF2Zt9jt3qkNDesiBe8qO1zT
hcpAwA086TQeF9EyXbJ1e5NYxKJJZczaw/Y92ZETsXS/tQWlxumw1XHbXs4qyXK7
GzVkXlCT8DSeELXcM50HlSZhkAS8q0fLg3R/fse0N7aJ6Y/mt4/41EZtlB1VuCaX
EKWbODdLZNPbYBFFREjNp0cNfdjZJxsqvzZkw/1UE00qx4mM4O2QNveg1EnIB9TX
LY3fVN6K4ou1ZihcOJiC26WbQPNuEIf5nPQmsQn4kt+ymtR2+Lrh+caVXNN7K9hB
vh5eyxcBYLhCT8DxKLhrLPRkLHfsKw==
=+zqG
-----END PGP SIGNATURE-----

--Sig_/INkSETqbTX5k7nBLuVIGx7u--
