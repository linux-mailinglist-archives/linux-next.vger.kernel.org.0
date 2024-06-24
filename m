Return-Path: <linux-next+bounces-2651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B9915601
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 19:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781241F21819
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2151A00CE;
	Mon, 24 Jun 2024 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+/IXTZX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435B19FA6F;
	Mon, 24 Jun 2024 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251720; cv=none; b=EUVFRhEWKjgvA/zQ9c+AvwQlfx5FcgORP/QWJ52D9OUTKrEZxjEJCQSIrbZiuvO2xb3oAdmTslN6kns4zRcNVNX+Wa2Wv+/+MiRDuafqyItEd224jSIFm0bqYCaInu9guJtrWOGwzlZ2ab2ic4WFuX4p2/2hMul5Nfr70Kw126U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251720; c=relaxed/simple;
	bh=Dsng+wl/JnpD45QyCVpIBvIgJ9Y7NDKt9V/oHYab9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQ2Up9TieW5FaW8xXZ//ew2uAZoEzFx3JhGwOew5nflwXtFl7g4RulHyRBddHaMM1MMZ7Lrm3zhnlzblUyk/ugXp1vz1waRf7tEX8YkhrGVj44tuUJogc2ghtYLAoMFauT8Mkx4bjzHpHwnaRXyx3KBmy7doYNhuMuCjmFtvjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+/IXTZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA936C2BBFC;
	Mon, 24 Jun 2024 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719251719;
	bh=Dsng+wl/JnpD45QyCVpIBvIgJ9Y7NDKt9V/oHYab9Co=;
	h=Date:From:To:Cc:Subject:From;
	b=c+/IXTZXQnIXX5XeyEK/y+kcEZ4jBpzwIcIVmDs2lam62zVSGEXa4f7dlZ7OEW/Tv
	 cjGo/3Ytyl/Jexu425iXJ+I5OmYjiWOgUNyqzSexC9Aqg9cd/mqx2BDNMJqjOLlrqB
	 Y0eY8cRiTpL2J1kfVvYN802pnNX/UrQcyQepKUN0CSOSySSeXnFYsh7VD4Y4WddnIz
	 gLKYF403tuiRVpixsPjeg2tWzp6VYyNXEmesag6Oo0yNydSr9rQ5E+1dWtOl1wHRZr
	 FM72R3ubEpG32NP/b4geV7OzcQPqNHvKKSVQtOj1K28C/AC3Z1M63Wc9sOhy5hkkEj
	 NBO3oKjJomVcw==
Date: Mon, 24 Jun 2024 18:55:15 +0100
From: Mark Brown <broonie@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the counter-next tree with the
 counter-current tree
Message-ID: <ZnmzA0nM0Sn2Awkn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="40OqtuILxyApl9cd"
Content-Disposition: inline


--40OqtuILxyApl9cd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the counter-next tree got a conflict in:

  drivers/counter/ti-eqep.c

between commit:

  0cf81c73e4c6a ("counter: ti-eqep: enable clock at probe")

=66rom the counter-current tree and commit:

  1c30c6d024726 ("counter: ti-eqep: implement over/underflow events")

=66rom the counter-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/counter/ti-eqep.c
index 825ae22c3ebc7,9742ba9fc3072..0000000000000
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@@ -6,8 -6,8 +6,9 @@@
   */
 =20
  #include <linux/bitops.h>
 +#include <linux/clk.h>
  #include <linux/counter.h>
+ #include <linux/interrupt.h>
  #include <linux/kernel.h>
  #include <linux/mod_devicetable.h>
  #include <linux/module.h>
@@@ -377,8 -465,7 +466,8 @@@ static int ti_eqep_probe(struct platfor
  	struct counter_device *counter;
  	struct ti_eqep_cnt *priv;
  	void __iomem *base;
 +	struct clk *clk;
- 	int err;
+ 	int err, irq;
 =20
  	counter =3D devm_counter_alloc(dev, sizeof(*priv));
  	if (!counter)

--40OqtuILxyApl9cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5swIACgkQJNaLcl1U
h9AFVQgAgDJvCuLymRf+pSDaEA3ZixKP1r/fCMazx0wEx0iwce9qiKiW2yvGYRpq
HiR3ZJCfbxzcyo6hF4iZoIyHW8Mz4wKUGrMTDSuceaMO1oWn50DSjj2kk3NeA7zY
FTaI0UqJHVOiAkpiprgw9PgbYYaAzKFbFB6yRVdPTgacVnZMZET1jmOvJ46kicP6
vOu0JhmkKrhtxGYwiVs8auZLcDIJkrUO77Fj4JBm4VOA5k1S9wSOeX1h8av6xKFz
eF7jYbs9zwe66mnhIgOaBHQV+7hXhzbxUqRebm/eZ4pm3jcKr9jAWQrfY0SqP1EJ
ExTWa6APtc9StQiXYoSlh478IT92zQ==
=Y+J7
-----END PGP SIGNATURE-----

--40OqtuILxyApl9cd--

