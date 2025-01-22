Return-Path: <linux-next+bounces-5292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427FA18B6D
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 06:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1BA3A33DD
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 05:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64969156C6A;
	Wed, 22 Jan 2025 05:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zj1vkYa+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6A9463;
	Wed, 22 Jan 2025 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737524786; cv=none; b=AUjEi1zo9RZXM3MH1nCLpt8Gl42g55ggAPBVmGOP+JM7Hvx6wldLbx2LcPjMTN5ego0nPlkGMokVM2UEx2+lKWbyG492XRzMDWuR7jVoPZwmfdhoLGI+3CzaOL9e6lQlWHk68Bwi+SiwmxH6rOrHKOD13tEZNj7i3EENruC5SvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737524786; c=relaxed/simple;
	bh=N5iR7Muum22QUH7Kf42GkKmeKW+Sn/SdBq4kkabRZKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nxq8chgdQWuOlBztUJmueNk+clMLGUS5z8f3pUMWaVaN0jW4CpZhaQMSjSN8cD95Nzi8euUdESvyH67Zxc4hS75O6gXCVYeQz9bBdZ/Omx/ItGUR6jIbGT+PRqDzIEJMjEZDTt13oMB0OHUSdAFHQbRFTA2IS3DoGEFWT0EvTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zj1vkYa+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737524770;
	bh=jkewF8Og760lCodE9jSGiWdEg+eh9bhiyVGPLCjz8AU=;
	h=Date:From:To:Cc:Subject:From;
	b=Zj1vkYa+Y2ULnAf/7Mz6ZoY9l7k7y1BpjnXza3twhVB7uNf//M8HBeB/c0G3vuud+
	 PowT8tamcIiELZWn3pJ0TLwNmbjuE5/kGgofrbdVdp7EPiXxgBEpJK2wRTDbXg+Pwh
	 QnTgY4zKUHPHjhPj6O4F3PoL362khOBJGAMJ2ADpkGKAPdy9p5BOL3PTBTAYVmBvWk
	 F5q8KK36eFAkTM/X70C77K9pT77kChoX+CJv9dP6IucqTmNibcGwk58U9woNzspqbZ
	 xbnvPpKlU5H8OT4l/vmc6lj7Sl5e7TgvLM0sMmy1wK2Ae9QdTev3Dx1giy6wgUzmE7
	 o8Ltr/jkOnwyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdCjs4Fvcz4wnx;
	Wed, 22 Jan 2025 16:46:09 +1100 (AEDT)
Date: Wed, 22 Jan 2025 16:46:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20250122164616.22b96c51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JDMG.gSvXDTEVhpQ+5Rv9dx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JDMG.gSvXDTEVhpQ+5Rv9dx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced this warning:

Documentation/block/ublk.rst:336: WARNING: Footnote [#] is not referenced. =
[ref.footnote]

This warning has presumably been there for a long time.

Introduced by commit

  4093cb5a0634 ("ublk_drv: add mechanism for supporting unprivileged ublk d=
evice")

from v6.3-rc1.

I am just going over left over warnings in he documentation.

--=20
Cheers,
Stephen Rothwell

--Sig_/JDMG.gSvXDTEVhpQ+5Rv9dx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQhigACgkQAVBC80lX
0GyuoAgAkEuU7OC25e3q25Q97BLaCvfBQtXsANvZQJLjVjjoVXGi5eVPHqHW9jCN
WHDZRSwUwxrmXbgZCZbRKhoxOqyRCI3LainNfaUA2rgsg2cD69nbksRICtyTMmL8
OT5q5ZVMhKe8QaaYItf2QyE+f3IqJPYitcIVQliPNUSxmMZ6b8l+9QW3agNc7mdC
qYrQl2zEGRgqfY8VSI4AVB9N/2SgBZT5EfrQlQWfniju77pyv8eOpM7fb4aUujPk
+UPSQ7OYdEAjq4ZoJetanE3HEpv9zPypkOSucbRDETDUcAPgGYKcw9ViQUbIMzEP
dze+KfX6vTZE5Yf4lMluYzb7vOzUqA==
=QcxT
-----END PGP SIGNATURE-----

--Sig_/JDMG.gSvXDTEVhpQ+5Rv9dx--

