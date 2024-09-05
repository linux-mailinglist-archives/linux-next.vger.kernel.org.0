Return-Path: <linux-next+bounces-3609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6196CF82
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 08:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38EEDB21EF6
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 06:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667F918BB97;
	Thu,  5 Sep 2024 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uNOo5RNx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DCD3612D;
	Thu,  5 Sep 2024 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518427; cv=none; b=Kt/u7Ksk/6b59Vpbh8osuTM5yf+w49SAo8vcNrEao7aB/exZs/k7shW97qak6xOfWXmVBFrZj6pOR14+fmFrpBLljkzm4UQYQS94MZ9Ynz3K3aO5ZKr6XygZd1DuAoV4CO3KV8T4fRuVSHUKoNHsBzLGumjpkB4YeVsMY51zLJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518427; c=relaxed/simple;
	bh=mZg95VM7BF60b0vm1tIB5yAQdeXTD1pMTShrRus8zp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sE5cSyLlQBIi+C6a27+q/CXP0ozW56Hx9fmhuM6TB/b2/DkRBjDu9Gf6nYH9qnecvJWDpqH5FiQVLaFe9kb5R05XdNqpWt1n22IZVYKJR5wUwts95O1rn1xWue7XS8bMAETIEH2WURHf3bErb12Et12vfNv0bct/7nB6oSngJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uNOo5RNx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725518420;
	bh=6VP7AomkR+7TeadwTXH8+CAmxhLwvPndDE5UlE+nsMY=;
	h=Date:From:To:Cc:Subject:From;
	b=uNOo5RNxaxm+2Bf55hYazStxaKq6Hxt2+vShF0ucCQICnJHE+RKVev18pCOnvb44A
	 NtYWZaoD3+ea7iNUQM7iZLm/rhKipSDLgpVFnpT1QeFL/BFplK1uVETNTsGJq4cAGW
	 YQoaflTjoY5oMADwf1ihQZIPanKEjXgTVL0AKrFlG3wTu7Y6+M7JNV4dd0TounkSoO
	 02963zi1SQGv4c/iOvMkPi9tZ56wIFux4+76JTNILjluvTQyWinP9ok4IAtSq1mrYZ
	 /hr7/PE7iODAPiRSO4q1mUFFQ2ppxQyxJNvFbkX5XGMvPJfQut01RgBUX7TV4GX7JB
	 YPmKToPSfX1cA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzqVX0kklz4x0H;
	Thu,  5 Sep 2024 16:40:20 +1000 (AEST)
Date: Thu, 5 Sep 2024 16:40:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devicetree tree
Message-ID: <20240905164019.5086e9b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jc_FKpbnaD=AYLnz6otH_Dz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jc_FKpbnaD=AYLnz6otH_Dz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pci tree as a different commit
(but the same patch):

 80cfdfeb8367 ("dt-bindings: PCI: layerscape-pci: Fix property 'fsl,pcie-sc=
fg' type")

This is commit

  f66b63ef10d6 ("dt-bindings: PCI: layerscape-pci: Change property 'fsl,pci=
e-scfg' type")

in the pci tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Jc_FKpbnaD=AYLnz6otH_Dz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZUlMACgkQAVBC80lX
0GwPpAf/bXIMkvO0IZT79AS7c6/pjVa4stGp2ZBPxg4qzis0YEJuWrUp2q3Hgvad
+4TQyuZHNJ/355O25jd7g6gN6yD018NSY2h5MduXsY/jQMlfB60rzGJA5ojPkirB
EKn3Io86tmRrCSTjPj3GTy4otK1dZ8roWxBt33OpBfydwpze5N0TOKV6d46u0DV8
sznp32edmAWC2+S3Z3E5J7fEykDweIAquNZFjJ9HCX1gBePK1FV1fBXD3DMJdqLx
VCJdt6CfKjYveqPNV4gsOWCYL9vCT/cMXEmlpjv6WT2Q7G5P2IaRyvxi4lFYVeSL
JyWWCsYWxCmOkMv6/tMF3851NpNpIw==
=9a9N
-----END PGP SIGNATURE-----

--Sig_/Jc_FKpbnaD=AYLnz6otH_Dz--

