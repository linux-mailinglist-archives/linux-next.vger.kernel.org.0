Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438C3130C04
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 03:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgAFCRY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 21:17:24 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42149 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbgAFCRY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 21:17:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rfKV1FwZz9sQp;
        Mon,  6 Jan 2020 13:17:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578277041;
        bh=g5hgS8PaXyRwMeuMb9SrHjBiLH+iyoGniQ/pgQSZF8s=;
        h=Date:From:To:Cc:Subject:From;
        b=ecZrBJ+rq2WoNXmqlFfe5IUNxBhupGIVk4NTltnykY/IlSezbsad8wvnVzOzpGofy
         P2r42COhwdI+glxmJy9uJl3nD612KMOTE1Wd9qsindWpphJ+tbplIq3xG+xuwg7JUj
         4CqqdI7H6wxA253Ugs4tH72NGZr43srU4uW081uxaZZ2b9+4jXdiPEAiY4yMCsccwC
         nkmlH68jpJSCnPjl+jnmOkkdeoUJZcCNRU01wzoc9faQVbsva7otUlTJgpbRNW1tz2
         8BAdT8//egmGHtgGkHJsePYdIpazxtDT8MFnP8dBtDbYhCf5uGthpHNy2QJrsDPuea
         anEKTOipvKOzw==
Date:   Mon, 6 Jan 2020 13:17:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200106131716.3cb701e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cL4=G8M+QYfb2enyyq=q7yt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cL4=G8M+QYfb2enyyq=q7yt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  init/main.c

between commit:

  74f1a299107b ("Revert "fs: remove ksys_dup()"")

from Linus' tree and commit:

  dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc init/main.c
index 2cd736059416,919f65faeb7e..000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -93,6 -93,8 +93,7 @@@
  #include <linux/rodata_test.h>
  #include <linux/jump_label.h>
  #include <linux/mem_encrypt.h>
 -#include <linux/file.h>
+ #include <linux/kcsan.h>
 =20
  #include <asm/io.h>
  #include <asm/bugs.h>

--Sig_/cL4=G8M+QYfb2enyyq=q7yt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SmKwACgkQAVBC80lX
0GwTiAf9GWwzdc4WYSAk0xSvIytCJHZi8dFOhoA6mFnsjI2QDb7oyZiIvF06XGvy
U6sN2oCtnY5ps+VHaQ7WYwra5crwbdFlUIzTDLoNjMhBZ8hA+9LA3B4Q8rUOSewl
8ZgObYu7Uib/dBb1EQVEw5dzhKAAvxQTWgrVRXTyGpUzoyuAHKx4GBYlrbXVWhyA
y2zEoBO53s0/A2cKXHbLAM3AfXMs8NkBYQuwd1LhEz2FeTwUBWpeXOxFz3ZZpF0c
Mzq4WNNya/o+tgG/UbSE7GtgsA6oGqH+KNrvLYt9KxFPfxs/blWxQwId0N+bnjXX
dFsBq5pkIvr/PmkdaA++TKYcYkTe/w==
=7i5u
-----END PGP SIGNATURE-----

--Sig_/cL4=G8M+QYfb2enyyq=q7yt--
