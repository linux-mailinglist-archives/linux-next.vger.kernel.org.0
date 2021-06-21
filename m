Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFB33AE917
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 14:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhFUMdJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 08:33:09 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:48735 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFUMdJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 08:33:09 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4G7plp719qzyNc;
        Mon, 21 Jun 2021 22:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1624278651;
        bh=JQxVDoKF51qG0AkUhMlXbwCZCBS+9ZJYGc/Mz5M8mlQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KHiYwXfW/pku6rbNnj6hfeThwnw7A4z63MRtjVch5y9WhXukmPGySQORCmV9Vq7LW
         3LPAB3i6oOXwNIdIQORNI+106+Zt4W256j4fCmvZAEwXD3o/p3w7nEq5q/AhpZ03ZA
         7Xf9FEPobVo863M/vi3lGLhEOyas+TS8brRZWMm1qt78DZ7j/dwjGNlViv4j70mYW5
         Aw6hFGyPs2IakijTi4ZHsAJZv5B3Y8HmdOtKgdCUK7wtRSjL3ZcHKe1hCMpo5J/EQx
         dOUY3DIIfnKPu+NMvayMbquLxCLKkmovx9rwQDvhgHdFXPq1CGVjv09Yz1UwaDNvIX
         sRtOl04zEZ8PA==
Date:   Mon, 21 Jun 2021 22:30:45 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        David Miller <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the ide and
 kspp-gustavo trees
Message-ID: <20210621223045.018223b9@elm.ozlabs.ibm.com>
In-Reply-To: <CAHp75VcJKX4xzP1PrCBixDzgGBGwVvbV3YtMebKxpRoi1_EhaA@mail.gmail.com>
References: <20210621141110.548ec3d0@canb.auug.org.au>
        <CAHp75VcJKX4xzP1PrCBixDzgGBGwVvbV3YtMebKxpRoi1_EhaA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fy5o/0mu3mzyH2Kk2QtDPd5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Fy5o/0mu3mzyH2Kk2QtDPd5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, 21 Jun 2021 13:56:13 +0300 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> On Mon, Jun 21, 2021 at 7:13 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
>=20
> >   2c8cbe0b2971 ("IDE SUBSYSTEM: Replace HTTP links with HTTPS ones")
> >   9a51ffe845e4 ("ide: use generic power management")
> >   f9e09a0711ca ("ide: sc1200: use generic power management")
> >   d41b375134a9 ("ide: delkin_cb: use generic power management")
> >   6800cd8cbc6e ("ide-acpi: use %*ph to print small buffer")
> >   731d5f441e1c ("ide: Fix fall-through warnings for Clang")
> >
> > from the ide and kspp-gustavo trees and commits: =20
>=20
> As far as I can tell the IDE hasn't sent PR to LInus for a long time
> (like a few release cycles). I don't know what happened there, though.

Yeah, the top commit in the ide tree (which is intended to hold bug
fixes for Linus' tree) is dated 4 Aug 2020, so hopefully this will
prompt Dave to do something with it.  There has been no ide "future
development" tree in linux-next since 2011.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fy5o/0mu3mzyH2Kk2QtDPd5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQhnUACgkQAVBC80lX
0GwlvAf+Jy/JQiD1G3kpyheGpSOuus8Uqp9jpo6/dNQOcZ+0xWbkXDM7xJWpePle
SOR+ISangurQsuIN83jczgtHErE899J1Lol1rP8sgH/KBDKDgH4H21wljLofLHR6
KbbpNsWhxK59YzKQqC401ERzXIFD4u0iKzI3M1VT/c3/Ksr1QzpW2iN+euBnOd+U
8MWs62yQPI0aF7PwxNWAZLOOW7aiHzFu9n567nVCWjGAMU8VdOHPw6ZYCulc7UBB
byzeFkrkgO5LdXgrOYMGnDCfXRwQPcit5nDf7H341blySIqtu8E96cWpkI7sG5R0
2zG8efbBE0lws7KFINz8bvPAXfD2Gg==
=SPti
-----END PGP SIGNATURE-----

--Sig_/Fy5o/0mu3mzyH2Kk2QtDPd5--
