Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E03E21966F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 05:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgGIDC7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 23:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGIDC6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 23:02:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CC5C061A0B;
        Wed,  8 Jul 2020 20:02:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2LZl1vPCz9sRK;
        Thu,  9 Jul 2020 13:02:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594263775;
        bh=Q5DZ1T27iSX36XpPlgVCp+Lsh0qH8xbMtBnZLAqGjn8=;
        h=Date:From:To:Cc:Subject:From;
        b=rkrfMXXPNqMQoB3zc31IBoQ0Fb8uyjvfT2XDdTiEMzo+plTiXeytw73ZkPJyXHQ48
         kf4d1ieaovo5a/oLYRvZtrouCHILBOLqM5RdNRK3WQZVx1/msm/vbafutnRsQYHPsd
         KQxTIaQ0sMaC5m7uSZQHEcPmRbN2IxqJf2R7z9u/nM56y5nD91Lo4bA7BoFJJiQ3LV
         WD1qNe3YxREek7m+dyMryH6hWVfFGMtrdQdjMdExe6y/v9TPMcR57BT67aVqAmSlzF
         mCpp2VsqAfBjwQhFVBHk95ac0MiB+4HfRf03sm0+jXjcg7wH5Jp5qjbt7D/IUUovIU
         tmyf7oj83cMzg==
Date:   Thu, 9 Jul 2020 13:02:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the block tree with the fscrypt tree
Message-ID: <20200709130254.65d3f234@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vXiRgDJuUwT/+WnNmcmlHBd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vXiRgDJuUwT/+WnNmcmlHBd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/buffer.c

between commit:

  4f74d15fe408 ("ext4: add inline encryption support")

from the fscrypt tree and commit:

  ed9b3196d2b2 ("fs: remove a weird comment in submit_bh_wbc")

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

diff --cc fs/buffer.c
index dc5e05b47646,2725ebbcfdc2..000000000000
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@@ -3039,14 -3040,7 +3039,10 @@@ static int submit_bh_wbc(int op, int op
  	if (test_set_buffer_req(bh) && (op =3D=3D REQ_OP_WRITE))
  		clear_buffer_write_io_error(bh);
 =20
- 	/*
- 	 * from here on down, it's all bio -- do the initial mapping,
- 	 * submit_bio -> generic_make_request may further map this bio around
- 	 */
  	bio =3D bio_alloc(GFP_NOIO, 1);
 +
 +	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
 +
  	bio->bi_iter.bi_sector =3D bh->b_blocknr * (bh->b_size >> 9);
  	bio_set_dev(bio, bh->b_bdev);
  	bio->bi_write_hint =3D write_hint;

--Sig_/vXiRgDJuUwT/+WnNmcmlHBd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GiN4ACgkQAVBC80lX
0Gyopgf+IMkPFIsrZxKAlcv4gYfvJx5BaL7cN49ipah5p5IKCjbFaTVQk6GoGLvo
o2YyUiTkWz8YyaaGjfiN/PXr51f2N/4Ui+tevFWikNy1Tl1ySlN9ywjQY8oBiQwK
FNlPnQrXW0V7EVj9qzbzKdavBCOkIS8yYTyMz1BQCDEqPSJyGtx04Yq/5SnGXGh8
2A1JCZhqhskaFJWWj4cB8nc89oEuNqjv4SfhwTWWsbQsrEMU50ICOI4N9Vv6vqMA
o/wr4V+Aplb8EbHJDClh6stnqam4RPi4wbC+o8HfZH4Y5SsaSFHXmLNluSMr/wyI
pvFzP3EeulhT1Dw/t7Cg1Ao5qovyQA==
=FpsB
-----END PGP SIGNATURE-----

--Sig_/vXiRgDJuUwT/+WnNmcmlHBd--
