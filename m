Return-Path: <linux-next+bounces-8672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8AABF9838
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 02:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 187BF4FC067
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 00:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B2876025;
	Wed, 22 Oct 2025 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lo5c9baB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076D1DB375;
	Wed, 22 Oct 2025 00:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761094015; cv=none; b=dMvYH3S76b0Qf5g4E5FuS2TBjXL25DmkDlpszmHfhz22bGvaJJFbO2eBixOxkEsL/3EkT97mu8iSRfR++oLc9gdtLcz/VERQAG4LFDRuEYwOgCrS56wHxsCjaEzd9BtCk9sfawud/hbEVQjzUyJZlweufP6jK7nUBMNdRhH2qYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761094015; c=relaxed/simple;
	bh=9zedbGfbaoM5u4ZdfcyFq3k9aBVZMXoA2Mu2j1nOf64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j56Hswyfe7EUDKDgiQhKR/VAGA/EyBwZjlPGIlKkIZbkyH8AsqRg7YvDpmbve6CMzYR8ZPukJSOcqfCM8MLy+Uicr4mudI0YZvdcERjBH76TR/iy3Utjv15W6teqeDJiGeOteCi1VZj77nANLuMPAV/4LiHgrA6S1JXt0OvvDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Lo5c9baB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761094008;
	bh=oLTfYh7UNOirViaAmqiLX2FqwS+c10rWJSMQtVrCjqY=;
	h=Date:From:To:Cc:Subject:From;
	b=Lo5c9baBl8tYEoT4Zy9Jpclp7rt3WhOC9yUm8jXnTauYIUHD1qEH1CjV7LL5IpX5d
	 p4Aru4tMgLyMjWVuvuJhzbLgveSDMDhyXsoqFN9tXuVEofZIkD6gsBVZGnVR6PgXGy
	 ISi1IZUeHg1rd6yoGtctaP2o5obvqBgDtbDo4aMSMTg6LmTJ162VZGkueyz54gMvjE
	 Wf6lYe0CIU4xlYmrvD3EIkuHRs4iEQ3yrUadQHopH1Scl1fSr19GwsOkhZFrgJfLUv
	 P5LP3nbKW9NDROKP19ixXKVlDw8O4Yo8vq7Te9CO7nvtxXt1GVjEiI5i+iu1/CliaI
	 y2cziIQmurHlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crr8P5yZMz4wCK;
	Wed, 22 Oct 2025 11:46:45 +1100 (AEDT)
Date: Wed, 22 Oct 2025 11:46:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20251022114644.4437c2d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J40QB5wj/ZWAu7Xduaj2lu5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J40QB5wj/ZWAu7Xduaj2lu5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

error[E0594]: cannot assign to data in dereference of `lock::Guard<'_, T, M=
utexBackend>`
  --> rust/kernel/debugfs/traits.rs:64:9
   |
64 |         *self.lock() =3D val;
   |         ^^^^^^^^^^^^ cannot assign
   |
   =3D help: trait `DerefMut` is required to modify through a dereference, =
but it is not implemented for `lock::Guard<'_, T, MutexBackend>`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0594`.

Caused by commit

  da123f0ee40f ("rust: lock: guard: Add T: Unpin bound to DerefMut")

I have used the tip tree from next-20251021 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J40QB5wj/ZWAu7Xduaj2lu5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4KXQACgkQAVBC80lX
0GwJ8Af+Nfn7uI+nQ/YbG9Qx1tduynS+qLzBSTX6ZTjNo734Lp747Iw2lQy0AdGx
quEV5XCQxaCAmxBjeHHGnz2bZoKiFDC3IzzAL4KA4Oz7zpK8fNekypuU6pg7OqJQ
scMTPD4Y3pObgtL9W41IpawQtfnpLPY2pzN6UhTsQ4IogXAkpmP8ES0HozDQX+/X
hBNqAod6q/RvXjF2OES2uHivpwE5tg1aGFPUFl1zRflYJvrkznYeLfSv7o4MXKw1
hbN4TALFvRo7dLiHzKVtzC9nd6rnyUq2MGDRgYqo20QTDepC82Ut0pktrqA0+ZvF
tAaJM/lgVf3CAy54xngOv1QvFbIn5A==
=nRh+
-----END PGP SIGNATURE-----

--Sig_/J40QB5wj/ZWAu7Xduaj2lu5--

