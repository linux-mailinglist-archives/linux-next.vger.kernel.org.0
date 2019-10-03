Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B6ACB04B
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 22:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbfJCUlc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 16:41:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbfJCUlb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Oct 2019 16:41:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46klKN03hHz9sCJ;
        Fri,  4 Oct 2019 06:41:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570135288;
        bh=6h50s+8T6FadF0QKkVxMnA2Sp2h21Or+M2VbdN2pvlM=;
        h=Date:From:To:Cc:Subject:From;
        b=Xdetv9K9brxjEmde6/bxg5czoNm67NzeP2BkxTBLPgII9vdWF3DaqdA7phfr+dETD
         v4Y5eAmQg1I8jCMMPiuX5hgu+4DLofzDZHCAyrN9ANI5zhzW38prm/fM2xQLb1iL1n
         oGDXO6Js1BZwaVIIX7OsDXNQYJeG1AAxCWDka80djxwQnEkwpDwJU/RlmJ1ZHiqZXe
         NIAttjd+8hz9UzC6kkXjCNEYk0s2hwSm6Okjr+tQBOw2MH5AerqT9cpCiNs80gXk7N
         Nt9DDkiJijW3Iu64sZhwEeMv3plP2mj5pvDg+X92hkZbGDSdAg/7H3WF3z9gsHjCDo
         3JkIiEM2Q2EpQ==
Date:   Fri, 4 Oct 2019 06:41:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: linux-next: Fixes tags need some work in the amlogic tree
Message-ID: <20191004064120.6262d85a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0m_My+wqo=2AS7Rd+XOThTc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0m_My+wqo=2AS7Rd+XOThTc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cb8411a2b051 ("arm64: dts: meson-gxm-khadas-vim2: fix uart_A bluetooth no=
de")

Fixes tag

  Fixes: 33344e2111a ("arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth sup=
port")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  495637be0e28 ("arm64: dts: meson-gxl-s905x-khadas-vim: fix uart_A bluetoo=
th node")

Fixes tag

  Fixes: dd5297cc8b8 ("arm64: dts: meson-gxl-s905x-khadas-vim enable Blueto=
oth")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  880913b3ccaa ("arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-poll=
ed node")

Fixes tag

  Fixes: e15d2774b8c ("ARM64: dts: meson-gxl: add support for the Khadas VI=
M board")

has these problem(s):

  - SHA1 should be at least 12 digits long

These can be fixed by setting core.abbrev to 12 (or more) or (for git
v2.11 or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/0m_My+wqo=2AS7Rd+XOThTc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2WXPEACgkQAVBC80lX
0GzaQggAoYYG67DCMn/Ggi7EVRRwGKNMlHTJp1P5vDw2TyFeSpIUjnGtZ9ESKESn
YhZnVZdOFSyTVBtdc4RXDe7Psf7ZJ4p3w0wsBzvro41sxQvioqn19LaFDu0ik+Jh
9+cvvgIF2srLZQrwyDDPJR8nAeUluR/N6evMsKjPa6RWoh7IDdJQM0xyXQiwlvgi
wA4GJGI/z4ydmvD2SxxRwzy22132rTZnLRJm4K5ZnRYLDJQejyANdLgzTWTMg2aj
gHYkU+WdBnNE/Y6c5Shm0jsD82R8QKUVvW/npngY1YW5vyvmAs4sgWco+hreMIJd
mAo6T8+ukFEiACURRiB3AhDxg8rPNg==
=1ofM
-----END PGP SIGNATURE-----

--Sig_/0m_My+wqo=2AS7Rd+XOThTc--
