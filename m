Return-Path: <linux-next+bounces-9523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B22CF187B
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 01:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D040B3009F9C
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 00:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5F91E3DCD;
	Mon,  5 Jan 2026 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D6LIEFjc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E619E96D;
	Mon,  5 Jan 2026 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767574566; cv=none; b=BD8H0UPqmjGjJzX9g0t4S/cUPrqoT0ixbBLQxzgNK5XV1MZqV5GVTwbrGKnuXkk9t96+QLw/YX3gh2NkQ4MiS/Qfrkr4152z1AP9Ts0HgU7mFkbhgtCffgPHfckrgxMO1e3EqqLpwk793TiSuCuEtYKsVS/3AeiADgEy6tm/2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767574566; c=relaxed/simple;
	bh=+Y7QXTSq2jnojiQDu28CfvWPJpSrg/LqqUd1YOFUD8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dlY6sWnf5nbXXauuPWCjqGk5JKiD2zaW4EOnjY5ynfAasq574GuXbnuwcNcqzQrT9MxNXXatV+26+SvVe88ugBh+xEW3xwY1+bsL498jZSdhnruX1OKZmmgqVs0mgN5J2vAMRMaY750sK54/jGWk7zg+yFoKb6z6pyn892cvC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D6LIEFjc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767574556;
	bh=d3sqkw7mMZ+VbFKsBGA27HMeaRn/vojoxnZoDEDsFk4=;
	h=Date:From:To:Cc:Subject:From;
	b=D6LIEFjcZzekFsg4YzdZs2eeoJuijPofE/uOxJSh51al4rpTF5N2GjQM2q6aWrIkQ
	 MMa7LP9wm+0Z26fuZGR3+s5yFRXLyQQMhY2BGs9xTF0eAiQn/LQ0i/zAAfLqcxpzWt
	 Y1traRH4cYXB3GH5hdoG4etkcV8YZvDUwL4zxha3BpjGiRZOoRGpP8Y1HAqc84UsNG
	 419fbgfY/um+ItICQgPzGEpsbzKzw5BUieORhe4ILWEV5AAEVwpLxFpqzpcW8atv7L
	 4LJx8f0rGq/Svq6/zPXcKp3PK+nFsV07MWMZRQB0jNfhXMAnpzFmHgPZ3wiYCwcu0y
	 tGyzmIC8sjPlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkwpN1VzQz4w0Q;
	Mon, 05 Jan 2026 11:55:56 +1100 (AEDT)
Date: Mon, 5 Jan 2026 11:55:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Qiang Yu
 <qiang.yu@oss.qualcomm.com>, Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Message-ID: <20260105115554.1afe97ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V_Jub4RPSqwxbHRkMJVR+L9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V_Jub4RPSqwxbHRkMJVR+L9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/dwc/pcie-qcom.c

between commit:

  0cc13256b605 ("PCI: qcom: Remove ASPM L0s support for MSM8996 SoC")

from the pci-current tree and commits:

  7c29cd0fdc07 ("PCI: qcom: Remove MSI-X Capability for Root Ports")
  6a1394990902 ("PCI: qcom: Remove DPC Extended Capability")

from the pci tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/dwc/pcie-qcom.c
index 5a318487b2b3,9b7cffc891d3..000000000000
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@@ -1315,8 -1317,9 +1316,11 @@@ static int qcom_pcie_host_init(struct d
  			goto err_disable_phy;
  	}
 =20
 +	qcom_pcie_clear_aspm_l0s(pcie->pci);
 +
+ 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
+ 	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
+=20
  	qcom_ep_reset_deassert(pcie);
 =20
  	if (pcie->cfg->ops->config_sid) {

--Sig_/V_Jub4RPSqwxbHRkMJVR+L9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbDBoACgkQAVBC80lX
0Gxtvgf+MX8e3Kgb9jZb239q3mVRoGEui9hI3t/T0dC1tIfPk2ner1ALCbTAID8O
dRW+0xVyVtQFIxOyE//kqNnVj2PFxPv0CkUlsteXEMzlxtSDhffB6n7L66nqOpvV
67ploh/ieJq4HTq2kqaPO9HmZwz/2R00lD9V/BlOpfRVHQmBIJ2vIx4fmBP6rC1V
vZKQ6IWVQXLvSwgpYMLHpWyiHlwroy0CdQj/nDJBbnbxL7J9yXqeAABMSp9LzO9r
o3gAUdoF4564tamdjLqlPreDT6zmm5hT2rQs9kqQ3sLYzq5Ewb7D9u08+8I3U7OS
tEgpURoYmAPCpM6s8U5V5MKdwLpeBQ==
=kx+0
-----END PGP SIGNATURE-----

--Sig_/V_Jub4RPSqwxbHRkMJVR+L9--

