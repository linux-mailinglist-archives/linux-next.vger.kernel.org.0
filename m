Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5FE10001D
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 09:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfKRIMd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 03:12:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52035 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfKRIMa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 03:12:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GhWt6MCHz9sR8;
        Mon, 18 Nov 2019 19:12:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574064747;
        bh=Ylcv/kAcskiEgYIYi4TminUt71+ufYVaNqcwaor7E8c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DHIf2G7ZB+cL+eBkxIPvCu1EjLMZWxzzns94iTyTeLzbfBPA61/Tqsnu+09y7azC0
         T1XAp2boKqnROXrHLsvArwOxw9RH3/DCdHXd+MpENTLVppLBb+bqHZEeYjowBiCHz6
         5dWvkduh+e1HkqImBBas7dBU5lpnjxEafRvswr7BY4FIjNmRBF0RwLvCVpz/Xi9SOL
         RhIuKlWpXGYF601KiV3jhvogxKQei9mq2GVcYr/cin3ujGqoNbBLOBTzsDtoVLhpJ2
         AtafywVaatEd8+uhHZwOqgtozNlOfRFaLCtDRg4DKKazzUZ9wV7E9PZ3IQD9zkboQR
         Qlg67yn9dUqpg==
Date:   Mon, 18 Nov 2019 19:12:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20191118191223.1b7c11a9@canb.auug.org.au>
In-Reply-To: <MN2PR20MB2973E1EAD50B58826FCEC763CA4D0@MN2PR20MB2973.namprd20.prod.outlook.com>
References: <20191116101954.33672f2d@canb.auug.org.au>
        <MN2PR20MB2973E1EAD50B58826FCEC763CA4D0@MN2PR20MB2973.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t+UzsCG2yRIu++9O0gVcY2h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t+UzsCG2yRIu++9O0gVcY2h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Pascal,

On Mon, 18 Nov 2019 07:58:42 +0000 Pascal Van Leeuwen <pvanleeuwen@verimatr=
ix.com> wrote:
>
> My bad, I didn't know the Fixes tag should not be broken over
> lines (and that rather conflicted with the 75 characters per
> line rule here, which is why I did break it up).
>=20
> I'm willing to fix that - except that I don't know how to create
> a patch that _only_ fixes the commit description of something=20
> already pulled into the cryptodev tree?

Unless Herbert wants to rebase the crypto tree (and I think this is not
a good reason to do that), you should just consider this a learning
experience. :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/t+UzsCG2yRIu++9O0gVcY2h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3SUmcACgkQAVBC80lX
0GwDlAf8ClZ7n/HmuTyieT433MqwtF26pB9zw9iswQ709v1gNpWzMT5xdfba2JKr
Vnvci9i0a02Op4c5gX0rQiB3a2k0FFb+jNA+Y68qk5iRvGE1EjD9u4V38xsErH9s
v0penDIX9T8t83KRpdSNQHWbL2ZU0VOoKz5kRYBWe/XU2aW0DdMk74XrBeVIVhLD
BwAK8LHOTdgQwlZoRIfGAjMeTJuagvUUC5RGPX72WXxn3WzUcJIH3IK0Y5/IaHqH
pbAdAEYyEk1RYr4FveBhnDT0CcFkXTMlbU0LsXAD9dY1eaZ3efK7o2ZSPxpWKo8e
iIRE73ISn4nGzBdtnlyQBttgX6Fxrg==
=gpYR
-----END PGP SIGNATURE-----

--Sig_/t+UzsCG2yRIu++9O0gVcY2h--
