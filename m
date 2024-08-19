Return-Path: <linux-next+bounces-3356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF39578AB
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 01:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9454628481C
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 23:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33395183CC6;
	Mon, 19 Aug 2024 23:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MHul6+H/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76C15A865;
	Mon, 19 Aug 2024 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110472; cv=none; b=PvSuRwqHfZc5AtHyvxr05qba/P0jQvVLj+OKR/GC1jhv1kpV1tQuH6GUAkfRJCsFrt8kVdnxGYvI5y5chiNGlbhyr8Wg6OmyzY8FA6kafXchzvbZcoi439N9O4B8V6at2brpPKRPAy6Ior38/09avo/liujyGDFGFDtuWcNwFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110472; c=relaxed/simple;
	bh=9bEap7+4gkmfX4t8B1NC/CwZ0FaaHaU35iaoOYRUZjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dhfHnwwiicLrrtP9Rdu6rNnl6hynBXkLHgLLWDBADMQSUlM5RWqxkChPYubIJvhy6usfbIjoV2mHJ54p+FTTFNqOdZvI4kmDpji/27rRDCm41bOHFh9kD6FHuNxbXrNF3JAr8qDS/e1TlLrAUPRmDljefP1eC1UdpDXCb333Rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MHul6+H/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724110464;
	bh=3ZJ4DwnjoU21oFaUvU7urqvBa0hoZQ6SOEabdyPxcA4=;
	h=Date:From:To:Cc:Subject:From;
	b=MHul6+H/qIjOpkGqNlIniDXXP9ifiE5blNossrIbOVTCudZONkbwK4m3ltX/42HU/
	 dDCOw8vVXgIKSexzzkCKVPmgwIwzI0HZExqJt/kq2FDxqB2ys2NbLKL3Km1IkvDbTk
	 eNboBFzxtb+8QUb9r8mx5uGeeYK8V+nWiOCzSoMKF3fkPtvJDbw4qlYC6XFIDIljOw
	 uSy+9ZrtO3shnOewkuLQRhXgkfA0D6BTaRdXXpA/TorwMdyfWvaUd/7TuOxhbzfPaN
	 d2A+fjOg5rwECF5vZ4MS+qNDa7g6e24nVLjPk/fB1i0W+fSM7W+SUCQ5+Rdf04XCqY
	 KR6yWwoC0KDKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnppS667Hz4wd6;
	Tue, 20 Aug 2024 09:34:24 +1000 (AEST)
Date: Tue, 20 Aug 2024 09:34:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the aspeed tree
Message-ID: <20240820093424.24f9e652@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A+ChbPLElbrG25dm+WTPhPY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A+ChbPLElbrG25dm+WTPhPY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  995d8fe0341e ("ARM: dts: aspeed: System1: Updates to BMC board")
  76c553392543 ("ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM content=
 to layout syntax")
  fdc26e0560a0 ("ARM: dts: aspeed: Add IBM P11 Fuji BMC system")
  787d4cbff0dc ("ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system")
  fe1d09efd2ae ("ARM: dts: aspeed: Add IBM P11 Blueridge BMC system")
  e09e75d5c669 ("ARM: dts: aspeed: Add IBM P11 FSI devices")
  db769d76874e ("dt-bindings: arm: aspeed: add IBM P11 BMC boards")

are missing a Signed-off-by from their committer.

One of the catches with rebasing ...

--=20
Cheers,
Stephen Rothwell

--Sig_/A+ChbPLElbrG25dm+WTPhPY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbD1oAACgkQAVBC80lX
0GzmcAf/cu4hGEWBIMnyAUB6i5zBoDYIihC87qIK956u9WYu8s2FSOHKFGMCmMNR
W+QKmEbRFL2OX+5oVZu2BCcQUXfyQMxYRPwKJX6D63XvS/jJvBAufxxYK9sNVDaV
6vA2V9M2KdKBkwX7PruCDFCimTTjvcagYNMOmb6v16Emihsl7qJbSwWUOPuBP0Zh
FiX3+KHvw01qgOfIqIS9b9qEBAegXzetz+Q11//ksCQ0AraLKV6VLekP6M+luBFd
MncXDJxG1p2xAB8AgOm5E9rM2glZbxIg/lDiIAjLtbL+q7TuXNmMab3P6DQuf9Z+
lPE/LRkLazFKS/p7RQ+IIk/JvksiWw==
=LGRd
-----END PGP SIGNATURE-----

--Sig_/A+ChbPLElbrG25dm+WTPhPY--

