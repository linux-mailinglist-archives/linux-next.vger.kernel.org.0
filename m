Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1451C23B007
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 00:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgHCWMv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 18:12:51 -0400
Received: from ozlabs.org ([203.11.71.1]:36491 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727959AbgHCWMv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 18:12:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLBw04ZJtz9sPB;
        Tue,  4 Aug 2020 08:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596492769;
        bh=/7c1j4AVqGYmetClE8dSkr5s9BZZKUzb3JXGZCUSLXw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UXQVIQXligsNwAkJjrv+PZNqrl3itX1T74vLgF0vQlTVtBfFFPUzFwTpUZRhPGb33
         J4+8hgt2EN/WICq9O+eTjlZlA31voEp7ysYXYy20GHMwyJDXsDQ0BywF4pFhHW4ycI
         QcIunTh6XRCOl1JIy91VVdWNzKa2LAlZUwed46n+QBcH67u91yvPxK4AJ/+o/qPe8Y
         iC2rxbfa5KmkIH2980bVxXiIraWuD3aJYuFWERVWNyWHqAEKn9A/PzShPxqnUDweEG
         xN5TEtuqsSN5DUopLvDjhULCO2A/GG0vUAhYtHVUDpqqlKKjO4UyBCtKMNTRC6P9rt
         w7622acskPGfw==
Date:   Tue, 4 Aug 2020 08:12:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 crypto tree
Message-ID: <20200804081247.1b686608@canb.auug.org.au>
In-Reply-To: <20200717201411.3f1b8417@canb.auug.org.au>
References: <20200717201411.3f1b8417@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jZlSr4XHspbHtB=MfsVKrRi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jZlSr4XHspbHtB=MfsVKrRi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Jul 2020 20:14:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   drivers/crypto/mediatek/mtk-aes.c
>=20
> between commit:
>=20
>   f441ba2ad341 ("crypto: mediatek - use AES library for GCM key derivatio=
n")
>=20
> from the crypto tree and commit:
>=20
>   161f6a5cc3ea ("mm, treewide: rename kzfree() to kfree_sensitive()")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (the former removed the code updated by the latter) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the akmp-current tree and Linus' tre.

--=20
Cheers,
Stephen Rothwell

--Sig_/jZlSr4XHspbHtB=MfsVKrRi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8oi98ACgkQAVBC80lX
0GyFwgf/bQNxv5tl9jMYxV++OZ52znu7RaHNtbiO+6ohloAFG9osI4KqwTrwG2SO
cCnuUXsoJTyBn1VKTa91r8a7kXS3M2tAL23G+LUwelMYoSk2ZpaFP4ty+4XHXY5l
zYuzrQlsKNLEWJQYDTS1cBx/jW0fgv9QTvXwI77b5LiKWubB2B+LrY3st7UR4y4b
3g6Tg3j1Cj9DAxw44jeDFymYjd05Ffgntw3PwJVhohHAp2bhF1V78yJ3RhDghEfK
jBnthSlHsibHTZ+PG/HmCGb+jYRCrF1yaJKTIYamLsr9qtTNKNe+aDSMgRttSnH8
r48JP7Msi9JchND3tt9/fgkiTbm1gA==
=tevK
-----END PGP SIGNATURE-----

--Sig_/jZlSr4XHspbHtB=MfsVKrRi--
