Return-Path: <linux-next+bounces-4264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BA99DD46
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 06:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63A9E1C210CA
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 04:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688B116087B;
	Tue, 15 Oct 2024 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fj538o6e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17815175D47;
	Tue, 15 Oct 2024 04:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728967829; cv=none; b=t166++9BxeVoRQVqATdBZE+ann9/TAQKF8LsrjX9vJO46EbTGruBF7kNYnfUACIj2zVjjtpvmzXVhk4cY8K9z5AN/zpB7Q2ceEWzmrL8y+4wyXFlHqrbB2oZgwFNzj8GxHEdUHq/5p5Xm35PXpXbY2uWk0OMlxcWm7SiD7GkF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728967829; c=relaxed/simple;
	bh=QaD+RkXdnoHld+rLfYKon9qNc7qhjmj8U9hzWRVOq9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qhhXrVjF4DbmJP3ac5PUz0e6aOxlZ//BpNO+BYwxkqnK+J1G2ihNNzDy3DMXyYLQ/YECZf2zjSEfQ/RtQrjJO4xHWfpDdugYgLew+qI9aQKjxdu9DfML1tcfXwNCx8KxxysQHmLaFsBT1OCJ/vpOxWqVLWR5CYgaYNZDZxGsXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fj538o6e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728967821;
	bh=24Ne2Cpw6e+6vaMRMjYH9vvaHHayVeaCzTWJmDARTQc=;
	h=Date:From:To:Cc:Subject:From;
	b=Fj538o6eujcSNbWOf1m1FL5RBJS4/Areo2kEs/l/nYnF1NkdxyBBOzckj3Lj4W5v+
	 T0PCQUwamdUzFC/pDvMo2JiYKFMGriToFKwXKYMN4fkyjpp77eJrNcHAPAslH9ZbOA
	 pGDbKaeM7GWruqI01vhNU6KQSPBs56sScs1VfWmzE8UbdKWemJsSmuhx1/1hUHqprB
	 F5N2OnBAF6Fzf727wE+AAAbJopyzeTqEv6FYbbXGsvYHRzu7+GWDfK5f0jiUwPdeCo
	 j+NxswRfQoiZ2l/dtIxxxLZMBKaJZmBfQHsx+bVGjUmVVYYvubPYqDGxoIXC/YhDNx
	 sOKPF0ocVDtgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSM991ZSvz4wj2;
	Tue, 15 Oct 2024 15:50:20 +1100 (AEDT)
Date: Tue, 15 Oct 2024 15:50:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20241015155021.6707d315@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8PNNLEOJx.MXiTtEcTUq4UQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8PNNLEOJx.MXiTtEcTUq4UQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/iio/ad7625.rst: WARNING: document isn't included in any toctr=
ee

Introduced by commit

  b4a35432dbd0 ("docs: iio: new docs for ad7625 driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/8PNNLEOJx.MXiTtEcTUq4UQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcN9I0ACgkQAVBC80lX
0GxEpwf/WnB4io8oQrvMJSR6+gUISNq+kdZB8RCzcYZbuvb4yfEUx63B/nV/ufTv
DbWOsnW/OAkwHHzAkVUbZGm+t3v/FC9eP37+VsuI2DfRC+R7qSr7ZnpPy6ROXi85
XzZET13G1uSHt7LTG2kTnSVtxgCLQO4DLrw9beqCf1dB7zvem+k78GZI8tWfXZle
Zo9hQ4ChJbtf3kQ3awbpb6V17E1PQC4yttMiS4TSVHiHSRu6z9uXUmV/Il1N5XoD
oIKhCBw7ikQzWpHJ8edMNMFQMjXS2R0Wsg+NLoMYLUlWYSlQtR5IJ8aJMfs21y91
zb2Bl1lp97LXTEaY3s1Qygn/x+vGUw==
=Q2uA
-----END PGP SIGNATURE-----

--Sig_/8PNNLEOJx.MXiTtEcTUq4UQ--

