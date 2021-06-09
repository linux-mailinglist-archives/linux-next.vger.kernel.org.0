Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5BC3A0A79
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 05:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhFIDJu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 23:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbhFIDJu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 23:09:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A4DC061574;
        Tue,  8 Jun 2021 20:07:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0Bqr2S4Kz9sSs;
        Wed,  9 Jun 2021 13:07:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623208072;
        bh=rDPfLvJ4R1YVXedapW3kf6GxubS/Np0nhdGbBVkEUr4=;
        h=Date:From:To:Cc:Subject:From;
        b=D8fDoztj7T3s/UkT9OLjtojHyTWv41v/lWI4KVn9tWjuRBRHnJ3fAAo4dLWdFpskH
         xLnUeKTiaPylXl055riXFiML0WTn5Rp1dLN7IcyooYumXrJFUyx3Akd4LcFkr5bwz3
         M+h6rDzAyOLS0e6Ef68Y1YLXzPSOnllbc8xSo48KaFnRrh0ntfav/QLubheJG7GGrP
         BaOyEJVNeWA5pO4sM4zL2JhvJLM9PYZWyGcp8OxINwWDivo+Jll1TxkEafAM+l6Hs8
         tnqT6UgmR1MTC/v9MuDG18Sd8o796+DdVjaBHaUbJkfOHsOEtloUmknmUACtUyXwGi
         7D2RGXdW2LSRQ==
Date:   Wed, 9 Jun 2021 13:07:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gfs2 tree
Message-ID: <20210609130751.38a409a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cDHm5v74s03vwThKptICCAa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cDHm5v74s03vwThKptICCAa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gfs2 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


Caused by commit

  f8524fce6a88 ("iov_iter: Add iov_iter_fault_in_writeable()")

interacting with commits

  e59c7577f5d6 ("iov_iter: separate direction from flavour")
  30da2b24a3ed ("iov_iter: make the amount already copied available to iter=
ator callbacks")

from the vfs tree.

I have applied the following fix up patch (I think it is mostly right?)

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Jun 2021 12:51:59 +1000
Subject: [PATCH] iov_iter: fix up for iov changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/iov_iter.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index d225e827b22a..b2d7289dc729 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -462,17 +462,23 @@ EXPORT_SYMBOL(iov_iter_fault_in_readable);
=20
 int iov_iter_fault_in_writeable(struct iov_iter *i, size_t bytes)
 {
-	size_t skip =3D i->iov_offset;
-	const struct iovec *iov;
-	int err;
-	struct iovec v;
+	if (iter_is_iovec(i)) {
+		const struct iovec *p;
+		size_t skip;
=20
-	if (!(i->type & (ITER_BVEC|ITER_KVEC))) {
-		iterate_iovec(i, bytes, v, iov, skip, ({
-			err =3D fault_in_pages_writeable(v.iov_base, v.iov_len);
+		if (bytes > i->count)
+			bytes =3D i->count;
+		for (p =3D i->iov, skip =3D i->iov_offset; bytes; p++, skip =3D 0) {
+			size_t len =3D min(bytes, p->iov_len - skip);
+			int err;
+
+			if (unlikely(!len))
+				continue;
+			err =3D fault_in_pages_writeable(p->iov_base + skip, len);
 			if (unlikely(err))
 				return err;
-		0;}))
+			bytes -=3D len;
+		}
 	}
 	return 0;
 }
--=20
2.30.2


--=20
Cheers,
Stephen Rothwell

--Sig_/cDHm5v74s03vwThKptICCAa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDAMIcACgkQAVBC80lX
0GxaQQgAnnJMvQZ4bBX8z+7BGaAqggoBg+Sy06NTvNb2YrgJbQupS/XzuIeu9ucV
YmgKAuDEi5odvWd+sL/L60caFjV8JL0pgBTIFnslA4PTAwEe3yytXwXbJm9hMzT8
Y90m7EWs7uc9tWOvkuAa0n0Iem+lkuTdHiDeux7AL+yWb0B7btoa6YvQ93dAG8bX
Lwx51V4ta7BUlkg9+kFixEoKTYloQjQ7hRBEm2Y3yOZi4DEFQVRVa66TAYUs+7If
Fy44I1Akyj3+9Pqn3eP9UFaZnG96t2LZGsrzh28owTbCrLh/Qisna40BnFU8jmJD
hYTbhIecr2kqV95WWddJQ2sz2EqWGg==
=q+7Y
-----END PGP SIGNATURE-----

--Sig_/cDHm5v74s03vwThKptICCAa--
