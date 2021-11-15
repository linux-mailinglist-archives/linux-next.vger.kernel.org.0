Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7BC4516A4
	for <lists+linux-next@lfdr.de>; Mon, 15 Nov 2021 22:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240714AbhKOVgn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 16:36:43 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48357 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348988AbhKOVNx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 16:13:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HtML51WvXz4xbM;
        Tue, 16 Nov 2021 08:10:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637010653;
        bh=ouiiKAgaax/jlItXSm8ObRYTMiRsdExBEOmVlnBfIQM=;
        h=Date:From:To:Cc:Subject:From;
        b=HnD1g3K2B1MU5DiQBVhfliUnlQEYvOT5A7/8RSAwX0zaveoPqWRsSZT5lR/b/6aVS
         oBG4KEBjOp+V76S2C5vGw+aCs4ikElZ30GZIVVP6LjFgTxx7JOw9YFgfmVnaSB36eb
         B8I9F2X7sxTASncyOCRn/TU9QvRM27u8vC4jJcP5BYw3kvVsHcchi4RsSf9jK7bEZj
         UXbaK21kTTxXvOrRi9lSP/FD/QgnzURwH9KJpaZuvY6XsZ8IeHtz/LroUuJmres9Nd
         fwx5645A0NRQS44+Lo9DIo7/4H+vKq4FnCY7nLAuvbCcIf6PQtwcufZ78uzwtLS95J
         Yt4F9RA0ET0Kg==
Date:   Tue, 16 Nov 2021 08:10:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dillon Min <dillon.minfei@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the v4l-dvb-next tree
Message-ID: <20211116081051.2066724f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9pFV1GLELZsjSIUBnHqras3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9pFV1GLELZsjSIUBnHqras3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d9fbdedc56ea ("media: stm32-dma2d: fix compile-testing failed")

Fixes tag

  Fixes: bff6e3e2f4c9 ("media: stm32-dma2d: STM32 DMA2D driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")

In commit

  147907e93224 ("media: stm32-dma2d: fix compile errors when W=3D1")

Fixes tag

  Fixes: bff6e3e2f4c9 ("media: stm32-dma2d: STM32 DMA2D driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")

In commit

  22f2cac62dea ("media: atomisp-ov2680: properly set the vts value")

Fixes tag

  Fixes: 62b984359b6f ("media: atomisp-ov2680: Fix ov2680_set_fmt() messing=
 up high exposure settings")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 29400b5063db ("media: atomisp-ov2680: Fix ov2680_set_fmt() messing u=
p high exposure settings")

In commit

  d9916e7c87c9 ("media: atomisp-ov2680: initialize return var")

Fixes tag

  Fixes: 6b5b60687ada ("media: atomisp-ov2680: Save/restore exposure and ga=
in over sensor power-down")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 4ed2caf85337 ("media: atomisp-ov2680: Save/restore exposure and gain=
 over sensor power-down")

--=20
Cheers,
Stephen Rothwell

--Sig_/9pFV1GLELZsjSIUBnHqras3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGSzNsACgkQAVBC80lX
0GxDlAf+LujFZn1TAWIT0Zuck5bYoMjMOi2Lo1RZ7VBpl6WVi8W18pSWRiOp5ymq
KN4aRwYXHUGBfv46FMPmeTCO5mgrKAbEigVoHcsAWtzoA9XSJTrP1z+maV1qFpHb
uJiKZ7VyXBoUlRZUQyYQCcOB83FhivjjB0Z7UvM9VOBR2EnONqDKu6cO97zp9UEE
2Ksr/Oc2J8aZ4K8Mnwpn0yTDboA7lFpIUCW8kW8gsTwsJQLIV+6RJu4Zz3zE1kC8
sa+tOXQeBYSut0LkqaredFZxoZYzHOcVBg3mh05DD+RAtYEi6/gIDEgMJPwQUvnX
2XPsqxdvsTPN0o/MGhLwglWR2ut0+w==
=EJpY
-----END PGP SIGNATURE-----

--Sig_/9pFV1GLELZsjSIUBnHqras3--
