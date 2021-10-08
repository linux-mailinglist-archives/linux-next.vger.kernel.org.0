Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FD8426470
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 08:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhJHGGS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 02:06:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37677 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhJHGGS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 02:06:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQd1d4j70z4xbR;
        Fri,  8 Oct 2021 17:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633673062;
        bh=txlKVDLj/XD+UcB3cbPrKt3zjMD93waqfthegP9yFKg=;
        h=Date:From:To:Cc:Subject:From;
        b=WzUz6esBb7qbJRwJCn4VxrVRyZaSwqHFh58J5IDVhNGYTyugPFnhTzoTfIVB9l2bJ
         jz29Qs0FVNPWBBF3gfXwdO667fFqlMCTlc1vXJ1FKC5f5kKggs/yWCKZV0e+ucXU7e
         e1zUxkjeG4hoFYdTKsl9T3wh/nCOJCfUnTKw7SBXRQ/5fQ8rha6+qvjYQj2STC+JnY
         55xw42T5OuMMbE2sQuSuqxG0fCVI1lH/15DPyWSybHItb4d0VAmK5QiIXspwxTI9Q9
         DAt7heM6POksaHDhAYsN7HLhvhJxzuYeMSwyfVlNPLdzh4jEqgBBgDzEIs5mgKYPRw
         0HJRBuBpKJLVA==
Date:   Fri, 8 Oct 2021 17:04:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20211008170420.4044df3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4MYs/j8RX/bD13_O+5LfhuC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4MYs/j8RX/bD13_O+5LfhuC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/kernel/mte.c
  mm/kasan/kasan.h
  mm/kasan/hw_tags.c

between commit:

  ec0288369f0c ("arm64: mte: Add asymmetric mode support")

from the arm64 tree and commit:

  7f3c6cb1e524 ("arm64: mte: add asymmetric mode support")

from the akpm-current tree.

I am assuming that the arm64 tree commit (and surrounding commits) is
a newer version of the same change in the akpm-current tree, so I have
dropped the following patches from the akpm-current tree.

2cff25205689 kasan: extend KASAN mode kernel parameter
7f3c6cb1e524 arm64: mte: add asymmetric mode support
a0449eb025b2 arm64: mte: CPU feature detection for Asymm MTE
b7b8a32980f3 arm64: mte: bitfield definitions for Asymm MTE
89a5adeb4891 kasan: remove duplicate of kasan_flag_async

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/4MYs/j8RX/bD13_O+5LfhuC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFf32QACgkQAVBC80lX
0Gy4mgf/WUChD2MISA6liZ41M0zCb8D1Hzcu4Ne4prszM5BDoG2jK41LIpbd/Bex
mKNi046/Idjpf1/ShrKgPR0nYGk5mKWhtIYfcMPKR/ENUfXWE4SuOKs1TpUurA9w
cmpO22AUyeT1CiV+O/3XriOytTds3HV33T+gyFwzmYRJAfQ3iow0e9naMQ3N/FP1
CwYXjodcqsztRo0/Mxd7Asr3nyZTru7rdeIB7xFtd4sZgi9p1F6FoDV1l3+DVe+n
gBL7Vk4Xzc1GuIwgjW5iLTvfYFdrU6g0HBAZY19oQqt4a8U0LIuaFhilNoeVVnDK
c0UOkDlu34NadGLo6O/LDKA/n23xgg==
=mMcd
-----END PGP SIGNATURE-----

--Sig_/4MYs/j8RX/bD13_O+5LfhuC--
