Return-Path: <linux-next+bounces-8636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D3BEEEA7
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 01:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E53E3BAA3E
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 23:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED74C235045;
	Sun, 19 Oct 2025 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XRaQvImD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2CC2EA;
	Sun, 19 Oct 2025 23:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760917161; cv=none; b=u4MEeFzNX5hUYSR9bv/TMLKhq+7OQvhCs1qz/sqCTGzwQ8XlcrlENb5DdPQKyw8xpJoua6hyItXm5seZh0vhvYVWzpYSczy3UvYFLd3yQTo3/vF0ZYYCUZ+onWo2RQgZvPo84GAb2to2GEjyZUTYDCcMGOvO9KEdYDI3f2rhv9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760917161; c=relaxed/simple;
	bh=rdmLtdI2R2sV+7kXC5wpbSF0v6DnJD2dS7chPG05W4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mUJNT5v/KgGvERhXIHka1kGIdUva9JazxsH5CxcMMf27HFyK0pVNxfUqwRHZvYtbAP3hEJELcW7nKTE9FYhrYd75Q+Ml6oOcztDhpgXd+3Ox+HwjEnJVmNyrrzBsoT5jFIUqRy/GzYe0pmYp1azwvhpaAjAhq2krFAnTpkzfiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XRaQvImD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760917156;
	bh=vysPfp5uTRWW7DlQl3QvCUX04RLQin8Yxs2x3IdxWZI=;
	h=Date:From:To:Cc:Subject:From;
	b=XRaQvImDwWCwwIsKTSB6qlVtp3OxLMZQguRNmvu0/sA+ehI9f8OIleIwPFpvYrYGd
	 oUQpfF+IvSfVF5nv/X5DwlywYZkAoL3Kr5f5oOGuQK45BXKiAMEA/F3wkTrSLGI+cC
	 4/xe5jq/vmUmYN9l7D8m8Hg+vzVvOVK81IkT866xhtB4Of02F9GAnWmZR02x0uuN+4
	 xfeS2EF4gBfsfsq1syCF/A4rgnBstD1p/8GXLmE16YPcBNmYSpl0BIVAPQA1yHDah4
	 ymZwf3dnpuHlqTld/8+QhciI7CUYohGSfm/zgzKgHEdshnZ78AtiCagCmkIjyrOd+v
	 dTVb5Lamc4RaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqZlS01dTz4w2J;
	Mon, 20 Oct 2025 10:39:15 +1100 (AEDT)
Date: Mon, 20 Oct 2025 10:39:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the libcrypto tree
Message-ID: <20251020103915.6f203f67@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KLCI9CtiV2Kl_W=sqtwTEQP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KLCI9CtiV2Kl_W=sqtwTEQP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the crypto tree as different commits
(but the same patches):

  3bb8775a518f ("crypto: x86/aes-gcm - optimize long AAD processing with AV=
X512")
  5a530ed1e321 ("crypto: x86/aes-gcm - optimize AVX512 precomputation of H^=
2 from H^1")
  e274d2ebb428 ("crypto: x86/aes-gcm - revise some comments in AVX512 code")
  08080b1ea549 ("crypto: x86/aes-gcm - reorder AVX512 precompute and aad_up=
date functions")
  42d929de14fb ("crypto: x86/aes-gcm - clean up AVX512 code to assume 512-b=
it vectors")
  9bc4bcca89e4 ("crypto: x86/aes-gcm - rename avx10 and avx10_512 to avx512=
")
  d03a8a0dc347 ("crypto: x86/aes-gcm - remove VAES+AVX10/256 optimized code=
")

These are commits

  a7098b73a98c ("crypto: x86/aes-gcm - optimize long AAD processing with AV=
X512")
  decb160d8a39 ("crypto: x86/aes-gcm - optimize AVX512 precomputation of H^=
2 from H^1")
  4d1fe69597a6 ("crypto: x86/aes-gcm - revise some comments in AVX512 code")
  12249403d1ef ("crypto: x86/aes-gcm - reorder AVX512 precompute and aad_up=
date functions")
  99713223854d ("crypto: x86/aes-gcm - clean up AVX512 code to assume 512-b=
it vectors")
  d4acd8519d2a ("crypto: x86/aes-gcm - rename avx10 and avx10_512 to avx512=
")
  bbe0e2274a45 ("crypto: x86/aes-gcm - remove VAES+AVX10/256 optimized code=
")

in the crypto tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KLCI9CtiV2Kl_W=sqtwTEQP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1dqMACgkQAVBC80lX
0GxrYAf/RPO1xwe1OrDcDydkXgCztP7xyDwUMGMai7bkcp1/dY6hnJy7/uFnSa5D
IS1ia8Zis4HlTy9VFi4K2RtDOsUNxgwC71Chl66ZzVHjO2zrwgtzv5VxVvPvg0SX
NRjMWT3VOPFK8MYmeIA/acoGJa+ymuESmAO1BCRvhQeh8J7ysCif/UtMydcyFYB7
CbLgIKLbjnYw/b9lfz7FvN6pyywcY/bp1NO3JeLtFoZoHmXrS7zTOSkd98/M9k7D
bGoXNWmL3VsfcgvOjX8pxIIt4/oLLEMTqSbOo8bBHTA9EuyLnSAz7tWpE7sCGyWL
sSjAVCNqzVPUiNwifYCJUNh5cwxmNw==
=uW5r
-----END PGP SIGNATURE-----

--Sig_/KLCI9CtiV2Kl_W=sqtwTEQP--

