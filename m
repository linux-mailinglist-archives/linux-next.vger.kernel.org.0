Return-Path: <linux-next+bounces-4383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB129ABD7A
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 06:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C8BF2850D5
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 04:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D6112C475;
	Wed, 23 Oct 2024 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="px3BAo2S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4104C7C;
	Wed, 23 Oct 2024 04:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729659086; cv=none; b=l2fTaQjo1NqwLUt8XJBUtEpcLGZkIOslrLQ2yk76jDFDRBJHkJIuBS+oRghfIQZ3sOy7AJovJghW05ejj6BVUuJliGm/BP68J6ZBR2YsXMYpBy5DGDwjxZ9N+DYLZ60e1Bsy1d+lBu0cSc1LnlRMNvHKJTkufZ9LNs9CJrABS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729659086; c=relaxed/simple;
	bh=QdM5pRVlmUY1dLedhKWFYGfjT7hRokQ++WeJNbDEuzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tuuWE0XhK3K8ZBs1dU1RV0REXV/4bCVAQyzjEoFIiKFZ37tF7mAlruYmS//TapdknadXtzg1tXxtOtD5fhWGT8pvCYV4JOLUKB8MvfHapIN4TD4u3f+wzTASX38WNe65h+iroTHNG4Nbr7pD9OKpLkabDgTy8NLPsreOA/caNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=px3BAo2S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729659080;
	bh=rXHbrtT939MB2KnykijlAfrtsIicrqwwORtlXrzGUyY=;
	h=Date:From:To:Cc:Subject:From;
	b=px3BAo2S5okDZson1BVOhA0oET9TbWWYE9wvYFdqqpRIm9lWctFxUxAqx7Af8rcMg
	 SUJBG85xOshgblbkZdWiVW7+bRWT/9JrrQp5FDOhYbTskuhHQTcBF5Vb9cLh/0fzh7
	 aA3h8LH7q0OzocYFEiSAqyLfaku71HgnWUh/B89jcewAOtJOQXTKYJe1nIDcET1fZc
	 woT4S056e6WmMpu2skAggaeWbQJIvshyK+pXw5BfOwZm30eVunc4J7xjRKPnZ5TcoM
	 zjc5I2z4g99z/aAZb9MyneM6xcjswlrJp9/SfznD2Wpu4Tmb0kyAfFtz+5y89j8To9
	 A8/I+E/O7Um0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYGpb5XSwz4w2R;
	Wed, 23 Oct 2024 15:51:19 +1100 (AEDT)
Date: Wed, 23 Oct 2024 15:51:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the regulator tree
Message-ID: <20241023155120.6c4fea20@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HW0/H.I7MaanSU90W=L50jz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HW0/H.I7MaanSU90W=L50jz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/regulator/driver.h:435: warning: Function parameter or struct=
 member 'init_cb' not described in 'regulator_desc'

Introduced by commit

  cfcdf395c21e ("regulator: core: add callback to perform runtime init")

--=20
Cheers,
Stephen Rothwell

--Sig_/HW0/H.I7MaanSU90W=L50jz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYgMgACgkQAVBC80lX
0Gw9jgf9EOe8ylMCoTPjPrzGbUzUyyF83DlnRvJzk/4lPS0rH3QL9vj5qbIP1Vu7
TWj0oS4eGlQQgHXGmoKMNZE6J9ngqUWSVyp4W29Oz1aQ9M2017x5pQHA6sffVR+b
dkCWFDFfJma8V8+9o9tnBLX7J4Ud6rcDb3QqHaJRsZdfMiSgThbW89zJE5gJsGsA
wDue2hewM/vRmtYcPqP9l6ReGOwntS2jsKipyeDycG7J4UI9IYMJqRIkijFPoI5B
Az3nWwZ6/+zd3xX7UpOU1e61jH18qK821jUx5HztslZXr2IzBQaQEZZlv3DS1CRS
UetWiv4X0l0fEDjcw7K6mVQaL9DrWA==
=jiET
-----END PGP SIGNATURE-----

--Sig_/HW0/H.I7MaanSU90W=L50jz--

