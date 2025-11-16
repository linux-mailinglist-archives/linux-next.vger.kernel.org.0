Return-Path: <linux-next+bounces-9019-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C545BC61BEF
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC1F4E35AF
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 19:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFB92222CA;
	Sun, 16 Nov 2025 19:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SX1njiz2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537971A9F93;
	Sun, 16 Nov 2025 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763322336; cv=none; b=uiCsA+0J8e6NZQPfcrdmjYZej7Yxk0ACecfrPW8dcksFjyr9hJPTDaRSrXuzdocmqqjqrbvX3xQd+uO/pWaNbXxdwSV3bLIC3k0XZxH9Gfu8gt6XB7AgbqMZQRVgeL4UGlk0fUJ3Uu6uCpNATmhOxbQTQsdHTmlO78NhjAIQA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763322336; c=relaxed/simple;
	bh=U0TpF0dJclTahFwdWCEBzpX6Gm4pcfA4T6DthKduyxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qddFlzranLj979EuJdAoqyVcun8vJ5dFmWzfziUa6KM0Aad1wbrw7H4lKtRPjSuwGt8lM2kP5gq4VgcCcf0IfI0VcN1FcGG96byV58jqIdlrcw9pqGA8S/A6vIxdhYQyHtl4xe/A9v1I6xSL9rO/huQ4oIR8lUcGPj0+qTb3Yys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SX1njiz2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763322323;
	bh=sY9/vahHOw8nb+2Qp1du4qrQhsGcMVzRnz57G/v8WO8=;
	h=Date:From:To:Cc:Subject:From;
	b=SX1njiz2LCddLkFvJiF4Vm75OR3+lKlUMgGiWaVIuuS6X+ZgqjXbnd4HPXpAqnzSJ
	 Rrro7WrPtpkPq2lR2c//3aR6UE1IrpmV4bAwYOuP7x4RLcyNceBeBoJbM1rA5xInPD
	 IUDxpnSLUvIVragYI40E6x8W8RuFsfMFW50q7spLDhR4bE6/9ihbftmUfAi1lvQnCO
	 AItnSWQ4oL90KKBBKNojTes7vnlZQZ4cTTpHkM+nKB2sGFgTuXJTtmPqNvG8UMTyyI
	 bQjfyBSTTufPIAWy973uh5PulJaVOp3bz13EwVTqEnIHPFroDsDF+fJqBFWJLnG1V3
	 W2Lh6apgwgEug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8hDg0Pq9z4wCB;
	Mon, 17 Nov 2025 06:45:23 +1100 (AEDT)
Date: Mon, 17 Nov 2025 06:45:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the imx-mxs tree
Message-ID: <20251117064509.18014915@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K4FFsyDI2Tx847SeC+qAB.q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K4FFsyDI2Tx847SeC+qAB.q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d207441fb3da ("arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequ=
ency to 66MHz")

Fixes tag

  Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")

has these problem(s):

  - Target SHA1 does not exist

In commit

  fd0e24c7d631 ("arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name")

Fixes tag

  Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 91d1ff322c47 ("arm64: dt: imx95: Add TQMa95xxSA")

--=20
Cheers,
Stephen Rothwell

--Sig_/K4FFsyDI2Tx847SeC+qAB.q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaKcUACgkQAVBC80lX
0Gylhwf/dk3A43LxRzl5kcqPDCngWOZBNerAvyFoF3ItAtXQCYQBrQyO4y2jeuW8
yg9a/+8N3vBXdQX45wTG01CgMqnlgM4m+kqzrW1tX6yuEOx0AX7puWNhXRKG7+8v
7V00CssCF5D1Oaukb29Vmho7adKNrMVdrSjo15tewi5EjpZ10qqidWDEeAqRRQbK
OH99vI6zJPYumFOlxTXOeMtJei56hEg42rkXx5aRaRvjDfs46z61uzp8yEDNq3lX
a/odf0Ax8ULeH/kGINSQaGAUSEoWcY7WIsMReHxLwGEoadPPmxR/WcNDDvkSCHOc
rCOkTZms+g8tMbqbRAwiouffQhDvqQ==
=Ru6a
-----END PGP SIGNATURE-----

--Sig_/K4FFsyDI2Tx847SeC+qAB.q--

