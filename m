Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE72E3EE63C
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 07:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhHQF0Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 01:26:24 -0400
Received: from ozlabs.org ([203.11.71.1]:56437 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233923AbhHQF0X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 01:26:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gpfd930KTz9sPf;
        Tue, 17 Aug 2021 15:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629177949;
        bh=KjHGthe09XkYP9vnNd1d2PrOKK5iZajleMPuoFkbYCU=;
        h=Date:From:To:Cc:Subject:From;
        b=XWbmyztuybOFupCNrJeYNyRrD92azZc6q+9TSBmnK2cB7MOsh0aXPbzjETO+9AyRM
         8Efp8669RmtgD1Z1fq4byQW88hws1ONE2qLGF7OcjciSAZLafcovTK9/9h34O31HRi
         gLIhYaJ2qkbbWdhi37gtt7C2KmRTXGa1X7KiFEeqTJmnw//mBmOBn+8DZYFC4g3hVo
         XDP9AC5zzVKOXdMvtZMJ3eUvSy1nlrpPAtfcDAvUcn5uOl9MmeqilKB/5aIbZ8/I8C
         cGbYYwP+JM1oz+nkxcPtFpSI/iafGk6Re1DFX2sft8XDdW1b25ljS2gvVTi/PpJofT
         F6GQlw73f3FIg==
Date:   Tue, 17 Aug 2021 15:25:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20210817152547.70af4cfe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XZXNoh8qkr//X056SMijrd+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XZXNoh8qkr//X056SMijrd+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/mq-deadline-cgroup.c

between commit:

  0f7839955114 ("Revert "block/mq-deadline: Add cgroup support"")

from Linus' tree and commit:

  252c651a4c85 ("blk-cgroup: stop using seq_get_buf")

from the block tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XZXNoh8qkr//X056SMijrd+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbSFsACgkQAVBC80lX
0Gw96gf/R461GOfnQaGbRPXxLsoGxjgnS4NP+Ua95Z9T4pK54sUCHuobw0IsK8xb
xwUOTIEUs3HdIvPy27+oZJQRzhD/dmgyAAlvGwpGTy3TEKWbO/nebG+dCm4F8zzQ
bwH4CkblYOJ/jxIoYReJx/8jKm0m7eqJrRwrGAsTXmH8kd3nAbInduOLRRIDS2ia
lfamVHy03WYpTEhlryd11wg3uhwJv75oCmVCAfUojtsWP236pJjaDdkE5urZFLld
SjYTtXzddqdZlnDXroYjoUWPRZmUwi9eMCmRrdVuGtW1gZnCxSIwNmdbPEH01j72
1k5glyiCJpNRyMuNZ4CyKakbtP9uEg==
=rAh1
-----END PGP SIGNATURE-----

--Sig_/XZXNoh8qkr//X056SMijrd+--
