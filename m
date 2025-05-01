Return-Path: <linux-next+bounces-6479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A35AA5972
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 03:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7887F7BA67E
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 01:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEA51F4CBF;
	Thu,  1 May 2025 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hc7emitz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B81EDA02;
	Thu,  1 May 2025 01:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746063490; cv=none; b=u5vTGdw6zwp6+I22FA4fhepk7jVWGMI3sbIV1uXTR3dsq65euIVGtqjiOEzKiu5cjWCq5/hRE7eULGaALQhkVm3FUNli0Y185a+d+RPL4H+N5LRIGp9n3mZAsxJ9xCNOBMGjX/HQhOLDXFEYrWHxEZ9nTMVQGuPruK6UDJARqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746063490; c=relaxed/simple;
	bh=uEfmJgq7SQ1ZrUMPGWXpC/gvHzQRC33gE1qvCe5sXIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kmKyIW9lC+cGdJRYkEXO9sBuY5N4TBVWS5zWwS99gKvPDPasNOMCS59Y6pqZAl4b5Zn2MRkKvrzGC05tWM9L1ey66rlqJv+EGDpMTM4DGgN6LN9fB7o9VEmp9/rMzDtAxnQzWGdkay8oi56PjebYqd5xDJeaI/bvgenVlAii2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hc7emitz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746063475;
	bh=lzyhLmg/ziMLt4yRoZGb0hv19iiAWHl/1qxkgQ+5AS8=;
	h=Date:From:To:Cc:Subject:From;
	b=Hc7emitz9ZsUWYPpVllHGyplXQ/xhdmxbvF7vBt/NwHRylQ12oesZ7lw2Z1kYMNxC
	 suh5n8cDBmvL07bBbq/1svOPrU8T08PDB6AGkpbtpoGRYOSE6OI2j9awiiYwiNTLpy
	 ET53guqPtaHlE8trhKjWt5PFfSekPhfWlVMT6Ppd9XncwvEsddM8kSGDzwktKZcnaU
	 QoitBJUNEY3S/YUeTEekqtKBsyjKQtmvh5FEarA33/XC0XVjWNGnPcqWZeKMFS7nvi
	 zwM8eey7Nu4OUek5WCncCYao7FikNL9sXw3t0UunCG2wRtMrxdcGo/jBItjDdsL+Bp
	 558jsXQrv1PwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnxWk6bcZz4xQW;
	Thu,  1 May 2025 11:37:54 +1000 (AEST)
Date: Thu, 1 May 2025 11:37:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250501113753.53f6fc88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UFLoNUn3bPfxHBrObqHN=+p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UFLoNUn3bPfxHBrObqHN=+p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc-fixes tree as different
commits (but the same patches):

  0530a74f3f43 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp23 SoCs")
  6485975d7832 ("arm64: dts: st: Adjust interrupt-controller for stm32mp23 =
SoCs")
  635ff238ff7b ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp21 SoCs")
  2ae67a2e7e4f ("arm64: dts: st: Adjust interrupt-controller for stm32mp21 =
SoCs")
  97d0a619e248 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp25 SoCs")
  e5694384b07d ("arm64: dts: st: Adjust interrupt-controller for stm32mp25 =
SoCs")

These are commits

  2ef5c66cba61 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp23 SoCs")
  3a1e1082097b ("arm64: dts: st: Adjust interrupt-controller for stm32mp23 =
SoCs")
  1bc229e9bb9c ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp21 SoCs")
  02dc83f09c72 ("arm64: dts: st: Adjust interrupt-controller for stm32mp21 =
SoCs")
  06c231fe953a ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp25 SoCs")
  de2b2107d5a4 ("arm64: dts: st: Adjust interrupt-controller for stm32mp25 =
SoCs")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UFLoNUn3bPfxHBrObqHN=+p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgS0HEACgkQAVBC80lX
0GyGngf7BksM6WgqDKipL3efzeWF/g/vQMzKp09JHYlUeES3sn6la4Z3EjVmSQfi
/7ydJcDAA388x7uYvKL+IAworDIDNlUZdWtmby9VQXbnTe9z8Zh+YmROQAKdcytz
Q9u8+Qo5EpJiM45n9Vzd5t6CdPuXHViJqsvREwC6VXqz6gdsgimuRZc8Epqgp4mj
Li5KprrP82L2nZotU1GfSPLVHjUG+v9u43tkxB1zUY/6gyZQeFYcIUzHWnNunkFl
1hBDcmDtNn8jQ4xnfDAYTFqTX+cYs+u6F1kiYYFuyeAPhzj/9ewOufedv8ppIvnu
zaHTvGI3WEmmg01ddtgAemrzTUiROw==
=E9wg
-----END PGP SIGNATURE-----

--Sig_/UFLoNUn3bPfxHBrObqHN=+p--

