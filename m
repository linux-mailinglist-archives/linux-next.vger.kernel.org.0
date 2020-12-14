Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E842D92EE
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 06:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389769AbgLNFth (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 00:49:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34227 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726177AbgLNFtg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 00:49:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvVnC5D5jz9sRR;
        Mon, 14 Dec 2020 16:48:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607924933;
        bh=3JgDXWZLmjE1DToRwNs64MKUO9l19hfDGbOLoi22EXw=;
        h=Date:From:To:Cc:Subject:From;
        b=M0h61/ofCbOocNZ+W3KBOzYyQv0mkuyxf5MThyEA8NdaE72jY/HAHMq0IUyMfziHX
         5cKiZmrb2qEzdr0WmvUTok86iUEmkvUczJVDANrssKAJxvj3JGhH3XBLu6XdlOcf9N
         tLqja/by+wwwgyw81gZMZfCMhxcGO2p2GzAHkyyXVZJ9EsuhnqfYUvRDNanQ3ljgrj
         LltFA6gndRcp0xSumhfloYGtxJZv1zKROchn1kkQkMMQ56sEEg9e6hdV7+EteF+Pwi
         ssMA+yYIOU49lzYOTSinsl0qeQ4fQU+IRG6xOQmZBfByvA3D8+tdQj6dGS22FoZFZr
         CnYpOJ1cc8G+g==
Date:   Mon, 14 Dec 2020 16:48:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20201214164836.0d73cf9a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xT8_XsTdsRY3tkthhjDyt8x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xT8_XsTdsRY3tkthhjDyt8x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/kernel.h:14,
                 from include/linux/list.h:9,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/proc_fs.h:10,
                 from include/linux/efi.h:19,
                 from drivers/firmware/efi/libstub/arm32-stub.c:5:
drivers/firmware/efi/libstub/arm32-stub.c: In function 'handle_kernel_image=
':
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
   58 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
arch/arm/include/asm/efi.h:74:25: note: in expansion of macro 'max'
   74 | #define EFI_PHYS_ALIGN  max(SZ_2M, roundup_pow_of_two(TEXT_OFFSET))
      |                         ^~~
drivers/firmware/efi/libstub/arm32-stub.c:123:44: note: in expansion of mac=
ro 'EFI_PHYS_ALIGN'
  123 |  int alloc_size =3D MAX_UNCOMP_KERNEL_SIZE + EFI_PHYS_ALIGN;
      |                                            ^~~~~~~~~~~~~~
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
   58 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
arch/arm/include/asm/efi.h:74:25: note: in expansion of macro 'max'
   74 | #define EFI_PHYS_ALIGN  max(SZ_2M, roundup_pow_of_two(TEXT_OFFSET))
      |                         ^~~
drivers/firmware/efi/libstub/arm32-stub.c:139:20: note: in expansion of mac=
ro 'EFI_PHYS_ALIGN'
  139 |  if ((alloc_base % EFI_PHYS_ALIGN) > slack) {
      |                    ^~~~~~~~~~~~~~
In file included from include/linux/list.h:9,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/proc_fs.h:10,
                 from include/linux/efi.h:19,
                 from drivers/firmware/efi/libstub/arm32-stub.c:5:
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/kernel.h:63:46: note: in definition of macro '__round_mask'
   63 | #define __round_mask(x, y) ((__typeof__(x))((y)-1))
      |                                              ^
drivers/firmware/efi/libstub/arm32-stub.c:144:17: note: in expansion of mac=
ro 'round_up'
  144 |   kernel_base =3D round_up(alloc_base, EFI_PHYS_ALIGN);
      |                 ^~~~~~~~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
   58 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
arch/arm/include/asm/efi.h:74:25: note: in expansion of macro 'max'
   74 | #define EFI_PHYS_ALIGN  max(SZ_2M, roundup_pow_of_two(TEXT_OFFSET))
      |                         ^~~
drivers/firmware/efi/libstub/arm32-stub.c:144:38: note: in expansion of mac=
ro 'EFI_PHYS_ALIGN'
  144 |   kernel_base =3D round_up(alloc_base, EFI_PHYS_ALIGN);
      |                                      ^~~~~~~~~~~~~~
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/kernel.h:63:46: note: in definition of macro '__round_mask'
   63 | #define __round_mask(x, y) ((__typeof__(x))((y)-1))
      |                                              ^
drivers/firmware/efi/libstub/arm32-stub.c:148:17: note: in expansion of mac=
ro 'round_down'
  148 |   kernel_base =3D round_down(alloc_base, EFI_PHYS_ALIGN);
      |                 ^~~~~~~~~~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:58:19: note: in expansion of macro '__careful_cmp'
   58 | #define max(x, y) __careful_cmp(x, y, >)
      |                   ^~~~~~~~~~~~~
arch/arm/include/asm/efi.h:74:25: note: in expansion of macro 'max'
   74 | #define EFI_PHYS_ALIGN  max(SZ_2M, roundup_pow_of_two(TEXT_OFFSET))
      |                         ^~~
drivers/firmware/efi/libstub/arm32-stub.c:148:40: note: in expansion of mac=
ro 'EFI_PHYS_ALIGN'
  148 |   kernel_base =3D round_down(alloc_base, EFI_PHYS_ALIGN);
      |                                        ^~~~~~~~~~~~~~

Introduced by commit

  c0249238feef ("efi: arm: reduce minimum alignment of uncompressed kernel")

--=20
Cheers,
Stephen Rothwell

--Sig_/xT8_XsTdsRY3tkthhjDyt8x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W/LQACgkQAVBC80lX
0GxUKgf/btiJpW+e6kT0WJjfXKkotdBim4DhCeLgY5CYV3GujfI/YW66KdZwrPMm
E0yTr68AmYhdFtBI7QgJqm0bQ1WL4yleJVNNZDPv0RzF474Lq5Ru2+TWUBv2TMJy
Gl2/Bke2BGY1HB7Qe5jansnyQwtnpfF2SDBVTuDkGmAfNphsXXkp3AxTAROfuFcR
jAIklnSpVObFHmKisPpYGqjCPhz5ZIHbX2Mzf/iFKP3dvArMHtL7Ho0Kg6vzN90z
/5SJlT+eCKGyDMo4qt0gEifgohAcnTDEdydZ0CGxpOostYgdrLDQmRqZEqcvXN26
g1QjhdvSkvWcQntIuEzsaiXkttgBhA==
=dIpL
-----END PGP SIGNATURE-----

--Sig_/xT8_XsTdsRY3tkthhjDyt8x--
