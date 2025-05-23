Return-Path: <linux-next+bounces-6906-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A53AC1A5F
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 05:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50A0EA42CF3
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 03:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BFF220F20;
	Fri, 23 May 2025 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y6SM0pXE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D86B2DCBE7;
	Fri, 23 May 2025 03:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747970633; cv=none; b=WsSkfsec3rGHWdekb0zulladqYXZU8hP7lrHpd4ya9MC8I3l/kvuyvKQVG8HCYaPiyebh0ugW23i9iyyFKiK8l0Yez/YvndVwKcCd7+0PNRtotJkmhsby2oTUF2/uM+MjNSUPzEQYlr4Puf5KDRksRFDvjv8rDYlCBvv89WLRyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747970633; c=relaxed/simple;
	bh=iyWz/fXuH0R7TlOwsw4fx5qxRfUBjcvlYeTAUH0oq5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kmSGqYkwLQWYlNOaC/fznc3s+VyWItB1HLcPm8HawBzF22v+1W4cMyZI3hL3fg/GoaAG+tqzOU1B4BWZlvMlSpGqDNLm/pG/JUXcWWAfU+1HGdoCmHNOEiN4GqpC2wO8+zPuU9R+EoTqe6+0GPMShkp/IMtVcFvHkIFj21qGYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y6SM0pXE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747970625;
	bh=eBuTKXWoJ65Z6cyACn+klnCL2HucQeD9omFwYBo3AyY=;
	h=Date:From:To:Cc:Subject:From;
	b=Y6SM0pXElwt89qEX1gwhZKE6BemeF6c65ZYX0wGdajOrhilDTtGR4o40UoqdRt9AM
	 9REZtfmqpzIYzhg1CNUVM/dU46P4o/U6RRMkIMf2WKscORwMoyaNG9PyJlxjamMGRC
	 e1O4Gl82CTKVqkmUOPv8DFqO7JhFemkp56Xf7FRwL/4r9ayEawPl0ar2jZUY1FarIj
	 8gcU3hq/WMaaCmCjYz5Tsxi25BMjwc4greC9nzkUjXb4dGW6Qp4QrxvYHPH32UZmVG
	 EjqkGXCcNNT/MT3cEgtzr1rG697qgefWVF+TwLynuLnsbztNaSrl7ZOhPnj1Acsbzl
	 KheN6i1bOWvWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3Vqh5mTYz4xfH;
	Fri, 23 May 2025 13:23:44 +1000 (AEST)
Date: Fri, 23 May 2025 13:23:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Philipp Stanner
 <phasta@kernel.org>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20250523132343.6f33b625@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ADs_KDf/ECZz2ci6q1vhCHu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ADs_KDf/ECZz2ci6q1vhCHu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/pci/pci.h

between commits:

  51f6aec99cb0 ("PCI: Remove hybrid devres nature from request functions")
  8e9987485d9a ("PCI: Remove pcim_request_region_exclusive()")
  dfc970ad6197 ("PCI: Remove function pcim_intx() prototype from pci.h")

from the pci tree and commit:

  d5124a9957b2 ("PCI/MSI: Provide a sane mechanism for TPH")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/pci.h
index e39a2a5df587,39f368d2f26d..000000000000
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@@ -1105,6 -1059,20 +1105,15 @@@ static inline pci_power_t mid_pci_get_p
  }
  #endif
 =20
 -int pcim_intx(struct pci_dev *dev, int enable);
 -int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
 -				  const char *name);
 -void pcim_release_region(struct pci_dev *pdev, int bar);
 -
+ #ifdef CONFIG_PCI_MSI
+ int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 =
tag);
+ #else
+ static inline int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned i=
nt index, u16 tag)
+ {
+ 	return -ENODEV;
+ }
+ #endif
+=20
  /*
   * Config Address for PCI Configuration Mechanism #1
   *

--Sig_/ADs_KDf/ECZz2ci6q1vhCHu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgv6j8ACgkQAVBC80lX
0GzuFAf+I4NsjHtzzXHUpckyCMm7E44o1YLUDyJUsLxQXoe10a3m27c24QIs+Uht
otilrA43ltv/dZrST9bCF91pKQZHuMn0a393uxS22LfLvJgUKyLpHP0QwDQUYlsu
Om+OoAqWcCBP7eAlY8+hq8EmMDShknVPgeB9Mwviu08z4JbWlFNMVsGiKN7JJyY5
9iCPSVzOA9z/oqpocee7OtRGikZSEa0HZArl3acxU/t1N5RDspz/UN6AWIWHusiu
xgcUuh3J5sFEMot3eBXNJlD9YobK2gnKujwOR1p5YW90d1zgVhQcPClAbHnNPZDC
USRwLVT+00Bo+qXhIUeDwj3YSuYBSw==
=afDw
-----END PGP SIGNATURE-----

--Sig_/ADs_KDf/ECZz2ci6q1vhCHu--

