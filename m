Return-Path: <linux-next+bounces-5027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4AA01C2D
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 23:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C39BB161E72
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 22:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5D7143C7E;
	Sun,  5 Jan 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NCSL19hl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207D1F19A;
	Sun,  5 Jan 2025 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736116675; cv=none; b=R5l47iQ77kK2FYA6xvPnOAuHG6gjIsuxZ4Am4AdPAzB6umkvqz7AISQsr3ElzEyJD3DNZOzyuub+Rq/th1M2UFfycSvx+42gK1uYBJcjEvI5G5tWRk4b24PYTtD5eG5NbTMa03ilVshrT+yU9dhnNwRokKGyuQx3cIdPp8gXZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736116675; c=relaxed/simple;
	bh=zXrm8FefRrg4ZjOWHvPwBmB8153l6RHMC1KJ7hJgXIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hV9nuY87t0kiz/54WyCR4p/w2FlVrFIHrLW1UU37M7g9myL8eOwzkX7QgrLoBsJf01n/4uKeBqp7NMhwW/G55mny9xfol8W4W8IBwPHN1Nd5E6NDAIyswQYTRSOgTlnAlNapXLLAQ3twaQE1tC+qPxuFf6VLxybQuUqNrMpHzW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NCSL19hl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736116662;
	bh=2Dgu+xEK/xsOALa18iqsnwD7qKYhUuHCiXmp3fWkzNU=;
	h=Date:From:To:Cc:Subject:From;
	b=NCSL19hlxmvEs/mV14xF7Es4UMMIwxagnRwZrXnQ+LZFiXpqw6TzkMoe7tT5++YZ6
	 nViBQMY0xH3rpbclza2J9StPGr99ykj/gaP0X1Jxj/DeocpFPGiYxyUQGqS5CtW47W
	 QadILaE+VNG805ZtYp1RBfeA5gzaHK3Xa2h10aQCAvZWyuYlKgqyLIJrOJ6ZMy0ceq
	 DwyrqxIPEIoahUVxVrnJTwE5d9qDdwsanKSRWdT3JFptDrfHaU3Iy3V1sqfzYwqC/R
	 /v64m58zmzfutROx+U3mogs2PlE5ph+RCweWkhIOBHZNd1qRJRMCeUGDlHDDPQ6wtI
	 eYoZBHre86ltQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRByr4VSlz4wcs;
	Mon,  6 Jan 2025 09:37:40 +1100 (AEDT)
Date: Mon, 6 Jan 2025 09:37:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250106093723.147ef27c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+hoe4iC_lj08K4GqCk0iDhd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+hoe4iC_lj08K4GqCk0iDhd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  b7ebfb84a09d ("arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32=
mp257f-ev1")
  7db93f0277d9 ("arm64: dts: st: add csi & dcmipp node in stm32mp25")
  abf9b56d5dc5 ("ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15x=
x DHCOM SoM")
  ee843399b312 ("ARM: dts: stm32: add counter subnodes on stm32mp157 dk boa=
rds")
  db10d90e8f16 ("ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1")
  47d9d3c1d424 ("ARM: dts: stm32: add counter subnodes on stm32mp135f-dk")
  ba8ff583891a ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp15")
  ae281e200680 ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp13")

These are commits

  8df9bff27889 ("arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32=
mp257f-ev1")
  d67635e62d80 ("arm64: dts: st: add csi & dcmipp node in stm32mp25")
  479b8227ffc4 ("ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15x=
x DHCOM SoM")
  5f8049c1d170 ("ARM: dts: stm32: add counter subnodes on stm32mp157 dk boa=
rds")
  00de2022848b ("ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1")
  2879145733cc ("ARM: dts: stm32: add counter subnodes on stm32mp135f-dk")
  57f1e18bb6c0 ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp15")
  ec9bd8e7c06d ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp13")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+hoe4iC_lj08K4GqCk0iDhd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7CaMACgkQAVBC80lX
0GxmOAgAgu0j5vtOg/zWzwdf/08nOkQz+Dj/7s2qImByzrVrv0joGjqDZ2kQCMxM
vWF4lnalyfKp55+Vq3+p8XZMpMnP75/OSLz67nGv24im/KcrItX8lndu3SeU+fXL
cs2bydGCXsm3ctZtiLsAh0e1ZBwJ/3lf8BxYCXMRRwbOX/gpGZySK2BXmYd1Lrje
sr/JHTXjLhB81pGaCsqPidbyo3ZhTJZ7o3HceNkOUVkXUVCaFyp91LFV5nGRZFiX
n487n5wPAz2MVHy4lyJqm9YiACINTcIygYpWJqHZgl47LoYftHxVnhgQmtJwP8em
aecnJqhzNagwLbYewP8XhVj+nRCD4w==
=6s81
-----END PGP SIGNATURE-----

--Sig_/+hoe4iC_lj08K4GqCk0iDhd--

