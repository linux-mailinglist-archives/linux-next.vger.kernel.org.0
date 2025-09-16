Return-Path: <linux-next+bounces-8334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34535B5972F
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8047325026
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96E2DAFB5;
	Tue, 16 Sep 2025 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgQpEl3Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB38288C35;
	Tue, 16 Sep 2025 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028421; cv=none; b=tuu//nt+weBDOJmCPbZtMpcmQ0rPfLI3o4s8RI3IwrLR/oj1EXT+6Oh3Pi3MS+MuGVSHe/wgErVsn6PIYjGGwnVBYee2mJDC1Rq1ehRscSJgZHQstQ8S7SLL3RXwK35MZ9To6z7d1n/VpTJd173y1yijtAfF7FsXlXdXAecsrQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028421; c=relaxed/simple;
	bh=s+wCAG5BNTvG7Yd5wNh0mmRPRi1ojyXV1AR78FC5RO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VFCwN6aih/GfGdeHdgzaa9RDYNanqoPrO/dQQznJkfi5qJymi+HiUbGkms0Q1zPxRh8EBjEaPuo44OlC/k12FUBqXXVaGy91zLij/05QHmK/hQnlmxVO0e+RbY19IQUK5lbf6c7brMb+Qakaq9qbC5Fs7ZH4x4qmVXtt0/oKanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgQpEl3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A3C4CEEB;
	Tue, 16 Sep 2025 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758028420;
	bh=s+wCAG5BNTvG7Yd5wNh0mmRPRi1ojyXV1AR78FC5RO0=;
	h=Date:From:To:Cc:Subject:From;
	b=AgQpEl3Q52zUpszRFAoxC+8pyr/6q0JdELiyMFTksmN04QIWKP0E8KJOKTUXXG8Sq
	 LPOxmYuFDctywrLGAA/6oQdOtSr2bupP3etdTx6rIPrLgpsdP7JImZZAmok5sIYsIk
	 Oboc7Y25lorP6mYSo4ETGPq4CA+O0AiQh987vCOolYUqKHrosJJSJK+ACR7FC0CWjC
	 rCqBeP7s6PsAaeTK1dE+4ttd3nDlx8IRBMxVgrwoyf5loSzM+OTl0DD33OnT2s59l2
	 oKupjaa60mE7AMDTO2sjjX/nJWsq20zEzei5mBK6rsN1oXcJ+DRZvgwgvDkicDHuga
	 FR3EItv1mGB+g==
Date: Tue, 16 Sep 2025 14:13:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the block tree
Message-ID: <aMligBYh0Z4V5Biv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="REc+PVnkN8J2xx4H"
Content-Disposition: inline


--REc+PVnkN8J2xx4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/block/mq.rs

between commit:

  90d952fac8ac1 ("rust: block: add `GenDisk` private data support")

=66rom the block tree and commit:

  e0be3d34f1089 ("rust: block: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/block/mq.rs
index c0ec06b843555,61ea35bba7d50..0000000000000
--- a/rust/kernel/block/mq.rs
+++ b/rust/kernel/block/mq.rs
@@@ -89,7 -82,7 +89,7 @@@
  //!     Arc::pin_init(TagSet::new(1, 256, 1), flags::GFP_KERNEL)?;
  //! let mut disk =3D gen_disk::GenDiskBuilder::new()
  //!     .capacity_sectors(4096)
- //!     .build(format_args!("myblk"), tagset, ())?;
 -//!     .build(fmt!("myblk"), tagset)?;
++//!     .build(fmt!("myblk"), tagset, ())?;
  //!
  //! # Ok::<(), kernel::error::Error>(())
  //! ```

--REc+PVnkN8J2xx4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJYoAACgkQJNaLcl1U
h9DiFQf/X03OPDWfKRkNoKXRh2BIkpalCJB3sMsFY7OOixUo5Xe40ZpxcJsz3tZL
b7JcA0CzROO4XaA3mi1MxRyyhk0gZyXfRg5AuIktLxyylP63N6F8ffUt9S6YrTc6
A3M8kgnw9OfeX/2IiPXJYoR1DlDKKOKykSdxMmc0YNVBrltpKsC5xJ5Qi4lVpgBE
2iagfSynN1KOPJQ4zlQcO5TFdLvmgsWREmVmRx0W/8+//5k+I/pHugl7vb2YGYRX
0wLmkAbDfpEa95FF144Uk0ViVxEWgmjh6rTP1s+Rji9hX9UNubA1ByuWdwkMnDg4
E0dBzaS8PeYNzoLrute9JPds/yQ9+g==
=U1E0
-----END PGP SIGNATURE-----

--REc+PVnkN8J2xx4H--

