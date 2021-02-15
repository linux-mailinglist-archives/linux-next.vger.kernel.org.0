Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904F631C2FA
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 21:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhBOU0n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 15:26:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhBOU0m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Feb 2021 15:26:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DfbGG68PWz9sRN;
        Tue, 16 Feb 2021 07:25:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613420759;
        bh=aP6sOUWMsD7N1K6plxf8Ulg21BjdSdj6/qZm3htCf4s=;
        h=Date:From:To:Cc:Subject:From;
        b=De78+mgGZxqzAQtgUkjWWYVaYOS2nF0C8r0CrabVIP4LRbhszy0sUsbaS3ynpmQ87
         KEei/bCuojHHulazq33OOgSAYTw+oC9wQAq/BRCu0zR/1CVV/mj4Yg7DK/YHPxvkZ0
         JkHa3MJNoBCJUNRsRTmJTEzR88gOeAL3j7iej2f8WRuid5YHWwuFN2W2Fb4yUuz0PT
         Ogb3QZYeOGCawypur/15A3jGFixvVEOYR/jHSoIp78/lK9nLtW1/JI8hEFrPsZbzLz
         v9kPThqNKgiAt7+hmEu0SVA3buRRP/GUEzKP+z6bci3cS175h4kXyabIl6EMroz/LL
         RkxfKNpPRa29A==
Date:   Tue, 16 Feb 2021 07:25:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gpio-brgl tree
Message-ID: <20210216072557.59536d2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fcnGl=Skj0ybc2INN8erhvT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fcnGl=Skj0ybc2INN8erhvT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  78034b8e072d ("gpio: msic: Drop driver from Makefile")
  5a2a46ae4b26 ("gpio: wcove: Split out to_ireg() helper and deduplicate th=
e code")
  9fe5fcd64035 ("gpio: wcove: Switch to use regmap_set_bits(), regmap_clear=
_bits()")
  2edba74c9d34 ("gpio: wcove: Get rid of error prone casting in IRQ handler=
")
  944dcbe84b8a ("gpio: intel-mid: Remove driver for deprecated platform")
  fe08e9e26ae7 ("gpio: msic: Remove driver for deprecated platform")
  6e004a98299c ("gpio: aggregator: Remove trailing comma in terminator entr=
ies")
  b2498cb87c4b ("gpio: aggregator: Use compound literal from the header")
  deb631c40114 ("gpio: aggregator: Replace isrange() by using get_options()=
")
  0ea09083116d ("lib/cmdline: Allow get_options() to take 0 to validate the=
 input")
  f1f405c35ec2 ("lib/cmdline: Update documentation to reflect behaviour")
  d3c7cfc6d3dc ("lib/cmdline_kunit: add a new test case for get_options()")
  1d10243dc295 ("gpio: merrifield: Make bias configuration available for GP=
IOs")

are missing a Signed-off-by from their committer.

One of the hazards of rebasing :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/fcnGl=Skj0ybc2INN8erhvT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAq2NUACgkQAVBC80lX
0GyQmgf9EZeG/JFDCAhnK0kuZJUMnr4v16i7dMh3CJL0BYdztoXE2Z1OZ6GL2lFs
5MZ7A5DVF+rZE2s6x9wn1dLWz7YWTTorsUZ9b7Ih74QMq1ryOw+D5DTFoYDOfVaC
4cMBVktbGR73uZrjIBcNOPzBYudLMYlyWJR+QKMC55PhF3YF5nj2VyAu2mchJIxj
DLY+fEGzzRmHgJseRogOIgPh4OEV0GXOR6PuRYuaVpP3NDzSVSD4p5K/tVFmomZf
NzNITJyEo47AdVJAr1eSC1c8vyIgtcya3VvNT6pHPn+rugCAZcJw7Kno28gmkQCK
WgLPkfMbLr/NtnH2G4m9e7hvmIC9Dg==
=xaqP
-----END PGP SIGNATURE-----

--Sig_/fcnGl=Skj0ybc2INN8erhvT--
