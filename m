Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1153445E37A
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 00:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350380AbhKYXoN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 18:44:13 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58361 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351629AbhKYXmM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 18:42:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Z8L5nYqz4xcb;
        Fri, 26 Nov 2021 10:38:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637883539;
        bh=MKfbgbcVcn3gQUZApNA95JIPa0dkTXjyz94Q0AneKGc=;
        h=Date:From:To:Cc:Subject:From;
        b=MyGNkeQdEQUlGkm+M25O6hI0pgRKWjoUnaMepgYt1USm02Isql5WrRTirf+qphDAV
         rcV0Bvm8W6VnsNJk7nTFBkpXDPoKAykdVVi2a4Hojs+38hBkqd3X7y7ama6O/lHfNJ
         o2wtLxBO89/tAeSsg+MSvfFJEB/UWIy9DtPcJSB4+QiqX1tBmV8SOdwYAUNqyVoGdu
         Wxb0nMfviThIdyCAa8aI+U9XXC6c0NfR4o9Yd3kuSUPAgpd41PDA2BwwBAai/ltI8S
         A1KQbUACroP31P98mXcsd5QWyhE8rQLCbaBTa/QM6EYoJtWEq/nG6c/zRBSRrllSwM
         QcuuxEqeO4p1Q==
Date:   Fri, 26 Nov 2021 10:38:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ming Lei <ming.lei@redhat.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20211126103857.50628410@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/anadDgOt88u9.Fa8TAFyYOe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/anadDgOt88u9.Fa8TAFyYOe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/bdev.c

between commit:

  efcf5932230b ("block: avoid to touch unloaded module instance when openin=
g bdev")

from Linus' tree and commit:

  a1525fbf1d76 ("block: remove the GENHD_FL_HIDDEN check in blkdev_get_no_o=
pen")

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

diff --cc block/bdev.c
index b1d087e5e205,ae063041f291..000000000000
--- a/block/bdev.c
+++ b/block/bdev.c
@@@ -753,10 -753,10 +753,6 @@@ struct block_device *blkdev_get_no_open
 =20
  	if (!bdev)
  		return NULL;
- 	if ((bdev->bd_disk->flags & GENHD_FL_HIDDEN)) {
 -	if (!try_module_get(bdev->bd_disk->fops->owner)) {
--		put_device(&bdev->bd_device);
--		return NULL;
--	}
 =20
  	return bdev;
  }

--Sig_/anadDgOt88u9.Fa8TAFyYOe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGgHpEACgkQAVBC80lX
0Gxj2gf+I0DkkNU/1ooEf8qak87XghJYOTyJjLzY4Tp8zVWrAkowBbqIXziBl+Xo
C9KEfecKCwEZKVqdGovLVRrMgcFAn2gG/RyhQwijXtAw9OWv6lCWiS989NRRYB8K
og6v9iHZVvTmPO6xBG50c4dqXb6WmJpnxrPQnRHPcRaZD0bnqtT1B+kw7ww/4xd6
kJRT1poIFBtoZMRJxcBQIir2I0L+PX+Br3Ibg+tMSYOu7wJcrH2zZEu3a/ALJcwn
5pHIdEEf13eO/Z3FwS62RPyntRHOsKCaGXcGmhvZ7PW2peD4pW7Ea5LGq2teEv1q
yYCOwamuAwIhzd7bic5lC1L7wToi3g==
=5K/m
-----END PGP SIGNATURE-----

--Sig_/anadDgOt88u9.Fa8TAFyYOe--
