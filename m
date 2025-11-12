Return-Path: <linux-next+bounces-8942-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA3DC54C2D
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 23:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FCDE3AF0C7
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 22:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D629B2E091D;
	Wed, 12 Nov 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iSz6+8PY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19C2DEA71;
	Wed, 12 Nov 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762988149; cv=none; b=rkfUmYQXIms5ajUiSCKFl/Wb//dm/bOFNrLm6HC75yJ+InZ9gsx+DWiZtrulBxtO7Ago0/sSW5sp6QOkh8iug1tWkIrKscHdJhOl+UzXSaBIoL4BJFiUnHY2O2I3KF18iQbAykPO2C6I3rtrDB+73IWmjCU5qUug82VMKvHTdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762988149; c=relaxed/simple;
	bh=pUQ178O9L4vcmLu15xqz1pP0QPjFgXWJG1bIiO9qiww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fao3pl+VdVx80WloMq/LbTPOn4R9knltoJD570Dyr/YGH9b/YAsklEqtwXnszVw5c4tJ8p6O5Tk9QKHtSeDmfQ2wKZJLiY4dllcV8FZre5FeXgRFNdZCm1ag7zSUVDE/SNPlQbl+qJfNGFC7HTRpYBYlGgZE1rkOPOqLlSd7kkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iSz6+8PY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762988142;
	bh=1MAtvJW8M1OCbur8O3r7GsQ9rwRnohEuR1j1rW6F6Mw=;
	h=Date:From:To:Cc:Subject:From;
	b=iSz6+8PYEiL7JpYVEz80opBZoq4rgUKg7y2CdzTVsWcxEsI4oM71ZF07+4Wg+1PXC
	 L0XCYXsJG9UpUtzKkgj5yzWGhSf4i9/dr12JnVrsqVwqLxNnlWD8/qn0EIY8sPpSTx
	 jdtHYQb8fyoTXMsbXQQs3IyJy3o3c61STcMe2oCTuuUKCKJD70JiEY6KESROFhBi44
	 +vGCznFf4w0sr/h6geCDGEtDSKYG7BakNngjOWmOWKeR77C9iyqLjDaEPAe4QH99O8
	 n4DkZxvUd7kgIVzYQTnqq1LX6JL4BrweqjNlPUgCW3/tYXgrTeqd4fTBK9j1DoEGfO
	 8ek8L/T3CqL5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6Jf56Rs9z4w23;
	Thu, 13 Nov 2025 09:55:41 +1100 (AEDT)
Date: Thu, 13 Nov 2025 09:55:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20251113095540.4a66405f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kp47ZAGb.5n5nhHDi2NOVoD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kp47ZAGb.5n5nhHDi2NOVoD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/el2_setup.h

between commit:

  ca88ecdce5f5 ("arm64: Revamp HCR_EL2.E2H RES1 detection")

from Linus' tree and commit:

  96ac403ea2b4 ("arm64: Fix typos and spelling errors in comments")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/el2_setup.h
index 99a7c0235e6d,cb0d72401d45..000000000000
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@@ -24,7 -24,11 +24,7 @@@
  	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
  	 * can reset into an UNKNOWN state and might not read as 1 until it has
  	 * been initialized explicitly.
- 	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
 -	 *
 -	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
 -	 * don't advertise it (they predate this relaxation).
 -	 *
+ 	 * Initialize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
  	 * indicating whether the CPU is running in E2H mode.
  	 */
  	mrs_s	x1, SYS_ID_AA64MMFR4_EL1

--Sig_/Kp47ZAGb.5n5nhHDi2NOVoD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkVEGwACgkQAVBC80lX
0GzfZggAlnkaX6PVgE4zg/BFdWHwQE9W9c+Li0JqCu6WWLqpQrvFg/PG1UxEnNuS
Xov8qTIDjahRsy4iC0GztS79g0Wg4fFfJkMta+9iZQrjwMLqjhBmwb8TVxvq41oP
/RnCoCnKZn6BW2Xp4c9K72hjZd63N2772VVw4nWV+90+MqqD/GbLYZINgtpBmldZ
m8UDcgftk8NnX0EY0HW99B03upoxRSYITNAUDrNG5OcDCF2BOZL7XPjAt2HAkCkM
dQLHwfWsokIxvt5yV8Nmolm/iSh6xEFfSUbTgMu1Q97KZznApM4UprQSNLHe8t++
cbwTZ5hPxtFeac0nkwHdojvn1L7SlQ==
=zcGN
-----END PGP SIGNATURE-----

--Sig_/Kp47ZAGb.5n5nhHDi2NOVoD--

