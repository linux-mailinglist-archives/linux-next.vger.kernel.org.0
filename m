Return-Path: <linux-next+bounces-3286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A61DB94E53E
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 04:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518D31F220D4
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 02:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F210F7406D;
	Mon, 12 Aug 2024 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qDAu68Hr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D828EC;
	Mon, 12 Aug 2024 02:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723431090; cv=none; b=J771PfU7eqT4W+nR5QVxCKY1j3kTBk27K6ujv1kIz6zIXSaYV07IYbT/ooL6sMkVVkROKLuweAozeXS1Vg86F0jsIo9JSNJG5egMKaIdejfZC7XXVxoeUhBF+qSRgvXHKotlDOYuK9/OfIld8vj94vZX4ZqMnG1brW8MeHkhVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723431090; c=relaxed/simple;
	bh=Ezv00exa+liaJcb22809FVOaTfG475NLsmcHDQW45Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LVrIfFbXWP8E7SIhIWOqMY5wYiw2fnHDJUqc5TTOXu7V8cXPKLZPc5cxiNcp9qfZ9mRfxxXjwMJHVy/0aY0rLsk8Y/KlI5VXY86x8i5rAbvFcqNZSTKhjH7apJpOa58IMQpsNR4S504x4rnqR9VuooIHdtv7tTpBbzWeDcCHSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qDAu68Hr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723431087;
	bh=0ZkDG4pf+7r/4VnCSZJrNDgV8dKL0EdYhljfIAH8mIo=;
	h=Date:From:To:Cc:Subject:From;
	b=qDAu68HrA0TEmliCldmQ90+3ykzRCjJhOEnFYd0+hYqC0CLWILW1LHrx7CFpn75iv
	 WEu2X9HPesLAQ176zcLw8sfYaVYgiRVfa6BAoegD3gXLC86qVFo8gFavQEFFPhtAjs
	 UHH3KlzLOvEs9wvpSrJH45EOTU7CT6pS13qu8hwPAYR1xuMPxAGGkSyrTOJaZ1qRS8
	 gC4FYFFDFUjsL+Z7AyrsS+B1ZKWZXEA8XcoEvwuZ23njcn41wxClP+qLEdvwm2BuFe
	 BCrQyM7KT2g8KMBZBDYCq+oZfnMks31h1ojOmZWmu9Xb9wvlrEQ7Wu5BY1LtOJBGJ1
	 MEQnBrZNKThow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WhzYT6p6wz4x8N;
	Mon, 12 Aug 2024 12:51:25 +1000 (AEST)
Date: Mon, 12 Aug 2024 12:51:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rcu tree
Message-ID: <20240812125125.3ac8cd68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wq5ZwO0d9BLj=KSyQl2MMJD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Wq5ZwO0d9BLj=KSyQl2MMJD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the tip tree as a different commit
(but the same patch):

  23311aca56d9 ("lockdep: Fix deadlock issue between lockdep and rcu")

This is commit

  a6f88ac32c6e ("lockdep: fix deadlock issue between lockdep and rcu")

from the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wq5ZwO0d9BLj=KSyQl2MMJD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5eK0ACgkQAVBC80lX
0GwYdAgAjmmw9LO5UThsUn/RReH8ErAVnsJvJvVMHB2jFxQsxbKN8U0JzNOn9DSx
U8NmCeEMH2Gf1C9xJf7fkQge2YyDgxVBUPvYkj3F8+RTXMzQACjAl+tlpjO8t44u
u3P3mXqk+SEWEk1AbLSyi7nSkjyg7bRBldBz96V/71rrUD/2P7TimstxFnTHj8cs
RNQNSMFNKJZu8CwQWAQFnK1h7AYatdsWOZxOAeutr5NYKP3AwZ0v1ybpedeBsvlW
qV5WJE535uOEKPfN2AWcmXgyTOkVxOq1qx95TmS+RRksTuVgFZir97o1gS+TxSqL
Q+hfIOYrU8R1skWWmi21fVsNVwL0kw==
=spik
-----END PGP SIGNATURE-----

--Sig_/Wq5ZwO0d9BLj=KSyQl2MMJD--

