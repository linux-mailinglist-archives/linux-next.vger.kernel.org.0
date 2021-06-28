Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62B33B6B11
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 00:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhF1Wxe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 18:53:34 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:42761 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbhF1Wxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 18:53:33 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4GDNBD5l3Wzyk8;
        Tue, 29 Jun 2021 08:51:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1624920665;
        bh=/uxx2/XMQ5Xn4hhQm234IexsORg6ynHGjqB67VOSi74=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QG7REzv0/Xp8xY7qsIXKwX0UX3gDejLyJm+KHWzQNVvWykg2YwKz83NxMnOiczG0+
         97ZolQARyWCogOWa56SdUZMtQ3EdsNW1NARlvTzETLXKpcFBA1r8MD1J4tTxXtNkNN
         06U6mbEzak2k6bVjgyV312wfdz4sbqEx+bzdgUy2cXyArkYp8T5jBho2fpq9+1y6v/
         Qtb7o84eludtZ1WhJc4PydWQ4BNXkLPogby6Gk5tXdzV+CcBtuA2OChCstOmspjTKc
         nhgMQZTVf9sdZm8cX2rYLa58fp5GOIjT59wHRKrlU5+FKsyIpCKcjaZM1OGvhjRqJ5
         PY8lVn7sKGNYg==
Date:   Tue, 29 Jun 2021 08:50:59 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        David Miller <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Christoph Hellwig <hch@lst.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the ide and
 kspp-gustavo trees
Message-ID: <20210629085059.10ab5080@elm.ozlabs.ibm.com>
In-Reply-To: <YNm0MBV6Sn+ceEZ9@smile.fi.intel.com>
References: <20210621141110.548ec3d0@canb.auug.org.au>
        <CAHp75VcJKX4xzP1PrCBixDzgGBGwVvbV3YtMebKxpRoi1_EhaA@mail.gmail.com>
        <20210621223045.018223b9@elm.ozlabs.ibm.com>
        <YNm0MBV6Sn+ceEZ9@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wIs9KiAiv9TORwvmFtUACfm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wIs9KiAiv9TORwvmFtUACfm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Jun 2021 14:36:16 +0300 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> On Mon, Jun 21, 2021 at 10:30:45PM +1000, Stephen Rothwell wrote:
> > On Mon, 21 Jun 2021 13:56:13 +0300 Andy Shevchenko <andy.shevchenko@gma=
il.com> wrote: =20
> > > On Mon, Jun 21, 2021 at 7:13 AM Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > >  =20
> > > >   2c8cbe0b2971 ("IDE SUBSYSTEM: Replace HTTP links with HTTPS ones")
> > > >   9a51ffe845e4 ("ide: use generic power management")
> > > >   f9e09a0711ca ("ide: sc1200: use generic power management")
> > > >   d41b375134a9 ("ide: delkin_cb: use generic power management")
> > > >   6800cd8cbc6e ("ide-acpi: use %*ph to print small buffer")
> > > >   731d5f441e1c ("ide: Fix fall-through warnings for Clang")
> > > >
> > > > from the ide and kspp-gustavo trees and commits:   =20
> > >=20
> > > As far as I can tell the IDE hasn't sent PR to LInus for a long time
> > > (like a few release cycles). I don't know what happened there, though=
. =20
> >=20
> > Yeah, the top commit in the ide tree (which is intended to hold bug
> > fixes for Linus' tree) is dated 4 Aug 2020, so hopefully this will
> > prompt Dave to do something with it.  There has been no ide "future
> > development" tree in linux-next since 2011. =20
>=20
> Yep, I think the best approach here may be to apply those (by sending a P=
R)
> followed by marking subsystem orphaned or delete it entirely.
>=20
> David, what are your thoughts?

Well the conflicting block tree commits have now been merged into
Linus' tree and completely remove drivers/ide, so I will just remove
the ide tree from linux-next starting tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/wIs9KiAiv9TORwvmFtUACfm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDaUlMACgkQAVBC80lX
0GyrHwgAollpbnqh8PTS//6xHSm/ZWQJLifI2b/xCENwIeWSol/IZH/dTNcXRVCT
+GL7RFFOrNWgkQNgDWy+wMN640wuTvllK3Ggn1/XapjWV5rOcqSFMnfjJXImpxkg
TvvNluc17nddxFX1SfA10Y8oOGcbRCCQqV4bofpjxu5Bbo0MHxTqzWhfZ8QejEAp
KWmaGjMjTxoqpk0bVR8t6H8Kg2Vfw7e/Aa8MavZwz8Um7bQ+fZmlUYoZEcaYfSfd
XIEtKwd9qP0XKZ0p45our0NqD/N+rtjtFq2efiMGwSuwjzbvEJOpsFxZk1aYlYWd
yzJV0pBmkUmmJiOT01i3+1hYpj2daA==
=jRXm
-----END PGP SIGNATURE-----

--Sig_/wIs9KiAiv9TORwvmFtUACfm--
