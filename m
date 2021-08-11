Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CF63E8BD8
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhHKIdz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 04:33:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236128AbhHKIdv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 04:33:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gl34L5KS8z9sWd;
        Wed, 11 Aug 2021 18:33:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628670803;
        bh=mrKO/1AwpBhJiLPvAZUci8dz5jM4rVv/jBQT2WKc7XU=;
        h=Date:From:To:Cc:Subject:From;
        b=jQdK6Aa1KsXyyluSJupheIvHH/pnsZn68Hpd5ha5PE2JIh45UkOn2nFBpjA5JybxI
         DxErgP6+TEjREhrn+RigaA/OpSthP0zA/q5Jhq+43/l5FFPgt3EkGuTzACb4r44LQz
         lhqXeP0RGI+3GvNFIfXK+wfE2K0HLQjtC0zZNRAhI44kfotRe2gmjMCsQymWUaITdj
         iFmGZjw1ooeI4calZI+i4ESUKkS5bPX4SXnQrCsV9yQ2aEe5soFd5sq89ACxWVLwzA
         rBb4aAV/C//7HAif8OPX7ayVZmcQtoFZ1+EzrxIptFLc5tXetqnlJdcmaO/2ajjd3C
         QU77qAp51Q1uw==
Date:   Wed, 11 Aug 2021 18:33:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Dave Chinner <dchinner@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the xfs tree
Message-ID: <20210811183320.59fa209e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/te1RZ5aq8=qc.f3Z5FUQzYU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/te1RZ5aq8=qc.f3Z5FUQzYU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/mm.h

between commit:

  de2860f46362 ("mm: Add kvrealloc()")

from the xfs tree and commit:

  dcda39e2fd16 ("mm: move kvmalloc-related functions to slab.h")

from the akpm-current tree.

I fixed it up (I moved it to slab.h like the latter did with the other
functions - see below) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Aug 2021 18:30:48 +1000
Subject: [PATCH] move kvrealloc to slab.h as well

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/slab.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 2c0d80cca6b8..05b8a316dc33 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -761,6 +761,8 @@ static inline void *kvcalloc(size_t n, size_t size, gfp=
_t flags)
 	return kvmalloc_array(n, size, flags | __GFP_ZERO);
 }
=20
+void *kvrealloc(const void *p, size_t oldsize, size_t newsize,
+		gfp_t flags);
 void kvfree(const void *addr);
 void kvfree_sensitive(const void *addr, size_t len);
=20
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/te1RZ5aq8=qc.f3Z5FUQzYU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmETi1AACgkQAVBC80lX
0GzwZwf+Ot7mHWOSQdMQBdGBAEu4d9LhTyQbF+spLvH50eG9m6WHU9d9/J/8VOVY
C5J9SVekKEk6LZ1c6jQJZHrCBKHD1sTo9n4YHTum7oH4A8nEvzi8u8SJh1dBORE/
8SbMWT0YLmB80BCckbpCrwhSM10jpVsWo3qDiAYXXdVW9UBTKfSw/bB2Pt+vxGlW
9ifj6cTm2Kx8cHkHp9uSndBuNrSyZy9qa0YhgFQMgYu/4pWaZxBj/z5KcEGKKm0B
CfS3AelJhl8hE1zzxKYHo9ke9aDO7aHBw2lU0eaN6xT1SuNaLcWFw2yNsQ8sVtBb
L7aYjKsqdr8qa8qALRs11njgTvBrrg==
=39Cs
-----END PGP SIGNATURE-----

--Sig_/te1RZ5aq8=qc.f3Z5FUQzYU--
