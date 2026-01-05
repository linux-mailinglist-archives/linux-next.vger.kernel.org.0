Return-Path: <linux-next+bounces-9533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8BCF1C8E
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 05:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC7413007189
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 04:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB6117BA2;
	Mon,  5 Jan 2026 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="atmxtSWY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C13A1E74;
	Mon,  5 Jan 2026 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767585786; cv=none; b=HgyNSsC3kEoTB61XTIYXqco6kL89vyCppIpU0cDVIO0MPnXTF8/duccMZQfw69u3RSPRZg1K7XByB7MZzDP/7H52H2nTaMzmY1+WAPyx1DlaFZFe+Zzr3CLKKH95ev81aQ9RmC/vEOlaLTxJnObsuF3oKz2uMZpltM/7zmkJxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767585786; c=relaxed/simple;
	bh=0DgsTeFdnZuVjmaA4Rn6Gr5gpo98K4bfZ4CPCF00t5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WU8822xfZESp6qTk151IrF1+1O6uLSDCpzJA45h27fn6PVS/45qkiVVOeJLLfy5DsC4C3/JKAMXhJ75aRWyHY9LnfW5fwv3u5GmEY1OjoNP77uoelo4DMS4EWNajbVVRFxx6MOmzx0KMJLve3M1mPcSbAxEbFPvnFolwo2D1cKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=atmxtSWY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767585781;
	bh=wGAzMYaslcisq44xrrzciOdNonEWM8+ohgvduEul4o8=;
	h=Date:From:To:Cc:Subject:From;
	b=atmxtSWYr5dym/B7s3+aH5wGjjEaTUd/lCL9ruGM01sgL6x37T8jHxUXqw4o21uah
	 MTgSx2JiVFB2XdwPDtgcEOmBMN92hsl05mrytyfgR5ycwoX+F8QrA0tn3FcPwhPPuP
	 /bg/yLuCwScFGCuNtfwBEIOk2K4PgE0qGRd1xmGnTqg0+n8FMOyelR5zq8UzPrsaza
	 MlQrBrkTY6doEssg6ai9fUwgrEbdX1kstIBuI6B0yN9dEBBjbP5o8UHIkkuvjQJFEC
	 pHpMPjqRA6qqdFezFDa20qMDZKQ+AXw31YT+WNMq/lacMmJecBO2+ufbtcXIqdV0tA
	 GhkCY56icgzpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl0yF1dWpz4wC1;
	Mon, 05 Jan 2026 15:03:01 +1100 (AEDT)
Date: Mon, 5 Jan 2026 15:03:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the soundwire tree with the sound-asoc
 tree
Message-ID: <20260105150300.5612a217@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tfw9/ekGj..cGAOKvN.CNxa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Tfw9/ekGj..cGAOKvN.CNxa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the soundwire tree got a conflict in:

  sound/soc/codecs/wcd939x-sdw.c

between commit:

  7a8447fc71a0 ("ASoC: codecs: wcd939x-sdw: use devres for regmap allocatio=
n")

from the sound-asoc tree and commit:

  478f3890709a ("soundwire: Make remove function return no value")

from the soundwire tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc sound/soc/codecs/wcd939x-sdw.c
index 399dfba79aa2,965c768e7995..000000000000
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@@ -1401,15 -1406,23 +1401,13 @@@ static int wcd9390_probe(struct sdw_sla
  	pm_runtime_set_suspended(dev);
 =20
  	return 0;
 -
 -err_free_regmap:
 -	if (wcd->regmap)
 -		regmap_exit(wcd->regmap);
 -
 -	return ret;
  }
 =20
- static int wcd9390_remove(struct sdw_slave *pdev)
+ static void wcd9390_remove(struct sdw_slave *pdev)
  {
  	struct device *dev =3D &pdev->dev;
 -	struct wcd939x_sdw_priv *wcd =3D dev_get_drvdata(dev);
 =20
  	component_del(dev, &wcd_sdw_component_ops);
--
- 	return 0;
 -	if (wcd->regmap)
 -		regmap_exit(wcd->regmap);
  }
 =20
  static const struct sdw_device_id wcd9390_slave_id[] =3D {

--Sig_/Tfw9/ekGj..cGAOKvN.CNxa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbN/QACgkQAVBC80lX
0GztEwf8DVgpUVFVgjWOwPyBajSrGbcJKxlQVHHs/GYnxCsJhuPQs2LA9F+FVoGO
3Ub1HBIOTMuvcvZNziThC7GpnzfCGAn/MZxOAwUeI1YvZn3/twWv54oLPAfP7gdm
r+UTDu97g+eC8wA36JlUiFTLzlmw1M0QzDn9iwkfQZdG9gCeXOsvmHHjpIH4foTf
BB/CTKQA495/b8E9Jbc/nOWcPTmLO/IeErrIixtKlvrlZ6MeHMb2jEUKLMUQcEvG
sb2fqnH7ISZfaFDHkSPdsVw0/HeWEShsekN/olueKms1zKsoONU0RM++u2PDTaBT
F6wsZ0jQrCIglLwMXOAXdKtmT/ypVA==
=Zd7g
-----END PGP SIGNATURE-----

--Sig_/Tfw9/ekGj..cGAOKvN.CNxa--

