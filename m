Return-Path: <linux-next+bounces-5754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B781FA5D3C2
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 01:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B8517A9A6
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 00:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8784120B;
	Wed, 12 Mar 2025 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iQZwB9Tf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFD27462;
	Wed, 12 Mar 2025 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741739783; cv=none; b=E8Q1jA9Rewt+gLzpS/sZX5oCC/WG/OcW68kzvQN6KSRAVF1r7R82Ed/56FhfWG8ZkT5729UcExvSM3PWO328O58Jdtzav2ddM8T7QEp02mDbJbEMmNTkFtDtaFca6X0zQgW7eG4/ua6/eoWeoys1FW4rqJYvbOXIuc4MGNTihQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741739783; c=relaxed/simple;
	bh=YTpRSYyu3/G71uw8ZTSmHOweZfO0z5cHnkVfrsVkNOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iiQ/UV0sUlXOkwaSKLj1OjmDwdIEqnnPfuYNYz/PyMp0GMBBM3ypKCeEZiv81TqL/fCyQAyvl4PJiArjaXile681HO06RXTjZyIlm45bdTlEXJUwYsXOPyWiw0MhYTwKspXUL8K0vLONcHn4c9lj+p13/j8zRQR2ZsbrljaWW34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iQZwB9Tf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741739774;
	bh=0jTd1+OxIsJERdIjYoAGccT8wkD1YaK+VSK5U0tv070=;
	h=Date:From:To:Cc:Subject:From;
	b=iQZwB9Tf9iful0/5gW+x//mN46tS+yntCdtfFtUx1W5VhVwhHANFqoX95qObhD5qH
	 OQL72CQAqhOnICgJyAqnDFxGJQqbr8Ro9SehaUhuE7YA7kmb9zODu5ZTYQAzUYx8Bo
	 +eQMOhhoIquW5irRvzEJH0XtHcjBINxrg8TdF1rAyk/rgJrRlSoWhPcS2U2Ei1Swsi
	 NrciEZ+Nk63opsh6fTWQTIGgivNVrnh+yvvbd1ESX1nlbrV3aNdEG1aI1m7WTwImpI
	 2G6F4FchDOWmuBSoSI0gCSRUzVAzzOuUxH66IXclP2qT88DZu5p77noSnbnIK60oqU
	 jgwWSRW5ATLoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCBWf1rW3z4xCW;
	Wed, 12 Mar 2025 11:36:14 +1100 (AEDT)
Date: Wed, 12 Mar 2025 11:36:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250312113612.31ac808e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/edYQh=zp5YgPt9=BV=cLoM7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/edYQh=zp5YgPt9=BV=cLoM7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (native powerpc perf)
failed like this:

In file included from arch/powerpc/util/../../../util/pmu.h:5,
                 from arch/powerpc/util/pmu.c:5:
tools/include/linux/bitmap.h: In function 'bitmap_alloc':
tools/include/linux/bitmap.h:83:69: error: unused parameter 'flags' [-Werro=
r=3Dunused-parameter]
   83 | static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t=
 flags)
      |                                                               ~~~~~=
~^~~~~
cc1: all warnings being treated as errors

Caused by commit

  351b9e493b09 ("lib/interval_tree: add test case for interval_tree_iter_xx=
x() helpers")

I have applied the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Mar 2025 11:03:37 +1100
Subject: [PATCH] hack for "lib/interval_tree: add test case for
 interval_tree_iter_xxx() helpers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/include/linux/bitmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index 8166719178f7..d4d300040d01 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -80,7 +80,7 @@ static inline void bitmap_or(unsigned long *dst, const un=
signed long *src1,
 		__bitmap_or(dst, src1, src2, nbits);
 }
=20
-static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
+static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags =
__maybe_unused)
 {
 	return malloc(bitmap_size(nbits));
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/edYQh=zp5YgPt9=BV=cLoM7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQ1vwACgkQAVBC80lX
0GxYXAf9GD6QmwMoPJX/ChW48/RpLSlbx1FlL616Z5UHjouR9AMP1sBUC3pyufiK
o/AOK7U9i2ZBV5l6FJazTxw5wHOMF4ksVq88vNHsd8lEKRtQdzgoyfdSbR/e0RU+
KeTNtieX6vOHndXJ8kCRg+SKWvuTCkzi25PrhIdj/UEZSFAxTK1zgnGD9jEOt6Q3
s7iOiRWXOMRBub98LH0yXQjtq6G1eEpOuh0jp77vjspDtvq5xJiU4GJRCtgRkA6I
si6NqEIN4dBDgvpBW1B3sls8pO71s/6GuE1KK5xZvaJ/b607mg5jDYZdM9C/1qzA
3aZtZXe6cK/ZTc3AMT5JIyEbOCPXXw==
=EnfX
-----END PGP SIGNATURE-----

--Sig_/edYQh=zp5YgPt9=BV=cLoM7--

