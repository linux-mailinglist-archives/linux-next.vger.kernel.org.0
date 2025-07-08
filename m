Return-Path: <linux-next+bounces-7389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002FAFC039
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 03:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E63A423A83
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 01:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0A01E47A5;
	Tue,  8 Jul 2025 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mfB2vRTD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D31C8FE;
	Tue,  8 Jul 2025 01:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751939375; cv=none; b=hVBqtTssDOx5KYO3C858zvGKLw7+kvX7HRhLtxe4L4Wv03oQlR6A77l12OPV7geXeBORNReH+R7mU17NeuBLo8PisZ1gCE9TdGhwnLz+eNgs7oeAfDxUhbk6bP3O77O7jGCNuaCno+WjsUWG/0mQ7Dj4AdAHxF++JnYO6AcESh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751939375; c=relaxed/simple;
	bh=APrdhuxCeqGdTJmIy9VLiLcyd9KrStt0/Q1vuW4iCL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xp4NRg1SYPyZv1b07DEfAX162hhmCGXX8ZoMibtS0ZceWh5ycLQSqMaTbsY/CUAP5avqN370umklVxH7wW5M31XGnwbrsmURXLcjYGKR4X+GSU4aB64Gv8hHN+nV6xILFc7vm8OghX4JE6DzkFdTxSC4zcXhHetE1bPQyg2RZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mfB2vRTD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751939311;
	bh=u9MpRVdLVDBHRe2122M4F+8HuvFVsl95/sDF1Q5dFFo=;
	h=Date:From:To:Cc:Subject:From;
	b=mfB2vRTDSoEH7mNZ0MiR2jw/zUldj6hEFIWTG606M65cB34xNNn3cY443Cmx6ATBG
	 d6XPCQJtHThOSqXBgLMYqmDO5ENUg9B1eVdmaUF2UfaYRBlYYCw3wBfkzY3YDAjCcm
	 FDebF4JIjClqIWWB0x4vcLpYVNHC0fjIVZSTl3yvZwms0HeHh6+OieqwCsdwGGvHIV
	 4zyr00c73Dhyo/CBfi9GsPu66d9AF1hwabeO9t5gA32Aec5PLl6exkndlGTEekhkUJ
	 XULJDbF7VbD9+cfSpe0bfVJMsC9xB81pQRK5nmGbZ/DFYcJYAplPD+oReOVJ1aUQc+
	 zIbDGAOMMZXsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbkXZ6YQnz4wbW;
	Tue,  8 Jul 2025 11:48:30 +1000 (AEST)
Date: Tue, 8 Jul 2025 11:49:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Zheng Qixing <zhengqixing@huawei.com>, Yu Kuai <yukuai3@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20250708114925.2413cc77@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zp8+q6x=2VBON8n3+trUCx=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zp8+q6x=2VBON8n3+trUCx=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5fa31c499281 ("md/raid1,raid10: strip REQ_NOWAIT from member bios")

Fixes tag

  Fixes: 9f346f7d4ea7 ("md/raid1,raid10: don't handle IO error for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zp8+q6x=2VBON8n3+trUCx=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhseSUACgkQAVBC80lX
0GxOLAgAjR3Tik3nBBLMCVOF+lxCa5on5Gb2Gc5CB5+jPzvVUzp7xk1zaBTiY2f2
yN4d0QQTU33+Ti58q+3DgNg72ZYgmivDUIUwcMvhK6VPfs8b0rg/NSoD5TTu31mV
x2YhQhJ3Y/m0ExZ11JcT94aJkKrwSe4N3uW3agvXaVoqXRJ6aVaMJCTLhRHVhTqc
GoJEl0MGJa0kWWyoYnydXmopdahvqr7V4gkR3YTx/nfZX9RPyMh46737GegxEMs7
HvAozLOmWnXtSm9p9/OYUed8H1hyJM2JvVEh4ncM55a90xEaKc8Wn8PbIQKydGW0
H/NERhXpmx6E4ZBxWBc3K/hXOHfZ+A==
=s6HV
-----END PGP SIGNATURE-----

--Sig_/Zp8+q6x=2VBON8n3+trUCx=--

