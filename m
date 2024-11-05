Return-Path: <linux-next+bounces-4614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C429BC215
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 01:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FFD1282CDC
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 00:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195F7BA53;
	Tue,  5 Nov 2024 00:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RbhQPJmK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308B1FC3;
	Tue,  5 Nov 2024 00:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767270; cv=none; b=YU1BRpWxrFbQcCgk8UCCSqYj0cSWHrJX5qefW6eXJM97jDsQ1k7PYqam//tGpGcCK7dcMROh6EdxruCD9a4gjGpV5MAxX68ctoeagJVy+gpaEppJIYwwVqjD0WO7hje5veyP24n1QrKSLURTU2PPZEW6D/VnIlmK0QfuiqtF7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767270; c=relaxed/simple;
	bh=mPdDfCpngc6bKRwCJVIyx84h/ef4rxx6rsJCP1SL5TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Byhl6D/c2xskJkc22r5aYHUInzR4rcnW9mrPitg/gjQC/Du+VTYb4JeIulN2jwPme0uYG9or5IAtNMtFlrFzRAoLmnI5JYt/mAvfSXsKq4D7uEvtgKo1x4wyEUR/dm4MHZ8W4CqWLw5q5NHNo67bdFgNsehPepgrHVdJUKz8QAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RbhQPJmK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730767260;
	bh=rdYDPfkkpkH+F5nwG52ouQQ84vhjm/eoeUegPcCquPE=;
	h=Date:From:To:Cc:Subject:From;
	b=RbhQPJmKQjO5Bz6/K+GDAXr4lCxN9Tq38yKgb8DoeGh6Fk1I2LHrlLQ+IKgVtooBf
	 YsU+Ft9v4TjzYwPTPKCmRnvNOEXgmUD3RpHOeagi8tGNSNF1Pdh+MApMxU3dWbgxCj
	 C+AmzTwXvYV341Ve3KGWLoLWta89Rdf6flj4BlnMdenO9bgXIEzaWUxtfnG60q3QaC
	 W0cGggJu5oeMkDUw4UCFjA8HvBX7ZnqW8ZEhtrByZ+9gvuIlCfDtm8X1Dlvq0HPcQG
	 QXITr5lFZlqfnrTihjfifyClJH9VWVrLTXtgVIKf2WVh0F5aWJ+DG5sKz9nTaveliA
	 H/VAUE/w9tyOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xj8dl52MPz4x04;
	Tue,  5 Nov 2024 11:40:59 +1100 (AEDT)
Date: Tue, 5 Nov 2024 11:41:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wei Fang <wei.fang@nxp.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20241105114100.118bd35e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gDQ=/C39ZeLwnHK+QSskU0+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gDQ=/C39ZeLwnHK+QSskU0+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/freescale/enetc/enetc_pf.c

between commit:

  e15c5506dd39 ("net: enetc: allocate vf_state during PF probes")

from the net tree and commit:

  3774409fd4c6 ("net: enetc: build enetc_pf_common.c as a separate module")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/freescale/enetc/enetc_pf.c
index c95a7c083b0f,a76ce41eb197..000000000000
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@@ -1277,12 -1024,7 +1015,13 @@@ static int enetc_pf_probe(struct pci_de
  	pf =3D enetc_si_priv(si);
  	pf->si =3D si;
  	pf->total_vfs =3D pci_sriov_get_totalvfs(pdev);
 +	if (pf->total_vfs) {
 +		pf->vf_state =3D kcalloc(pf->total_vfs, sizeof(struct enetc_vf_state),
 +				       GFP_KERNEL);
 +		if (!pf->vf_state)
 +			goto err_alloc_vf_state;
 +	}
+ 	pf->ops =3D &enetc_pf_ops;
 =20
  	err =3D enetc_setup_mac_addresses(node, pf);
  	if (err)

--Sig_/gDQ=/C39ZeLwnHK+QSskU0+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcpaZwACgkQAVBC80lX
0GwOFQf+KU6hgL1u0134RRwL59L4v0RtCKHSTOter878kRyu5+Q3eSpNpiU1WWKg
NTAXmTOHRDeWm4cmtYvRs5o3/vlTNWntKsyxuJylZr0tU/7QWhEaqBY+4swd4QJ/
iYBjsOuxz/RyKYa5C7lBlGRNfSg3vxRBLmNsbyta5my1MBfbkixm/OFxU2t3JARz
WBtDZ6BEpyexD0toPkgQqjcPT+/7iAPSDG0Jajg3LLqdxOeiJpIRMmKQknHOBcnF
lUp9yBQ3IXhJlocn7+X1IU6n86i7JBE5c8nCEY+9xpNgkfKbdrxS2jOGNUcJTNuw
UG6isrdHEDtcVN6J0ABrB3IN4b76gw==
=vrAv
-----END PGP SIGNATURE-----

--Sig_/gDQ=/C39ZeLwnHK+QSskU0+--

