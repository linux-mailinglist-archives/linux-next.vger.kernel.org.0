Return-Path: <linux-next+bounces-9532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7769CF1C6D
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 04:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8203016DEE
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 03:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E8631987B;
	Mon,  5 Jan 2026 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cCrUbzOZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A41A314A9F;
	Mon,  5 Jan 2026 03:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767585576; cv=none; b=WLs9vdSFtUQgA+739UhPCy5Pc80JooKIMQJkEMgyx6e/A3G1i/iHEy5o7+/w6/gVNl6gvpmZ3ouzzh1E/nfq24jJnhteXpnD9UE+Dl4v3/qewFXJCYFmr619FgtVKjiWbQho+QkoGpu2Iub0/51VcigxQVRrNZrMIVm0pA0rvwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767585576; c=relaxed/simple;
	bh=l+VPSILndeQHfuEwZe8q+EHsXabFKFn3otjAv3ZxFJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LYJdEubXCQDjeCdZRyHOGnNH3oUHq6cRyv7I0agJ0ARG2+y5za6afBj4K/B1ONzcsP83z0E2vt/yGAj3Mt2qEuXsW63Ltlg5pRRZTmoO4LhPmd/3kXTkWlNlhv657fHIJCt4Y9I47g8SBiEanLbzr++GAxoQDTLqHuqffRJh4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cCrUbzOZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767585569;
	bh=GfInJBI5d1ABe7ub0kHRVSQne9HpaFmdqNJZWYo/Ig0=;
	h=Date:From:To:Cc:Subject:From;
	b=cCrUbzOZx1nOFPqwhJZ+iMcUjd2mZS3+w6IW8TGabBpjoGVWon2UD+s+lPwpZYk11
	 8e3mzTOuo/Y8+KpeVtSjNPXfdMwHLkM8rXXY5QtRhMoRTlYxTrVdvKnvWxRrJrxN5g
	 2Fx3097rPfCFnqbA+3lMFZwE4IluPWKa0RKeR42y0teH8SzXgtnkK5tO3IzuXQDrgh
	 L7MXMAHFWK0MPpj53vuTNI5N66MXRmp6VdBqFnt39nVSVx57WJ+npejYgxVoHqzbN4
	 DxuzSvj34dPjy8ukYqUNzHIr3Dte7Jd+qHnkt2VVxiSJ0NLS2WpGomn4wtJuhqhTpm
	 TZpEZxD4LU0dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl0t86NDmz4wCp;
	Mon, 05 Jan 2026 14:59:28 +1100 (AEDT)
Date: Mon, 5 Jan 2026 14:59:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <20260105145928.2f78ad36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BhSS86Eg8iW7BqBrqndv49b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BhSS86Eg8iW7BqBrqndv49b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

between commit:

  393e132efcc5 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie =
phy bindings for qcs8300")

from the phy tree and commit:

  25671c378210 ("dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur PCIe =
Gen4 2-lanes PHY")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.=
yaml
index f5068df20cfe,82316aa5e15f..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@@ -178,8 -182,8 +181,9 @@@ allOf
          compatible:
            contains:
              enum:
+               - qcom,glymur-qmp-gen4x2-pcie-phy
                - qcom,glymur-qmp-gen5x4-pcie-phy
 +              - qcom,qcs8300-qmp-gen4x2-pcie-phy
                - qcom,sa8775p-qmp-gen4x2-pcie-phy
                - qcom,sa8775p-qmp-gen4x4-pcie-phy
                - qcom,sc8280xp-qmp-gen3x1-pcie-phy

--Sig_/BhSS86Eg8iW7BqBrqndv49b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbNyAACgkQAVBC80lX
0GwunQf+PHSizKaDH0jtYO0wuygPKAmtuWGaOloliFKkR9iBZwKFsPBM79EW1TQv
fevlgAylJsCZqykebtfrGPh3p3LiYvtxrARLMQYnwN1kNvOpWYVH0YvY2o7hCVGb
U5AGU+dQF3fKGmku8jkhmA6e0q6xxDkcnc9CUrmkULkHblR9sgG4Pnd+6yxPx/bU
PeoujNEdT+Rz95/2esvR2DA1s5ZkNmIrqzNlBVwWzd2TgMwcDQuUmK/7BiBvzgY6
AFRNveeMgpkmlMi9GmoI9rIJ4PmWPI5O/KaLE1fm1KhaJMRcE3BSX0afSxz5wgOa
jLRlfDBIs+BUJUrR5rP9bbWyHFrybw==
=ZOX/
-----END PGP SIGNATURE-----

--Sig_/BhSS86Eg8iW7BqBrqndv49b--

