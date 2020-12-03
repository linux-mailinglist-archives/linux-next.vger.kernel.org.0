Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264452CD22E
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 10:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388586AbgLCJJV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 04:09:21 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388383AbgLCJJV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 04:09:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cmqkt0Svcz9sVx;
        Thu,  3 Dec 2020 20:08:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606986518;
        bh=v57HY7yzbu2n48GAoHI2xpG949ISV126+/mBCGIwqoU=;
        h=Date:From:To:Cc:Subject:From;
        b=ludUBYFzWyrkcybz9c3U+f55oDtA+OaG0GOW6y3K3m8Nwmc+GSYBiXnuuUsR2jDGr
         3SgYgdv6aNBRWOkmJpTkOcVnENoJCQgHDPSOlDp4DN6bFDuWIX/vfxoaf7Sj25JYya
         yNxMxVwkujATCYNPR6ywsULMaaveSUy6Z53bg/QeRVtR1vXhCnAM3eiHnWDLa1EpgJ
         epuJeaJ0s43bw6E3MXc02bXLH08BrMPqgyFsYCx7WOJf3iXMwa+rbAnO+Hq/f/aS1g
         Zy9elv3K8pz+o9bLXjfNd6/XzfcoVosuhdheIgsXHeX6rQrjdsWV5vHEIySqKDKe3w
         aUMICVAaDvwVg==
Date:   Thu, 3 Dec 2020 20:08:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Rui Salvaterra <rsalvaterra@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201203200837.68df59a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uDw.SJl9/QsNuxOCE4QhoGW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uDw.SJl9/QsNuxOCE4QhoGW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

WARNING: unmet direct dependencies detected for CRYPTO_LZO
  Depends on [m]: CRYPTO [=3Dm]
  Selected by [y]:
  - ZRAM_DEF_COMP_LZORLE [=3Dy] && <choice>
  Selected by [m]:
  - UBIFS_FS [=3Dm] && MISC_FILESYSTEMS [=3Dy] && MTD_UBI [=3Dm] && UBIFS_F=
S_LZO [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_LZO
  Depends on [m]: CRYPTO [=3Dm]
  Selected by [y]:
  - ZRAM_DEF_COMP_LZORLE [=3Dy] && <choice>
  Selected by [m]:
  - UBIFS_FS [=3Dm] && MISC_FILESYSTEMS [=3Dy] && MTD_UBI [=3Dm] && UBIFS_F=
S_LZO [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_LZO
  Depends on [m]: CRYPTO [=3Dm]
  Selected by [y]:
  - ZRAM_DEF_COMP_LZORLE [=3Dy] && <choice>
  Selected by [m]:
  - UBIFS_FS [=3Dm] && MISC_FILESYSTEMS [=3Dy] && MTD_UBI [=3Dm] && UBIFS_F=
S_LZO [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_LZO
  Depends on [m]: CRYPTO [=3Dm]
  Selected by [y]:
  - ZRAM_DEF_COMP_LZORLE [=3Dy] && <choice>
  Selected by [m]:
  - UBIFS_FS [=3Dm] && MISC_FILESYSTEMS [=3Dy] && MTD_UBI [=3Dm] && UBIFS_F=
S_LZO [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_LZO
  Depends on [m]: CRYPTO [=3Dm]
  Selected by [y]:
  - ZRAM_DEF_COMP_LZORLE [=3Dy] && <choice>
  Selected by [m]:
  - UBIFS_FS [=3Dm] && MISC_FILESYSTEMS [=3Dy] && MTD_UBI [=3Dm] && UBIFS_F=
S_LZO [=3Dy]
ld: crypto/lzo.o: in function `lzo_compress':
lzo.c:(.text+0xbc): undefined reference to `lzo1x_1_compress'
ld: crypto/lzo.o: in function `lzo_scompress':
lzo.c:(.text+0x228): undefined reference to `lzo1x_1_compress'
ld: crypto/lzo.o: in function `lzo_mod_fini':
lzo.c:(.exit.text+0x1c): undefined reference to `crypto_unregister_alg'
ld: lzo.c:(.exit.text+0x34): undefined reference to `crypto_unregister_scom=
p'
ld: crypto/lzo.o: in function `lzo_mod_init':
lzo.c:(.init.text+0x20): undefined reference to `crypto_register_alg'
ld: lzo.c:(.init.text+0x30): undefined reference to `crypto_register_scomp'
ld: lzo.c:(.init.text+0x40): undefined reference to `crypto_unregister_alg'
ld: crypto/lzo-rle.o: in function `lzorle_compress':
lzo-rle.c:(.text+0xbc): undefined reference to `lzorle1x_1_compress'
ld: crypto/lzo-rle.o: in function `lzorle_scompress':
lzo-rle.c:(.text+0x228): undefined reference to `lzorle1x_1_compress'
ld: crypto/lzo-rle.o: in function `lzorle_mod_fini':
lzo-rle.c:(.exit.text+0x1c): undefined reference to `crypto_unregister_alg'
ld: lzo-rle.c:(.exit.text+0x34): undefined reference to `crypto_unregister_=
scomp'
ld: crypto/lzo-rle.o: in function `lzorle_mod_init':
lzo-rle.c:(.init.text+0x20): undefined reference to `crypto_register_alg'
ld: lzo-rle.c:(.init.text+0x30): undefined reference to `crypto_register_sc=
omp'
ld: lzo-rle.c:(.init.text+0x40): undefined reference to `crypto_unregister_=
alg'

Caused by commit

  a6d52df2d8bc ("zram: break the strict dependency from lzo")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uDw.SJl9/QsNuxOCE4QhoGW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IqxUACgkQAVBC80lX
0GyZkQgAmQbfqBv+DG62p7CPvkKkeuA1UVe0Fq8l5ghEHnT75/jJBYsoDjGqTH6B
BN7x61bMHezcMtkVT/o9gwsc0oKPO8cKevCqM6sOVsP4esQIatPSefUVW0iDkImp
BYkH7QZ44xN03O40TMDtjwBu2+ko9mWvCkdsRoNYIubC6istZwc4akqtP/jFx24R
Q+ZBWClBdhLrvyuUqLPF8Vgh0/moONwRAp1yrNSzj4Wl5ARIjvMNTKaIudx9AV8m
4XsM7X77n7OmJPzR2t7xdtlxPhZ3bO/KuBTV5aIHp31szWyhv3fFCmGbCcQ+ELLt
5cN7K5L+XO01i0qLcW7G6WRKchZ6JQ==
=qfgH
-----END PGP SIGNATURE-----

--Sig_/uDw.SJl9/QsNuxOCE4QhoGW--
