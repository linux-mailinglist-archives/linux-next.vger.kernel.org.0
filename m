Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978801DDC9D
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 03:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgEVB0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 21:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgEVB0m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 21:26:42 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45293C061A0E;
        Thu, 21 May 2020 18:26:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Spjq3Wgsz9sSW;
        Fri, 22 May 2020 11:26:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590110799;
        bh=YODjtNZ3rwmpRl6sJUoNkBjHr72zwfvG/cj7A1RWpJo=;
        h=Date:From:To:Cc:Subject:From;
        b=gz6gfc6MaJX0JcgtZnAwtge0yGju6zY+bdBkfEinyZHDLc/1j8qd7eXngSLsveVVY
         846ejSbBE+IQC5fUO3lWMeqYw7/oxVbhUDR3J6VPwXOgRV8AnGeSyT7BKsPg3N5G8Z
         CmXiSM7SDa3dhSHgX74ujMvrFJ7DbIJq2+qqS5oZvM9W4XvDe+UKIdTZJBFiHg0B1y
         zxfrBi3iBjCfTXk0A69/6/DZLIXdqgRtt9bRa2+UN6FFIjNLVFuj/VV0wHJVpcx5lo
         oRNC+dmrtlvliy9ihWNu9d1oR5Es0RRntmwGgSqyD3ceGR3FScYT40qLtADWkgMHLQ
         7z0UCvEzyp5CQ==
Date:   Fri, 22 May 2020 11:26:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with the fscrypt tree
Message-ID: <20200522112638.577ec8b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TsrLHyJYATXjLv3am2_WHJv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TsrLHyJYATXjLv3am2_WHJv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/super.c

between commit:

  ed318a6cc0b6 ("fscrypt: support test_dummy_encryption=3Dv2")

from the fscrypt tree and commit:

  e0198aff3ae3 ("ext4: reject mount options not supported when remounting i=
n handle_mount_opt()")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/super.c
index 4a3d21972011,62e6ebc0c0ae..000000000000
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@@ -1819,8 -1817,8 +1820,8 @@@ static const struct mount_opts=20
  	{Opt_jqfmt_vfsv0, QFMT_VFS_V0, MOPT_QFMT},
  	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
  	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
 -	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
 +	{Opt_test_dummy_encryption, 0, MOPT_STRING},
- 	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
+ 	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET | MOPT_NO_REMOUNT},
  	{Opt_err, 0, 0}
  };
 =20

--Sig_/TsrLHyJYATXjLv3am2_WHJv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HKk4ACgkQAVBC80lX
0GzDZQgAphOOzunXU+74dZOBQrG3J2PRBQbGMF3H1B37IEtT8NIR8onnAF2iRw6n
gdYPGQclYqc/7KC8U/l2glhfB/Rp7h8I0j5qLFKMEo4Pwl47HbjrCc07Kc5evIiz
l7WW9GZrM5RB4Fw0ovkN4dUECuEDgGy8VNiply8eFtNoEKAFdHNsnlnoxeI3xLUg
Bkyr6KtFKiUeJa/pX+JSzZCSC+OEo5gWBl7FXfapWvjuIxCygdhSRb0zAIoWou1l
jpRvzTnbh6yaIqpK9uwTsDxZ1gxggzM1d8wl8+udbfj4r3Lbp6/tKZlhJ72oD/65
PPzLdGErswGiffDlQARCJA2YG5bX/g==
=truN
-----END PGP SIGNATURE-----

--Sig_/TsrLHyJYATXjLv3am2_WHJv--
