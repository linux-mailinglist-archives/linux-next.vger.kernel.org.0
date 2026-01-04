Return-Path: <linux-next+bounces-9521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D029CF15E0
	for <lists+linux-next@lfdr.de>; Sun, 04 Jan 2026 22:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4055303A0B4
	for <lists+linux-next@lfdr.de>; Sun,  4 Jan 2026 21:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ADE315D2A;
	Sun,  4 Jan 2026 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hajF+2Sq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D662F5A3E;
	Sun,  4 Jan 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767563011; cv=none; b=NnY01YSguRPX5dthKqfxzGyGrt7uBE4Y7CXplt5evLlUwsCPlahLjb5lfyY0GSYRrkV5TAMV7z5/4hJFVbGXfiaA7QydI0aKSVmjQ0Sw/EcWqMc+FPDTK4pqzMXphhpAu2YShJFN6nlKcc648XgV695h29Af/Hqg2UDnlgxZ7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767563011; c=relaxed/simple;
	bh=NeHP/vzwu8jgQ/IFdUSk/8nXi1IyxeF36Oli3ZMiOeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BNLWcGhrSpzFEUQE7jUR7Da2Y2VK95o9dGNOYpfh3GbOnE4IYYN6z3Ap/+MJ/+OdPzmYy5SLeUkZx2A5SXRPFDsK8Cf95UxxydGorTCfj0Ksekrj7ZecjQvMl5OZA0/Whvd+glftBMJWbcFRX0cfr6I/K9pr1DPKgeeT6EWbfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hajF+2Sq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767563002;
	bh=/VfK/up63/jX+lxOwjNEsr7s+i+SRXi1l47YpMybG04=;
	h=Date:From:To:Cc:Subject:From;
	b=hajF+2SqPu45Ay3QNRtCtjjZ6LBRNZ6X+K9mFZSo3f7ETzi+JTKdrMKj+3QrOShu7
	 KWffjVt12tIKnXhCWkuS5idIhUyYydtMUk5coItKhCf0C+r3dblrrW3TTtrToHfd6z
	 r0kA00rfQZ6POa53PFTd8nfJMZcnhiLHMy3fznQ9JrNclHgy1SRmgw1kNx6cXLylFl
	 FKNYHEJ+M6fW191ujP1RnUAKnRIiwNq4zoUsaLTN5PeIgPK2vRnGGtdQ18iB+V1+aT
	 tpjffhvRr3nGRrJ2jET43RV17OP/3BCQFg6JLL+cOBpmcANGrz4GhnGpeVSuKe1mnX
	 pTgB0kFV87NYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkrX91B36z4wDj;
	Mon, 05 Jan 2026 08:43:21 +1100 (AEDT)
Date: Mon, 5 Jan 2026 08:43:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Finn Thain
 <fthain@linux-m68k.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the
 mm-nonmm-unstable tree
Message-ID: <20260105084320.3efe68d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eRK9fULdyhfu0P6tweh9aPC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eRK9fULdyhfu0P6tweh9aPC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3d73f718d762 ("atomic: add alignment check to instrumented atomic operati=
ons")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/eRK9fULdyhfu0P6tweh9aPC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmla3vgACgkQAVBC80lX
0Gz5kQf8CURhL0EE1tQ8MH4/g3drJ+SQMUyoWH2FtivIFyTYYvcvFH+LqkFDOZql
MxQdIdtg/witU3o/ibvs2uRXijadno59K8salIowMVADQbcFPtYn0G8bAJMqzdOL
LmLdNNcGcIuPIgrCZZnPAb8EcRIg/AW4A8f9t3VqBSigZQX3A+PeSXPTHf7sFy0E
7l78TS3MsumgYnIVkWR3FKdfiM2FH+Xp5n7K9i/YbzSUqzuaV+MoJD+aqJtH7ADA
6nklX8TPAR3IJxkrwmkPEI+ew/V1Q7oxu7yt4mKRqMvsGbtyWkJIZPbqHsgmNFmC
NBUot2WN813hEU14nch7BHMd/hO1iQ==
=jkz/
-----END PGP SIGNATURE-----

--Sig_/eRK9fULdyhfu0P6tweh9aPC--

