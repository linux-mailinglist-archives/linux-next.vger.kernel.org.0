Return-Path: <linux-next+bounces-2510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E0903118
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 07:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4BDCB25BFC
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 05:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917E5171070;
	Tue, 11 Jun 2024 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gl60GviU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9C171064;
	Tue, 11 Jun 2024 05:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718083352; cv=none; b=Qnh5CEIn97Bliv84yzMLIQPwWGueQEI7O8cMdh1FVSFDiF4WgvvC9s7M1dTsCI4C8f8rF2ZNxKPQKi5+G9wL2K8UmP/3VjN8TRdSJWy6sXC0YC89hfTOQ5j5/pekjiF2aSJ1P+n+7GSToKXMmnE8ua+QRXElPQLLOkmHeYnztw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718083352; c=relaxed/simple;
	bh=whGHIvc987xpcxKIbQC1w21ATinkDrL3pOyefPmfmY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XRB8gYOsklfbJg/h8pcaMoF8A7byjx1APDtp07wuKJ45rh6XeqsWIp7I/YXafl4rht4MQESCUGqKsKBSi8y9111HKJ3/0MdKfFarheoUXQXpAPa2WuPOkJlsOBDkS0T1MA67is/tXBqz0UmmzHuUM5VM/rN5G1RL/LUDLbusrx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gl60GviU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718083348;
	bh=n8RA86qvER1SsxxUe5dRXDAgBzYXO70c9urnFQvSfp0=;
	h=Date:From:To:Cc:Subject:From;
	b=Gl60GviUTA5r/u+yMfX5Ev3Hz5HCO/vc5LQy/2zCPkb6K9+dkPlAoAEED5rU8133Q
	 VUB81yrSMWHTFkn7VLbxxImzqsPabkbP1rZv5ktullQ70vpGsdFWOcbpLNavRZ57xv
	 buSNydmATgNJnAdhW9xJmCQa9mimg/L/PhajFtDGPMHQzTpHbvx7LteHayuCtT1KW4
	 TJ8tUc1niH2297NTU8M50z8qVz/FUv3U0hKdRaXfb/CfPb3smDLRB0iL0Hj+k1yP6j
	 2HdGMwbeA0saxhWwGlQdhkfUcG6SxtfJQpL/IlEGDPAN6CMKiTKxt79VF95rFy22gw
	 /qpPFzNJXbYMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VyxrL5bRSz4wZx;
	Tue, 11 Jun 2024 15:22:26 +1000 (AEST)
Date: Tue, 11 Jun 2024 15:22:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kunit-next tree
Message-ID: <20240611152225.7264e9df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+myGlpPhJ7CZEHi/pkLvdpy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+myGlpPhJ7CZEHi/pkLvdpy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  425ae3ab5a1f ("list: test: add the missing MODULE_DESCRIPTION() macro")

This is commit

  245e5db4adaf ("lib/list_test: add the missing MODULE_DESCRIPTION() macro")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+myGlpPhJ7CZEHi/pkLvdpy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZn3xEACgkQAVBC80lX
0Gwc/gf+J0AuJGPNERPozsvt1mTBFtSeTbAhfujJQPmbGy8rgtMv8T7NFB6TYTx1
6TV5OWS9wRNaOLZQxkrw/2Ka4ozDKeGHDv+VXxgORsq5d2UxWQ3iI/x8WuPHFI7e
zTXr/PyNoh01MCiFtWAP5hgOjQB5DWAEPrYlyEXdTym9tttMyO7zEIocbAsQFWzq
djyIoHY5y+SzC6E+QUN1nROuu2R2nKvGJQ20CKmmoZ0rmnTOlRCfY0oHxITSjH+L
SwrgDtBqr/I7RYicHAUmodG/Hu0xec9prrc9COC/cLrH62WpTbec+wsez9Xo6ict
Ldih3js3z5m5V26k5ffzOTJ7iRb6qg==
=OdJQ
-----END PGP SIGNATURE-----

--Sig_/+myGlpPhJ7CZEHi/pkLvdpy--

