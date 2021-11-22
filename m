Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E4A459690
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhKVV1y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhKVV1y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:27:54 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB38C061574;
        Mon, 22 Nov 2021 13:24:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HygJr2Wrxz4xbH;
        Tue, 23 Nov 2021 08:24:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637616285;
        bh=7Iuw+l76crKRR36inaZ9fpNgWQTDmKdXJwIb/VQ/gVA=;
        h=Date:From:To:Cc:Subject:From;
        b=ZBzlQl7N8FFWpFDvitmbFz6ghofjcv16xHonA4oGk5LD/8dF7yyFYzLSx7sswRuuA
         kXQO0ek1H+IMbG1lQ8WuOHadOVdkXHxpgRsCYnK2nr0Dtwxup21/AcrgUvwKLsYelz
         96QmAnVnckpUBHhIPMOld/pLubegQRDugO+H83FYSv/FbfuvKpHVaPM9IOCr0rZ8iV
         EX4pfGxZQqtFbM613IvmQ+6W0zKDHY1cu8bWoNS38T87NwLBbMBvmvZTErjS3gabUD
         CYr2TJdTyjZFQMgmloxAs1H2ZzVmKJcc3rhKvd+PZ0xbZx67+aCJMFmMlBM8FPKo6F
         DBOkTouKP8zQQ==
Date:   Tue, 23 Nov 2021 08:24:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dillon Min <dillon.minfei@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the v4l-dvb tree
Message-ID: <20211123082443.0a0740e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qAR40pRs60EGlK7m5JYVp/G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qAR40pRs60EGlK7m5JYVp/G
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

--Sig_/qAR40pRs60EGlK7m5JYVp/G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcCpsACgkQAVBC80lX
0GzS6gf/ShnKjZvN47rNCBtRogwUuAgIvNVD4vYyWbv3h9ul1cOq10Ve4INgj0cb
qAVohjQyCuHBsm4ukjJpDuHnB0DtmNnlgPUlsHW5mdqmF0aMWqM4UBPckzQjbIzY
7CLGJlWKsNOY2Ta+WhxGKL9TzLTf9mxAvk8aAjAvawzemS5Z3H6qsZS7rwyk6jEF
8ly3b30UgFVh/sqrgLEjd9JpQqE8PSNJ1NEITLgZHE/9HNpzv4qEzXW8ACru3Xvk
Bih9klxwcFLo32G8aC91ZfrkdVmETPem+vRPW/zYUCzse1/z3zXceDFriEO4c1gv
+BWwW8zF/ElGb3cvvezTKseeA7Af9g==
=7Kqj
-----END PGP SIGNATURE-----

--Sig_/qAR40pRs60EGlK7m5JYVp/G--
