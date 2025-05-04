Return-Path: <linux-next+bounces-6509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F6AA8980
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 23:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB841722F1
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B914B086;
	Sun,  4 May 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p+3ZrTKA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA322557C;
	Sun,  4 May 2025 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746395309; cv=none; b=uHfIaPKCbB4O4ThZfzwzpz1HljMYr5zCAArwbMhwnpGR6twanKGpVt/gUk8MQdMuzo00ETywBQUZj04nHDxGiKQPtToQQEB9H5f+eX0FSOBHt+HcQqreLgG3r1YJnF4o2l3d/Y1jMFb0QwNCQB3siZviwazV/wNsigQ4KZLfaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746395309; c=relaxed/simple;
	bh=uQZRqcxJgCvN+PWj74uZy9svql+GL+Hatxw0gNT3bC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mzJhsbn3Ciy/pZu8cgQAb4On+aL917xWlTIH+eq6/tejBOMF4a15DPbLrSLIabATj9aJYQQtpKZTSx0ZDejSdbSs7q6zei/8mWSbXNLaA9Y9plztUbC32GOIsWY/KQQ3r2nwY/nl6JbIT/g/scJ5oNVy3dY/n3jBsEs5Q2PS/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p+3ZrTKA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746395296;
	bh=g0XmLwJUAyRbh4xUo6ZXOdxWEifsYe4+UOHv5483s4w=;
	h=Date:From:To:Cc:Subject:From;
	b=p+3ZrTKAUzVRN4EF2fK+JpfBPGS5gBIuA0ehC6wciq6JzcIX4fyjBZcsLrFeUpYKz
	 GgyR5d6sodpK2oO4/o43XZrp97giUTZIHJ4x3DsqYA4MSSXALMb+dSBOXH51TgJgVx
	 87Vp6093T59/Vt322EKTKDCktxEPNTcHXK2oNP0zkKepvQSCytF4Nv9VHolrPGXI9h
	 L7pYO6zJG958hfzq+f+4GNfMYQIUAsaimPyRNt0rY/PVxfBN7TvivY9WFQgnAEXJ0f
	 XIz+OyX0LHAqACCUheiZgEkOykFbvEHGhR8kb+CY6MXy4WLl0vf94CvEpQqetIaQme
	 O6dopPqk61uYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrJDw2jZmz4wbx;
	Mon,  5 May 2025 07:48:15 +1000 (AEST)
Date: Mon, 5 May 2025 07:48:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the iio tree
Message-ID: <20250505074801.258da03a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_9Y=By2sCOTJDoHHlaIoYaS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_9Y=By2sCOTJDoHHlaIoYaS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1a521690c060 ("iio: adc: ad7606: explicit timestamp alignment")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/_9Y=By2sCOTJDoHHlaIoYaS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgX4JEACgkQAVBC80lX
0GxmlQf/SfCY5rb5Yo3teQWJSDcbOwGhvnJdKUOwPtVvrHVHJqR2xSpTC3EQYUe1
9paRsHS7TdjPZCGwabRqKdj7rKROeMDTA92QbfkNoee00Wme1roz2KRGjLt2gVK8
AdPyQODO0FOxG4x0r4fXEyE7gr2skEmQigo2H6G5qZqJHZZ2ppH6a3L5HT4pLbFn
hZ+ah8ZdX5i+Rt6bPv89Z9fV91mC9yi6CcAH1hcCyC9EYNkz/o90BTtCCOl/K4hF
31cc0mr2QqiOyUSN8NvlwntGhVMcIR5glcIDhJ1jYRtrRnUfvNwLbuGq9FCdOPLj
Zndlt1XXjZGh3SxQa6jKYf2FqqWhhA==
=1Fh2
-----END PGP SIGNATURE-----

--Sig_/_9Y=By2sCOTJDoHHlaIoYaS--

