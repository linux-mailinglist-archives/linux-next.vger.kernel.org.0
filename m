Return-Path: <linux-next+bounces-9230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 406BCC8C62A
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 00:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AF6F4E1243
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 23:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9112E1EE7;
	Wed, 26 Nov 2025 23:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c2PbA3JG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5F29BD85;
	Wed, 26 Nov 2025 23:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201001; cv=none; b=deehf7YsitC17xebO4gFoLn1eTiSBoipfYo79EIKuKJYY+xnKvRa7lwtHUa9xVuWIsZQ9V59uEdn2geU+8uvPjplt/3VlukP4HQaPGe+9RYDNKu3g2GX423n8teujzKpgqfnafUePoH970uaPGEmoMsnGTyJnqynemKjhhY/X/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201001; c=relaxed/simple;
	bh=QwhqL1yTFD0oDmf0n1qAwh9f2vDBye+JKNGUP53n4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FAx+lAGM61GuEFCYpf6hOnFN71PdOZ8OO/0d9V2u09hHr5PSvS4viGpflSZN03ukBfM1vDDm7w1BBL1ghe60u3/QhVnIkpPnpZ3llXQsYIgbZ6JBKvAx49ATdEJtqA6COvTKlj5YVeebY+K173uKBF8PuJ+laJk2TOQQAZUdFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c2PbA3JG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764200996;
	bh=ZW8FrOVUfg1g5KIWoUueYyS/5Uva/e1zBXxqFYM9yzA=;
	h=Date:From:To:Cc:Subject:From;
	b=c2PbA3JG/bP3zYwnZI0xSJrVDHdrff7IabGClUXhyIVPF+9J5R2ACcdOy3QG68Cas
	 gyqGwBX4JkCDwx9h0ZSIcZhmny8HIF6K4p5Gyx0ZtyaIK9z5a2xod98eve8/W0AmDF
	 0qQjL+KcjMNxteGR/2XB2Y6IBPXv0t2JP+lP9H9556yctddfnsG+4bSB9l9yWFchag
	 PtmxqNIxyjze9YDBEvSU/yFZpzvLS6jyCa98HWMHQaNkLhu5PGUcTt4NIzRoRtcLDg
	 jYURQGR4yfAk/QrLueuwB7V86bsEmdhKdC6VYj03zigPoNiY9AC8Z3blu7rwNBnxKE
	 DWNRqmik4IK2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGxBD25Ndz4wGt;
	Thu, 27 Nov 2025 10:49:56 +1100 (AEDT)
Date: Thu, 27 Nov 2025 10:49:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20251127104955.7e0086b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tMxMBruae.XKFEvZLQPQtdf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tMxMBruae.XKFEvZLQPQtdf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/dwc/pcie-designware-host.c

between commit:

  a1978b692a39 ("PCI: dwc: Use custom pci_ops for root bus DBI vs ECAM conf=
ig access")

from Linus' tree and commit:

  3445d3820770 ("PCI: dwc: Implement .assert_perst() for dwc glue drivers")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/dwc/pcie-designware-host.c
index e92513c5bda5,cac1aff84e94..000000000000
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@@ -840,34 -843,21 +841,43 @@@ void __iomem *dw_pcie_own_conf_map_bus(
  }
  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 =20
 +static void __iomem *dw_pcie_ecam_conf_map_bus(struct pci_bus *bus, unsig=
ned int devfn, int where)
 +{
 +	struct pci_config_window *cfg =3D bus->sysdata;
 +	struct dw_pcie_rp *pp =3D cfg->priv;
 +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
 +	unsigned int busn =3D bus->number;
 +
 +	if (busn > 0)
 +		return pci_ecam_map_bus(bus, devfn, where);
 +
 +	if (PCI_SLOT(devfn) > 0)
 +		return NULL;
 +
 +	return pci->dbi_base + where;
 +}
 +
+ static int dw_pcie_op_assert_perst(struct pci_bus *bus, bool assert)
+ {
+ 	struct dw_pcie_rp *pp =3D bus->sysdata;
+ 	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
+=20
+ 	return dw_pcie_assert_perst(pci, assert);
+ }
+=20
  static struct pci_ops dw_pcie_ops =3D {
  	.map_bus =3D dw_pcie_own_conf_map_bus,
  	.read =3D pci_generic_config_read,
  	.write =3D pci_generic_config_write,
+ 	.assert_perst =3D dw_pcie_op_assert_perst,
  };
 =20
 +static struct pci_ops dw_pcie_ecam_ops =3D {
 +	.map_bus =3D dw_pcie_ecam_conf_map_bus,
 +	.read =3D pci_generic_config_read,
 +	.write =3D pci_generic_config_write,
 +};
 +
  static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
  {
  	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);

--Sig_/tMxMBruae.XKFEvZLQPQtdf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknkiMACgkQAVBC80lX
0GxUmAf8DQWL2bBe7pl4QFJboMbx4OL0fcMInUDregnO5H+zx3XMHu+T8rvygs/x
redEERYEQcb2emRj6UBhnEduGZFFr3ggiiJpZtbm4L6LM3EdG+sEduiCK7Nq+FLQ
CSrqFdXWGgPLMaZFvr9t53BKr5WThkUoz1eGZ9Xe2sbKryS1ZRWt30XrVUWD5Xgl
Ge8kGc7G2DdLX19l0yjf6Y3I7O2RkaLV6De+mK34Fc2Xn30rzjdoN5JYwU2P8Wvd
LJcErcfLx2ZRRcptMFaadZ0cYHBhFZVFAGu0RDS5KSi+ba3MozqRHvlMyqA+uKmD
ATACP1dFtpQlseBJJJDjf6qwJiRlzQ==
=K7RF
-----END PGP SIGNATURE-----

--Sig_/tMxMBruae.XKFEvZLQPQtdf--

