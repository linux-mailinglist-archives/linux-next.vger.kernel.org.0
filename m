Return-Path: <linux-next+bounces-5924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCCA6B61B
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 09:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21C8189FFBC
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8051EE7DC;
	Fri, 21 Mar 2025 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="avrOojH2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5441C1C5F2C;
	Fri, 21 Mar 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742546167; cv=none; b=GMkJaeT6DQvSDbqriLNR/7kDoohYuIo08s2aFDeTDgNPDtpz4i3hMEbotXg2MvHpY9DLP3z49w7blCL1KCcdwjExaPWf/Nf86BXoMVKa3GQsIEK0K8s+omeDXCnLa1WEkciIommCncokwIXSkiHtIdl53oc5jBcMFK0F0BVs4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742546167; c=relaxed/simple;
	bh=kD4327qSJNc303P+MczvubdWUwyEuGWST5tT0GsJ2IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kuR2ujRgNKCwmf3HEJgoPmn8tmgfIPSd12q3uu3RPea1eB1uawd856ctJEtxdlJw0G4GJqVL1Rn7fDRGhDVEzMJ/DweC7ZYE+gBVjRiTGToiy3QMIFOxUKodgemicCvyZIV9fI3pZBrNd/Cr+Otoe9UYw5BNdFi1F3weOBnTThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=avrOojH2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742546161;
	bh=kD4327qSJNc303P+MczvubdWUwyEuGWST5tT0GsJ2IY=;
	h=Date:From:To:Cc:Subject:From;
	b=avrOojH2bso6CNLYPYftxPHZabiyn+6kmc/hhlatq0B2p2S2nBpyHaw8YnclApW5n
	 RbgjadnpSTOMkXrZ81u9ucylnbOUItrHc8YkFWj2Bn4qBgOI9XRvTC01rmoapYYnoL
	 52hbDe9E5/414tqPWaa3HK5iHLVMTapVw0IalYEsU6HDtneReDJYLmYQhKDe3w4cbp
	 CYSwqgVyWVI32SidmEIEwkads8fiSHs2bSmvX00jyw9s7pHMOMvkY+JgJakwbbBHCX
	 rqeC0D2cT+pGsE0Obqa+NHW20bc/MEdUl7XpysFtf7I+eThx5obWpv7/we7w9xTT5p
	 3UWpewm7mC++Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJwl52Ct9z4wb0;
	Fri, 21 Mar 2025 19:36:01 +1100 (AEDT)
Date: Fri, 21 Mar 2025 19:36:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250321193600.2bfe03bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qeY9vNVAVvWA9VTtAuNlkED";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qeY9vNVAVvWA9VTtAuNlkED
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

vmlinux.o: warning: objtool: iommu_dma_get_msi_page() falls through to next=
 function __iommu_dma_unmap()

I have no idea where that came from.

--=20
Cheers,
Stephen Rothwell

--Sig_/qeY9vNVAVvWA9VTtAuNlkED
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfdJPAACgkQAVBC80lX
0GyagAf/UpDeL4DuhUwnakj1KETluXImFdtmDrkrJSA9YZqUzCLj/GpDyI2TlwgH
V/lcjfM3NTAe8JuE2iu2MGWWWiOmS0C3w1JG4x6B4iLUsmr4BcWRaidYOHSuaxm6
YlPn+S9Iy+enWNqJvrzWoZossMuLrkmGijKfdPYdgI23U3SXYkqci2AXWj43jYP/
4+7rrMRTBZ5IKBg0idTTJjuuW535yd+82+3QJgEK5lIwKiVOMHy7QLM9ArNvceZO
68Ev0Hbst9gmJy8I1fuyYOlg0SHFk1r5jNPJlbQKq/JtvozWOOVOZGz2CsVMF4mT
MIKunBOzcpUDFZne7SOwSVERjrjbMQ==
=oiDu
-----END PGP SIGNATURE-----

--Sig_/qeY9vNVAVvWA9VTtAuNlkED--

