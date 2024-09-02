Return-Path: <linux-next+bounces-3524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445D967D46
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 03:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65244B20EA4
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 01:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8A0A94A;
	Mon,  2 Sep 2024 01:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pYzkwZx0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D0179AA;
	Mon,  2 Sep 2024 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725240067; cv=none; b=gxwIvcS+s+wSoBJOzaLjbgD+1N5NXVWykg+Hwauib8eKvrLaHvXSU9uhmT6o0Uzd2kz31I5LwN8QVebzhznAqn/bDOFb38AUyqt67wAUTZXDfG30KDc3GFCS7xBzgg7gh+KLYwwalDESLvdM1VnU4jpR4OQlnQcCfmPJlMsrsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725240067; c=relaxed/simple;
	bh=veHDEAqZ7qx4m7FUaxOpeRM4Ko7hWkG+aledPNRz+x8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uLjsznO5Eyhk2c8DbwhYmqOT4Dq7kC07PeJWrZ2ivJVzDHltqAx51fOwd4yTzu5vlhbBdh/t6a3brUGR5J1EFCxzMC9sw7+FJfAtWjURNf5ruV26MVh3tKSuL0+jGOBwalFMJylhsgKnSJhNdK4mfSEVTUL8S4yZKnVM98ITU/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pYzkwZx0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725240062;
	bh=yCX3AG3F1YQmeNFRBTV/ZK2nZz1LuG4wF0BT5ltBvjw=;
	h=Date:From:To:Cc:Subject:From;
	b=pYzkwZx0qpu1lj3CUf0gyvRNfr3rVmsB9s0B4SbYNU8K2HF4uy9eQUwnuqH2bjlNs
	 xUGXc1rVO8SOjcYwm/ZGCJ1dZ9AgBeV89oHvKCnvISOyA9MFBhoKNlgASsK8e65tRs
	 KcNQqn5KEVWAt2FEldXOVR+NXpH4AiNzW9UPZbgN327EojUOn8nojAKQFFn4lClfa6
	 PAJ4r1SwXXpuYgacFyAQtQHb8Mxf9kTWy9+o6m0YNftUxyOOHKCS54OhGHir2rIfR0
	 3j33C/XInKR43PLWUs1TXaMyFQQlOYJCJVtp4hCl4yN5cHMnX3fOLpJrd/LxZe/RxK
	 4B052bWnfWiYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxrYT6jH4z4x87;
	Mon,  2 Sep 2024 11:21:01 +1000 (AEST)
Date: Mon, 2 Sep 2024 11:21:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Usama Arif
 <usamaarif642@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the mm tree
Message-ID: <20240902112101.2728f045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TN_5+TTIdtGKY._wb.+H6NN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TN_5+TTIdtGKY._wb.+H6NN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  include/linux/huge_mm.h

between commit:

  bc47772ebe8b ("mm: introduce a pageflag for partially mapped folios")

from the mm-unstable branch of the mm tree and commit:

  fd031210c9ce ("mm: split a folio in minimum folio order chunks")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/huge_mm.h
index 0b0539f4ee1a,7c50aeed0522..000000000000
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@@ -326,14 -316,15 +328,15 @@@ unsigned long thp_get_unmapped_area_vmf
  		unsigned long len, unsigned long pgoff, unsigned long flags,
  		vm_flags_t vm_flags);
 =20
 -bool can_split_folio(struct folio *folio, int *pextra_pins);
 +bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pi=
ns);
  int split_huge_page_to_list_to_order(struct page *page, struct list_head =
*list,
  		unsigned int new_order);
+ int split_folio_to_list(struct folio *folio, struct list_head *list);
  static inline int split_huge_page(struct page *page)
  {
- 	return split_huge_page_to_list_to_order(page, NULL, 0);
+ 	return split_folio(page_folio(page));
  }
 -void deferred_split_folio(struct folio *folio);
 +void deferred_split_folio(struct folio *folio, bool partially_mapped);
 =20
  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
  		unsigned long address, bool freeze, struct folio *folio);
@@@ -502,7 -487,13 +505,13 @@@ static inline int split_huge_page(struc
  {
  	return 0;
  }
+=20
+ static inline int split_folio_to_list(struct folio *folio, struct list_he=
ad *list)
+ {
+ 	return 0;
+ }
+=20
 -static inline void deferred_split_folio(struct folio *folio) {}
 +static inline void deferred_split_folio(struct folio *folio, bool partial=
ly_mapped) {}
  #define split_huge_pmd(__vma, __pmd, __address)	\
  	do { } while (0)
 =20

--Sig_/TN_5+TTIdtGKY._wb.+H6NN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVEv0ACgkQAVBC80lX
0Gw5EAf9GbI00hwZb2BMskaU6qsiXG12/m8h0QtGyRScACqtI6hdrTUwnQaL4lpx
OZ4m+u4Mbj1chqQ6+xSHL7iQPZ9iZaxn4tsDADutljQFEY4Jx5HnPR7f8DYEkWof
MUo9Ur8Qo/neJQueptTbEkneIPdOthUReYl/7mxoTOnzAUCht7jVMGnTTTV7stv8
3xbPhUHDCkXkXDSsHOI2IH0goVDXnvUKp7mt7ImEJONQXHExxSmJL38m0AadFYn9
rNJ4VfQYjUmS7vQywcT4OVVb2m5VCIRh09YSgSZFrNpH0cfHZyKsn8jWkI14Qn/e
7f2Tdy3rWD9tOhbfMQ+dj14CPoVexQ==
=nrbf
-----END PGP SIGNATURE-----

--Sig_/TN_5+TTIdtGKY._wb.+H6NN--

