Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC0E305A0C
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 12:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236857AbhA0LlE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 06:41:04 -0500
Received: from ozlabs.org ([203.11.71.1]:52263 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236938AbhA0LkL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 06:40:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQhTM2DMyz9sS8;
        Wed, 27 Jan 2021 22:39:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611747562;
        bh=hQ7Mrq9AxKBZWvNBKP/PYnXxj6VoO/Kf/wBYrz8n0ts=;
        h=Date:From:To:Cc:Subject:From;
        b=HJCqWfshHsBwsudWdwOOOM2570sZ707JhhRtwrpVuFe8FFBeC7mL94goCYDIyCSLy
         IGDaQL74aeFJ7SjTn7PHjQk5JMEHCGAhF5YlzzNYgZujolHoFRaQ6dIyhg/rUa2cVq
         fkLJO8IDgoIXKc1kARztcUhZAIKbLbcmSHGltFwfL7SCkX7x8N5e9uZAPD1Bv261pI
         sfOnJYiVJQFqXphHa1t1eAOQO7Mcq6yx0RokI4gEScWRwIWDlIu3ACDo/o5MiiB6tg
         NSbB+qfPX9C4mrmXVSz3y49DAU+t3OnKwtFfayYNIRQoNnAj3Chb+I+mPtq8Aub3Mr
         sx/psBrxB3Azg==
Date:   Wed, 27 Jan 2021 22:39:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the btrfs
 tree
Message-ID: <20210127223918.1b3e4b3f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l9gz.s2npSG+SyuDen2A6Rb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l9gz.s2npSG+SyuDen2A6Rb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/btrfs/file.c

between commit:

  0225a20db6d8 ("btrfs: Prevent nowait or async read from doing sync IO")

from the btrfs tree and commit:

  ddcd14c48a30 ("mm/filemap: rename generic_file_buffered_read to filemap_r=
ead")

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

diff --cc fs/btrfs/file.c
index 5282f456c99c,898ef7b792b7..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -3629,18 -3639,7 +3629,18 @@@ static ssize_t btrfs_file_read_iter(str
  			return ret;
  	}
 =20
 -	return filemap_read(iocb, to, ret);
 +	if (iocb->ki_flags & IOCB_NOWAIT)
 +		iocb->ki_flags |=3D IOCB_NOIO;
 +
- 	ret =3D generic_file_buffered_read(iocb, to, ret);
++	ret =3D filemap_read(iocb, to, ret);
 +
 +	if (iocb->ki_flags & IOCB_NOWAIT) {
 +		iocb->ki_flags &=3D ~IOCB_NOIO;
 +		if (ret =3D=3D 0)
 +			ret =3D -EAGAIN;
 +	}
 +
 +	return ret;
  }
 =20
  const struct file_operations btrfs_file_operations =3D {

--Sig_/l9gz.s2npSG+SyuDen2A6Rb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARUOYACgkQAVBC80lX
0GwUTAf+KYmKcJ8DMkClAUpERqkIEdEgysnQi1Yis3T5VgZiypDCG76zlUY68+qe
PVmIHO47y7KNTgbdkTxcGLYpaESVAA/IH9Chxj+ZugO12yYCoe6JwEel2cyVFhws
xvqsYiNeExbpsSt785JOyt/B2P+sv8JqY8Wy3HilRXrRsMD5D9dTeZS5duQm1Xkl
XQ8eONAAIKRRDbqENPI2qtpEwnknXk6YxU5d/gEecHdDPUUhxpduATeiK91ifjeF
QeG5xCwHxRQJ84yFUcDr5cu+ooZ+hxoALbEEhhYJFbThsDlIVTX7uphbFILkE3k+
V0pNaDGGdb139GZnoQ0OAUn9bRv3+A==
=MJE4
-----END PGP SIGNATURE-----

--Sig_/l9gz.s2npSG+SyuDen2A6Rb--
