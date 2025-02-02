Return-Path: <linux-next+bounces-5355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C038EA250C6
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 00:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53C027A1AA6
	for <lists+linux-next@lfdr.de>; Sun,  2 Feb 2025 23:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B931DDC1B;
	Sun,  2 Feb 2025 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g1ZQCf/+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6E4A04;
	Sun,  2 Feb 2025 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738538212; cv=none; b=NCFlME3Hy1CxBxrRIJ/hlGB7K0wrcXb7P78wGAXiktBUZqfmMmnxBR1spsf7VN3IblNjONRFh1GASMitp3sofdL+AK/ELg6tAnGqYCcnhGtQQPy6o2Zs84GyteM9VWCUp04njmvNQyyTCplSH8I1cmW2ML8QSP+kqrnF+i/pM+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738538212; c=relaxed/simple;
	bh=PXKBxt11d0e0OpS/oJYiwKCQRPmWhBrktefRD944lKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IGLq9DBG41EFbUDCZJLgu5GJqFgrhJ8SeSa20cKTXgq/lGWCvKVADBoqvKsdGnYaOCuRsVDOm9D2j9VwZzvGMkmNFRf4RmMx72kMu+PwRkq3VTPb0WFyOYM+hMbbj0yZfikUAJM7Yw73cs6DZhvjB15PUIHBu/mFC6vdxsd00DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g1ZQCf/+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738538197;
	bh=+PKTUOKHTl1mPmuX8o8gGRxGihjPgEXOJK7byYPp1uw=;
	h=Date:From:To:Cc:Subject:From;
	b=g1ZQCf/+AnwJtqrsKClWqcdEWUQJLmM4GhAFpnDw/bMvHNbT5k9OpFnXoOEwGu12l
	 9TpmidzlQcvcj1kImSxXnntMCWs+8sm8uH4iwmaK+1HCTZEbP6ZrjNlrc0iPIuPB4U
	 wYh5NHeq1BWb/NkOvpiWbH1r98YjO5qpAteu34FZsLQAXrko18KNt36HetJNtbbiLy
	 TNYBanpaW4fXJScNwbiWQRUg9Cm/s3pkV8b8FpLOto8F5zkeC6+3/nQqYrxIvZHvsw
	 R0G+vQWYxfw+LXLvsxqzhWvRuXDfqZNauTSV6MofXM92giEtbN0iklYPfHDd7CokAx
	 VfbTZGVzkQnNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YmQVs1pHTz4w2J;
	Mon,  3 Feb 2025 10:16:37 +1100 (AEDT)
Date: Mon, 3 Feb 2025 10:16:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-hotfixes tree
Message-ID: <20250203101645.5af941e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vjfGjrJjqZS82YUIM5ZQObe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vjfGjrJjqZS82YUIM5ZQObe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0d1fdb1abcf4 ("mm: kmemleak: fix upper boundary check for physical addres=
s objects")
  13efc25a93c4 ("mm, swap: fix reclaim offset calculation error during allo=
cation")
  280237fa2b18 ("MAINTAINERS: include linux-mm for xarray maintenance")
  2dc3d63a8128 ("mm/zsmalloc: add __maybe_unused attribute for is_first_zpd=
esc()")
  483956dbf826 ("nilfs2: fix possible int overflows in nilfs_fiemap()")
  4b02919df8fc ("mailmap: add an entry for Hamza Mahfooz")
  4f132493c48f (".mailmap: update email address for Christopher Obbard")
  5e3b8c974521 ("mm/fake-numa: handle cases with no SRAT info")
  828c1ac1a256 ("scripts/gdb: fix aarch64 userspace detection in get_curren=
t_task")
  8b19277c1a37 ("revert "xarray: port tests to kunit"")
  a691d3521e67 ("ocfs2: fix incorrect CPU endianness conversion causing mou=
nt failure")
  a87ee033f9bb ("mm/hugetlb: fix hugepage allocation for interleaved memory=
 nodes")
  b8e6ed6f63be ("mm/vmscan: fix hard LOCKUP in function isolate_lru_folios")
  c874f6e4a5f9 ("MAINTAINERS: add lib/test_xarray.c")
  cfe2631fe1d6 ("kernel: be more careful about dup_mmap() failures and upro=
be registering")
  dc846d3998bc ("MAINTAINERS: mailmap: update Yosry Ahmed's email address")
  e5be1e9410fc ("kfence: skip __GFP_THISNODE allocations on NUMA systems")
  e8185a5242c1 ("mm: compaction: use the proper flag to determine watermark=
s")
  ee9192a230bb ("mailmap, MAINTAINERS, docs: update Carlos's email address")

--=20
Cheers,
Stephen Rothwell

--Sig_/vjfGjrJjqZS82YUIM5ZQObe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmef/N0ACgkQAVBC80lX
0Gx25wf9EEC4Rig63N0Av+PQL+n9fl2rkDr/TyAeujSuEBi8LK+icEevmaHwYtfm
v9CX5AACnt3qDW9djJHn+TyOUhjAHZGwuhL5XNrZ/pzKDSJz19qCHcIwxF7RPZmB
mApHa2osjj2bPa1hdtkqs+C7Ts5aEgSvaNXxf2N4DekECLqLg8PkQ5OmUaomYD9m
0B23wh8N8cFTb5PUm4mMAJYmk5DgCCZeoP0/7Jl0oSNs7pB5yRZ1S+WCEr9JO7nG
qbP4R2iUEmwMaPsX8L4Pf/uwd3VWHJg4b3pZF+fXLsJBdu2uV0HkVEYaazUbgMvC
YqxuMTyj5QzwIh7NtmnovABgNpRTTg==
=rzx6
-----END PGP SIGNATURE-----

--Sig_/vjfGjrJjqZS82YUIM5ZQObe--

