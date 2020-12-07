Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DE52D0936
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 03:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgLGCpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 21:45:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgLGCpA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Dec 2020 21:45:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq71X0bp7z9sVn;
        Mon,  7 Dec 2020 13:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607309058;
        bh=QYMU9f/5ucXLmPvZ0OBO4kYJURzAAl3ykFJOon2aLso=;
        h=Date:From:To:Cc:Subject:From;
        b=T/ZQKmKalhBArHmm6xld550VpiJLQBtZNS+6GP7NtB9OLN+raCk4pksm6fw8vhDtl
         Rwg7RdL4ucxiYua9Vy4PYI05IB8acsczW2AC3NzJFXXIDOS3EBVougvlew4rHELm2a
         pr3P9TMzIFmvI4xpBTaGRgFX39EgmO/CNcT6yWaJnqqJVv2Uc6QQPJEiVP1mlYsq4e
         RAhpbGFckobVihUzKd52b51WYaFtgYH6z0ibc0tXwa5olOn2gR5sAoxBf35Dfkwtht
         E0m2JMVxkZ7pqJ3EBG/Z9DP4vt2EYjnFFOrHlFR3nYS0EbReph8PEdrkbmEgHE7E0c
         4GVaTRRAtEkSw==
Date:   Mon, 7 Dec 2020 13:44:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Message-ID: <20201207134413.37094de6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5yNNZRKdA7YErfo4BZaW60V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5yNNZRKdA7YErfo4BZaW60V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/check-integrity.c

between commit:

  068afafa2589 ("btrfs: drop casts of bio bi_sector")

from the btrfs tree and commit:

  051707baf43b ("block: store a block_device pointer in struct bio")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/check-integrity.c
index 6ff44e53814c,8791ad9b3ca5..000000000000
--- a/fs/btrfs/check-integrity.c
+++ b/fs/btrfs/check-integrity.c
@@@ -2690,9 -2693,10 +2690,9 @@@ static void __btrfsic_submit_bio(struc
  		bio_is_patched =3D 0;
  		if (dev_state->state->print_mask &
  		    BTRFSIC_PRINT_MASK_SUBMIT_BIO_BH)
- 			pr_info("submit_bio(rw=3D%d,0x%x, bi_vcnt=3D%u, bi_sector=3D%llu (byte=
nr %llu), bi_disk=3D%p)\n",
+ 			pr_info("submit_bio(rw=3D%d,0x%x, bi_vcnt=3D%u, bi_sector=3D%llu (byte=
nr %llu), bi_bdev=3D%p)\n",
  			       bio_op(bio), bio->bi_opf, segs,
- 			       bio->bi_iter.bi_sector, dev_bytenr, bio->bi_disk);
 -			       (unsigned long long)bio->bi_iter.bi_sector,
 -			       dev_bytenr, bio->bi_bdev);
++			       bio->bi_iter.bi_sector, dev_bytenr, bio->bi_bdev);
 =20
  		mapped_datav =3D kmalloc_array(segs,
  					     sizeof(*mapped_datav), GFP_NOFS);

--Sig_/5yNNZRKdA7YErfo4BZaW60V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Nlv0ACgkQAVBC80lX
0Gyy6Qf/bDimpDLsISjg5euSTeL53GgTtMCNxCh2wqikJtTLnSnxhqJmcpTEChyL
0zo0hgxyLPUK8++yIOrODa02mv7IBWCsz+L/K64N3jo3uOMCWnEUpr/GJnziJ98N
OP7eJnx6FKi1AwS2eoZfiB4HLg1UCO1GU6axPyFCHg0zl9zrRw/jEq00bD6LxouQ
xmG06V8iiPUmAKVP7PH+pte4nTVsfxCG7Ukey9qVdmfl3gIlu6Fighwnf2OgVSe8
guy57sx5KA5A2uLYRsnGLaMq+5jc8JRNMcT8oBQ2gWkhRmOjKSOkJYdvSq5HMmHX
7OzBSzAnXkVncWO/H03QfBKD8E1DZg==
=n8bU
-----END PGP SIGNATURE-----

--Sig_/5yNNZRKdA7YErfo4BZaW60V--
