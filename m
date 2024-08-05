Return-Path: <linux-next+bounces-3231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC71947475
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 06:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0DE21C20A82
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 04:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DC913D50E;
	Mon,  5 Aug 2024 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mVUdXPnm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99225A94B;
	Mon,  5 Aug 2024 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722833841; cv=none; b=XBMYkhRgQ3Yynj10AVTQ3hltxSfo69Yt45LTheZQCdpqFaXhH5oeH1mq7HUeiumLo8D8biBsISMlDcToXi+INEKyFEVKQa/d/dv7LKqdpvfINt0R/5/PUdO5/5o9JBXTixv2rqqFMx9DtnAUiXPQURVEGGjncY30NjVHRF+zGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722833841; c=relaxed/simple;
	bh=KFZY9GYqGU1CLWWYaxfBRQmiyb/iOtqN4+/tLIK/Imk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r3D0zZjGratIlM/JS/qX6HEAyQNaaxwILkHsedGLPwuFDeaqGUSp3bw9xb9EFgoyjR4UmV7b7ZDPzCEeXNY+LXtELUWXQsZ7XCLuy0XD3MA0DKg/vqjR8vuEE8PdweFlsSK0BwfueYyYm/LK97xb4FLc8ao+QakmZ/Bhk8e/Ao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mVUdXPnm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722833835;
	bh=JIs+G20mZquSIqBL9xIBlSW5uIkQJ4jKnz+Z2fI3zF8=;
	h=Date:From:To:Cc:Subject:From;
	b=mVUdXPnmzNtZGJEK63XPCpTNjzdTW+l98q3JUlVxRY2tVQydvaDAUvQzbAPcNIyiP
	 PVN7XZO6NXKG5tjFOl9XD11ctcYXiLDqILx62+DTM9865DmDIZIf6xuHgJaJWW0qjd
	 O/pGOqpksh3BI8JjP8BorOHuuF60k9LF4qQwAHYhlCIHar08LFi/z3oEo1Le8aC17B
	 PRqMYKeI3M1MW1Mlyiju1R02Fq9F/KyrWS9bzuPeWwnx01QQSfiRgsfLia5GOrBVeg
	 A3KnAd23nBSc/hflWjdciz2hsbhzjWtg/Rp8Zq9snjehJngVGC/qbfLWS5U+Sb0Ls1
	 jEiXbdG54eUxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wckgv2Hs0z4wcl;
	Mon,  5 Aug 2024 14:57:15 +1000 (AEST)
Date: Mon, 5 Aug 2024 14:57:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the paulmck tree
Message-ID: <20240805145714.75dc55a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jymxzXbCuLJB0BVoIvgsU/4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jymxzXbCuLJB0BVoIvgsU/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  88b4d7bfe7c2 ("clocksource: Fix brown-bag boolean thinko in cs_watchdog_r=
ead()")

This is commit

  f2655ac2c06a ("clocksource: Fix brown-bag boolean thinko in cs_watchdog_r=
ead()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jymxzXbCuLJB0BVoIvgsU/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawW6oACgkQAVBC80lX
0GxlFAgApPjZYw8wyxB8DAY9XPVFyzmSwG2SunArbhmB2cIYgfIpXJ0b3o8kPo0P
pqSU0rMtV8izWguvKcRRHa3kTkhVYjj7MPqcJkPTzqTwyla70AO5vDjEH3tZtwNE
Y8alZhgDE6NbxdLkuc8gMyDSLrWQD9eFMJ44eTutuRDNs5k3QNqpVfcqSRhUBTb7
FHRqDnYIEQ4EiFScGyQQhic2Mo8Sb4i+TR7v4538wKOVNI1gTrb9sFGboEO7Fy6L
BUhHZePAXB4VBbO4FW/hM3QuE2IesRkhB3JO4UdAh5Piwr0teqma+QEDtdQCFpqf
PATerb+Wdgne5522NYE6goZcXmKU2A==
=1OZB
-----END PGP SIGNATURE-----

--Sig_/jymxzXbCuLJB0BVoIvgsU/4--

