Return-Path: <linux-next+bounces-6211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C8A876E1
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 06:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DB69188FD3E
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 04:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BD61925BC;
	Mon, 14 Apr 2025 04:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PiMfB+HK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E317A586;
	Mon, 14 Apr 2025 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604593; cv=none; b=eOocPuPgdjw6BGKRGcwDaYACf5HhTgZKT+GgOEoo0rE2lo5thhX8QYbUp8kqeRLufoR48Xx7PG92ohUEXrYIdykcpUr1+6MKXBKHYcUdi3aNw9rCRo0gf6JeIW0mzmbuKzlRlhQfZK1jh48Ii5PFLZUZsFOR5jvtJAe21XO7QhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604593; c=relaxed/simple;
	bh=SI/yMIbrU5RJMbKvNS2C9js5QNV6MNoDwN8h2gvaqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O2vVDmxDNZtGMym2pfc7/bgW55G8sG6YWH7DRKHVBUGXHLNAp1NBL97aEwPa3cDzeCzpKHMzjIcxjyJk7mHIgeziOHsVKJhDBvoZpsjx+/YAf3Oi8Sd3e7zHYm3dvpwaYlls4FL90kE+l6wLzw+dzWpVxYAfaP+7tGQ/hAzjG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PiMfB+HK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744604588;
	bh=CyarvyjTtLMRhzYDsLNbSCVGVbO9qlGbtamPzbN+qNM=;
	h=Date:From:To:Cc:Subject:From;
	b=PiMfB+HKenf/60lR4m9+JEQ9PN33iP5iF88RLVMGobFyZ1R4xV595n+KRm5yEAA0H
	 gTKx4gEKX/DAqbge7obKZPC16P1Lte9boQT+H4PJd1DjJpKrGsDNli5XNydqljT3Yc
	 JgkTh3GGAB1DQV/2atPvyFofuTt0QzCmhhRPYTtJaGOQeyjRDG5XnElVOMhkVvdPiU
	 eMX2VzlAqWMuhAeaIPxselLVgHxzor9CsE8Sxd0DxXbsx2FvPQS9lLp/z7q7lF5BbM
	 TataLUR+tRyUgFQ+XNsQeSSYZMUozkTvJBeWqvuJe47xKXgWNiBXWAZSO977/27KZX
	 EyzTXs1+6GxWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbZ0C5vWCz4wbb;
	Mon, 14 Apr 2025 14:23:07 +1000 (AEST)
Date: Mon, 14 Apr 2025 14:23:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Xu Yang <xu.yang_2@nxp.com>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20250414142307.7df3443d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QTB6j2jdEf+9OAfWRawRpEu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QTB6j2jdEf+9OAfWRawRpEu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/chipidea/ci_hdrc_imx.c

between commit:

  8cab0e9a3f3e ("usb: chipidea: ci_hdrc_imx: fix call balance of regulator =
routines")

from the usb.current tree and commit:

  ee0dc2f7d522 ("usb: chipidea: imx: add wakeup interrupt handling")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/chipidea/ci_hdrc_imx.c
index 4f8bfd242b59,c34298ccc399..000000000000
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@@ -336,13 -338,16 +338,23 @@@ static int ci_hdrc_imx_notify_event(str
  	return ret;
  }
 =20
 +static void ci_hdrc_imx_disable_regulator(void *arg)
 +{
 +	struct ci_hdrc_imx_data *data =3D arg;
 +
 +	regulator_disable(data->hsic_pad_regulator);
 +}
 +
+ static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
+ {
+ 	struct ci_hdrc_imx_data *imx_data =3D data;
+=20
+ 	disable_irq_nosync(irq);
+ 	pm_runtime_resume(&imx_data->ci_pdev->dev);
+=20
+ 	return IRQ_HANDLED;
+ }
+=20
  static int ci_hdrc_imx_probe(struct platform_device *pdev)
  {
  	struct ci_hdrc_imx_data *data;

--Sig_/QTB6j2jdEf+9OAfWRawRpEu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8jasACgkQAVBC80lX
0Gx4CQgApiqKDqgJK4H7NS4rSHd8G0aRkhGs4QKueKzaylXUD63pYlvpf/QvsSVB
rP9YCjfs5AAb0yKUe3hNEFRr+ymuKF2f94ka2sIAZU4izpLeqJpOLyLmovkCYHKS
O1aRiLsWEFotMGGgXsyO2YDnmarRw5NI+QiwRokagglEbt4gNMTucGvLBxG+CWCU
T1emAMkF40DWYwr0bON1+m68LLBqbLqU9nq9xIl2+3pOvq1TILtAXPS05Q/fRhEI
Z46/1vzgU2r41+Mib3HeDNEDJINbajQ+IigQl1Fy2kp7kU/gFrmUkRogMuoq40OL
AlI4W98owiPCDu3ojnp86D7vNUHioQ==
=AnX4
-----END PGP SIGNATURE-----

--Sig_/QTB6j2jdEf+9OAfWRawRpEu--

