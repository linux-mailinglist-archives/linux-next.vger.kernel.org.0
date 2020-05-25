Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E439F1E0C90
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 13:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390070AbgEYLLc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 07:11:32 -0400
Received: from ozlabs.org ([203.11.71.1]:59413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390058AbgEYLLb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 07:11:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49VvYF3g2qz9sSg;
        Mon, 25 May 2020 21:11:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590405089;
        bh=wvEWTF6elJP2cqo3dUF3BtVU8fc2TyVlOPYQCctcvhE=;
        h=Date:From:To:Cc:Subject:From;
        b=SZavkh96wNibefCD2pjdqWDJoJXGS442rSxprHiEC0UD7gJpEgqQ1LfXXa1earLIW
         pYWZaPt15BijdLonxHffW9xeaT5e00/t8UFm+KbAAAd7AW4cy83x469uI7YdmZE/cd
         Vs8rFFUPdCelVgheYAOi8EBAkn8hP8u+zv5YDjUBZt45dMam95pe/IeXgrSLiqZNUa
         hcZWFJs6lzEhpMMW7ozezUc3/coXOKwLy90VWicwZSPY8m3tU+rImh7mRaPrPxVmm8
         1hYrpHmSL38KAnvZyPTWNzfKfNwiv7kx44UN5AwXjRb/dT6Gqj31P6AYeAQwzDh0u0
         tReJnYNsZQHsQ==
Date:   Mon, 25 May 2020 21:11:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: linux-next: manual merge of the akpm-current tree with the btrfs
 tree
Message-ID: <20200525211128.1cc8c00d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Za/i_MQAl4YAVvL+=+0IdY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7Za/i_MQAl4YAVvL+=+0IdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  f31e5f70919f ("btrfs: switch to iomap_dio_rw() for dio")

from the btrfs tree and commit:

  2167c1133b8b ("btrfs: convert from readpages to readahead")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/inode.c
index fb95efeb63ed,8b3489f229c7..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -10075,8 -10538,8 +10060,8 @@@ static const struct address_space_opera
  	.readpage	=3D btrfs_readpage,
  	.writepage	=3D btrfs_writepage,
  	.writepages	=3D btrfs_writepages,
- 	.readpages	=3D btrfs_readpages,
+ 	.readahead	=3D btrfs_readahead,
 -	.direct_IO	=3D btrfs_direct_IO,
 +	.direct_IO	=3D noop_direct_IO,
  	.invalidatepage =3D btrfs_invalidatepage,
  	.releasepage	=3D btrfs_releasepage,
  #ifdef CONFIG_MIGRATION

--Sig_/7Za/i_MQAl4YAVvL+=+0IdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Lp+AACgkQAVBC80lX
0Gy4VggAoS6kyvXTGf1ijdfe7FIz4r0QHe0ib8ddY7OGdjH8w/lbRGfaPuJr/VoF
IeGgRTgR5ZSqEYQiqho8AAF53PNBMJqiQOKygWPoaMycIQGjMfukKNyk26kqZzqu
Yc146W3sdiimxpq4bTTR2974yLoNaIipHDcqPgofsuSINitl2uJ0NB0eluowVAQF
a0PY2XjoqWerMpOAAUubP9s8h+MEBQiVg3OLBlPSFsR5gKp71eqhqFcNmj66zcM7
dqXq0aAJZh39IaJZuENQn4r/yuSmT6KtC4GmCVvm5Ooe363OtJce1yOFMPuQaArg
mX0XfQr3t8iKyh3IsYapeWnVr+8+Rg==
=8yoH
-----END PGP SIGNATURE-----

--Sig_/7Za/i_MQAl4YAVvL+=+0IdY--
