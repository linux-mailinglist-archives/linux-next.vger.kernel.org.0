Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92BD1CCE1D
	for <lists+linux-next@lfdr.de>; Sun, 10 May 2020 23:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgEJVIM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 17:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726955AbgEJVIL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 17:08:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE435C061A0C;
        Sun, 10 May 2020 14:08:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49KxVc0KNWz9sSc;
        Mon, 11 May 2020 07:08:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589144889;
        bh=8achXUmhmB+0x7mbwnDwdLNhr89i1XYUHsil6l3G/S4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TLbp6h/Xa/+Euu6yIdgD4xRS942D6ZX6qxeSzAAje1qBjDQiPHd6gHClhDQkulMyo
         byye5DoCwmSlme5PdJ2Z5Bfv93bygEwz49HUum59AJtMieu2pFrPx03GieJSGFL1kt
         rYvevDmahpyf/UKFlHJNyo/137kVzlKLKDNO2sJpfp8ADd/nQJ3OLmXUav3oyPBzr5
         JfHr9jg5cI0d3w1H11qnS8+jdnGuFYOLyls+qQmHGFVv2Xtucn2g1sve5vKU7keIxK
         Bs4SkyozIWxo9Q2P/1T4Q+MpS34UNHNDzVvLelDMl7kuewkmUFRLkmq3dUp/CHn+xD
         c/EOp6/fG/kxg==
Date:   Mon, 11 May 2020 07:08:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ilya Dryomov <idryomov@gmail.com>
Cc:     Sage Weil <sage@newdream.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeff Layton <jlayton@kernel.org>
Subject: Re: linux-next: new contact(s) for the ceph tree?
Message-ID: <20200511070806.397e0584@canb.auug.org.au>
In-Reply-To: <CAOi1vP8JjtBZoy0zAgz7=wwMuHiiRPCvxz7ZKicE9nh-NZXz2Q@mail.gmail.com>
References: <20200509094515.7082eb92@canb.auug.org.au>
        <alpine.DEB.2.21.2005090103060.29336@piezo.novalocal>
        <20200509134751.147d747d@canb.auug.org.au>
        <CAOi1vP8JjtBZoy0zAgz7=wwMuHiiRPCvxz7ZKicE9nh-NZXz2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nVpoGKp4BWwuSVivqla8Tp3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nVpoGKp4BWwuSVivqla8Tp3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ilya,

On Sun, 10 May 2020 09:40:07 +0200 Ilya Dryomov <idryomov@gmail.com> wrote:
>
> On Sat, May 9, 2020 at 5:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > On Sat, 9 May 2020 01:03:14 +0000 (UTC) Sage Weil <sage@newdream.net> w=
rote: =20
> > >
> > > Jeff Layton <jlayton@kernel.org> =20
> >
> > Done. =20
> > > On Sat, 9 May 2020, Stephen Rothwell wrote: =20
> > > >
> > > > I noticed commit
> > > >
> > > >   3a5ccecd9af7 ("MAINTAINERS: remove myself as ceph co-maintainer")
> > > >
> > > > appear recently.  So who should I now list as the contact(s) for the
> > > > ceph tree? =20
>=20
> I thought maintainers were on the list automatically.  If there is
> a separate list, please add me as well.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/nVpoGKp4BWwuSVivqla8Tp3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64bTYACgkQAVBC80lX
0Gy8tAgAkHXKTZlO+QgrnQ8qct+AnpOmnpzWuL8sZKW24dWc9LchlOOFFr8fOCTR
pEL81+W83y1CWZaSqf6+WZPD9Zl3jlkBLSvN7NWbQKg1GJ/2nLGvxeKLd9CffbZj
NWtUuqVi/E7UAnNDWts/u6nCXgU8P8bb6+E/5ZC5jiTRAFuU7NyJ0eVmqaSTxDuu
SPI5vPsXKtEjixl9OuzwJJ+bLvh2G2CAjXYjZ4CjbaDFCWMBScKyVXwjIRaUfSCf
Z/LCF3IjYk0JhIyo+7/iT2wDUwyZlwDa1ooBJGYfkB43dmZ2yR0Y2FHr0E+qHrHt
AJNTc4lHyrrn7IfeTIuMe24CGRrCSw==
=qBJb
-----END PGP SIGNATURE-----

--Sig_/nVpoGKp4BWwuSVivqla8Tp3--
