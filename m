Return-Path: <linux-next+bounces-8151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190BAB3D83B
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 06:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E784316ECAB
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 04:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B203223323;
	Mon,  1 Sep 2025 04:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RpvmuS6E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FAC1DE3DB;
	Mon,  1 Sep 2025 04:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756700807; cv=none; b=QY5TegsuldpTInHAGAzts5aVg8uValJpKcvbPmqlNm/ehCAxPcZ5d8IYWMMFAU37jyb1Pwrljy5Ur+YF4WyAlV1vssmmKsAVs4IMS3QpRaLjyDRcpedBJIZ20xMIlLcETWBU3Hkzogniw1BX+7VkwedgW8NzPfLd6XZ3F6VK6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756700807; c=relaxed/simple;
	bh=oemzABsj/V0ekCx/UpRBHmBTS8Byn81McNB0nw2tksM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RY69+iL7yfPbAVPaBVQN2gjgzrObafjMEdtaParPGpHvqsV98voyzW0CATqB5yBGbNtH0lvtLdFtOXaG2DGuBVIUZmVhQOjKTa3uFsWoINwfBc1ehNVNoH+y7+zAP3xJ14ZIFFZypI0vlsiIO+iuAn3TjzvhrGDMz0MfZG+go6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RpvmuS6E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756700800;
	bh=yvpisDviLA+tQu8r0lizKmdUZgxC3D3iMWxAH6+T+tY=;
	h=Date:From:To:Cc:Subject:From;
	b=RpvmuS6EE77/TKcnV7M5vJYVqoIGijluhzhnVWkZ/rX9EAARQ78u71AfRrkb8nw8L
	 rjDmbZL9JizWk58VXjMneIvOCL9SdPXHfMf2fBwIpqX7YwTDipO+0kCSZ0S1q6daLl
	 gHbVqRv0MCv/kgVzYpYk5VQjlffgZgUiNvqomQeuZX8BYwvdNUoxEgdHetWH191EMq
	 NSYFOc2GywxAfnzgIK4dbYdmg4U2wwHSwVUre6EL4O2/ot9MXO9Q4XHu/q2nG99o/f
	 HSeUFN4PWw4tTJhLnaCEfPPo5CP2q2wK24pPZ/hPryrmPOuJMZJ2JKSI7dRNoRUe3d
	 63Z/0IeNNPHGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cFbRh3ZhNz4w2D;
	Mon,  1 Sep 2025 14:26:40 +1000 (AEST)
Date: Mon, 1 Sep 2025 14:26:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the jc_docs tree
Message-ID: <20250901142639.4de35a11@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MPsJgAcXhHigV0a1rY44i51";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MPsJgAcXhHigV0a1rY44i51
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
failed like this:

$ make O=3D"$HOME/htmldocs/htmldocs" htmldocs
make[1]: Entering directory '/home/sfr/htmldocs/htmldocs'
Python version: 3.13.7
Docutils version: 0.21.2
Using alabaster theme
Using Python kernel-doc

Sphinx parallel build error:
FileNotFoundError: [Errno 2] No such file or directory: '/home/sfr/htmldocs=
/htmldocs/include/uapi/linux/videodev2.h'
make[3]: *** [/home/sfr/kernels/next/next/Documentation/Makefile:109: htmld=
ocs] Error 2

Presumably caused by commit

  8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makef=
ile")

I have reverted commits

  aebcc3009ed5 ("docs: sphinx: drop parse-headers.pl")
  8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makef=
ile")

for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MPsJgAcXhHigV0a1rY44i51
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi1IH8ACgkQAVBC80lX
0GwjIQf7B9iu2YUN+jRQQYzGNjAkx+Fj3dKUebwZp7kbxEl5prTTeuaOU4EYT9te
JAyK9oPY9C+WNit3AXoPnqpba9WnhlISPxy5hnwJ4X6/OsCnd1Grpjr16sK6S6Tw
Gr6Ap+l7+1BmPIhjhiCJoMCs5HJ++6019t/I0MZSCtH5Ppp+G3ZGJKgyZJLJjjsb
kEjcwVrDzS066TVhLebihtpGDFZCbU+wUwEZyOqCCizMcXJeSK1YtU21nQrTZrzT
5BtGiny7mM26JZ8E72Tdgh6bmXnrttT+bNrMtiOliJXpxJMlso5SXfeOy6QWmVFf
HB3WGpa2XSXLP9Asq4ZD8+X5vBbywg==
=m3Pl
-----END PGP SIGNATURE-----

--Sig_/MPsJgAcXhHigV0a1rY44i51--

