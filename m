Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB081AFE86
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 00:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgDSWME (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Apr 2020 18:12:04 -0400
Received: from ozlabs.org ([203.11.71.1]:57099 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgDSWME (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Apr 2020 18:12:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4953w04FmTz9s71;
        Mon, 20 Apr 2020 08:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587334322;
        bh=KvhFCJYfDZoBnVP8jcXi4CgpSpt8Lzp3DJo0iaxWN80=;
        h=Date:From:To:Cc:Subject:From;
        b=siLGayARt+MBKjkZ5Jmgyh9l2pWtUdWUTmFz5zo+8AV/ep7KIfy06zHFdXc5TcBGj
         9n20Pv5h4sXX+Z4qz0YhUUjqmzBhtBcC7LM90oPcTU76Z8SrBsmmOqWvGjjzePVP+0
         eG5NZvAxB76vynmtIbJK7njfY+pkBdfZknfAT1+hkpENaOqBdyZNjSHa3mmYvL9bn7
         54bSABkCfi3cN5zqffatHJNJeZvB3gbQAa+NsS6BiKDW5sMJaR+aOJ1n9ty39b76bg
         wCBr/zmLSUoD5Al8YpnwSH0NccmmXSGxqdyi/9I7OmXhS1Gjrxa5uWi/dIiV4g4YE5
         NBNe61EmlgJhw==
Date:   Mon, 20 Apr 2020 08:11:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20200420081154.597ffa59@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sspffptTDF_lIfEfrtjUcUs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sspffptTDF_lIfEfrtjUcUs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  512e8d40f91d ("ARM: dts: OMAP3: disable RNG on N950/N9")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sspffptTDF_lIfEfrtjUcUs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6czKoACgkQAVBC80lX
0GyN8Af/Wz3VGXqNgOg4ZhnsiK6AXgTZ64tZDA0j9tfbOM8yeyrzq78ISQv9oJ2d
RJLzgqVI5jbBAkmBton7lOqeUjCNN9JYbs6OPLMW1YLbWj3f8kZzE5k+NMdYwmrf
XkSv9bgaiCUbIwOr4ELqQD+sNOOBHbdUGlijHI3K6zMT8fIfstay5NQvOVlJGtGX
JfTcwtMJISHm15Hr1tTVaKlTtkIt9WpcBHjCPNBjxuipwgxTo4tCm1FrLzH04Ser
vj0WXz3WT8zZQwTCcBFEWUPT9sminSu6BIB0o30J/YY43AlR+8ArHtuxqryEPgyy
zjqk8CAWxnwJjiwHdEDz/KxdB5kgfQ==
=IwOw
-----END PGP SIGNATURE-----

--Sig_/sspffptTDF_lIfEfrtjUcUs--
