Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078B7182721
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 03:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387453AbgCLCzX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 22:55:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387411AbgCLCzW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 22:55:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dD2v63WJz9sPR;
        Thu, 12 Mar 2020 13:55:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583981720;
        bh=tNuE4pMHJsDFqfR4K0o7svKUZNv989qG/lN6kWNQRu8=;
        h=Date:From:To:Cc:Subject:From;
        b=W2oLLbCLWwKO2sfg7N1V+zy5c56izuOfv4giH8lq7rYps+l51UIEF2c0Z370d9+fM
         +Rc9H6p3uK9xZIDaFEcPVDulRxGlwb/LdAs9Le3AIQuYgns6pTSatWcXEoUcXoh2cz
         PhXOAfwXITJ0S5K9pnWTGrlgsAa0RiECj4pEpkhXXvofGK3TzODO6sGLoyNB3fAVub
         NAzHmTcen5cRxz55QMfeG2ajQ7zUubbLNi/fuMYF216ZjxasJfpXO0pCq5l9qib5Ig
         bC07TAq6xqvjBH5uQjYvzthUjC9vzUsYKXA3zJ+LnPlR+kkpCC9hMTUFpvDhvTswcD
         IOgzp8Zz/KQ+g==
Date:   Thu, 12 Mar 2020 13:54:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matteo Croce <mcroce@redhat.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Coly Li <colyli@suse.de>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200312135457.6891749e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Diut.1vghMyFUg_7Vp5MzOl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Diut.1vghMyFUg_7Vp5MzOl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from fs/erofs/xattr.h:10,
                 from fs/erofs/inode.c:7:
fs/erofs/inode.c: In function 'erofs_read_inode':
fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first u=
se in this function); did you mean 'PA_SECTION_SHIFT'?
  197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
      |                               ^~~~~~~~~~~~~~~~~~
fs/erofs/inode.c:122:30: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
  122 |   inode->i_blocks =3D nblks << LOG_SECTORS_PER_BLOCK;
      |                              ^~~~~~~~~~~~~~~~~~~~~
fs/erofs/internal.h:197:31: note: each undeclared identifier is reported on=
ly once for each function it appears in
  197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
      |                               ^~~~~~~~~~~~~~~~~~
fs/erofs/inode.c:122:30: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
  122 |   inode->i_blocks =3D nblks << LOG_SECTORS_PER_BLOCK;
      |                              ^~~~~~~~~~~~~~~~~~~~~
In file included from fs/erofs/data.c:7:
fs/erofs/data.c: In function 'erofs_read_raw_page':
fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first u=
se in this function); did you mean 'PA_SECTION_SHIFT'?
  197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
      |                               ^~~~~~~~~~~~~~~~~~
fs/erofs/data.c:226:4: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
  226 |    LOG_SECTORS_PER_BLOCK;
      |    ^~~~~~~~~~~~~~~~~~~~~
fs/erofs/internal.h:197:31: note: each undeclared identifier is reported on=
ly once for each function it appears in
  197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
      |                               ^~~~~~~~~~~~~~~~~~
fs/erofs/data.c:226:4: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
  226 |    LOG_SECTORS_PER_BLOCK;
      |    ^~~~~~~~~~~~~~~~~~~~~
fs/erofs/data.c: In function 'erofs_bmap':
fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first u=
se in this function); did you mean 'PA_SECTION_SHIFT'?
  197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
      |                               ^~~~~~~~~~~~~~~~~~
fs/erofs/data.c:351:16: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
  351 |   if (block >> LOG_SECTORS_PER_BLOCK >=3D blks)
      |                ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  61c7d3d5e015 ("block: refactor duplicated macros")

I have used the block tree from next-20200311 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Diut.1vghMyFUg_7Vp5MzOl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ppIEACgkQAVBC80lX
0GwmQwf/VHjGajtoyfJ/T3FbAbp1hR0sNYropgqBbs5jJ4y5Zt7iZFibLfqEALv3
b0OCHo4r3lYUpLZ2cl+Yfp6ItoC6wHiYWh2WEQwZ/AmRNfxgfr1otGxYkvYSb7aq
tdwhvCkdxkg/fJYfo96ysPfVFS74X2c8+pCL/hi5UsRxF4jvZ9C71vtthO7PLaQe
B1iwxuPRXCy07MI+m68vM/ZIw/hW8/6aN6Xrk5QQJZHe+KyA52Dw3yg2/2rJowrY
xXlxsnX4rM8g6+x1tvBhp+8zXPc582TC+WoyPrkHr60+W0LPTSPmpH2tHPh2Q909
Hzi005MkFVxw3VfZxJCX+y7aPWT7QA==
=xl+s
-----END PGP SIGNATURE-----

--Sig_/Diut.1vghMyFUg_7Vp5MzOl--
