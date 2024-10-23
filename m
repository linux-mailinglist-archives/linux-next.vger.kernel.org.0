Return-Path: <linux-next+bounces-4382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD79ABC95
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 06:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788071C20B9F
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 04:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790A913211A;
	Wed, 23 Oct 2024 04:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bxVmqS9Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A543A1BA;
	Wed, 23 Oct 2024 04:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656500; cv=none; b=hqB0H5oSBr+eCVq0ZbicrLjkSD5POKUdWtlCE5M4m9rmrWTaAfL6gxhh6nmwHXFP22MyrOhMcPhcB8EIsot6yUaRV7pkTt1yvYxzF56sfxInRwSWRHBgvijV74ocRY9Urd9b+XUqvc1HOpzlkF70oE+Q+Ne4yqz2kA+3qB+hE4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656500; c=relaxed/simple;
	bh=M6rV8BFk9a3SaQhuAhdS/kM22vpBWs3ijwkhYxnCPHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JOl80Ywd9xavQ0sygw1F6KHQeYKYRfw+GIjrGdAw6YZy5QSoO1x90DjZ1iFhyckIVxhIMNDlZXAQeuZXOGY05rW3S5b6LIOYse8kkY3w7tTT7jd5+oJVDP+UfEC61IBB64QAvKLb+ON4/FKP6pOUxOHZk/p+wmHP/Kw/0Dr94kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bxVmqS9Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729656493;
	bh=udjhRnh6SaCssqVlVe7lrKiE+z1W/PKXA/EWtS32uN4=;
	h=Date:From:To:Cc:Subject:From;
	b=bxVmqS9Y8yhtnmxGl8eO1mr7ZiH3RCkTCSD9aKQAOmKkXwZHKakblceQgCkXORPwr
	 rDHnfKyBP0ZwxetqOfEt1LhEE3bctvrt2DNGRWbQELszzNqBUERxV9fXIwypX5EaWJ
	 LVrV4RTzErGaoTXCr7Qlo4W0id/yjKP2K+CfGsNBqc29Bus2RONaDfHLO9onoBtebA
	 RHydMXL59dcbDiXyOK1XHN0HXZfH+3GRpZ0L7I6RHXZR2lZkqXu6MukPLt2enw77gD
	 /94zFUU9DrGSpv7osTLmzM0OBP//T05vYicJcwP4T4LFFldvyjsGK+1aK+6sa58HdQ
	 Qu5bRXJ7DaY5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYFrs3P8xz4wb1;
	Wed, 23 Oct 2024 15:08:13 +1100 (AEDT)
Date: Wed, 23 Oct 2024 15:08:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the dmaengine tree
Message-ID: <20241023150813.416aafd7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PueVX+MxaG5KvlQEsHs2Rme";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PueVX+MxaG5KvlQEsHs2Rme
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the devicetree tree as a different commit
(but the same patch):

  72c65390c61f ("dt-bindings: Fix array property constraints")

This is commit

  a6fa1f9e32f5 ("dt-bindings: Fix array property constraints")

in the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PueVX+MxaG5KvlQEsHs2Rme
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYdq0ACgkQAVBC80lX
0Gy02Af6ArD/qVAGV1MwFqUiDEAhAUaPez7d5OhlStOl9LgaOutqHHCH5TcnInA3
YLZvoC/0M9YZ7p6J3UuCOy93XdPj7MzFuKdV4zNuuglONTWtg9bMVy3YeXTybtuQ
EDUzwqSfi7Ff52yrQAqi5muUWbPw+xokay0lp7yHj/+Bv9rY26uXsJNXcLVUPA7G
LxCOt76/vctfcozvsBcg76S0h1MKyWeftywBj1sIK3tbXrM8wW/qRTsF99wQiUwL
+Yfs/sxYzzx6zkMBheR+lTdG6qFtX3Q6+k9ukUWOQhaTZ+B8yRoZiKKewFI3I2ER
n5kU9XeAmofnOU1sJsOX7e8VqnUdkw==
=24hb
-----END PGP SIGNATURE-----

--Sig_/PueVX+MxaG5KvlQEsHs2Rme--

