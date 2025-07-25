Return-Path: <linux-next+bounces-7712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645DB115C0
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 03:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CECA585BC2
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC2E1DE2D8;
	Fri, 25 Jul 2025 01:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UUR65iHI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB032B9A4;
	Fri, 25 Jul 2025 01:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753406520; cv=none; b=K7aZiRKZH9hhFEuu0H9NZ7yIG8UtzSy9Mz+fZWkJCZT4wBDpBt9d1nM4RteUEdq3lVGTkDeRXO5b81xmybh2U+YBiomxHTAKF7oHCRuCawWW4Vxe+TyUo11ygBMtC88aoZib03EQlKkXOpCLN437bDhhyg0nyV3Kr4Aml807GBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753406520; c=relaxed/simple;
	bh=a64Nlreg3EFRWT0iwq52KTZxDycBriYfWDiHt/Q4GtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jSJwJ0LNfqrImLmq8qRdkuBMq3CZd6vZNXZ1tT7RfHWrdWsYP2oJYSLxUr//Gx7AtnabA5Y/pWmA2vcpGSfd0F8Fh0+aablJIPviAZSJDgD7qsJB+y4F0GMeZziVZvghkxgcK055C0zlcv9i+HBYd8etRyxuC//QmDQb6BB8kqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UUR65iHI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753406335;
	bh=MV4A8Nf4qSUgF3poJHBdrZQqJXGzedWOrRVchFfo0+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=UUR65iHIXZWIlR2Yo6wOdM3GeGzPfb2LsLhFW/pM1MeD60AnQQFjg5Sb1/pV21O1q
	 C1K9FtRp+E4IIosor1eEW67f7vApCebq9bkk1x2XZh4LRGpH3k7NxsyKv74/GBrLid
	 53G5vlb60s+l7B6LF544N9T/bphnpcH3fgAw1TSQBxBWugIFzWGtuACHdihn+1vTeE
	 bI8OETrNlTdjOHFN8tcvqIH1AULv/MaNdrp7F0DHyIvMctfyNWOnjYjeARpgGzzXC5
	 yzX6uUOOvH2Y/J8NUCsmePVPzuq4hSBJzYwV/bVhf4RY63XMDQV87ysd29XlLgx114
	 BjZUInJiE61Iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp94Z5tFgz4x11;
	Fri, 25 Jul 2025 11:18:54 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:21:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Sean Christopherson <seanjc@google.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20250725112151.599e12b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t7eBgaqwcgw+a5tKOyCNQOy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t7eBgaqwcgw+a5tKOyCNQOy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pci.c

between commit:

  907a7a2e5bf4 ("PCI/PM: Set up runtime PM even for devices without PCI PM")

from Linus' tree and commit:

  5c0d0ee36f16 ("PCI: Support Immediate Readiness on devices without PM cap=
abilities")

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

diff --cc drivers/pci/pci.c
index 9e42090fb108,fbe1281073aa..000000000000
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@@ -3266,10 -3209,6 +3209,7 @@@ void pci_pm_init(struct pci_dev *dev
  		pci_pme_active(dev, false);
  	}
 =20
- 	pci_read_config_word(dev, PCI_STATUS, &status);
- 	if (status & PCI_STATUS_IMM_READY)
- 		dev->imm_ready =3D 1;
 +poweron:
  	pci_pm_power_up_and_verify_state(dev);
  	pm_runtime_forbid(&dev->dev);
  	pm_runtime_set_active(&dev->dev);

--Sig_/t7eBgaqwcgw+a5tKOyCNQOy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC3C8ACgkQAVBC80lX
0GwDqgf/ZSIz+/oRkYoltFu3gpvqlHvBBaBtqq0yP8xhAlpJ+0Zq9RPo2oRPVQcO
NywyZCk94S/cDo/hbXY67OcEYMWMqOVHBE6lnJCu9WjGQiTavsEbAmsfRHKMZuyr
uh1p3V7zVELqJkHiaC+leI2YH0vdiA9VC97pjYgNXX7F8akvzCBqiJxeqtI/OL/Z
wT9XBg6SyRya+frz7K1LMDsE6qknEqzfKdbPs5NAZNIg7hBJlVGladuZYz5/QOEX
VCAF72hiPW7f0ulV+uvdYsSp6XykWyDKChNPy30C5C2xcYOFfG67pB0MjkfGB83S
ODJx237cft88FH2qy1Lb53aEBc6lpw==
=2U7s
-----END PGP SIGNATURE-----

--Sig_/t7eBgaqwcgw+a5tKOyCNQOy--

