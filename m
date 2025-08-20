Return-Path: <linux-next+bounces-8029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D3B2D31F
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 06:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B36BC1C24C4B
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 04:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D50224B0E;
	Wed, 20 Aug 2025 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OX5Ies6c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338C21D5B0;
	Wed, 20 Aug 2025 04:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665029; cv=none; b=VWUvbSWg0/EsqL50R/Tizw5JI/NzdwvsL5LY32vi/1wqAvEw6/sQrqWL3G3H+tXyVXLb+EzVkvsSybHzT/ZTcfNktmfWnYAVoGStGaTm9XJoNgs4jRqPw6MwLJ0Uh/EAM2hgqxI6bU2eJv75IMZv22vgUT+sW+fI1Wdp7GjTlUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665029; c=relaxed/simple;
	bh=/NG/maR6FUK6WPWW4MeXwzkE7iIdXYYZp68UWE9aZ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q2gqLMxXzw6VTok6TnEHVTyQcDKIE2BfVPZTyh6/oDEvsKUAo1ErBm2o7XHUQN3djO7+DtT6DnKS1m6RP7DFfL1zS2M4Qp02ll3p2SNoaplLHOLNhA5+eDdnYT01jgda4KShPZiDzzLiUdFHmWEANkJl7An3f4wX8Dc8tVtJiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OX5Ies6c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755665024;
	bh=06DtmpkW61FtLA5IE8LdxXjc3xR5TKTUAzlBfH/TF98=;
	h=Date:From:To:Cc:Subject:From;
	b=OX5Ies6cxiGf4890apY4ODvKSthwWTIhAq30KTRHEw0i2XXLxapokHJ7piJmUmT9h
	 Fc+g1Ukkf5xHiBiGlx7gx2QjwmpsPyG1wBY/SkMgH71l1gO01LN5EItaycMC9zkp0n
	 ERpHHg7BXMbJVbedyyzDgAP5H+7eg/BcdhlTjSx7PG4dAUyfanls93RhCmUXc8iEu0
	 WmLPB2DZ6kuxkI2Ozbk0WUFp4/k/Sz4ZFiquAXKWJc0cQGVI1eLyjFzWxIFBF7TEwz
	 rzUgbA8mjR2JF8M5/Zb4Iw6M0YbWEY/2yEu7G3RQ5jCi+auRZub9JkYp548YZ4yT6i
	 CvGNtYnPuBkhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6DNw58npz4wcn;
	Wed, 20 Aug 2025 14:43:44 +1000 (AEST)
Date: Wed, 20 Aug 2025 14:43:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20250820144343.46bc5746@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MCNzlgRIKb0iuApOTUb.qI9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MCNzlgRIKb0iuApOTUb.qI9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  fe726eb6af04 ("fixup! bcachefs: bch2_fs_opt_version_init()")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/MCNzlgRIKb0iuApOTUb.qI9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilUn8ACgkQAVBC80lX
0GyydQf/QIUIQb+OvOWc0IqumEW18f0gxDYiEEbJB/nm3z09at8MhHSwVF3Toojk
HDCLg1/YbLxWKmawb+PUMbwSW+jGMTKj3lemH3g3gRlADDgflBb+nlIRwjbXTaKR
KVwsVDsHI0u7KfGGBfaNzk89QWs3nuWEa8GVFgZNjoHVeJQ1+Xt2+W+BTO12u6zI
XO8DQHjMT4rY9yp4Y01M67kiuc98F6oUnayVQlHe6rQRUAO/htZ8AxU8y1J304nx
m95cJvSl0zQEY3qujfLVWXCt/0zxGuns8d3Pxos8YZ7xL3A1G6H4UH+ZIzgpKdaU
vVydf4UXKyEI5S66ruX8EO/npnbWDw==
=Wd1Y
-----END PGP SIGNATURE-----

--Sig_/MCNzlgRIKb0iuApOTUb.qI9--

