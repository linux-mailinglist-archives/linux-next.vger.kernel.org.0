Return-Path: <linux-next+bounces-4361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 832719A981B
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 07:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43814284496
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 05:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4567316E;
	Tue, 22 Oct 2024 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RLE245gq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19C10E0;
	Tue, 22 Oct 2024 05:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729573695; cv=none; b=qAPP5ehujzEfdU213PUOH+espgrNjpcomhQqcWcr5wh8nhiDZN6eOqThBLaA2iFHyooIAgnU9ik8dJ07a1oRjYzNRMncRqGNP5txsZhLIYd6H5zhsqmvDVAe1JR8+G7/XVgfCyDKvIvvZR2PGT8p12D+G06Qp9JdCkr7z+GtXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729573695; c=relaxed/simple;
	bh=Pz1bygNOzlScu41+O+8uMVD57QAR723FHQ5STBMg4ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gr8YTQvBgenoQHK+Jc3MKeGtiI674U9cmyN2E8OQgd5QWiwggmKvs6SZR5rbRaRoaGML6/m5bt0dX8+Q5v1s2/RQsZ0Ue8ohOF6h+GEevfvBFEHrHIMdPnzP8O08awLKzeca10IzOLu8cHS+w5rIzzDFhPPJ1JLuDgssYt7U/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RLE245gq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729573686;
	bh=jdmwtuPmiw7Ox8gUFK3P+X1wjtSFVWnwIaefMd/tLdk=;
	h=Date:From:To:Cc:Subject:From;
	b=RLE245gqMyI0sxwCM5xOfgVhyLSDeG6jHD0XAnOQi6GusC9Mugb4B7aa49DNycLuc
	 mzifLEHssqfgWDZu6sOVAapxdQGyERrXrhzjfu5IYikpqlgGPd7gUxSAvSJYpjDIb+
	 QqmH21K/oH+QQJCkLuGALIU2TNikEeclqAGU++nD0jqGbBkP0RcJMKubraZOlz8rEa
	 euv5Z052viaQmupGhPbzyrmynfc6ogMDXUaN4BqqVDFa3mDkaVkqjXZc3pOfKYyVhZ
	 ZYpek5F8LUDPt6U6QOXu6q9UP6knlL2NzsC/8mXy3bOQ/xrcFiTtK4KX+Zl2B+OPHV
	 E/U+IHZYHq/DQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXgDQ0Zvgz4w2M;
	Tue, 22 Oct 2024 16:08:05 +1100 (AEDT)
Date: Tue, 22 Oct 2024 16:08:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Ramona Alexandra Nechita <ramona.nechita@analog.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the iio tree
Message-ID: <20241022160805.63581b36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t2ixq=7iyk665rQ3YO_IQTc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t2ixq=7iyk665rQ3YO_IQTc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/ABI/testing/sysfs-bus-iio:2273: ERROR: Unexpected indentation.
Documentation/ABI/testing/sysfs-bus-iio:2273: WARNING: Block quote ends wit=
hout a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-bus-iio:2273: WARNING: Bullet list ends wit=
hout a blank line; unexpected unindent.

Introduced by commit

  0404f4e2e48e ("Documentation: ABI: added filter mode doc in sysfs-bus-iio=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/t2ixq=7iyk665rQ3YO_IQTc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcXMzUACgkQAVBC80lX
0GwbDAgAiMGwYV8EUrjPIDMXd/beLKq4KviK81/TKFsMPB5tqj3RNzuuYSmW4XZA
TZTq1KDsnnaKddul+2BEy9JXwVbJ0syHsL7XL3oNZ0gz3dOBUMETjkCh5GK+AqrO
GkMW/JmyI4FpqiucgaMYIQRGhoKZP8QDEja3W4F7T18p4PriL+fxe0FstSEyABNl
7WBVuSJo+KLHbo/pc+5yWMsGXp3p3E+uVuhHc0Ikh7fy9ivbkm44IVIlKWl0CXTl
sKcaoOgvAwNHoAJM2VSTqcqMsS0ku9Hi8v34KQ/VhEFU1hJQp52bwIgc8PcfUfYr
nxZF758ZlwLVvAP2ZiZ9wBnlbY2NFw==
=qYU7
-----END PGP SIGNATURE-----

--Sig_/t2ixq=7iyk665rQ3YO_IQTc--

