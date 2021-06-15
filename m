Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105093A739A
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 04:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFOCPa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 22:15:30 -0400
Received: from ozlabs.org ([203.11.71.1]:33965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229743AbhFOCP3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Jun 2021 22:15:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3sL36lcMz9sW4;
        Tue, 15 Jun 2021 12:13:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623723196;
        bh=9MlykeVUCwRGDxv70LGHNLyJkE65EThzOtrBU3H2PtU=;
        h=Date:From:To:Cc:Subject:From;
        b=Lt9xx+m/jyTYBvXduV4MF4nSK6XmHymI0gNNPwSpUvmhpNV6GNCx5yhttSThtMZlW
         eMmwyU8bIOjo84X26MSCd14KtvigY1Kh9bzWZ0mvCKoJ0s/yQuW01VpTkGMqaNbf9k
         PG9RSccotwoTCdO6SyVMeHFLFrqgPulDM5Pu4RryrP3qrp7BVDoWuEEe8ufKfZxGRf
         3HM61OqkdBmax5/10unk5wL9ZqQvvwIe3vRLGitjyWDi8Pv4WSyWLH0ozkDmUx4bdw
         L0ne7RmR45Fml8Q97XDi7gmSR/tTjHaxg6VI2CcPGL38zzC+vWl6JI44uVQerOcyj2
         MaO0d3kftl6wQ==
Date:   Tue, 15 Jun 2021 12:13:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20210615121314.6b711d8e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/120syJlJlrS85xtlj/.J.0=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/120syJlJlrS85xtlj/.J.0=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/kernel.h:15,
                 from fs/io_uring.c:42:
fs/io_uring.c: In function 'io_alloc_page_table':
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
fs/io_uring.c:7095:28: note: in expansion of macro 'min'
 7095 |   unsigned int this_size =3D min(size, PAGE_SIZE);
      |                            ^~~

Introduced by commit

  9123c8ffce16 ("io_uring: add helpers for 2 level table alloc")

--=20
Cheers,
Stephen Rothwell

--Sig_/120syJlJlrS85xtlj/.J.0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIDLoACgkQAVBC80lX
0Gwzbwf/T14z+2CkFXv7FWlkIc7bHFnqEXL5FBiDAaE2uXcztZA/YoG7e1BM3e2V
kFs9SCHIUe5aHXxy+/ssA561Kf4Ou1bFzLCPe18P/H5g8hJi3Dq7sImnqJVj8fO7
FpqLTecLChkFvBy6GzOSUz7jkogBUJLJqUqAsFIG/w7Iu1WkVkVd9eDnoJqFFrq6
w8KZ3T1LsMYSCv3Pi2FUjKhjwosgpaHcL6LMVROpWe20YL3VFdu47oGnB/AWOdH8
rR6rVnmt/0eTF4lA2I91puQTiBVHHlCVkmVonuWGVVH2H6Mh8TrKkTM8R9zflfdN
Z6NC5JGCPL483xukLQpgtzh5YEzIbg==
=Ek/O
-----END PGP SIGNATURE-----

--Sig_/120syJlJlrS85xtlj/.J.0=--
