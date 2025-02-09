Return-Path: <linux-next+bounces-5397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EDA2E15A
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 00:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3E43A5123
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 23:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE3A1E4928;
	Sun,  9 Feb 2025 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AbP2fLM1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54B15B543;
	Sun,  9 Feb 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142385; cv=none; b=QWxLPK2TdPaz07eUw82p7xmxPViy6ACmHuvKxKFRRhg5iHqrDPmWRo4DqCp0oLPQrK4whrIuiYi0u/jryyiX1ugd/pn6S1x+HIwpwdGNNa7YCKQ9qqt4T/LbA9I5uaxCDYJMc7eckBe8rTS4hi4VigYVO9s4nlSTGYQmufSzzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142385; c=relaxed/simple;
	bh=qOxutKJ1aPy/nIpf4MsBtVCTGieg2u7+ov8x2k9artY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=orwv2vh1ePLlU6hiTXHp1pAv5wVZNrEGCkc1NPYp2N222hNPg+UOgDyDZfzAmc4DmJXENdQagmxYuyRbZUWkHxFHH+0iz1sWDx6yU4n9bUco13YIdHkb2I6RXM9TwbzTQdyxo+l1QtmlbhZykdGJKT3TPz9z4h8UFGHdfzypXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AbP2fLM1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739142379;
	bh=7JXEZY2Tg7lHxdIz3FICAtrNW/SEaMyHeEwI9gH8ghU=;
	h=Date:From:To:Cc:Subject:From;
	b=AbP2fLM1qUp32NQVtK8MGaRCyQBonAtRtk0KpMAAXmiMv8gcv9BdW7skcKTpKAonE
	 VHL7SUIniRnvyEvEFXw35oBsYaRcF+N4Nhaq0hF6UC6xbDWVO5lJI6w5cJ40k+YOCc
	 xusTT1TkIcDGwJ6a/paVkSmHtwf7RkOVSqOJYY1vibeo5uziw6EUq06pUySU8Ykwvy
	 mv/QIQLez5s5VJ5UL3bBtG9ToQjYKqNGUCEiUTR+Y2hi3FfSPDHC6wFEpPO7ofWWgC
	 yrM31odL2bMklU+vAwhi1Xf1AhzQ+3lt2FObF5AOCUWdf9WOW4je62jB3epPqyi3J2
	 pRCM39MArbg5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yrjxl43k7z4wcw;
	Mon, 10 Feb 2025 10:06:19 +1100 (AEDT)
Date: Mon, 10 Feb 2025 10:06:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20250210100618.032bdf9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m/1xXQa3tDeq1dsEnAB/INS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m/1xXQa3tDeq1dsEnAB/INS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scrat=
ch+0xa9 (section: .text.unlikely) -> memblock_alloc_try_nid (section: .init=
.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scrat=
ch+0xd5 (section: .text.unlikely) -> scratch_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scrat=
ch+0xe9 (section: .text.unlikely) -> memblock_phys_alloc_range (section: .i=
nit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scrat=
ch+0x1b4 (section: .text.unlikely) -> scratch_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scrat=
ch+0x1d1 (section: .text.unlikely) -> memblock_alloc_range_nid (section: .i=
nit.text)

Introduced by commit

  5a86a3085351 ("kexec: add Kexec HandOver (KHO) generation helpers")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/m/1xXQa3tDeq1dsEnAB/INS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepNOoACgkQAVBC80lX
0Gy3Ywf+IflcbqT/532jVQv8eoCLEbXJwXW6jAAJcIFg0oHWkFY+5+0OVhl4TU8U
d83haNn7vgPKVhLsR5sVIcps6E45DYY5v7RGtbXC58ZArU1pVDqqNwvQYGaLkyTH
V87GNUk7YfxAJ9H+w6E9rXfZP/+wdof9j5FnVGLhyWD2SB1J8QR5CcNPqNfGIox4
eRZ7tkJHsS+Et8ReIs4/yM24XZh3ejJ6oARM404as/pOrmo38oqocpyiTFLADfgR
FgCRRv/dxcEBhP76Am58szp3/Fd/Nt/U/CMAfH9XECSgLX7iEodXEcgdHvGFdNLB
8wlZsqEnnkKZJvu3QGtjtWqHk0MMxg==
=B5RF
-----END PGP SIGNATURE-----

--Sig_/m/1xXQa3tDeq1dsEnAB/INS--

