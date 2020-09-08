Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB6626080C
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 03:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgIHB3q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 21:29:46 -0400
Received: from ozlabs.org ([203.11.71.1]:36475 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728088AbgIHB3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Sep 2020 21:29:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Blnd121LZz9sSP;
        Tue,  8 Sep 2020 11:29:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599528581;
        bh=KoPWn2j54CxH5/hsGP8oBbcq9orM2s0Jc9bUUxyFu5U=;
        h=Date:From:To:Cc:Subject:From;
        b=AxSRVSuOU4tFxcpXDiO7Lvu7retPHbADRf4SR3WKaHXBTalR7DvascRV3gE43042U
         N2HQzYIg7yCHe2HzSx42+QjFmukzZ1RZDzKFG1ncTZyKiJ955iXuQjirRifL+e9xWN
         XN0nKIgZuFAu+C3E1wGu/VYeOERwwxge6aS3tu9EY210yFpAFDDW7DE0CbBNITemVb
         oOmJb4FL3fv8lSPioymofSrHsPZykxJfhcqf2NtrZlZOoNgCRwMDmsZR/LGVPFZuKK
         u6+BI4xYQbDTATyVwXRdi/v0m+POLvTFwBliYU1tX+Yse3A2vuRLgMGCZ1WmQXW3Em
         pHYm+zMn+ZOrw==
Date:   Tue, 8 Sep 2020 11:29:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the s390 tree
Message-ID: <20200908112940.6d025af7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NTd4A7br10mBdN=kSLDdwGo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NTd4A7br10mBdN=kSLDdwGo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/s390/include/asm/checksum.h

between commit:

  98ad45fb58c1 ("s390/checksum: coding style changes")

from the s390 tree and commit:

  6e41c585e38f ("unify generic instances of csum_partial_copy_nocheck()")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/checksum.h
index c401a5fd3ad2,6813bfa1eeb7..000000000000
--- a/arch/s390/include/asm/checksum.h
+++ b/arch/s390/include/asm/checksum.h
@@@ -39,15 -39,8 +39,8 @@@ static inline __wsum csum_partial(cons
  	return sum;
  }
 =20
- static inline __wsum csum_partial_copy_nocheck(const void *src, void *dst,
- 					       int len, __wsum sum)
- {
- 	memcpy(dst, src, len);
- 	return csum_partial(dst, len, sum);
- }
-=20
  /*
 - *      Fold a partial checksum without adding pseudo headers
 + * Fold a partial checksum without adding pseudo headers.
   */
  static inline __sum16 csum_fold(__wsum sum)
  {

--Sig_/NTd4A7br10mBdN=kSLDdwGo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9W3oQACgkQAVBC80lX
0GxBcwf+Irr/yM58qKpLt9CPpGnNiSr2X7KWNwGWn+OIT970PoGHViPmHxZliZQ2
dBU0aBkAIEc4i0LBBchby3VIxxS09xnco0leT3pyoko/ypIYjKnglu0IXGdQYG49
Ck999XRJg6jZnO0T0+tkmJWS0VzwErr448nj/Z2lZSL3xQeYNZhTRq9CWDWNMzQ0
iQqVgguBrzNMg7EYdnTGHxGsVZ59kwdT9rGChlqeo6sIkIh/qWdV6JA4rYA4Ldc2
fHhBpIYmSd2eJenfHjzgVK5mFQcke4y8Rt0t2fA2cDr/Tcy+t1u7+uD/oFtlIrPv
ZrbPKKaCaAUNKLG8fRfYJfIzqbv71g==
=pUTx
-----END PGP SIGNATURE-----

--Sig_/NTd4A7br10mBdN=kSLDdwGo--
