Return-Path: <linux-next+bounces-6510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A243AA8A10
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 01:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 282F51892A72
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 23:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DC3197A76;
	Sun,  4 May 2025 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j9GiojF+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A846F17A31D;
	Sun,  4 May 2025 23:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746401912; cv=none; b=D8a0p+JK6qa1Gn7esP1fY+5rbEU9cIz282ceej+BAtyGm/dkYUDsNt5thLLKa+rtNNW6/dcMkSdLQlc/PFs2vzH+EZvi3oXVheeK5GKSXIZ9gk/81aRGKceQvCcpwbaKrcD0Eu8WP2BqkfkKA8YvwU0oOXs9duafOYIFTfpO/ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746401912; c=relaxed/simple;
	bh=vrphGDl/y7/iEIu4rfgiaAktIP8GL7K1CsH2nW/CGlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DsWFBH0mVfK7PH9oLxqvzjuTtPw5YQ6bBcoYZ/aKnai3ipb94SaO5A2ccFznRORs2CerwDjvhzytPvKTzc0b2ccR5flS2oU16/GKmuCUlFxNR7BijcLSyIccYXGLEl4M/AsKQlDnFb1QA90J+NrYYXoLMCtgD59oaMmNn2NNp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j9GiojF+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746401902;
	bh=u2i2BIqFit/Wwnzz8waPFlwa5pIfJgrzIQEOFxRXUZs=;
	h=Date:From:To:Cc:Subject:From;
	b=j9GiojF+g5bPm5PCs8cI/yzbdsfAlHOkQdxR7w9IkBXAkj4EFf+2QphjJR/ZfI+r3
	 UMG2Jnbvo9HAVR3r1y74GCTMCgfzxd70AFOhz6FFGcqZYuoEabYchOkb+Dl4qjUR7Z
	 gojkdRYjpz2s2e2RP9aBLYrlCxdJ7dIHM9/1mn9/48Ve8AYauilZDhJ/EbONfdGzpW
	 FIkeocDw4KQ/Uch+k7bOQsIg4+ikii/Q8RDxHQk383Kcgzx7WoUNKK2/n0ZpWSK9u/
	 uFCw/01TRsUzSsd3+VNdlMbs1XP2o9C+kCyHUQ/riGfgtBxdLBSI4lSzPgkvKGYenr
	 YUh/Gl79EaUQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrLgy4FvQz4wnp;
	Mon,  5 May 2025 09:38:22 +1000 (AEST)
Date: Mon, 5 May 2025 09:37:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: linux-next: manual merge of the pci-current tree with Linus' tree
Message-ID: <20250505093759.4b88323e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OCSl5IDeyrjOmuU2yPMDlAR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OCSl5IDeyrjOmuU2yPMDlAR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci-current tree got a conflict in:

  MAINTAINERS

between commit:

  0747c136753e ("MAINTAINERS: Move Manivannan Sadhasivam as PCI Native host=
 bridge and endpoint maintainer")

from Linus' tree and commit:

  69dcbfec5f02 ("MAINTAINERS: Update Krzysztof Wilczy=C5=84ski email addres=
s")

from the pci-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 51b64cabe308,ef64f4bd2de7..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -18763,8 -18632,8 +18763,8 @@@ F:	drivers/pci/controller/pci-xgene-msi
 =20
  PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS
  M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
- M:	Krzysztof Wilczy=C5=84ski <kw@linux.com>
+ M:	Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
 -R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  R:	Rob Herring <robh@kernel.org>
  L:	linux-pci@vger.kernel.org
  S:	Supported

--Sig_/OCSl5IDeyrjOmuU2yPMDlAR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgX+lcACgkQAVBC80lX
0GzM+gf/ZdM+LDjf5nwY5QKqApcerdAtZkMKRtomiuj2Fjglq+Z4JSX2Y8DbCwE/
6+3/QvsXOOQMC5P1RhuRnEaE+TOEONmY3CnldOgGKB83LqhrcSPfDz6ONPN7sHya
d8paVJu/6E0SB4cIP0kHlBMMV4zxRZHju/DU2pD4lqMACnuEyKN3rAMRmv0zRQLp
Ui5zky9NvZi4PjDJxSbqabSs19xn7j11qcdPYpD7jEsr2CkLWbhnpDqe8cXe7gPa
OVOsBQcZdcsjeajrHvAgCJpmLf+wu70HRsCxP9e8KleIl9N2gQg2EfAkwg9491vk
l+1LZlAntp1ROa7MIbqN9lFwb04d4g==
=R7ks
-----END PGP SIGNATURE-----

--Sig_/OCSl5IDeyrjOmuU2yPMDlAR--

