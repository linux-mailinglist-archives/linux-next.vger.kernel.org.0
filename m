Return-Path: <linux-next+bounces-3239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F685948885
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 06:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8EE5281824
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 04:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894E1BA88A;
	Tue,  6 Aug 2024 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mP90Py/h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3053B2AE68;
	Tue,  6 Aug 2024 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920101; cv=none; b=f4YTSlA9C3nC1IJi8WcNtC9xYhrGk6dIch9peGrs/O4HnQBHzaI1d+QsJHEODnmGGfSW7l8kPuMpiO9xe5jolaKino5I212YvhJuexBflpx3szfgCWWN22OtCBnq3pCSGa1RPRAUWJeHW90cZuPRMXiVyTtIeu4jiST+yhzEYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920101; c=relaxed/simple;
	bh=Fnk2SkFvReILZashY28NuHpG1sCHrWFZE6iufyyniUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wq6jHJr9s1fAdmP+3cOOmw6xc+U3qUTc6KtSxc7F0qB2Ai/v5HGzoINnoy6Dq1Ii/oWy9BWRYevGa/2ohb+yKgzuPdKLD9xw1fuy9gD62YMgoFFs1PQmQFbEFvEvo3tRnJS8U2Ii/GPjvmDoX4R9Grl/T+VJhpSpr+bTXbFhvGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mP90Py/h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722920095;
	bh=k5aBA7Tb+MBRpr6Z7OVPfNcU6AvXcfCYoZ1x43aXJ/U=;
	h=Date:From:To:Cc:Subject:From;
	b=mP90Py/hnpF8+mAracZTgPsWyfT02HlF9CUfDbE1V6hubf7A2eEwtsQBDm1ctr2/S
	 8e43tdE5+ZXemRrRvWsOxJZdhnXaSHt8ZyozQ9hWGa71y1y1Y4vGjOWxWLxTig4/Pp
	 MmOIJuZQ413Uxmvi1ByGQGMnWstklW9TiGvv2mBE4IYT15aD3Y8E35OyPFJp2FTdjZ
	 jmdWnBpgYVa7h76nGhDuBl9NqpgBGaWj6dQx8KxRSQWiFbuRa8/alf358dXVWGiGKd
	 osRva/B57/YawSVwPk6pJ52jETMP8lqRU/RclJgMjJMk7WKx6ioZIqpy8GikyiKtGT
	 H8SiUAuRgoO/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdLZk68qQz4w2L;
	Tue,  6 Aug 2024 14:54:54 +1000 (AEST)
Date: Tue, 6 Aug 2024 14:54:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the asm-generic tree
Message-ID: <20240806145453.5297d452@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kfgWpx3zeoGVykIPgm5NWRw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kfgWpx3zeoGVykIPgm5NWRw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the asm-generic tree, today's linux-next build (arm64
defconfig) failed like this:

error: /home/sfr/next/next/arch/arm64/tools/syscall_64.tbl: syscall table i=
s not sorted or duplicates the same syscall number

Caused by commit

  95cca8c0b665 ("syscalls: add back legacy __NR_nfsservctl macro")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kfgWpx3zeoGVykIPgm5NWRw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxrJ0ACgkQAVBC80lX
0Gzh5wf8CKZ3fk1CK8Q1wnY7vGoIBDZGnRy0W9XnWwI4tsrkButIhs/f2ltAlZSr
HjV/W9nx15Nth5mxzmNScjqbgpbE2J0BFQ2UfbLKgmHnSN7GUaILoqloI4q7E2GR
HtAZet8Pnyhu9QJwXWzI3wmmeSzYn/FyIKBR3guTp5ZCLjT2A9Nbleyo8UkHIPqy
B7ESQFR9DJJT7Ka4tV8mbBIP32eyyiXPUuy8UnOQDDjhNLo2hAGCKiHcUGMSms//
YeLwG0cdfDe3DpgaXwn6nIcvTrXG3uzPvymB36MIDfc63KbFbKi3j/wvrDkmormo
t+rnj0brQmWocUrhKctgnJhjFiwp6A==
=KKDy
-----END PGP SIGNATURE-----

--Sig_/kfgWpx3zeoGVykIPgm5NWRw--

