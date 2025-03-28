Return-Path: <linux-next+bounces-6052-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 560EDA7422C
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 03:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07AAD7A794F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 01:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E06C1C6FF8;
	Fri, 28 Mar 2025 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zr6j/xM5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF0189B91;
	Fri, 28 Mar 2025 01:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127178; cv=none; b=q6d3cXVcfH53LL3tszHUUe//F6cFjQs4BmJ+MFoyWHYkw0SAMNNDjs8Uc9Z3zcOSEpqaX1CaskZaRY2WC9Iw9hxCdYhC5en03JsE/lFK4iQxc3nQG+KgCEMf6IiivuwMF3h5IdBkOnV/6UNqmQoosxBJVT+4Gy7mkmwgQxiSVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127178; c=relaxed/simple;
	bh=h53gNow7zNag0auKs9fje8t6fMoKtAPUWcjpQ1qKgI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eoafAEnPKcxAeqjmbaDw4wNSRWtUO9k4pdcaUNSph/Y5BhTlIJANhqJksBLPTWLylusJfmTmZOmIbOIVoHkcoVJWwsR604D50M9uarHohE+PEwGOeCXZc8Hj32NAX9fvK1tZFwlpCEgWz9Ke16CH92En/5MrjyDgFWH35j9Q54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zr6j/xM5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743127172;
	bh=I2KurtP2vFyxuKvIdJhRk0/uFqRNHteULCvEDOApobE=;
	h=Date:From:To:Cc:Subject:From;
	b=Zr6j/xM5F/qprlb18TuPQMGjG2Ru2T+GPqbJ3ouh7frAr3v7bW/Mmz1hQrIg2RoZ2
	 QVUbn36sPCZ2hXOrrGcHlgi6l0p7jURQ3RdBAwdor9vqUk7W8N2dTVnqT8Iyf1CIgp
	 VQnVajYQqe9B6xohhsPYGZzuSP2yYjTr57ojG1gruWuIb+7C7mTomxnNAH3Nu/bI2x
	 eVVg8vax5J1CIdpgXTwkj3nLpBoLanSwYEjrT/VWznhkAxssMCbB6+hOOrYsVFiioG
	 KbajaI1Bur5iWohWmi0QUMsMP1NUhoAi2Q9FCctHn6xbxKMZEKRwcGFkZOLxVR9aif
	 wdQtzepAFyCng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZP3cM5cKHz4wyh;
	Fri, 28 Mar 2025 12:59:31 +1100 (AEDT)
Date: Fri, 28 Mar 2025 12:59:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20250328125930.4f8692b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/99llr.uA9IWapHH8ekPbabN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/99llr.uA9IWapHH8ekPbabN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the i2c tree as different commits
(but the same patches):

  01879dd3b07d ("i2c: amd-asf: Set cmd variable when encountering an error")
  04bbb78be54e ("i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers")
  0c5620203c08 ("i2c: amd: Switch to guard(mutex)")
  19f3af22ccbf ("i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers")
  1a32c37c73ea ("i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers")
  1a63160e0884 ("i2c: i801: Use MMIO if available")
  280deda134db ("i2c: iproc: Refactor prototype and remove redundant error =
checks")
  2951c695bf4a ("i2c: omap: Add support for setting mux")
  3c10f034fff0 ("i2c: dw: Update the master_xfer callback name")
  408fbbbbce6a ("i2c: mlxbf: Use readl_poll_timeout_atomic() for polling")
  470787fb5b27 ("i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers")
  5721ac2c5ac4 ("i2c: pasemi: Add registers bits and switch to BIT()")
  594f71eabcc5 ("dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C")
  646edba35872 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
  676bacdd6eb4 ("i2c: i801: Improve too small kill wait time in i801_check_=
post")
  6c47a63bddda ("i2c: i801: Switch to iomapped register access")
  6ef61d097224 ("i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers")
  6fc176e1830c ("i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers")
  78cc2f229e92 ("i2c: k1: Initialize variable before use")
  7a8c4bdbee5c ("dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible=
")
  813fe8a1c150 ("i2c: i801: Cosmetic improvements")
  85175a591d67 ("i2c: octeon: remove 10-bit addressing support")
  8b9de656fc8f ("dt-bindings: i2c: qup: Document interconnects")
  92a8d36abbd8 ("i2c: octeon: fix return commenting")
  9427b4680e0e ("i2c: qcom-geni: Update i2c frequency table to match hardwa=
re guidance")
  94505359bbf0 ("i2c: pxa: fix call balance of i2c->clk handling routines")
  992961d3a4b1 ("i2c: cadence: Move reset_control_assert after pm_runtime_s=
et_suspended in probe error path")
  9a3208cb7c21 ("i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers")
  9b982a430344 ("i2c: i2c-exynos5: fixed a spelling error")
  a20a217ac502 ("i2c: mux: remove incorrect of_match_ptr annotations")
  a41771366857 ("dt-bindings: i2c: spacemit: add support for K1 SoC")
  a516fd98fbbb ("i2c: spacemit: add support for SpacemiT K1 SoC")
  ad9769d81ac4 ("i2c: i801: Move i801_wait_intr and i801_wait_byte_done in =
the code")
  aff120a4546b ("i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers")
  b22c902580a8 ("i2c: cadence: Simplify using devm_clk_get_enabled()")
  b402ffba81ca ("i2c: Introduce i2c_10bit_addr_*_from_msg() helpers")
  b7fc85a98f96 ("dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c comp=
atible")
  c529a82a7f8f ("dt-bindings: i2c: i2c-rk3x: Add rk3562 support")
  c9a73204f14c ("i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers")
  d0120c8e9a5e ("dt-bindings: i2c: omap: Add mux-states property")
  e02ea71a6ff6 ("i2c: amd-asf: Modify callbacks of i2c_algorithm to align w=
ith the latest revision")
  eadae9e7606f ("i2c: octeon: refactor common i2c operations")
  ee280e4d4e6d ("dt-bindings: i2c: qcom,i2c-qup: Document power-domains")

--=20
Cheers,
Stephen Rothwell

--Sig_/99llr.uA9IWapHH8ekPbabN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfmAoIACgkQAVBC80lX
0Gz2cAf/eZv506xe2vKyxKJxwQPG3aeqCUeZVj/C8VndPBl/9TuFDBbHhst58WnJ
4ug/hoAf09HF+GfcMP0i8zIMY9C8f5NuT4A6EVrfvlo/rKUs3L/GgjYQsPFl/p/u
nexXhFgXNy+FNNEn4dhOHyLwvxzH3Ty0gbfLIO6hGjjifxBrn6MvVvov7DlaXtjd
+nKd93TGW9va9If9zHGuWxQ/dI1Nn+M3THztc1cP+86SqjGclbkJzcA8Q/sDRzeB
E2+gf2ZX6DP6p4IJY+zX2Yb2n2yUlu5eFKwlDYdYP2vpD24jkNpIF/HyF7DitLL/
iq3aMV/LgU+Iyaxp3be3Fm4bpTIDBQ==
=hfVy
-----END PGP SIGNATURE-----

--Sig_/99llr.uA9IWapHH8ekPbabN--

