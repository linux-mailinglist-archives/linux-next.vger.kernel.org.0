Return-Path: <linux-next+bounces-4797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619E9D07AD
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 03:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 414D3B217EF
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 02:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94D88F5C;
	Mon, 18 Nov 2024 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eoyl6FBq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861EE55B;
	Mon, 18 Nov 2024 02:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895215; cv=none; b=qn+p8rMa4ARYVtHjWUJB9K1Qh2Dy3A27UlnDi17oBHHtWsHeAU/xDFp5wh0N4+iDfH1uSsGNHTq9Yo18jM+XGx1IgusgvywxG2umBLAnBqd4bNCry4avayq8mY2WbIWG0ZCazZuoMNlXqk0ZKoTob6FTW9P0yZMqs3jTP5iH0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895215; c=relaxed/simple;
	bh=Je1hJxMN9hD6APxB/+Abkl5BOe94IaC3VlzIa8Vtdo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OdGuo1mRhBaGe+Ru4C2/m8d4zyvbT602pmWU3iY0+cIDKtmqYn3IImI9uwXaIThgPR2vKyt2O0KhMw497iYZUOB+OfkxnsFKsThlmlPAeRxWN4YJJU+EU6UXkoITRzGOuJg7h3gfVkqBTtSNu3IsesMAkK/e5vWjz0RT2pxqFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eoyl6FBq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731895205;
	bh=CNTDTqXbhEFap5YCqaXqxmDfJdiMqARrjatz4N2vwVE=;
	h=Date:From:To:Cc:Subject:From;
	b=eoyl6FBqy0I3vWfJQNBWnjsegbjA8u9s+Ikk0MFEEITzWBdDAc+bND5eh1v/SlRE1
	 AqwHjWW9S5+Ahzt1/dw83p2fROzT7aRMOErAJh1FkNakhRQfKx79gHmhBkv3OYIPGA
	 a15NVRxU2B5YV60euZwc6nOT6bogzupgVhUK8uXbnuR2uasD9XIyOoF/92d0OxwZAy
	 qwdLgzFGYm0lEVSx/FL27rbuOAepwL1eUXWnd4YVJhMKEpULZ5BZARsgpzDas5Bkw1
	 w5B69gAbicKMoRlFe7xol40bsLmjiQoyApbvU+BAGZIEJgrlub/Da4vyhqzf4fMgwE
	 uh1j4p6bOrZAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xs9n10xd1z4x04;
	Mon, 18 Nov 2024 13:00:05 +1100 (AEDT)
Date: Mon, 18 Nov 2024 13:00:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20241118130006.05700e50@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yoai1q2MpqJ4Vbpgb.n_HY9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yoai1q2MpqJ4Vbpgb.n_HY9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c

between commit:

  ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on pre-pwrseq device-tr=
ees")

from Linus' tree and commits:

  086bf79a4d45 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl")
  e826ea4c7f26 ("PCI/pwrctrl: Rename pwrctrl functions and structures")

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

diff --cc drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
index 0e6bd47671c2,e9f89866b7c2..000000000000
--- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
@@@ -6,9 -6,9 +6,9 @@@
  #include <linux/device.h>
  #include <linux/mod_devicetable.h>
  #include <linux/module.h>
- #include <linux/pci-pwrctl.h>
 -#include <linux/of.h>
+ #include <linux/pci-pwrctrl.h>
  #include <linux/platform_device.h>
 +#include <linux/property.h>
  #include <linux/pwrseq/consumer.h>
  #include <linux/slab.h>
  #include <linux/types.h>
@@@ -18,51 -18,16 +18,51 @@@ struct pci_pwrctrl_pwrseq_data=20
  	struct pwrseq_desc *pwrseq;
  };
 =20
