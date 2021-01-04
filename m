Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B572EA014
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 23:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhADWhA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 17:37:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726168AbhADWhA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Jan 2021 17:37:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8r815Xx1z9sVk;
        Tue,  5 Jan 2021 09:36:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609799777;
        bh=UN/pxO4Hm2dtXu35TV2Rqf85blFWW77FjLybnLVDm4Q=;
        h=Date:From:To:Cc:Subject:From;
        b=OL/IJ5J8rH7J+EwltKHJsB2w6mRAjWkQoF/Ej+Y5vRSi031TEP+Su2JrbQUQPJSoY
         AoiDoYMC5tv/eQkQ/fsD8NbfWMcugAQJE6ZCKdCBGviX4QlYycK7RqOCSeCKzSN5wz
         tNM0cnpkHNLaDBGCDMJplCCO0FzMf2fLdFCbdS0k+72Pyt1b+XyT5T9gG7a8l8be6j
         rWSc/V8q0gJknqlw5fNYiIh3IRDYq0CXlbUPIm2274KI/oPR8W+JqoJmpS+dgrDwV9
         ly6yr/oAhUvZ/uZng0UaLA90WdlPreZePx/s0u59z/irYW9Pzc2U9rTknSefbbIQcF
         oaVLSQXJcxGfA==
Date:   Tue, 5 Jan 2021 09:36:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20210105093616.5712e36f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jjlLmamDKI_6n2l+k/ymSLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jjlLmamDKI_6n2l+k/ymSLl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from arch/x86/include/asm/elf.h:8,
                 from include/linux/elf.h:6,
                 from include/linux/elfcore-compat.h:5,
                 from fs/compat_binfmt_elf.c:17:
fs/binfmt_elf.c: In function 'fill_thread_core_info':
arch/x86/include/asm/elfcore-compat.h:23:20: error: 'TIF_X32' undeclared (f=
irst use in this function)
   23 |  (test_thread_flag(TIF_X32) \
      |                    ^~~~~~~
include/linux/thread_info.h:116:45: note: in definition of macro 'test_thre=
ad_flag'
  116 |  test_ti_thread_flag(current_thread_info(), flag)
      |                                             ^~~~
fs/binfmt_elf.c:1744:5: note: in expansion of macro 'PRSTATUS_SIZE'
 1744 |     PRSTATUS_SIZE, &t->prstatus);
      |     ^~~~~~~~~~~~~
arch/x86/include/asm/elfcore-compat.h:23:20: note: each undeclared identifi=
er is reported only once for each function it appears in
   23 |  (test_thread_flag(TIF_X32) \
      |                    ^~~~~~~
include/linux/thread_info.h:116:45: note: in definition of macro 'test_thre=
ad_flag'
  116 |  test_ti_thread_flag(current_thread_info(), flag)
      |                                             ^~~~
fs/binfmt_elf.c:1744:5: note: in expansion of macro 'PRSTATUS_SIZE'
 1744 |     PRSTATUS_SIZE, &t->prstatus);
      |     ^~~~~~~~~~~~~

Caused by commit

  5a9b7f382248 ("binfmt_elf: partially sanitize PRSTATUS_SIZE and SET_PR_FP=
VALID")

or maybe commit

  9866fcab1c65 ("[elfcore-compat][amd64] clean PRSTATUS_SIZE/SET_PR_FPVALID=
 up properly")

I have used the vfs tree from next-20210104 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jjlLmamDKI_6n2l+k/ymSLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/zmGEACgkQAVBC80lX
0GyxSggAhrIb7vW+lXFvt3Y7mBGkivMIYoZxzE92fmvGQ+dkS7L/P6/QapixJy/8
wxd88xvQpBUcuAMDUsjtnQVoHnO0y9nAhrzIoYQ29Ew7vfS3YDLKX/4bIXtW5EPP
Xm4tOJiGtpaeP9DUdvDgWZzBEZVy8zCjVsFxmUdO84Cpct79od8b7Ys6UfX+zMEL
5pP+9cM7z8NZDEM1+DrWrgzPHp+cMW4wJCgBUIaSFEZ/z+XHWGvoN6XF47gkSkfy
LblLmrzBqffiONImeboj3aY54uO/86eGn0akG8iVc0CSJWye81YhEgbNmsJ71OR8
pR8K/jhIWyeq80D4AK+4FYjgI3A5VQ==
=4w/b
-----END PGP SIGNATURE-----

--Sig_/jjlLmamDKI_6n2l+k/ymSLl--
