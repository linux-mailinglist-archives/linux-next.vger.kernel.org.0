Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9B035B733
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 00:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbhDKWV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 18:21:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42743 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235894AbhDKWV1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Apr 2021 18:21:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJRCl5c46z9sWT;
        Mon, 12 Apr 2021 08:21:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618179668;
        bh=1aHiQ3LnuB0CLh3YfgclKj1iMA+G49hSXkqLjpUdvc4=;
        h=Date:From:To:Cc:Subject:From;
        b=E1OsBu88kVMfByMVoeMed2CRhmUfOFzrGmlqtbcX9JEJfTeWQPX8WoYzAopxcy0bK
         F3fb5pcoJvMgw8OzVRAvh0Y2CEt5phxHtjYlnrQPGFYIYXBNb3/FiYXZqKqJuKiGYe
         17C/PsQFCHpD9TaJ1Hlx/3fZe1AaeCWEUz1F8V6uMv9Jclaw9jT36lxL7gcZB+BOsk
         3dEBHEWBnC8WaHicR6FQCazOC4t0x5Mr7x/eShYYcGjbr5yrMpTCaeANiD98v9vptk
         SX6nb9xTetY+zkS5wWxEAt3qVd8h+jJS2mH3Kfy2lnqmHuEwdzrb61cK1x1uMpi9El
         xWN8WDHKUWcqw==
Date:   Mon, 12 Apr 2021 08:21:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Zhang Yi <yi.zhang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20210412082106.488f6642@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DmFOym7WZs/X1Td6bnvx=W+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DmFOym7WZs/X1Td6bnvx=W+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a149d2a5cabb ("ext4: fix check to prevent false positive report of incorr=
ect used inodes")

Fixes tag

  Fixes: 50122847007 ("ext4: fix check to prevent initializing reserved ino=
des")

has these problem(s):

  - SHA1 should be at least 12 digits long

This is probably not worth rebasing to fix, but can be avoided in future
commits by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/DmFOym7WZs/X1Td6bnvx=W+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzdlIACgkQAVBC80lX
0Gzdlgf+I5VGKYtQkyAK1KxRNC0smv/6SwQ9jDe7jgfhIJK5tAJprK0s9VnIcVQ5
/KwtN2uEDSJXvBpTnBMDdSfWE1JOk5GGnsQTJyVCbsg2G6UyqRd6CJc72yZS96O5
ffFhBD61EfFequsjqFXhH+cjGMinaB0PI0rtW3kP/iS742cbbB/R5ps4MUj1SS6x
Kj9b6XNgACNNOEtdP1Rdkci5hTQlymGjL3sb9MNkvLGwEFRcVzFH4ISkZbj2dY0y
zPHaFO8hbHh/W19OXm7tanorb3w7HR2+635LV14G1z26M812ZYGH3H7KRgtn8CSG
3o+dxmu9agi4XmoKtdaPAY2FQdeZaQ==
=tgP5
-----END PGP SIGNATURE-----

--Sig_/DmFOym7WZs/X1Td6bnvx=W+--
