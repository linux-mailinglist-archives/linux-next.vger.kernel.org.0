Return-Path: <linux-next+bounces-5941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3BA6D3B8
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 06:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1776167954
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 05:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A00122339;
	Mon, 24 Mar 2025 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p8vQSKDr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082982E337F;
	Mon, 24 Mar 2025 05:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742794465; cv=none; b=cHD0Wck5wzh7NZqd4clj/C5ATFL+r6PTtidDvYC0FKiqqIOeluJ2/Q8cc161LJMGCPC9/aMjCceYlOHwWXz/j9ThcoTD4yi6s0XPm83Y3qD6gU88VIh9Matyio8LUei3fyrw3Dt2srq67v2dYDDF5vLXy2s9T8TRa1IT60aL/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742794465; c=relaxed/simple;
	bh=0N4c2WZI8x4iQ2jgWASJraby+PyTVlH5TDkjYt1h7o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gmrSXKdDMi5c+hGQRzW3EA7gU+NSfNKft/SWNZoyP/f2y/rseFbRz59z+0+C3P7+rK8M92SSZz+GwDtyDjvpD6HcM7qxH4jwzKYJHua4krwkfQSn3modLjvo8mh9qJhudZDcn5ifgxFfZLatBmTmecGqZp6Ds70yIx0fEJRXyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p8vQSKDr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742794460;
	bh=B5Ws58J6CVirVIY6lproU4sIVTY4C6GXMtjU5lZ72Cs=;
	h=Date:From:To:Cc:Subject:From;
	b=p8vQSKDrUWjVt0ooaRAhAx2WxD3SYxq2mSC43USi6QNO+3X4zBk08TYTwXHuSfXQ7
	 u9jRFDud3olEXATxyuWEbParUKHfzQiJqYd+Edy2FEOSJKyt9DbEJ/V3lGB01jwtiC
	 gs1Ix6OOT2iEttGCKySIdtI7qhbQGkH/E7IShDqFewM7q4mE6/I51Ehj0J8VXjjjjV
	 tDgSdeFNNeYErvYL3Q7/iXpJBOkWRVtodKvW8FzAfYjKResyMaTWU5p59PxfSZFqGE
	 iw67Djot8Z3Tc858Bfw+tgq9G4fFinwM8hUsfU2rsiqofGoOyiGx2HNcf089dfe7RQ
	 p98A4okFukiBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLhZ20QQMz4wcZ;
	Mon, 24 Mar 2025 16:34:17 +1100 (AEDT)
Date: Mon, 24 Mar 2025 16:34:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.cz>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Terrell <terrelln@meta.com>
Subject: linux-next: manual merge of the tip tree with the btrfs, zstd trees
Message-ID: <20250324163417.4b9e84d4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/czFsEbvN6wl_GngY3ZKjha.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/czFsEbvN6wl_GngY3ZKjha.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  lib/zstd/common/portability_macros.h

between commit:

  65d1f5507ed2 ("zstd: Import upstream v1.5.7")

from the btrfs, zstd trees and commit:

  1400c87e6cac ("zstd: Increase DYNAMIC_BMI2 GCC version cutoff from 4.8 to=
 11.0 to work around compiler segfault")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/zstd/common/portability_macros.h
index 05286af72683,0dde8bf56595..000000000000
--- a/lib/zstd/common/portability_macros.h
+++ b/lib/zstd/common/portability_macros.h
@@@ -59,15 -53,15 +59,15 @@@
   * Enabled for clang & gcc >=3D4.8 on x86 when BMI2 isn't enabled by defa=
ult.
   */
  #ifndef DYNAMIC_BMI2
 -  #if ((defined(__clang__) && __has_attribute(__target__)) \
 +#  if ((defined(__clang__) && __has_attribute(__target__)) \
        || (defined(__GNUC__) \
-           && (__GNUC__ >=3D 5 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=
=3D 8)))) \
+           && (__GNUC__ >=3D 11))) \
 -      && (defined(__x86_64__) || defined(_M_X64)) \
 +      && (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) ||=
 defined(_M_X64)) \
        && !defined(__BMI2__)
 -  #  define DYNAMIC_BMI2 1
 -  #else
 -  #  define DYNAMIC_BMI2 0
 -  #endif
 +#    define DYNAMIC_BMI2 1
 +#  else
 +#    define DYNAMIC_BMI2 0
 +#  endif
  #endif
 =20
  /*

--Sig_/czFsEbvN6wl_GngY3ZKjha.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfg7tkACgkQAVBC80lX
0GzDiAf+LsQ+E8/64x9fP1QR67r0pPVc3pnPZtHFlthPeQFifAgoynTjV9tSfk0l
dbFpywkt4EPCq9bIT5gchrZfjy9rLnvtj41N82c3ycyaiLiMj3iBTq/HJyrzYXH7
/guCk/GjvbImDyixsOQVo0rd8jYjoExofD+9mHkgu0FkZywIgZylE/C8sl0VEWeb
cftbhroX1gHy12Gxeu8L+0dofaJ4r3NOynQ290bLbHMUtUB4nLdEpSn9Adc4QQH+
8/afXxud+wT5YKZBh8HenSh8FYp6lQpiLPG97H5HzI7TFJYuwtkNjmUBu3Gc4wi6
bTuSb/PeDCbxcDIh4m/d/lp9BB2wRQ==
=/afS
-----END PGP SIGNATURE-----

--Sig_/czFsEbvN6wl_GngY3ZKjha.--

