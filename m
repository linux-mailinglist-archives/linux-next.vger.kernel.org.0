Return-Path: <linux-next+bounces-4782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 942CE9C7F1E
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 01:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3179AB24AD4
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 00:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A5B195;
	Thu, 14 Nov 2024 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="izHdRU5o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF2A954;
	Thu, 14 Nov 2024 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542634; cv=none; b=nd7I5COzDZsUwUoH9rZz0ut0sWdjX76zSHPrs9eQckqYMNDELnhXqNduASuO5zazrTjnogHMaXi4jeWQu/ao/1PkIZsUBkELfKsfTcdY6yq40IMG00WFwcW4UT4H2St+KbroMWKQ5zVLLkOk8VKgGO3hw9WG5Ne2NZ1ntVgtNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542634; c=relaxed/simple;
	bh=3udQPQ52xcOuxhuLmlBL3dmra9PEBLqv/3HrWShzNeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mxvc5qHMwdRuP/XntKstWivP7XoJF9w/B1HnI7uCimXlE/64BzAEaSO2pFb9ii5Kn7TuR8hE//6LbzPfK5Nhw/RLMjPsTyveND885cOqqq3ZITIbJr6K4NeEn5I6HX5EnHWpm5EMTq4+Rf4PGw1gXnZQA5vJPNXmom06rfEzWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=izHdRU5o; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731542625;
	bh=AtdGSSl4w88h4xNvzmnzk11iVqxcRKOjABrghFtfSh0=;
	h=Date:From:To:Cc:Subject:From;
	b=izHdRU5oDtUA6SDYdOOGkzQYpW32O43Rbu6dpcHSvuSIGQEC1VxL2HxwQtojL4oHQ
	 gG2h38oq7gx1fkmBe/O8K05yTJwUIecVzLncWfFVPr7k0zZcuKKfEKrGUgzvKlmkDB
	 OjNB88envZtB0SvIOyyIZHKh3xGy7YRTs4wwNzC0rZD52eLVz3MvrkDcRbUJl4Qk8c
	 wV8NTQa8qmE70EzCLo25uqRLyLu+pTS+T0Fw01raId2tVnjn0oP17HpO6TmGrTspvb
	 C4nj3hhrgbdk5Qxy6ifiwV9jjKxXg0xqtyb1XS4tgYcQaSpUG0/9VaNbxD/0Sk1/rH
	 UR3v1RLvjkl2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpgNd1dd8z4x8C;
	Thu, 14 Nov 2024 11:03:45 +1100 (AEDT)
Date: Thu, 14 Nov 2024 11:03:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krishna chaitanya
 chundru <quic_krichai@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20241114110347.04ef829f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4wE4czMO6XTLy+kYX39Gbmo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4wE4czMO6XTLy+kYX39Gbmo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/probe.c

between commit:

  1d59d474e1cb ("PCI: Hold rescan lock while adding devices during host pro=
be")

from Linus' tree and commit:

  dc421bb3c0db ("PCI: Enable runtime PM of the host bridge")

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

diff --cc drivers/pci/probe.c
index f1615805f5b0,bf4c76ec8cd4..000000000000
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@@ -3105,9 -3127,18 +3127,20 @@@ int pci_host_probe(struct pci_host_brid
  	list_for_each_entry(child, &bus->children, node)
  		pcie_bus_configure_settings(child);
 =20
 +	pci_lock_rescan_remove();
  	pci_bus_add_devices(bus);
 +	pci_unlock_rescan_remove();
+=20
+ 	/*
+ 	 * Ensure pm_runtime_enable() is called for the controller drivers
+ 	 * before calling pci_host_probe(). The PM framework expects that
+ 	 * if the parent device supports runtime PM, it will be enabled
+ 	 * before child runtime PM is enabled.
+ 	 */
+ 	pm_runtime_set_active(&bridge->dev);
+ 	pm_runtime_no_callbacks(&bridge->dev);
+ 	devm_pm_runtime_enable(&bridge->dev);
+=20
  	return 0;
  }
  EXPORT_SYMBOL_GPL(pci_host_probe);

--Sig_/4wE4czMO6XTLy+kYX39Gbmo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1PmMACgkQAVBC80lX
0GxgPgf/bvbOMaggLI9ToPhN8E5ToXkVymhgyZwH0CARwN7Ua3o0xrn9h8Sk1gPQ
MQGF/GaecEbplLb0fHdKMvlVSSFdv6N7szgiAEfh4t0iJPPwsUakuu8O+EreSYaT
bSootRvx1Vz7VZ+hbnaXloSZnw0EuXk/pR6o5Ug6QyeDujEUxf8sCRrvHX82f6wq
bFDPbya+/P4EDnLKjLSa7vCc/KhDa5Hi6JVbcoz2pK7xtoqtdIxDmYqXFUTrok+2
gN5CXwBQzkoANuY8M0X95I/OBVRnaaw/FkYhlYQr4j6iPBg4V5DOIjj4kusZssxE
+F69RQ+aYUOSJPcEMmrKsB+PJ5jhgg==
=R2lA
-----END PGP SIGNATURE-----

--Sig_/4wE4czMO6XTLy+kYX39Gbmo--

