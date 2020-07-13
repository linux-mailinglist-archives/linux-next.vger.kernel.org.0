Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0EC21E2B6
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 23:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgGMV5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 17:57:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgGMV5c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jul 2020 17:57:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5HZ16f7rz9sRK;
        Tue, 14 Jul 2020 07:57:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594677450;
        bh=AsUmxseH5BnH3garHqf+P/Tp9k4EnP/BQK2s7sSigaM=;
        h=Date:From:To:Cc:Subject:From;
        b=nfJ/VJzZQiSxfLSzyqBxpgmrPVT4faoDz66WsMFnIDrcycdNS2nyps9IsJBYT1WTy
         HlgZJOaJgY7/8Jt3R/2G6/DQjMIuQyuYBGdeJs++nFWp10kbLAUG/2p/YvP8Rtfp+m
         xYFDXaMBAR13lirY9X+tV7H7dbpIufl+Tcc6dpnMpbXtna9tRfBgoK4/v/xsl4Pr8G
         0XcvH2GftdqgDFczFNpZ9/QEWNuUCb5iXct9bmdrsSXFX4mkXBbCIUl7E+kwjE/E/0
         KkVa3YX1n82fdlE/D+qMwvyAxu8Q5l7P/4ZyH8OtmhmQ8KgPt8T2yJc6723QRFkVWL
         ix8O+ziDApQGA==
Date:   Tue, 14 Jul 2020 07:57:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: linux-next: Fixes tags need some work in the arm-soc-fixes tree
Message-ID: <20200714075729.68b92239@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vqTgWJ30.lxte2gY6BSQ4yy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vqTgWJ30.lxte2gY6BSQ4yy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3e189a193471 ("ARM: dts: socfpga: Align L2 cache-controller nodename with=
 dtschema")

Fixes tag

  Fixes: 475dc86d08de ("arm: dts: socfpga: Add a base DTSI for Altera's Arr=
ia10

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  8e343e71b092 ("arm64: dts: stratix10: increase QSPI reg address in nand d=
ts file")

Fixes tag

  Fixes: 80f132d73709 ("arm64: dts: increase the QSPI reg address for Strat=
ix10

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  c188c8348836 ("arm64: dts: stratix10: add status to qspi dts node")

Fixes tag

  Fixes: 0cb140d07fc75 ("arm64: dts: stratix10: Add QSPI support for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  390a90089db5 ("arm64: dts: agilex: add status to qspi dts node")

Fixes tag

  Fixes: c4c8757b2d895 ("arm64: dts: agilex: add QSPI support for Intel

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/vqTgWJ30.lxte2gY6BSQ4yy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8M2MkACgkQAVBC80lX
0Gzg3Qf8Dl8JMliIWTydxbP+rQP3eJC+jTJomQOaSjLzaLA7B/ttRQ1EPHEtgqAj
SnITsJl9MxvGP+9ZtIgREUqg3Vt3HM2KV2EENwjqhfHzIYj4GGhEllK7zeJwEiaH
eXgCNgabYbEI/JTib5r2Sr7o39LT6I48Pzmb/V792ZspcxU70H4tzXInAc7W/x1n
b4TcysaJFce5DvOBwAnquvqU6bMk1Qw7ISICNZ5fAIh9x/gDvx7aw6F7iYUKggJt
F0C9sD9yRmCmc76PgDdKIsU/kJiKuh+pZDppkq3Z/U5ug4R7QK3qZj7ZW3dkqFyE
/bbLqyDxwAWFxcvc2P1PZOBSWpUdgA==
=JKHq
-----END PGP SIGNATURE-----

--Sig_/vqTgWJ30.lxte2gY6BSQ4yy--
