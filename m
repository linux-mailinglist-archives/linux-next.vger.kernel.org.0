Return-Path: <linux-next+bounces-2792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B0F91EF3F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 08:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55364B2418F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59064537E7;
	Tue,  2 Jul 2024 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A7/aeanC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D61509A4;
	Tue,  2 Jul 2024 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902449; cv=none; b=khSORjJZsYnvPxXFZ4O6F6tw6MHSQNFu/i3CUZQtiGhdQTXtyoZ5X6L0i8I/eQgk/JB0S63k8HvUytrOKMrT+Kd8uYOezKcy/JxTXwPn2lgdabi7Ke3S3GYjlXcOqYjlShcJlRNCz+9ty2fYV+yeLK8Zd4ftKij7E+ibLi5BtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902449; c=relaxed/simple;
	bh=LN2KgqiHlqZx6N0bTSS2VDLHc455tKIIOJgsiRBOI0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=umMAvv7KHb4+rbVWosLsE6q+0a3koH90+3RSsT7gJaE4XaxQi7V40CfmKDPF1qsMXcAO9EaQALyr9QEQIBYq55EgjgNIZTsSdMDXCRyKREDpDXf6RKkspPrbznzmREJZhR378d0kXfi2NJv6InzAfv4x1T7DB4mNdKStr0V31GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A7/aeanC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719902443;
	bh=zh08yAnoonUi+gVwhMjKtfSwTB49+7cBlmmqEghzU98=;
	h=Date:From:To:Cc:Subject:From;
	b=A7/aeanCtYrMxp4a65tqvOkFVF6UesfwZUlW1kA443Un+XdmzQEY6y/enk+9EY/8y
	 ZYj9bT6LiNV+hnb9WvvJA6dk8NGqy+L7lLLUTXwmhQf6fUJE5GQdiv3Rzes6P7URzq
	 hbGAECHLkEl73pa+SAvGXzPwhHpFM+g9ZY1rCmGH8lBSfTCsnNZimcAN+zochUx2FE
	 fa6+E+G74ppd1cyQIcc0H4dvs/3OEuZ64wnfk38lZ1ac6PjRqSs/G22QOxWMutWIbI
	 ne5rH0VKgGT4hS3pBg64kNcxtLwpiSIwmxrS6bq7AASU++4RPgyx7Wghgcdp0QtU4W
	 LARYzlVyK7Z+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCtZx6y34z4w2K;
	Tue,  2 Jul 2024 16:40:41 +1000 (AEST)
Date: Tue, 2 Jul 2024 16:40:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Barry Song <baohua@kernel.org>, Barry Song <v-songbaohua@oppo.com>, Hugh
 Dickins <hughd@google.com>, Lance Yang <ioworker0@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the random tree with the mm-stable tree
Message-ID: <20240702164041.60a19dfb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//UoFVVvrpE_FsoEM7YRuMGE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//UoFVVvrpE_FsoEM7YRuMGE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  mm/rmap.c

between commits:

  a2a1b9f670f3 ("mm/rmap: remove duplicated exit code in pagewalk loop")
  92493c3b92b1 ("mm: extend rmap flags arguments for folio_add_new_anon_rma=
p")
  db4fb1039a19 ("mm: use folio_add_new_anon_rmap() if folio_test_anon(folio=
)=3D=3Dfalse")

from the mm-stable tree and commit:

  e788371a45ac ("mm: add VM_DROPPABLE for designating always lazily freeabl=
e mappings")

from the random tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/rmap.c
index 8616308610b9,d873a3f06506..000000000000
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@@ -1394,27 -1384,22 +1394,27 @@@ void folio_add_anon_rmap_pmd(struct fol
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
 -	if (!(vma->vm_flags & VM_DROPPABLE))
 +
- 	if (!folio_test_swapbacked(folio))
++	if (!folio_test_swapbacked(folio) && !(vma->vm_flags & VM_DROPPABLE))
  		__folio_set_swapbacked(folio);
 -	__folio_set_anon(folio, vma, address, true);
 +	__folio_set_anon(folio, vma, address, exclusive);
 =20
  	if (likely(!folio_test_large(folio))) {
  		/* increment count (starts at -1) */
@@@ -1858,8 -1852,11 +1858,9 @@@ static bool try_to_unmap_one(struct fol
  				 * discarded. Remap the page to page table.
  				 */
  				set_pte_at(mm, address, pvmw.pte, pteval);
- 				folio_set_swapbacked(folio);
+ 				if (!(vma->vm_flags & VM_DROPPABLE))
+ 					folio_set_swapbacked(folio);
 -				ret =3D false;
 -				page_vma_mapped_walk_done(&pvmw);
 -				break;
 +				goto walk_abort;
  			}
 =20
  			if (swap_duplicate(entry) < 0) {

--Sig_//UoFVVvrpE_FsoEM7YRuMGE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDoOkACgkQAVBC80lX
0GzqeQf/fQAJLD8KQCy6uHlD5DlDCvt/BypC3dJWnm1+Q4mCEBjJKuJb7D379ZQf
fq5OmRzUyCVAER9XGNJ91WOKVNceiTuhA3ia5mRkCPXbqtgAUaRHi+zHqfJPQjU2
R/3SghgGvSKzNSJOkNrpZmQZ3l6ETjfoHIbdwdyryfuEmkgKa19nZ0TyMmIDD8Pb
+vWZrPB8YOhfvdzzhR7ReVxZV+g8JlUlot+m/zdD6Uxa/wQKIn5byZ75GRN7ZcPT
hDjAUAcrE59qmDyyOf4xgCOWdI2+LvMmwU3NOS4XRc8S81L3ARQvneqkFUO5vBhB
36mJfB+cPcelKfnxJn9x0ToKt8SWpQ==
=gOkZ
-----END PGP SIGNATURE-----

--Sig_//UoFVVvrpE_FsoEM7YRuMGE--

