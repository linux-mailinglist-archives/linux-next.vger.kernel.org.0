Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DDCC4618
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2019 05:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbfJBDSk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Oct 2019 23:18:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbfJBDSj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Oct 2019 23:18:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46jhDW3ywMz9sPL;
        Wed,  2 Oct 2019 13:18:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569986316;
        bh=zvB9p60r5fI7pASgcHD64s7yCiagKfqUJprubacaDT0=;
        h=Date:From:To:Cc:Subject:From;
        b=Hv1zUDAOcRVyKA8vOzX1JwINCwcZenYr/B7rblXs+pElLfPBABLGYArnDQesjyD9q
         8FXgpp6JZ8Y1VMdavUN6lpGBDKpzpyWTkGtTYgvB/Szacks4x5/1PV4bTp+FeInTXC
         LNkolabMPn6O+nGizW2YK868M+ESelBROvnOohXubG4cKH+19OzPjVJB+A/5/O4kg0
         GvdvyxPTxRTpm1THykHRePKcizifUx9qzZrrIUf/yKQJPf86LsJW2dOiAu0xhF/0Pv
         HWx0yDAcf8RKLuzm4iIx3BiHaqohsx55uXTkYW9SP24Rp94E4arJTbEcqfp9jVGIMC
         JFeL+VkReIwBQ==
Date:   Wed, 2 Oct 2019 13:18:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jon Haslam <jonhaslam@fb.com>,
        Chris Down <chris@chrisdown.name>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Message-ID: <20191002131835.51809ea9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AEBcqd=ktfOYS/rhz2q0Jp1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AEBcqd=ktfOYS/rhz2q0Jp1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Documentation/admin-guide/cgroup-v2.rst

between commit:

  6ee0fac199e1 ("docs: fix memory.low description in cgroup-v2.rst")

from the jc_docs tree and commit:

  3968bb6dec48 ("mm, memcg: proportional memory.{low,min} reclaim")

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

diff --cc Documentation/admin-guide/cgroup-v2.rst
index 26d1cde6b34a,5361ebec3361..000000000000
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@@ -1117,8 -1120,11 +1120,11 @@@ PAGE_SIZE multiple when read back
 =20
  	Best-effort memory protection.  If the memory usage of a
  	cgroup is within its effective low boundary, the cgroup's
 -	memory won't be reclaimed unless memory can be reclaimed
 -	from unprotected cgroups.  Above the effective low boundary (or
 -	effective min boundary if it is higher), pages are reclaimed
 -	proportionally to the overage, reducing reclaim pressure for
 -	smaller overages.
 +	memory won't be reclaimed unless there is no reclaimable
- 	memory available in unprotected cgroups.
++	memory available in unprotected cgroups.  Above the effective
++	low boundary (or effective min boundary if it is higher), pages
++	are reclaimed proportionally to the overage, reducing reclaim
++	pressure for smaller overages.
 =20
  	Effective low boundary is limited by memory.low values of
  	all ancestor cgroups. If there is memory.low overcommitment

--Sig_/AEBcqd=ktfOYS/rhz2q0Jp1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2UFwsACgkQAVBC80lX
0GySzwf+LDPf8FOoj4TokjVrD9vvrJ/F/DNgUwmrqmjPHSAkiXBV2xUflJFTW7nL
RI05gp5nkVMkhVW3okgyEwqKe9lMqVc6AnFxIDePGjRta8p2wTm/W3mRGqtwWIV5
GDgufsVVWpD6qwl/oR3ufb4bklSAzVpuiAjIDlVXNF3t5xZvGoRQjou63Yfp4oGF
OeSc9MzMwbdEHjiQ3IUgL4WnOkg5sko6xxIC2CFcKzJ3Uy6PR2gv1GAPwymQ+cnE
agQITjwCQBXbCqxoKW5acuF2RShj0xWkZfkyXk75HTS2vcVBldsgxrsFyTNsSrro
nuL0WNKddKTye3Iul1RUJXr44Q/ALA==
=QUPv
-----END PGP SIGNATURE-----

--Sig_/AEBcqd=ktfOYS/rhz2q0Jp1--
