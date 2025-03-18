Return-Path: <linux-next+bounces-5846-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C68A66440
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 01:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F281897625
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 00:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8527A52F88;
	Tue, 18 Mar 2025 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g0B+aYh3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5B17E0;
	Tue, 18 Mar 2025 00:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259270; cv=none; b=HvMVMSqiCK1iHrUSQjNTmNZo2eiPQtQ0EFhdNOYDFaDLR6gyM6je9ymfdB1YZW4z/u/17DmaEcpMcFtqqHCFV878kmNij7NT/xPuPTPDgD/M4KU02rYzMj/lFhKepoloWggVrQzxRzNQkwu2CsrS4zyiC5T5RTYwGwTBwNcQ2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259270; c=relaxed/simple;
	bh=tTLztvLpHSbre/jffyVGfz19TUtNfWXMTPAYeg0VTQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iEY1WQB02roq58z0ULrIW5ui3/ipRms0J9yOaBd1LKZWsXxpn0vzL7a9xGZSEx0UP4+SEG0uW+0NYImZa3aAfJOuifjFRqzUhaYitSwuQs974UJa5An16V3ZUZes1/69zp61kNqwPstKWehEE88CW3ghZPpF72THOaSvj18DkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g0B+aYh3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742259262;
	bh=d7Jy5p5z9GCVX/nrV24oFxCR4XhMykM8P4W1MmsWpTU=;
	h=Date:From:To:Cc:Subject:From;
	b=g0B+aYh3jXchfS54W+zspenJeIj/v5uKghtsC+nMWSn3pXevY2ZLOXLhMu7ltkNDr
	 t5SYrhbn8B5JSedhmY8LDuXDNok5LBCIpgfZEE18VLlP+1alfR5f564Q/h8dgnnFae
	 EQwgOzsLhin0aPymrFhZxHngUcPZc+APEPRw6i5utthCHHXihQ6sxRf0s228sAdmL+
	 S8VmPNcZaFHldLhw8NDJ+nLcJ5arFzZahWgWxbTWUPlfBttXDrWWhqsi2KICSRxHBM
	 Scgnb6DSd9iUPMIwRQKAiieRV14Kam8yFJPi8c7O7ncMZbIGLPjFqL28eO4n1D6yNU
	 rD5aARgXXvAkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGtdm6cLLz4wnp;
	Tue, 18 Mar 2025 11:54:20 +1100 (AEDT)
Date: Tue, 18 Mar 2025 11:54:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the omap tree
Message-ID: <20250318115419.53442fce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GyS5PWTOv7lEnLYQwhaSAt=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  c2a5f8c4f28f ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

This is commit

  98f3ab18a0a5 ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

in the arm-soc fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYxDsACgkQAVBC80lX
0GxZ7gf9EVa5YyMhA2eFkrV70jnl1DUE8w33WPAh3HTioLvopneQvWltgf4W6VOb
q4CvSmEadc+occOdQZMTDyTE467Sb///oHda6HyOP0nG2eQp5pFbEE9AkuiCgldk
ZQzf2NrIsdHgGcZ2GwoM2ZalPEVOFUrUolLDHXdNvBLhh+Kdtcr2AjMCfVeVmP38
EAx8e5COjtniKXP/70tOUUBdNf/NgafGd9kyRTc1cMtsTqQ9Jd4nvHCELiTRKEzn
AInoY9zpAXUv8gpLnCJxdYvTtTcqbXZKjQs1RcFrxN/gQnqxhyUemEE47fq2MLIA
Oi9F/GhDeOFag4a09qjkW/jkFKOEJA==
=fgij
-----END PGP SIGNATURE-----

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=--

