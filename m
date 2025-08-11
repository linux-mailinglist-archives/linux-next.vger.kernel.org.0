Return-Path: <linux-next+bounces-7901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD2B217F7
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 00:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD4D6244F0
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 22:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1ED2DC32B;
	Mon, 11 Aug 2025 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="inKtI2zi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31D2D63E5;
	Mon, 11 Aug 2025 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950332; cv=none; b=Vt5BYz5sGnvIOEiJP6oMfvy2jMJB4ii+fLrg2vaFIakuNNAX0XtJBuESh7hIuYIJQpM7hlYv5EGLxEcFm1AvKpxfVzswR5lnyTllELLPTqqmMibdHnoYnYZwwUeYlLDZIgbgk389bExiA9LzMZ+g00tYTPVuWZ18ogcx3RWILOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950332; c=relaxed/simple;
	bh=TpTQLfmPbMktDsXRGnIA1Q4zkCKFQcD/caC8d9JYgkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IWl39JAqRd7/Rt52wJ4gBwNpewD1MEVSwd2cMRF3jhhpcAjUU/aBbOK6s63V6mD+wyfBabn904KBujlalbO2iwQOsvhBsEoItG/RwUcJ3YJis0waNrD3pmldRJ96iErYL3dykeLEvN0/MgyuZlT5u4//52aE4PyOcvzCWzvkqBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=inKtI2zi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754950327;
	bh=nK4wtJSu7TYzjWFrQIJwKuAcJgt5FOeurmLnC8ORXnA=;
	h=Date:From:To:Cc:Subject:From;
	b=inKtI2zilLjhr6JMYkfjjd8fLaytG8tdnqHL9NQT+5h90ttOBSSNCJZPETuJjlJ7Z
	 42LGUQnO8u/sicuSQybm5G/OThauShc05Y3W5fUCSO1u7wQbSdhg2yRyB5bibUvmEL
	 9Zv9gLAHvrXzzIx3p8JJdeczCuZdKjx/AX2Kp2SYBCKnIDLw50HAwQhEjVI+NJXqzZ
	 /gX0m1+axlYPJluWUtUU3a16tNSu4vQTSglKuSddO9SsyNJ3hn9WJBDeYDJz6jT/xR
	 GP47/8af43sfk8nFSzMBSVvk8huPkyfoXG0rJ1xKHVIFAspnAsThKBqJ36WVSPJu2P
	 Np3Mw/oa0RiAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c184l62L9z4x3d;
	Tue, 12 Aug 2025 08:12:07 +1000 (AEST)
Date: Tue, 12 Aug 2025 08:12:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20250812081207.7ac8d7c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CGL.4_DwK7BE++=w2gC8qNr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CGL.4_DwK7BE++=w2gC8qNr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  450a80623e3b ("arm64: dts: qcom: ipq5018: Add tsens node")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/CGL.4_DwK7BE++=w2gC8qNr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaarcACgkQAVBC80lX
0GwDkgf/YSfnv+XVYmTdwV1tSO0Oh6JvKBdZrWPI/mXoJavDGL3ALwhXohSUj4ki
HvTDa+s1oONIHvUIU2RnIZg0aXLZ/Y0+xLm0wdFW6SEO0dfCxm2pMQakEhxnQ4vO
DpgX5zaRRYbM93YVsY2+Fp4l4IShe5MLKllsvxVYJzBPM/ocGPEQw+GFVMDM2J8M
lR5Rbw0NZYJ4zlRCSCv8M8DEUjpZFZ4Emc/UEJTvTsbPJvSEX22PW3y+ngJd3LZx
BXJsZ6P3TI3yGKpi6du8oxcQUcwl0gf/ufhreexMTSLWfOgltSimRZpVXLw5YbDo
XvGON/jxtHacLA++QGI0FJsE/Xf54A==
=IkrL
-----END PGP SIGNATURE-----

--Sig_/CGL.4_DwK7BE++=w2gC8qNr--

