Return-Path: <linux-next+bounces-2866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AEA92B15E
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A62F282876
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E417B143C74;
	Tue,  9 Jul 2024 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ohzxsFGG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AC13BC30;
	Tue,  9 Jul 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510860; cv=none; b=X8g/jWq8SKAemRSljG2EGMhI87tgGoJp3KV+9cpkqK90FoVM2oDyAGqNoFxP9lAweWSNHqgWmKkasZK4zefeIO167bFuE9lzTBA+4xFefHgMOtcckmuhaTMUscYkdkpb3FzruK422cPC0d4Gnte89SWE1JmFmM3pNEYFsrsDcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510860; c=relaxed/simple;
	bh=mYo7BBhpvpBBP6FL1/v+q7xQ7NJIq+ysLMBI1P5ITMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YMFsH+wXjc1SgzMixiaf3tqbotWDSW2zjIaOFXClcpHWzbvjfbLhi51Sfk8v9RJprzgUSb82SQew5+VDeHZMDYh9ySgUY/yZZx/40nImGi18YLgFNkG4eEXijQR60hYeZt0Dmlw/uuBvnbY8oRKN3mOCB8hK8CXPa5erPnse3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ohzxsFGG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720510855;
	bh=OwVQjnWdc27b9qsSsgiOeJjlBd4pbZkQSedap0Ld7VQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ohzxsFGG8wwni+M09QuRQ3hBteffi336ndNeCuSnZK8Efyp+CfyQ73tpnzT99Voh/
	 r+146Vl0EdRwaXYDGGBtlVSJd+sA/jtACtQP43xc2x1yNxeYTk2LOuMuuW+U5SP8oh
	 rkTtWTXibjvTRZA4+0kIBEdN4ENpJyimugxdBF7IkPoEOZt4D9hskl5EyrRyfpfBQT
	 Za4doTFYFwDTgrVjh1RFVQQrNPyfS+joFzHEClI1cuRrg8YFxnkrRz5oBPIP/KuSjb
	 1yTARMy4ip7R3LQZ79nMpW7YHbVfWKOTYr1aTCxJd8ySyNe633p4eZknAX52dkFF/J
	 ZaEmwtfDiasHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJCbB4M48z4w2R;
	Tue,  9 Jul 2024 17:40:54 +1000 (AEST)
Date: Tue, 9 Jul 2024 17:40:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Barry Song <baohua@kernel.org>, Barry Song <v-songbaohua@oppo.com>,
 Lance Yang <ioworker0@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the random tree with the mm-stable tree
Message-ID: <20240709174053.051a46a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nss_ongiZk.IhXDCBHpNi9z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nss_ongiZk.IhXDCBHpNi9z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  mm/rmap.c

between commits:

  26d21b18d971 ("mm/rmap: remove duplicated exit code in pagewalk loop")
  15bde4abab73 ("mm: extend rmap flags arguments for folio_add_new_anon_rma=
p")

from the mm-stable tree and commit:

  94beef29e110 ("mm: add MAP_DROPPABLE for designating always lazily freeab=
le mappings")

from the random tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/rmap.c
index 8616308610b9,1f9b5a9cb121..000000000000
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@@ -1394,27 -1384,26 +1394,30 @@@ void folio_add_anon_rmap_pmd(struct fol
   *
   * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
   * This means the inc-and-test can be bypassed.
 - * The folio does not have to be locked.
 + * The folio doesn't necessarily need to be locked while it's exclusive
 + * unless two threads map it concurrently. However, the folio must be
 + * locked if it's shared.
   *
 - * If the folio is pmd-mappable, it is accounted as a THP.  As the folio
 - * is new, it's assumed to be mapped exclusively by a single process.
 + * If the folio is pmd-mappable, it is accounted as a THP.
   */
  void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *=
vma,
 -		unsigned long address)
 +		unsigned long address, rmap_t flags)
  {
 -	int nr =3D folio_nr_pages(folio);
 +	const int nr =3D folio_nr_pages(folio);
 +	const bool exclusive =3D flags & RMAP_EXCLUSIVE;
 +	int nr_pmdmapped =3D 0;
 =20
  	VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 +	VM_WARN_ON_FOLIO(!exclusive && !folio_test_locked(folio), folio);
  	VM_BUG_ON_VMA(address < vma->vm_start ||
  			address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
-=20
- 	if (!folio_test_swapbacked(folio))
+ 	/*
+ 	 * VM_DROPPABLE mappings don't swap; instead they're just dropped when
+ 	 * under memory pressure.
+ 	 */
 -	if (!(vma->vm_flags & VM_DROPPABLE))
++	if (!folio_test_swapbacked(folio) && !(vma->vm_flags & VM_DROPPABLE))
  		__folio_set_swapbacked(folio);
 -	__folio_set_anon(folio, vma, address, true);
 +	__folio_set_anon(folio, vma, address, exclusive);
 =20
  	if (likely(!folio_test_large(folio))) {
  		/* increment count (starts at -1) */
@@@ -1858,8 -1862,15 +1867,13 @@@ static bool try_to_unmap_one(struct fol
  				 * discarded. Remap the page to page table.
  				 */
  				set_pte_at(mm, address, pvmw.pte, pteval);
- 				folio_set_swapbacked(folio);
+ 				/*
+ 				 * Unlike MADV_FREE mappings, VM_DROPPABLE ones
+ 				 * never get swap backed on failure to drop.
+ 				 */
+ 				if (!(vma->vm_flags & VM_DROPPABLE))
+ 					folio_set_swapbacked(folio);
 -				ret =3D false;
 -				page_vma_mapped_walk_done(&pvmw);
 -				break;
 +				goto walk_abort;
  			}
 =20
  			if (swap_duplicate(entry) < 0) {

--Sig_/Nss_ongiZk.IhXDCBHpNi9z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM6YYACgkQAVBC80lX
0GybgAf9ECAKGIckkbB4BocYWJ2LMVtImP9MpX5fijc2X7IUsowkamBueLMpgVIa
o06Z6BEgfLrs5IDk/2KJLh2blwxaub/cQJbIylL4BiyGTKQM6+TwvuBDDbNESaQX
rH9C5CrGBjNDFCL+R0qOS0NyK98Q9gOLb7MpsdnI3KjKYPczM4TVwQgKcpn8UFBG
6szVfoxMtWWspV6rvMDRKCrqoKn8SFY+1n2yB0grzs9ZYnY4jooO49xqyiwbaqlh
xqN+gDGASx7jZ35vH5qFfMvHiUNZxr5fPKsR06nPHk7H4xpOtrAMIRvTAxH8/eIl
B+IPAD1AUGOo/PXILnAJDPjyZZ5igw==
=xolW
-----END PGP SIGNATURE-----

--Sig_/Nss_ongiZk.IhXDCBHpNi9z--

