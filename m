Return-Path: <linux-next+bounces-6141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9674A7878B
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 07:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013423B0461
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 05:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626EF22DF95;
	Wed,  2 Apr 2025 05:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N3XvSXyZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2378F44;
	Wed,  2 Apr 2025 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743571152; cv=none; b=WRpis4R2F+Yo3WdY7q8qpl8NsYZ8vgTS3xsCtqTL4DtOruwXlaMK5krSNuqOG1qXwjMAoo45miqH3swtfbl8ltjxkIEY3vula67m0N1GFzIKgoQkg7+9yKU4YB1rroVdmnZr87FVfygdG+VoLgoJd798Zo6DYroY8gJSFKR/7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743571152; c=relaxed/simple;
	bh=XYSqCbNRJ2hKKNFJDC7GTVqqCmHbhQJpw+cWZziAPYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afRyJrjbtOyQb23vVLgkZO3q7KgeAjXLIyOALzwZwT2u9HU4N2oqHOAVJe71ONCMwvEM1zwhHzSr06CmIrwRnZ4JmhThq0tKb/gwE4Uost/NybACnm8ttPiTtnIrBc5cQjsb9aJkzEc0lRv92LIRG6kdUSb1XMzumz3OEDcMfVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N3XvSXyZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743571146;
	bh=DUywMIQTgFq7UMpT2kA4bzcONBgyvQhJxP9y5c8jtO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N3XvSXyZuzW4HgO0C/EheyR5Bwg2hKrhUHcg9R0mtbUWIes9g05SzvPtZ9FakRwf4
	 L5uLyksmWwuMm6b5ZxJxTiYs4AZyHiMthrEP1Zo/8ebH6bHItoedf6ZtdWVydIcspH
	 dB48szeXm7pcAdDPhsRHpkjjFZa8miTqpsfOAarlC4Kb76IKAJ1UXGfOhZn9vy2Pm3
	 bTE6MHiMF1o7sg3ZP6phzkH1jofTGC0K2cxFsEhWnE6q0/8sjfiMexRtqZ6a8sJKrn
	 Bkk3bmrrfyldeDG2Oe38IvyhMK63y1qg0q7w1hfIu0kX0yhA3JobPw7eMfzgybr9cs
	 JJcJvdgVmrdvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSCpK63YMz4wbv;
	Wed,  2 Apr 2025 16:19:05 +1100 (AEDT)
Date: Wed, 2 Apr 2025 16:19:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20250402161904.2f36f59f@canb.auug.org.au>
In-Reply-To: <20250328125930.4f8692b1@canb.auug.org.au>
References: <20250328125930.4f8692b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t2hIsr+T.JhK_o025H.SDNQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t2hIsr+T.JhK_o025H.SDNQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Mar 2025 12:59:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the i2c tree as different commits
> (but the same patches):
>=20
>   01879dd3b07d ("i2c: amd-asf: Set cmd variable when encountering an erro=
r")
>   04bbb78be54e ("i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers")
>   0c5620203c08 ("i2c: amd: Switch to guard(mutex)")
>   19f3af22ccbf ("i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers")
>   1a32c37c73ea ("i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers")
>   1a63160e0884 ("i2c: i801: Use MMIO if available")
>   280deda134db ("i2c: iproc: Refactor prototype and remove redundant erro=
r checks")
>   2951c695bf4a ("i2c: omap: Add support for setting mux")
>   3c10f034fff0 ("i2c: dw: Update the master_xfer callback name")
>   408fbbbbce6a ("i2c: mlxbf: Use readl_poll_timeout_atomic() for polling")
>   470787fb5b27 ("i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers")
>   5721ac2c5ac4 ("i2c: pasemi: Add registers bits and switch to BIT()")
>   594f71eabcc5 ("dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C")
>   646edba35872 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
>   676bacdd6eb4 ("i2c: i801: Improve too small kill wait time in i801_chec=
k_post")
>   6c47a63bddda ("i2c: i801: Switch to iomapped register access")
>   6ef61d097224 ("i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers")
>   6fc176e1830c ("i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers")
>   78cc2f229e92 ("i2c: k1: Initialize variable before use")
>   7a8c4bdbee5c ("dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatib=
le")
>   813fe8a1c150 ("i2c: i801: Cosmetic improvements")
>   85175a591d67 ("i2c: octeon: remove 10-bit addressing support")
>   8b9de656fc8f ("dt-bindings: i2c: qup: Document interconnects")
>   92a8d36abbd8 ("i2c: octeon: fix return commenting")
>   9427b4680e0e ("i2c: qcom-geni: Update i2c frequency table to match hard=
ware guidance")
>   94505359bbf0 ("i2c: pxa: fix call balance of i2c->clk handling routines=
")
>   992961d3a4b1 ("i2c: cadence: Move reset_control_assert after pm_runtime=
_set_suspended in probe error path")
>   9a3208cb7c21 ("i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers")
>   9b982a430344 ("i2c: i2c-exynos5: fixed a spelling error")
>   a20a217ac502 ("i2c: mux: remove incorrect of_match_ptr annotations")
>   a41771366857 ("dt-bindings: i2c: spacemit: add support for K1 SoC")
>   a516fd98fbbb ("i2c: spacemit: add support for SpacemiT K1 SoC")
>   ad9769d81ac4 ("i2c: i801: Move i801_wait_intr and i801_wait_byte_done i=
n the code")
>   aff120a4546b ("i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers")
>   b22c902580a8 ("i2c: cadence: Simplify using devm_clk_get_enabled()")
>   b402ffba81ca ("i2c: Introduce i2c_10bit_addr_*_from_msg() helpers")
>   b7fc85a98f96 ("dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c co=
mpatible")
>   c529a82a7f8f ("dt-bindings: i2c: i2c-rk3x: Add rk3562 support")
>   c9a73204f14c ("i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers")
>   d0120c8e9a5e ("dt-bindings: i2c: omap: Add mux-states property")
>   e02ea71a6ff6 ("i2c: amd-asf: Modify callbacks of i2c_algorithm to align=
 with the latest revision")
>   eadae9e7606f ("i2c: octeon: refactor common i2c operations")
>   ee280e4d4e6d ("dt-bindings: i2c: qcom,i2c-qup: Document power-domains")

The duplicates of all the above are now in Linus' tree.  Can this tree
be tidied up, please?

--=20
Cheers,
Stephen Rothwell

--Sig_/t2hIsr+T.JhK_o025H.SDNQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfsyMgACgkQAVBC80lX
0GzWtwf9ElDdDC66HlERNrU8qVE27BYJN1BT3HE2wIf76F3wpZqmItAZZXzeLmLG
+tpgQh452UlCkBIlAYZ4oXJkFPKgL79k3lrJ2yDbWu/vxK02doV6D0zvpDTmNERE
JTzKwCcZqEdzLKqicuAajOdABcdK7F5Ym7bKu2rp8xn7W30hSxJVwXkBR+3/gBiF
68B6nQNP+CdbUZ49QRgAyYnh+RVihhhFeaJ65RRW9uBpCiiueU7cH3BE6wvT7sZU
TU7oMA0EQKtDyZM+HUwjyBc+PZF/ksmL1SFbFtVlR26V5Ra4YV+Edv41ZbAGuFtO
EulgnimKaSRtmQ+VtZkDSg/+0zPcgA==
=zPOk
-----END PGP SIGNATURE-----

--Sig_/t2hIsr+T.JhK_o025H.SDNQ--

