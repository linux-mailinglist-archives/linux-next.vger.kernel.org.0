Return-Path: <linux-next+bounces-7117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CCAD2C97
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 06:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7366E3B0543
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A484325DCEC;
	Tue, 10 Jun 2025 04:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iGbn5uoE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6BF25DB15;
	Tue, 10 Jun 2025 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529577; cv=none; b=RaM+WvTMOVWJHOATApUIFkRDqaytS7on9uei9/JXFN31wa2TmYKrLfAyRt42tuce8zqbsfInfv2fCDkQdVHoovAc2scpJP5u8EvCtVB7MeXUD2gLWrfX3wkL4yx+j+UqagvbQnRIgkPRoSV+pkI88hWrjyIDAyu7BKqC6Be1BvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529577; c=relaxed/simple;
	bh=HnnhJm0Z+iBUzSKCgtTykJngxRd4o/QpaKVBlzxOFz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=baeJPtjninoxL3iROaioKTdHhuwE/O9/ovOJUSLCNkGg0Ruvn91ZLg+YVckUNWsu126L/dmu/2sKwosNCHlsJe/GKQYxPi6ZVCphzYVCQprbPUxZvc6IBmWZPGYIa2MAq7mTeDSL70MLqF3yxnvsZUUdTawNT8CSGgiMOgi715Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iGbn5uoE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749529573;
	bh=+pnTi00QwWRbMKgIH0JKcY6tR04Qni+6s3iN3qY9zb0=;
	h=Date:From:To:Cc:Subject:From;
	b=iGbn5uoEJ+cyNfhxO37g08dbrMi4S/tHF2WhOSQHGuAWahOniKhqZ2D5naz9+ijnO
	 DZuVPo/qgQ0UaIXnKXfEfYmCZWA7P2rYYBNdFRiyxiQwpyz0qLz/I8pCQhI9W+IavS
	 DOZcI3Fu8rycRphLF05nAbjiMHV9fwxqPvVfFaIImyu89LnakHw8qUBzp03a3CIEA1
	 URC+g6mjXSc5kPSn9BhiaKP/mpysa04YG9mf3rjAsDQFpFpWpZUfXg35jtoda/mxmQ
	 KoO6nasIRsWiAHtjnccA5vXSrKis87x1rfTd4k5NGghQmtpCEgckgk45vF1mlmpCKd
	 c61NbPcL3QUBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGbMT2n5Bz4wnw;
	Tue, 10 Jun 2025 14:26:13 +1000 (AEST)
Date: Tue, 10 Jun 2025 14:26:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cxl tree
Message-ID: <20250610142612.130714a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f.BpewCPiM7hw6Cp6Lbq_ze";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f.BpewCPiM7hw6Cp6Lbq_ze
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/driver-api/cxl/index.rst:11: WARNING: toctree contains refere=
nce to nonexisting document 'driver-api/cxl/conventions' [toc.not_readable]

Introduced by commit

  11f401444201 ("Documentation/driver-api/cxl: Introduce conventions.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/f.BpewCPiM7hw6Cp6Lbq_ze
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHs+QACgkQAVBC80lX
0Gzfmwf+JoYKMtHoGKhvceoGn4Cd51hFMdZRzfHmoognk9jSdbVhHlut0UqO4PNe
D61hExPf0PQI6Wxrke5R4LigT/g6O7fSs0TTOumslm7X3uiTQuuwPmC+LyTyHPCH
jb4HJ4vnpGFq5LuyFGcF0u/hRb2bWmX8OFsq8oVdXVzrolgRkQQkjqH2vU/B3vKb
t2akj45fVCOgV6mfTTxmQrBk/oArbKVVJd5muH/bxh5U8//Z4cb1TNCoYmLfCH+v
rsz4iy08A3qaR+vOKeu2pWwlSnzgueBVtO8s2j6BcepnmWvZ7R3Sdlk907YScuMa
y5hsnn0OuHTlrQARPjwfPrnSOeKXDA==
=kGad
-----END PGP SIGNATURE-----

--Sig_/f.BpewCPiM7hw6Cp6Lbq_ze--

