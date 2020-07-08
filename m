Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F463217C42
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 02:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgGHAjF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 20:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGHAjF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 20:39:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B908C061755;
        Tue,  7 Jul 2020 17:39:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1gR839Nrz9sT6;
        Wed,  8 Jul 2020 10:39:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594168742;
        bh=ZqxJmHYKoX263jV+M7HK2ibyqOYYgqJck7f+NOmwaNM=;
        h=Date:From:To:Cc:Subject:From;
        b=QjUvgErWYUssoj3ZZ4VXe8S8NWYAauADeXkSC+USLm8sqQbVlY5LfStj/rHPDKav+
         t/DXwjWcwHYhJc1mJRjqIZoPYfwz6rh+NQe/KESu5lVJoEKy0Rd/CZ7Gmz0hNzW39e
         1dV1VPq0Ip4Gj0PrHH+zslQ5yVjxuHSFyDLNGy2uEha0EO1ryRxi10EdNTAqB2o41s
         51LzGosUoIQCu51QKQHDP36EIhcGT/cQaYrDzZML98JIKLFWskd68GRhhDIKJX4QDB
         1YoB6dkUHVZudchCd3ItDUtnuPxk+TJwm4R7Kx5ziv7Wm40Uz+0hwJyuigzIQNpc8v
         5MrJ2uX1iAoJg==
Date:   Wed, 8 Jul 2020 10:38:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Satya Tangirala <satyat@google.com>,
        Chao Yu <yuchao0@huawei.com>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Message-ID: <20200708103858.1196bb65@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nnST=6buV2SyRaUCBO_zXbf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nnST=6buV2SyRaUCBO_zXbf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  Documentation/filesystems/f2fs.rst

between commit:

  38dff4e50c12 ("f2fs: add inline encryption support")

from the fscrypt tree and commit:

  a7c77c387b60 ("f2fs: fix to document reserved special compression extensi=
on")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/f2fs.rst
index 8b4fac44f4e1,535021c46260..000000000000
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@@ -258,13 -258,8 +258,15 @@@ compress_extension=3D%s  Support adding s
                         on compression extension list and enable compressi=
on on
                         these file by default rather than to enable it via=
 ioctl.
                         For other files, we can still enable compression v=
ia ioctl.
+                        Note that, there is one reserved special extension=
 '*', it
+                        can be set to enable compression for all files.
 +inlinecrypt
 +                       When possible, encrypt/decrypt the contents of enc=
rypted
 +                       files using the blk-crypto framework rather than
 +                       filesystem-layer encryption. This allows the use of
 +                       inline encryption hardware. The on-disk format is
 +                       unaffected. For more details, see
 +                       Documentation/block/inline-encryption.rst.
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  Debugfs Entries

--Sig_/nnST=6buV2SyRaUCBO_zXbf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FFaIACgkQAVBC80lX
0GzA3gf8DlwxgVDST8m0bnJ9BSqDQhOIOuhw3NtU/pPTd0FyYTSBykViaSQxnFWx
mVdkZbC3QZp7Irl8dwCPoaGRoewZllWCUltSxBvOviuVhkv9ULYX2B+sgoixYVg+
RA17rNRU5rJlrIblItIKKR/LGmNToPi4dryHYAwt73ybrkGB9Jq1krAUnBs+MJ88
Nh7n1BBlVOvlcdJt+vaVF9T/ZJkV4gmngS7YxemiBBpZfHASI9MUvNAkszhjLEDA
iWfonaiT8tIBOjtdToiayLJ9syv9n4y6RD1EwtWc6Y1lN7tvmTqjYFPGa/QstU4y
KPI7T+Mw3zbkViFXCwiMUIwMNDUkqg==
=tWTW
-----END PGP SIGNATURE-----

--Sig_/nnST=6buV2SyRaUCBO_zXbf--
