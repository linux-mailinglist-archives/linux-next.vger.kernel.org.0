Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA64A3EAD09
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 00:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhHLWTp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 18:19:45 -0400
Received: from ozlabs.org ([203.11.71.1]:52343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234849AbhHLWTo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Aug 2021 18:19:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gm1Lq2WkLz9t0G;
        Fri, 13 Aug 2021 08:19:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628806755;
        bh=zmk7OzkWma+QFAKEY8vCf0uCq2mDQCSimbO+eULHId0=;
        h=Date:From:To:Cc:Subject:From;
        b=iEUEpdau26z8GSEx/9cdC2ofdiYrJj1tzXOl1MvA7vzq4y+NphivN+S9ZloMfxxsK
         tNSD7B1HQRN0EBU8oaS63EQ7ODtDhLctLKVzLiBKOWIfMdrOL5g98sc4ZUwoW8VCFL
         6uQr+DQK+v+5T5qV0UFRyiDhteCFPyPuSDXn7AKKCixEKy4eRvF2jvuerwM//ujLt4
         1SwY9cF0MyhyhqUTu8rAvhtaEy6zg2i7vAnU97b7I/2yrJzW0oH1tOKhg5kkvcFuLo
         +LnYVo3EUtMo60RXkIXIUYYYSLddtGsobU/g3KLgGdw/avmVwUmXzthXp/okolknHv
         XCKQH6bG8hrkg==
Date:   Fri, 13 Aug 2021 08:19:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the tegra tree
Message-ID: <20210813081914.0e541c40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fakQqZf1qnh2BO764h7_HXZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fakQqZf1qnh2BO764h7_HXZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b3b3e68aaab6 ("ARM: tegra: nexus7: Improve thermal zones")
  d97a74513cec ("ARM: tegra: acer-a500: Improve thermal zones")
  0cae833ff518 ("ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup=
-method value")
  ebfbd63602b0 ("ARM: tegra: acer-a500: Add power supplies to accelerometer=
")
  0c3136565b64 ("ARM: tegra: acer-a500: Remove bogus USB VBUS regulators")
  3970dc6444c5 ("ARM: tegra: jetson-tk1: Correct interrupt trigger type of =
temperature sensor")
  0a6e9f9cc27b ("ARM: tegra: dalmore: Correct interrupt trigger type of tem=
perature sensor")
  ad86e473e1f3 ("ARM: tegra: cardhu: Correct interrupt trigger type of temp=
erature sensor")
  61f8c4f6eefb ("ARM: tegra: apalis: Correct interrupt trigger type of temp=
erature sensor")
  303e2f343403 ("ARM: tegra: nyan: Correct interrupt trigger type of temper=
ature sensor")
  c626fd7eeb11 ("ARM: tegra: acer-a500: Add interrupt to temperature sensor=
 node")
  4eb121af6184 ("ARM: tegra: nexus7: Add interrupt to temperature sensor no=
de")
  a371e9698e89 ("ARM: tegra: paz00: Add interrupt to temperature sensor nod=
e")
  00786f61df89 ("ARM: tegra: ouya: Add interrupt to temperature sensor node=
")
  ffd8969c9100 ("ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees=
")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/fakQqZf1qnh2BO764h7_HXZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEVnmIACgkQAVBC80lX
0Gxo1wgAmYSUTXRGKG3S14uRNbvOjlALXDBoHRH/QjbjjQLJj2FDOhBcP6pvOe26
6js4r6TzgObHjtxNgCLvwufubh4Wy/3K4bU0kkXMFi/EYD1rLQSYqDazbhLaJN9Q
SwBeKEhrMYcHdXCNJgnVt7ajMxtfxWNBisdV4x0Lat+9C+WGLyqCgXFB6e2FZuNP
fffoopOKcA3JSeY8Z0tyDFd+zDoIoIuz6Pzse4s2GGHMzE7L5ctTnGVZ3Qy2KvV6
shY3Ap2My52913rFASSKA9PzVIV7BWWMtUHSIqpHOW9PS82KdRLaq5x4kfUy1tGq
sVX4s+zl7BmYvttaUmTGdYw5nunXvQ==
=aWl1
-----END PGP SIGNATURE-----

--Sig_/fakQqZf1qnh2BO764h7_HXZ--
