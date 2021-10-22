Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A7D43737D
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 10:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbhJVIMf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 04:12:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38359 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhJVIMe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 04:12:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HbH8S3Tz3z4xbG;
        Fri, 22 Oct 2021 19:10:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634890216;
        bh=LduLXJJUY2F+lmefTOGXKAt04F7PeHi3Ck9Qz6Yaj2c=;
        h=Date:From:To:Cc:Subject:From;
        b=jeHzSk9u1tjFak3gZzHq03yST2t+A59g6SQouoms16E6DSNVEqCIjbXuTyeCtHSmu
         ey/xOiQKACGplCf9dN50XtrnlDTh117Gjxd0dxie3a3kRMrr7bUB0LSJxuXhIbbetJ
         whGvH4R9JL2TbHJBy4z9EiVIpawLuHQlKn64JWhygigHv9/6FzZRhDuFafOJXNKf9l
         slFtWz7d9KbdRTuQWlTLxbFu4cs7wT4I9JMXfe1DnhXyfolFp1C3u4/+dyxyYpKvsa
         pWCE4pO8KVOtUX19HourjJ/ahUgSs1FOZ6RfNvW9ke7uc2a8OM0GT1KHbf0pm2cvTl
         Krskpbrn8WGsQ==
Date:   Fri, 22 Oct 2021 19:10:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the
 memblock-fixes tree
Message-ID: <20211022191015.5d8abec8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bF3Ggy0RTEMvEx4WaU1o+l/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bF3Ggy0RTEMvEx4WaU1o+l/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/of/of_reserved_mem.c

between commit:

  420175a11288 ("memblock: exclude MEMBLOCK_NOMAP regions from kmemleak")

from the memblock-fixes tree and commit:

  543b0385de82 ("memblock: rename memblock_free to memblock_phys_free")

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

diff --cc drivers/of/of_reserved_mem.c
index 9da8835ba5a5,161c71e1e390..000000000000
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@@ -46,8 -45,7 +46,8 @@@ static int __init early_init_dt_alloc_r
  	if (nomap) {
  		err =3D memblock_mark_nomap(base, size);
  		if (err)
- 			memblock_free(base, size);
+ 			memblock_phys_free(base, size);
 +		kmemleak_ignore_phys(base);
  	}
 =20
  	return err;

--Sig_/bF3Ggy0RTEMvEx4WaU1o+l/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFycecACgkQAVBC80lX
0GwRwgf/bFnSCwDM8/bnUeo4JqVT7R4KBM1xWuU7veSog9oYYHGlqHg2W96DCCeE
4kotHxxY4CgJThSSJMXPqfKwhqL4gn0gUn8L3mdd/6p3Xj1OwUsO7BtqdCFMjYss
dz9ZZWT1OW65PAl5oCIsy3ITT2Jx+gox4XRC0CdNFzpc2vk9if7/bfQevfBpEEG9
iqv2e0QV7v0erHwEJ6YZX2ZDpPPqF1SQBnqAm77Kgr9b57asd/E4GcQl39HuEXER
SNiOT/gjov16ypMxfp4VeTiOWTELEN6L6bgqSAkzh4HVSQSqPPxsP2twTf3NiQgi
MwXdM98tDrrDm7VOqUYaVtDaEfdBHA==
=rHWW
-----END PGP SIGNATURE-----

--Sig_/bF3Ggy0RTEMvEx4WaU1o+l/--
