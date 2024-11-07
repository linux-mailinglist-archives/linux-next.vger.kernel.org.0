Return-Path: <linux-next+bounces-4663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FA9C0525
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 009272824DA
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EEE1DDA3B;
	Thu,  7 Nov 2024 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aylmTckL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7C196446;
	Thu,  7 Nov 2024 12:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980960; cv=none; b=R93f7fMsG0VWuioJNUBHtQ0NUiqpRefTpFdkG8R0O7ZVIz4AIUwFgfmo73bNJlZKwK8ZHZCZ48FfrPF9izdeLSjcM0+BdYt76nr2M6nFUgv6pzDwfJuoTxmmNb9zQugOvlg6C63Boog01XEJtyBNLMnk3nDZZMnOSoF4c2eOi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980960; c=relaxed/simple;
	bh=Clihi8mLbIe88kHSLwhDPcIlfsjv09NtzjX3tO9rRX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oZGLgbjaoDMZOHq9LPzW2GNz0IzSL2uj/Cc90yy3/7esrp3T62WAPDjTgxH6Cb0wOLOcCgZmTb9kNj+9pSAEGzQWllL/GY9Mm0TLgwagFcRYrdVDDr1ZlwNdNhmObDgn1AZjMeHy516WIwOUMzs+1o2IAgQ8ebnOxE+TdjJW5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aylmTckL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730980950;
	bh=OL299ZOHudTJByLcOmQPVM81u66OJr/HCoLSJ+x0MMI=;
	h=Date:From:To:Cc:Subject:From;
	b=aylmTckLPl/nHxqh+Ui1D3qYw5OK3e1PC0KlB1iNcodvt0KOvXse7i72QiFYVBdkG
	 7k8RB/1U9UbZPLG9dio/4g/uQy1QgQHW1iYS090Oqpsg6zJpspkuvlxvc377O5KxSS
	 NvWvFyUJAap3a22rC/sGzWqgBaIlFow0R7XXlVoYWS4a2CcTBd/QE9DDqAe/iWJaf6
	 NodZbFniKJMykCjDyEsGwT+fgSRFZt/NBo/dAujDEFD2w5lT6W9ZrU4wNgLjOfU/Cl
	 WF7gKK+FlVSsJUL3nqCtXbOkLjaxifygVyFNt9vTOAH8WragCsUtdBVh+41zaTt2Fo
	 KS9RJmpj+qW3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkgg94Lkwz4wcy;
	Thu,  7 Nov 2024 23:02:29 +1100 (AEDT)
Date: Thu, 7 Nov 2024 23:02:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20241107230231.688e865b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/amYGHUvaWY5VFQTHnj0K3hM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/amYGHUvaWY5VFQTHnj0K3hM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (i386 defconfig)
failed like this:

In file included from drivers/pci/msi/pcidev_msi.c:5:
drivers/pci/msi/../pci.h:862:1: error: expected identifier or '(' before '{=
' token
  862 | {
      | ^
drivers/pci/msi/../pci.h:861:20: error: 'of_pci_is_supply_present' declared=
 'static' but never defined [-Werror=3Dunused-function]
  861 | static inline bool of_pci_is_supply_present(struct device_node *np);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  0a93ef0a2d90 ("PCI/pwrctl: Create pwrctl devices only if at least one pow=
er supply is present")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Nov 2024 22:53:24 +1100
Subject: [PATCH] fixup for "PCI/pwrctl: Create pwrctl devices only if at le=
ast
 one power supply is present"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 345db6844690..7dc82eac5b04 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -858,7 +858,7 @@ static inline int devm_of_pci_bridge_init(struct device=
 *dev, struct pci_host_br
 	return 0;
 }
=20
-static inline bool of_pci_is_supply_present(struct device_node *np);
+static inline bool of_pci_is_supply_present(struct device_node *np)
 {
 	return false;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/amYGHUvaWY5VFQTHnj0K3hM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsrFcACgkQAVBC80lX
0GxhPAf/d0eCQGR1tjtf1Fj5Ezu+VsvPj+EqakXNGA8uJZ5OSgfRoDWPGF4n3Pyi
gxZeT2tz3QFFOI0SCATx6vLk85QKroyXYFRrwAoOgWlzVFElLaq6j+lG2GZNbuX/
M3qU3EGMpQTCJ1/Fmsd8HN7H2jG2GDXNuV7YPNUNrbkrvE3K8BnjRO8B9L84Ps7o
tq7XAzzhGnZXVw7J6ckGgVGcWIcdtiYqcIyiD6IWX3J3+1GxYdOIu9Ob+cSVyqKl
jwv2TyDH962t7VlPdb+8SlR5FY6YtUkPczayOdbi3N/7LV2erEEQ1VQrbY1nKmGv
/oJrvj1kxibQebcUaCWsEHD+bIIuiQ==
=Qh4k
-----END PGP SIGNATURE-----

--Sig_/amYGHUvaWY5VFQTHnj0K3hM--

