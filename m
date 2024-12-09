Return-Path: <linux-next+bounces-4903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC29E889B
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 01:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3752163DE5
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 00:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75C7C8DF;
	Mon,  9 Dec 2024 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D1dQJqu0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF43B658;
	Mon,  9 Dec 2024 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733702512; cv=none; b=DXA3TNNdklfJegIOBBEVpuaraZGwf8+6Lh0qqbDDUIP/lvrtlIh47UhiQwFTEIUaAnF23oOfrWYfBF4uhj4cw7Kdfe7WoJfmFV/JM/V4ielluRlCRjlyfSSb12mjttTXSSbWr+7DwzAapaI8pos1dX6J9V99K432LOBO2eRomMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733702512; c=relaxed/simple;
	bh=3M8m0mkqlobCNWP582JbuQQ8ioh1zuogiUJyzan1gWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dXQU5kw1RmwdP/YsjNAi5AUnsZ5qoqDlc5piPAKBAyh99cvGQY7uVCIo6VairQBgtqIaHEUWkVBvs39geJrvz/NwQi9uTGgsgXqIA3kTPhF9+I19uT4JP1TRSGUoiXHLdI7I22L4Vz3VcPKafbxRVPlDuuRcHEM3jXoO+SxJWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D1dQJqu0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733702501;
	bh=ciHHlcaVO2t0MaGqyXFGjX3FCsBltnxR97IJmAxteh0=;
	h=Date:From:To:Cc:Subject:From;
	b=D1dQJqu0p4iS3SiN3ij8fFMMq87Bbba8y9wYyWN3MeCVtoo3FuXHREYBW6u/Psfh1
	 Qr7X6kxIlOs92OA39ltaLl8+0t1d/gcs5wW5er8LwND0OzIqylx9dhoGr56pBrYnD7
	 2P/ZSrawoF1bVoF0PL9dYlM9h+/wp1JRiBVdfJO4owiAiqjxYm7j3K2hQ74IGfzsVD
	 qfxbTU5mPFh0MHpGFxD/e50JG5+VQO1JMOtOQW34QFTjMgBhq4bF4VkSceADrL+qet
	 NrQ2gZIOiWkSP8RuB0ZzCIiYyayUgD3+nCy7BLzbbv9fbzQtvSsOl5AlSK7UR4++0Z
	 OYuY80KCf6eRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y628j2w1Pz4wcD;
	Mon,  9 Dec 2024 11:01:41 +1100 (AEDT)
Date: Mon, 9 Dec 2024 11:01:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Junjie Fu <fujunjie1@qq.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20241209110144.7a8968fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w+SyYjpIIHNzTc81dInZP0S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w+SyYjpIIHNzTc81dInZP0S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/aio.c:478:27: error: 'noop_dirty_folio' undeclared here (not in a functi=
on)
  478 |         .dirty_folio    =3D noop_dirty_folio,
      |                           ^~~~~~~~~~~~~~~~
fs/aio.c: In function 'aio_setup_ring':
fs/aio.c:524:25: error: implicit declaration of function '__filemap_get_fol=
io'; did you mean 'filemap_dirty_folio'? [-Wimplicit-function-declaration]
  524 |                 folio =3D __filemap_get_folio(file->f_mapping, i,
      |                         ^~~~~~~~~~~~~~~~~~~
      |                         filemap_dirty_folio
fs/aio.c:525:45: error: 'FGP_LOCK' undeclared (first use in this function);=
 did you mean 'BPF_F_LOCK'?
  525 |                                             FGP_LOCK | FGP_ACCESSED=
 | FGP_CREAT,
      |                                             ^~~~~~~~
      |                                             BPF_F_LOCK
fs/aio.c:525:45: note: each undeclared identifier is reported only once for=
 each function it appears in
fs/aio.c:525:56: error: 'FGP_ACCESSED' undeclared (first use in this functi=
on)
  525 |                                             FGP_LOCK | FGP_ACCESSED=
 | FGP_CREAT,
      |                                                        ^~~~~~~~~~~~
fs/aio.c:525:71: error: 'FGP_CREAT' undeclared (first use in this function)=
; did you mean 'IPC_CREAT'?
  525 |                                             FGP_LOCK | FGP_ACCESSED=
 | FGP_CREAT,
      |                                                                    =
   ^~~~~~~~~
      |                                                                    =
   IPC_CREAT
fs/aio.c:532:17: error: implicit declaration of function 'folio_end_read'; =
did you mean 'folio_test_head'? [-Wimplicit-function-declaration]
  532 |                 folio_end_read(folio, true);
      |                 ^~~~~~~~~~~~~~
      |                 folio_test_head

Caused by commit

  98a9217fdcb8 ("mempolicy.h: remove unnecessary header file inclusions")

from the mm-unstable branch of the mm tree.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/w+SyYjpIIHNzTc81dInZP0S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWM2gACgkQAVBC80lX
0GxYcwf/RxiMeArl0eXVmp25vzi5NtJVmwIECNscGb2iqKBk9vKNyR6sf6ZZtMPo
tWZws6mFHN5eFbk5VBxZ9sZNmllZULoWv4zGbUbtfoxrbVQ0+GFMBcewWwQpcLSS
upxMvn5z6fPemokUpVvMznfXgXZInuIm8P8SlwoKS9oqhbN0AGH7d6FRnG+t5275
qxi4/SldaiNphZZtfEBu1YFWuwjjIdkjv6Ybr+NV8yrvq8rXTDN0Z6tfJgyiAHqb
nvXVn89GXO/BaZrXxmQBRbNw0MKe6gGwcu/GSHfyABGavPpR3uAZ6UIIKU20fH8f
Vwv/kxrx4OcVA4z79r+aqgq+f4B7/Q==
=954s
-----END PGP SIGNATURE-----

--Sig_/w+SyYjpIIHNzTc81dInZP0S--