- struct pci_pwrctl_pwrseq_pdata {
++struct pci_pwrctrl_pwrseq_pdata {
 +	const char *target;
 +	/*
 +	 * Called before doing anything else to perform device-specific
 +	 * verification between requesting the power sequencing handle.
 +	 */
 +	int (*validate_device)(struct device *dev);
 +};
 +
- static int pci_pwrctl_pwrseq_qcm_wcn_validate_device(struct device *dev)
++static int pci_pwrctrl_pwrseq_qcm_wcn_validate_device(struct device *dev)
 +{
 +	/*
 +	 * Old device trees for some platforms already define wifi nodes for
 +	 * the WCN family of chips since before power sequencing was added
 +	 * upstream.
 +	 *
 +	 * These nodes don't consume the regulator outputs from the PMU, and
 +	 * if we allow this driver to bind to one of such "incomplete" nodes,
 +	 * we'll see a kernel log error about the indefinite probe deferral.
 +	 *
 +	 * Check the existence of the regulator supply that exists on all
 +	 * WCN models before moving forward.
 +	 */
 +	if (!device_property_present(dev, "vddaon-supply"))
 +		return -ENODEV;
 +
 +	return 0;
 +}
 +
- static const struct pci_pwrctl_pwrseq_pdata pci_pwrctl_pwrseq_qcom_wcn_pd=
ata =3D {
++static const struct pci_pwrctrl_pwrseq_pdata pci_pwrctrl_pwrseq_qcom_wcn_=
pdata =3D {
 +	.target =3D "wlan",
- 	.validate_device =3D pci_pwrctl_pwrseq_qcm_wcn_validate_device,
++	.validate_device =3D pci_pwrctrl_pwrseq_qcm_wcn_validate_device,
 +};
 +
- static void devm_pci_pwrctl_pwrseq_power_off(void *data)
+ static void devm_pci_pwrctrl_pwrseq_power_off(void *data)
  {
  	struct pwrseq_desc *pwrseq =3D data;
 =20
  	pwrseq_power_off(pwrseq);
  }
 =20
- static int pci_pwrctl_pwrseq_probe(struct platform_device *pdev)
+ static int pci_pwrctrl_pwrseq_probe(struct platform_device *pdev)
  {
- 	const struct pci_pwrctl_pwrseq_pdata *pdata;
- 	struct pci_pwrctl_pwrseq_data *data;
++	const struct pci_pwrctrl_pwrseq_pdata *pdata;
+ 	struct pci_pwrctrl_pwrseq_data *data;
  	struct device *dev =3D &pdev->dev;
  	int ret;
 =20
@@@ -109,17 -64,17 +109,17 @@@ static const struct of_device_id pci_pw
  	{
  		/* ATH11K in QCA6390 package. */
  		.compatible =3D "pci17cb,1101",
- 		.data =3D &pci_pwrctl_pwrseq_qcom_wcn_pdata,
 -		.data =3D "wlan",
++		.data =3D &pci_pwrctrl_pwrseq_qcom_wcn_pdata,
  	},
  	{
  		/* ATH11K in WCN6855 package. */
  		.compatible =3D "pci17cb,1103",
- 		.data =3D &pci_pwrctl_pwrseq_qcom_wcn_pdata,
 -		.data =3D "wlan",
++		.data =3D &pci_pwrctrl_pwrseq_qcom_wcn_pdata,
  	},
  	{
  		/* ATH12K in WCN7850 package. */
  		.compatible =3D "pci17cb,1107",
- 		.data =3D &pci_pwrctl_pwrseq_qcom_wcn_pdata,
 -		.data =3D "wlan",
++		.data =3D &pci_pwrctrl_pwrseq_qcom_wcn_pdata,
  	},
  	{ }
  };

--Sig_/yoai1q2MpqJ4Vbpgb.n_HY9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc6n6YACgkQAVBC80lX
0GzKGggAln6zLHF8emEgeQSAdW0d7T2KI9GtvyR1lKSoOOSTs1JtBhocmOPSi9go
2al8XZDtnlGD5EBXflEJHt3TfMIzO+xz0gza2F+gwugUgtA/qzT4ur27oxFEsfGH
bXS/xAk8cJ66k9fljwnJsHgm5tbzuLhK7JrG+SnWkUJc0RF8q3gOBGA9oyVF9LSK
vzWMMFMRjdOllW+odvObIZXrBhurfyP+KVMJp6r2FaJeQ4HaKK+OMBFU5zypAT4T
CHXCINPRA+OE6F/3VQSAPsTWitfZStrMlSsedOGe4ihE/I4pJ8b+pPagsyhTgjGM
rQwWu+RDokbk3AahAzEAMjAhhMPBgg==
=pc1E
-----END PGP SIGNATURE-----

--Sig_/yoai1q2MpqJ4Vbpgb.n_HY9--

