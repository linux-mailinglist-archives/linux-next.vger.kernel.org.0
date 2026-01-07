Return-Path: <linux-next+bounces-9573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568CCFC0B4
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 06:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C953301F8C9
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 05:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FFE1C695;
	Wed,  7 Jan 2026 05:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kVjmOGOB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF03C2D;
	Wed,  7 Jan 2026 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767762957; cv=none; b=iluwZorhPgHykC9ntuFUwmXV3MwDYdC2Ng9uaaTAQCcnjQ7ZzpCdtq5u9tXLb6sne5+c9xCGG6UbF8hpAjuKk0xAhiuIUGDKVLKpyMg5hJZf8C+otu9F6u5wOEi7RSuL2HvBf9+ZehnN4gdwX4d+FmEI+olVWKyrELl3NwgNck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767762957; c=relaxed/simple;
	bh=DNuktul7qIuoBYGAA9Fca2RX7MAvckLz79ns/NvFiVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aCzHNUUFkzlQrxnO48dg8sK4ofcjVPvtinKkgRyw12keG1pK+BHj/LlxSH5yCB+Z+7j0nbQkCwIbESPw+LHxr4xa5NMT0/jNv+VmxtoldRwmUJQolek3YaD8iGvTh/VLc7DxrTFDFExgqykdC3PoEXbBlwUC+cV2f/5HGLTId/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kVjmOGOB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767762950;
	bh=TwxV8uLXRSG3dgV5/eTQHGpS5aQQTxh23Bioru6mlOQ=;
	h=Date:From:To:Cc:Subject:From;
	b=kVjmOGOBSeTmPYLXvyOuDeUL5qIC8xssgEABtL4Zw7uIY9bzUVjeI0MBIZaD2olyc
	 92uJVl1XJRVJVr40tEmk8dLjXFKAm0jAU/TH4d4p+ilkDhMUtswKqYcWisFDS3qAjU
	 3jGELrJQ6IJKOUdv+YbC4ecy9uC+LD9nv/crYRrqyVqEA040WnrC0rU1gBaeevfOEa
	 RAy/mcNf1xlzcV/k7mPKTh62XfV5MbOHrXNr1/bDp7QfiptSr31ekgEUchslJ+tObC
	 z52XZXTW14fGD5oe0JMmqtrHJSD3vkzBwhk2zQSAnoCCaRBLrVxBCh1ndd1osqrQUg
	 zR2liKBY9+1qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmGTK0hSYz4w11;
	Wed, 07 Jan 2026 16:15:49 +1100 (AEDT)
Date: Wed, 7 Jan 2026 16:15:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20260107161548.45530e1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rgHHULTgrSkPBAH8NEd4MIr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rgHHULTgrSkPBAH8NEd4MIr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invalid =
C declaration: Expected end of definition. [error at 96]
  int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref)=
, str
uct mutex *mutex) __cond_acquires(true# mutex)
  -------------------------------------------------------------------------=
-----------------------^
Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invalid =
C declaration: Expected end of definition. [error at 92]
  int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref),=
 spinlock_t *lock) __cond_acquires(true# lock)
  -------------------------------------------------------------------------=
-------------------^

Introduced by commit

  5e256db9325e ("kref: Add context-analysis annotations")

--=20
Cheers,
Stephen Rothwell

--Sig_/rgHHULTgrSkPBAH8NEd4MIr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmld7AQACgkQAVBC80lX
0GyMWAf9GdLSd7g8QvUFjBUehyFx3LyJ+aPBGL9txag83D+CDdAfUyiRNVAl2wmV
9JkaDmjZkmpYc1cs/r4As7t4GouvTgulVMfnZZA19BXBstawEZYAPykv5EAvYGM4
CYnjgoDu+QLP97ZqwFhIMxJzZGc1YjbF4q25h5M+VEKcGj1LzotPDoV+KmXlDOkh
82Il+dytVXozp+srTrl+j+nja46rwslB2wWAeaYn2kI5eOql3bE87oDUKS+K7HM4
bFlJyAPhn9A5Sokr8sSnu3pWOlIm7RsL6ncyC69v1ywKp7hIicV+oUiROcWyOAZg
lKQpRp4YE2OItk4yO3SAY1DF82/zOg==
=BzXk
-----END PGP SIGNATURE-----

--Sig_/rgHHULTgrSkPBAH8NEd4MIr--

