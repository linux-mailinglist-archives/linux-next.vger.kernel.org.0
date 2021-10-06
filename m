Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F33423792
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 07:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhJFFsu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 01:48:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43519 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhJFFsu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 01:48:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPNkP4mVVz4xb7;
        Wed,  6 Oct 2021 16:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633499217;
        bh=b7MTg7ZVl26ADUOl1u03/HcFOduj3s4d9zCKkCxyQXg=;
        h=Date:From:To:Cc:Subject:From;
        b=KonA22HM1O/f3gna93O4yr6eX6nqv8hJylacW5fpS3PzXjfJc7x+x/YEr+ReKiGoA
         dxef7Ha0aWvapsaR/fWVSr0l2KBFXMYryqicZQsTCnjIsYySDOhNYLFoS7n0Fy+B2M
         1VBhmfirFiIyPkN6HExAXa7n/w7yZG4w2IbIGhbXzTOnWtIOiatGvvVoVz0RGLfD6w
         OSNyQzre8ztkGAoJpvuS7IlbG1jmJNO4IfCFuaocWZ4y3+aRc9+1SChdGLOpZDQ5k1
         rWz752BE8PTJKzoLLc1/J3Vd++TFJyvlSEksApAWcQbkcOaMVTlETVVd7hK/nAU+5/
         VhZFtwdsKVoYg==
Date:   Wed, 6 Oct 2021 16:46:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>, Gary Guo <gary@garyguo.net>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20211006164652.28b82d57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J1zoyKkcUK6Ohh+IrncZNnJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J1zoyKkcUK6Ohh+IrncZNnJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/kconfig/confdata.c

between several commits, including

  2836b7a7bd05 ("[for -next only] kconfig: generate include/generated/rustc=
_cfg")

from the kbuild tree and commit:

  dc08d49444e9 ("Kbuild: add Rust support")

from the rust tree.

I fixed it up (as per Masahiro Yamada's suggestion, I used the version
from the kbuild tree) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/J1zoyKkcUK6Ohh+IrncZNnJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdOEwACgkQAVBC80lX
0GzJmggAoaYZs2dTQJuhAju6k7BhtVxBI+0E/+1Vo43Rzn/38ptZ+MqtM0X0t71S
pB6gaGaeQh5FNo2x8Wee8TOLLw6E2fWcLkYyeF39azPekmyHmK+WotvotUSJ04X3
sLH/3Y0KBM7r/b5BhalyPipw96jqiywoTnyBRv6x37D6OTCBLaW1bZhVOIVU+v02
FpL6l9sVr+ukmJP37e8HpBSzdt3KrZJVZpSDMuC4ndICDNf9Hzvu0z4yGhCclOLK
0AwUER0Gu+A7icL6uEApgb1hKqgHla6wDJeVjVgak8QGfW2mbnV+ADJ9VK3RB2D6
f1fwInYdFjeZmTc3frKGn4OBDyNRJQ==
=q619
-----END PGP SIGNATURE-----

--Sig_/J1zoyKkcUK6Ohh+IrncZNnJ--
