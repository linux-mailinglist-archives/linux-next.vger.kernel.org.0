Return-Path: <linux-next+bounces-6286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FA0A91404
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 08:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 198EF17DCF2
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A110E1F8908;
	Thu, 17 Apr 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Nfr8OBTB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D71E0DE8;
	Thu, 17 Apr 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871229; cv=none; b=qroXsaGmSVX2d2rhBK51ptNIpsT3CQecin6zq6TSQl7M4OPJPcznays5+OQgo5KkZ9DG/GN07csFke2wztDTHLF16ql2EYg2Ft/eOCXjlqfkgJ4bHhvjz+HHJ//+5/D+l9ezh7k14ZGS6cQMv0z+IpJc115NdY6omWSnNrQkNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871229; c=relaxed/simple;
	bh=FfMDAim8sO3P09XvanHJKt4bgNLDXYyL0jx1kT3ZXF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZCuX8B0/myeZE1wTdB27gL8aqXjZaMVV2oHYKiwUK0ioqn9chkrhiUTtYqd/FNGTmThcpqoK25oa9d226bKCD/KnUFq138nYW63m5TD3AyFkvZImGC4PmeAONOnIjroIOdUpfUB7Q9SeosLLFyKt2QYWjbgeW0W0YrB55bq+pns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Nfr8OBTB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744871222;
	bh=OqW1VK/tv6rsYLnqe2G7guXAQbjvwED2FJapG1wrtLc=;
	h=Date:From:To:Cc:Subject:From;
	b=Nfr8OBTBMrcY4ktq2JTB3gYW5UMukGA7z4ul8VIcuyTegC9GVXw8RaS66RWvsESuS
	 2lDklrD4A5bVHmcZelgkganGtVOJ3Nb9Dr+N0+cSQqYi6XEkcnk5cZTYGKieKz5AE0
	 vzob/1o7CXkvJAKstPsVZAXpkOLYq1cA4URyVLAtRc7MyOUyxBwpSD13/p/s3BVqBJ
	 Lh9NeNuVDbqzmghEwA94+GgupoYcM6tJXTlvZ0sxaSXE62Op4J7i/hz95/cWOlQ6aL
	 1wF+z79oDzLcbFdXE+DRbOB/oBIGE0DLrn80uKesZ1gyqsUdlInU3qRLZi3HFDETfu
	 HLSHuDqXP8rlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdSbn41njz4xQm;
	Thu, 17 Apr 2025 16:27:01 +1000 (AEST)
Date: Thu, 17 Apr 2025 16:27:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pwm tree
Message-ID: <20250417162700.728e14e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6cqZMclfWsjISY9uBtAGXBJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6cqZMclfWsjISY9uBtAGXBJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (htmldocs) produced
this warning:

ocumentation/driver-api/miscellaneous:47: drivers/pwm/core.c:232: WARNING: =
Inline emphasis start-string without end-string. [docutils]

Introduced by commit

  bde5547f2e87 ("pwm: Better document return value of pwm_round_waveform_mi=
ght_sleep()")

--=20
Cheers,
Stephen Rothwell

--Sig_/6cqZMclfWsjISY9uBtAGXBJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAnzQACgkQAVBC80lX
0Gx/7wf/RNNWv0eywgcRUbxsojkFvQclaiMlfHtW6qNzFSVjx6fOKkYYSIxWOUbv
YTQ218GAEaSq7Ca9TGcEFw0S5z9UBidaDbA5JUoA9mCXBHwS2LMqt0PYAmqf1+Vm
sLVNAK9qFjzD5+3grXfBwNdNAY7GpRTPFLP03ycVEstWjN9gXKda3jhibJP/Y2Sl
NlrJOnTOf0WBXiSftT6gq3DEnf0bqIP4cd13louB5nftEkH9OdkmSq4UEQsj4sEX
Z2cUBeq14YZJdEaTKClVKnrwn4UuUF7UVqLbdm86jwqRT7l1Eb3Ee3DMYZuUGjnb
s+eA1pljBg9M/x6o+Kyv990ACIw+Fw==
=ZGn3
-----END PGP SIGNATURE-----

--Sig_/6cqZMclfWsjISY9uBtAGXBJ--

