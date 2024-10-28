Return-Path: <linux-next+bounces-4461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE19B2180
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 01:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E22281395
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 00:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266621878;
	Mon, 28 Oct 2024 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ckJhEOpe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CB2161;
	Mon, 28 Oct 2024 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730074573; cv=none; b=HVo7b9hl5+YQhm9/xSG0SgkfMEau+2w9m+PE30bW1Xvlg7wqiB0g3K+WwXZs6FKV0RNyeVL0cc4LT4jeW3bZOYNE91khVT9ALKOt1vR2ypEWswfZAsHdxX5rUrN1cJq/6WA4MplWJcb9cYxZkzGWrASJypD3OVx/2rgUTTzUQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730074573; c=relaxed/simple;
	bh=XEsBUcvJvka3MO2zGEOEk6jCMdSUXWKqLvyxaafKqfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qdaX7Z/KD6aPbq24bH9B0v7TM68ruXrNVd8HdiJxfCddktJ2AmoKTqkD9bA4VJrn9NyxFMxw6DyuwZvndtTOLatPN76FFoCq3QO4OgfJxB1D1em5vLCJ15q2mzIl5UI04ZciG4V4jkv57A44QnohSu4Os3szMdMzvurQQGFopC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ckJhEOpe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730074565;
	bh=AM8Mh5IR3ec7B3Zvq0RNBEJpbmGSMSdmtjQG5R249FM=;
	h=Date:From:To:Cc:Subject:From;
	b=ckJhEOpepV10T4BtAmlE/XntI5qWLrXFOP9TJfC0LwEgumzmP2vhX34CmPjzHMSbJ
	 10s9Le+GSGUpaVccr67Ixf/bqlQzDxVNCUxDDv5sHKlD/e2h58JQdm5OgWK8vKB9yp
	 sOoARRNgT4SCFETMUAN/KjZXH/JbYtBy6vZrKbD85I2NgJ9FXinb/ycGxxdlLQ4ZNr
	 FnPBehcY2ct9DzZofxaNr5CRjdaoOSUzc52OarXfUAmGi96WTGCmSUn/888mh+yEhX
	 /1sy3V0cwZjO1YNyfy5mWbWIvxwhbCVraOkgNup1O640RPjiF59H+EycdC6374EPD1
	 tpeFluyZyGVYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcDSj5HBJz4x33;
	Mon, 28 Oct 2024 11:16:05 +1100 (AEDT)
Date: Mon, 28 Oct 2024 11:16:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>
Subject: linux-next: manual merge of the s390 tree with the mm tree
Message-ID: <20241028111606.5c009055@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EeaFZ4ZAjaYoMeN=VzknrMx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EeaFZ4ZAjaYoMeN=VzknrMx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got conflicts in:

  arch/s390/include/asm/set_memory.h
  arch/s390/mm/pageattr.c

between commit:

  4c5768ef0fd7 ("arch: introduce set_direct_map_valid_noflush()")

from the mm-unstable branch of the mm tree and commit:

  2835f8bf5530 ("s390/pageattr: Implement missing kernel_page_present()")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/set_memory.h
index 240bcfbdcdce,cb4cc0f59012..000000000000
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@@ -62,6 -62,6 +62,7 @@@ __SET_MEMORY_FUNC(set_memory_4k, SET_ME
 =20
  int set_direct_map_invalid_noflush(struct page *page);
  int set_direct_map_default_noflush(struct page *page);
 +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool val=
id);
+ bool kernel_page_present(struct page *page);
 =20
  #endif
diff --cc arch/s390/mm/pageattr.c
index 4c7ee74aa130,aec9eb16b6f7..000000000000
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@@ -406,17 -406,21 +406,33 @@@ int set_direct_map_default_noflush(stru
  	return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEMORY_DEF=
);
  }
 =20
 +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool val=
id)
 +{
 +	unsigned long flags;
 +
 +	if (valid)
 +		flags =3D SET_MEMORY_DEF;
 +	else
 +		flags =3D SET_MEMORY_INV;
 +
 +	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
 +}
++
+ bool kernel_page_present(struct page *page)
+ {
+ 	unsigned long addr;
+ 	unsigned int cc;
+=20
+ 	addr =3D (unsigned long)page_address(page);
+ 	asm volatile(
+ 		"	lra	%[addr],0(%[addr])\n"
+ 		"	ipm	%[cc]\n"
+ 		: [cc] "=3Dd" (cc), [addr] "+a" (addr)
+ 		:
+ 		: "cc");
+ 	return (cc >> 28) =3D=3D 0;
+ }
+=20
  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 =20
  static void ipte_range(pte_t *pte, unsigned long address, int nr)

--Sig_/EeaFZ4ZAjaYoMeN=VzknrMx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce18YACgkQAVBC80lX
0GwUvgf/bPi6r/B2cAREFSP/MfX12qMSSoIR9H5HQS5GMbGotWqbUeKntQPzW5IB
1tTDOaWWG15yRzPZ/19R0ZOFof5eXCw1cLFxwteFDeOKIk3s2v3fmaNvLtt7er2L
Us6Evp8qYi1zb9RHSD9uJhnEukkG8xvAcX70sljuZ/zukksrmJ7Y6wlJ36T5b3qt
Z+SjYbRNvfvdqtMrksA4Nuz+Oi5M2z4mD2elwVBVO3i9Xo7hSZyQetPPTEHbqbW7
8ePPHuGBnREhkjsRzI/vJyJML+WPh/l2Z4MZ/qzfZbDLtSM2itMaHK4EJL/VNtxr
XVAoAvC/531qFlSHXNuHt0OSmVCkNA==
=mD/2
-----END PGP SIGNATURE-----

--Sig_/EeaFZ4ZAjaYoMeN=VzknrMx--

