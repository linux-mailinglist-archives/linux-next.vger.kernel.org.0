Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399781D110D
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 13:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732677AbgEMLTg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 07:19:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732494AbgEMLTf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 May 2020 07:19:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MXJ53164z9sRY;
        Wed, 13 May 2020 21:19:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589368773;
        bh=eWXDkhnWVrgQrvJzbOKavg/ZXftnGTRT+CHjp0w9y4c=;
        h=Date:From:To:Cc:Subject:From;
        b=PwsWXKh2Oq3KES5JPiZrO3cQSmcC78JU1uINFKOnmDpTNiiS24cn/WRPaQwu969Mj
         yeSkTeW/HZDaHUvmsMxp+5Gs8cmS6tf/G5IzCRCNLAwMYCa5VtwQVTXpKWHdGPAyDq
         ZI9Lv3hlRcSio3G7XalLEaCeXteee1f0KiaG63ZWWo99d8qJoS+XE1Hbp0vov+3It3
         RNYn5BPCuYIMBEdBkKsYOijbUErVfzwJvlV+o+OKeWp55PswZ6SbHZ5GKl2Nxr6HEm
         UHSyev95XwkF5BrnqhLXhZGAz/mfF4xmCtt6kuokG3p4od/3eTqLKnxImVBHihDrhV
         pZ9CR1Ne9RxBg==
Date:   Wed, 13 May 2020 21:19:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v-fixes
 tree
Message-ID: <20200513211925.030deeec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lke1ECv8QHlbEL7MyVShD6S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lke1ECv8QHlbEL7MyVShD6S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e2d8d84b18c3 ("riscv: pgtable: Fix __kernel_map_pages build error if NOMM=
U")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/lke1ECv8QHlbEL7MyVShD6S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl67170ACgkQAVBC80lX
0GwsxQgAiWwyPXyiCqVGv2q0S4mfSM86oQKC6zZDvQV0WFRe1Hpsfbjc/GzQgN0n
R1Q6cImOgO1PQ2qEcNb1IR5Z1xNgKkrhRwIt/UG2BQ1sEVp9fcpxXMzYdgtCclqG
ilgyrk1tn8RyAUTYA5vmM9rAhB6fk/8Wm/hQM2YphKfFrYuHejdpxwfpVLPhs7zF
2jKQhtN95xp0VuUqzWMnyUieDBWQjICfofoYu2GVIw/VYJg9XrHlPZmMEY1l03cZ
QTpAxkuF6SxWaTghEEk/llAhfF0zO/ibDcc4b6PeEwg0tCrzglvh3VeFqDbAjjR2
k3BzS61g4o0Gd1sKwUF+ObauuTfOhg==
=B34t
-----END PGP SIGNATURE-----

--Sig_/lke1ECv8QHlbEL7MyVShD6S--
