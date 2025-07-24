Return-Path: <linux-next+bounces-7708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C64FEB0FE7F
	for <lists+linux-next@lfdr.de>; Thu, 24 Jul 2025 03:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEEE77A5838
	for <lists+linux-next@lfdr.de>; Thu, 24 Jul 2025 01:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93BA72612;
	Thu, 24 Jul 2025 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MO3RFTi7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A614286;
	Thu, 24 Jul 2025 01:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753322056; cv=none; b=W6FPc+++Oj68aMv+pOTW8AJJsoVk9NR1H2Kjb3piRbPCIH+hyl9iqrQv/9UkC9Wt0krpHiX+tSh1cMWxfMujL0up0FWSDEUFICGzBmOM7dQN7J2S6udpozB9rqAqn88rP83I/Ccp44ramaoJ30tuJ8Z2JsWcEIVlDgsNc0Wx0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753322056; c=relaxed/simple;
	bh=Pxu4/cpKolXWOoqW21DUGXbB+YPHAVPh65XJhh0scbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BlWkyZAGHkzDxcL/bRb03Dxb1F1RTl/RrgEoXcQOtnQAdKZRVccTLuV3xOC9Pl1Y2k9VgfCLucz9/PUoswmW146DHV7DQEBUB2Z0gTflzU15mXqt2r2cg/h53oe7hanqOm+mx84uttbBn2N3An1RGck1UpvBI76qVaSoSwM2iPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MO3RFTi7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753321880;
	bh=Vjl8/nZPuhZeTZ6S3dzmBFZBP0glFW1rzB9CsZefNRg=;
	h=Date:From:To:Cc:Subject:From;
	b=MO3RFTi7/Oc7Y6rX8VBIq2Sdp6F2FiiA/gqOAg2OK1mS4C5mjDgLxH8/Gx1mYjuGu
	 tcDN9Sxybrl9+Uj+wY7K4VgPNk2iM9DDZT+2E5sf95pmi1FX03Wb+6JOVdkFX6fkoi
	 qkFsqjjO2V3z3Dql6UXazUti5RgC2jb3i4Y1iwGRAs51sEACGoOTLz/2yCYfDGqprP
	 72DkUfR8oxYyVeRk/Vs9HYX3DRUwn2qKb75HgdUjmL/Dfu67ORHBPO22Rfz/7brcGZ
	 4mGebRL6E8GCWPvQvdzs0yjLoKs1Y7aIo4ua8Qjym3GoguAANmG2T0NKMJrg4u/xHT
	 IPWSM47DY/+iA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bnYrQ6xc0z4x21;
	Thu, 24 Jul 2025 11:51:18 +1000 (AEST)
Date: Thu, 24 Jul 2025 11:54:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mfd tree
Message-ID: <20250724115409.030d0d08@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IkWpXAPTaSq+deO95ar+Slc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IkWpXAPTaSq+deO95ar+Slc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: unmet direct dependencies detected for MFD_AT91_USART
  Depends on [n]: HAS_IOMEM [=3Dy] && (ARCH_MICROCHIP || COMPILE_TEST [=3Dn=
])
  Selected by [y]:
  - SERIAL_ATMEL [=3Dy] && TTY [=3Dy] && HAS_IOMEM [=3Dy] && COMMON_CLK [=
=3Dy] && (ARCH_AT91 [=3Dy] || ARCH_LAN969X || COMPILE_TEST [=3Dn])

Probably introduced by commit

  ef37a1e24857 ("mfd: at91-usart: Make it selectable for ARCH_MICROCHIP")

--=20
Cheers,
Stephen Rothwell

--Sig_/IkWpXAPTaSq+deO95ar+Slc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiBkkEACgkQAVBC80lX
0Gzsrwf+OIxm78//JeVQAHE9jVrgfX+ZnbCO0RJbF1JjNndG6wOAMz7mvGL32SR+
DK0hiobHD9/Xw6/iBb+p5kBOgyYmvEtfjZMgVrAcyb120goLeanICQBxNZin0Pve
SPLUtUSEAzl+nzVlNAOdWMIRUn0BdmYcAzl4hoXCQR4S+vblW7VnwNWHQbddikC2
/3WF/9J5bu/4nQMbqqsrN62LaLeSpr1jJsMQDK7iG2/1PX/ffVUesx3WWvyKouy+
S5p0W8iXxpjwkkMgG/ClcR1G64v7R6jCoiPUQaAEBQOJWJG1c2z4URswJH67EgYY
0Uk3Rd3QLdpVT2surX0/+TkLZw+EWg==
=z55g
-----END PGP SIGNATURE-----

--Sig_/IkWpXAPTaSq+deO95ar+Slc--

