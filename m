Return-Path: <linux-next+bounces-7081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D4ACF953
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 23:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF8D1898A93
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 21:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC8D2185A0;
	Thu,  5 Jun 2025 21:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LTr/WfB0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0A28E17;
	Thu,  5 Jun 2025 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160712; cv=none; b=MyOApr3aU5pJ86WuxHN18QUvCBBry0PNxQ9Mf/6sCUUsRXEDnc7mBU4a5tNmA4mYUMNgUYyNLapWr/YMqzMgmXfCa2O/ghprFFvv5S10foCij6jAHO1k2YIuWw3pxkqPj3fRTV1T6a1yVaTnWcuYe+W1g29CWTZsAAqn2N13QJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160712; c=relaxed/simple;
	bh=YDcKeBvvCH76i4Lg7IQXNCwVtg0zeGFowGCrTovcc2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=adOwufDHIDoTypJ1dlAh6PciNN+TiXsObkc6vbkw6Zn+mUHtG1B6tswBJVwfk4XWS2cxsZIliJowxHiGsscIQOucpicWU96zclBY6NsBN7KONRWw6LOjrLRw+SucQGN8wo9uO5Kr1a8LdJQcVNIDO6KPUvibxyTrCzpFnYQCk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LTr/WfB0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749160352;
	bh=5zwNf8JIwOXt0gCxd/4OJe0h4Pp5ciq/uJCTwjYdGUE=;
	h=Date:From:To:Cc:Subject:From;
	b=LTr/WfB0nQ/cPvzc74JLXRJLpSkT4SJYTIz4fxZpc1ADQEmGThSjd0pHLbWe80/4+
	 nJLYwOXZkUNK7prXZhPIo84+lk3cK715Wvmtuj1ygyVRhJ2Qqve90vizYSyY17ulSs
	 CQGfum7QaEl4xLQBos3eascNJb+EN4haLkwgRtbhKG9/Y8wGADjS0NdxVwYHftM70Z
	 aFDrISV/7UkpjMUVbfUS+pdMCUqPFY/wGBF1UwDsIpj/uMYb9BqLzBfigE5qEwEr+K
	 ljvWQM9PDNoucDAZ7BdrX/5/XUV103pszlLedKuZa8t5LaUXWnnUF75i5i7Tz80VLw
	 943ZyT3YZNKfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bCyq42mkYz4w2J;
	Fri,  6 Jun 2025 07:52:31 +1000 (AEST)
Date: Fri, 6 Jun 2025 07:52:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20250606075230.6a13c53d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pyps0HuD9/J/87+6btea1.g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pyps0HuD9/J/87+6btea1.g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  10f4a7cd724e ("nvme: fix command limits status code")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pyps0HuD9/J/87+6btea1.g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCEZ4ACgkQAVBC80lX
0GwToQf9FLX3oEPYyPCQxve/oLm2ICV2QCQNtDinYFKcyAMPxO+Vb+1I6Yg0KvmK
b1H/eiOgKLG9EnCnetPFkpQLwFrqtwcif5/r1V8JbRo6XJg1lPrOVhNr+FF2M9Te
8lX9aVA0lEyjO5zUD6j4FYITOb0qC1qxAl03Cdp0g1NqZxKXUFWKlAqWu4Vskh1g
sEINlhwW5SdSaQVdFAczyJDKEiG8VScHOkw5I8cCbpNS6ZerssLMCpFq9tS5VaCY
CGBLjvIidsYPF1ZwC5SuTsZ7nUwYiiqLnCIedlDJBZ0lB64ze6AwXRl0+L7o6t/1
Na6QJ81kHS1k+49gHBcCAZDTR/1M2A==
=kL69
-----END PGP SIGNATURE-----

--Sig_/Pyps0HuD9/J/87+6btea1.g--

