Return-Path: <linux-next+bounces-5826-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F3A65072
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA8516F32E
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14A323C390;
	Mon, 17 Mar 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pR1ZkM4q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A4446BF;
	Mon, 17 Mar 2025 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217295; cv=none; b=u59PxKHURjWbPbgsqAEH58P61Z2RQIEr0BlPVJ2rDj5XY9dOKI1Rgl5hGgjV6m94WfFIOLodqi0p5a717XIfqh+ZEI3wi9PYAcrfbVvUiY7ASt9n3o7xAbk8BOR9+R/cR9fvkc9d7tR8SXkUwI/p3DVR8/wT24fdg2JFbaF2IdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217295; c=relaxed/simple;
	bh=zhlwGMKOuAnR4Yq3go/04ZWJRecfaFMdsqlCyqt8SLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SVXqahJtXQAPjhnYT+mNb4DM0E1VFfQQ63qfs6pRzVdR6D06KQwupT7KB8olpXPe32DKxB2vmpE1aZGU9bwsst+h7M/rB8qS8EUgUVyelpi4rNzRB/6xCrqoSnvvmZV3CL5syCyWp+mmWxCxrScryBl9L4dbM9k/gOWZEU4594I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pR1ZkM4q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742217291;
	bh=IJ21QJWJOS4A8Gair1vE7hnTMQbZO2RW4Mwa0hNxTy4=;
	h=Date:From:To:Cc:Subject:From;
	b=pR1ZkM4qmRzYD+vZGf46jAVYdnLB6gGu52c/kf3k3UickVpvyCumEFD+d3ne9ZMcn
	 8RrfncFDrJTrUVe9CU67bKUmnt1XGAZaaCAnaLJEQ9cW2EflZusIsItvv3ALWJqWnl
	 kUoJo+g7Cznyw3+SF5Al0pcSJG9TwvwRDClDiN/B7vTqZR6rV16zTLETUZFQqShYd5
	 RD6qDnl6vA7KDtk6Whij6cVrk8/ZKwIhMTbLLLQL24tKdQeP4AM9eCjWr+n2VjoRBq
	 GQR0CcNMBG4NQnCb8XkpgG81xw3q0E0pSib3hTrgnJ7Mq9OmpApUZNwxLjVN4sQSw9
	 AtL+dxowzk6dA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGb6f3sw5z4wcZ;
	Tue, 18 Mar 2025 00:14:50 +1100 (AEDT)
Date: Tue, 18 Mar 2025 00:14:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20250318001449.43075135@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xpCfG=8RJgnrsvoCxQxxEnb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xpCfG=8RJgnrsvoCxQxxEnb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  12e766d16814 ("perf: Fix __percpu annotation")

Fixes tag

  Fixes: f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and=
 'struct pmu' lifetimes")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 4eabf533fb18 ("perf/core: Detach 'struct perf_cpu_pmu_context' and '=
struct pmu' lifetimes")

--=20
Cheers,
Stephen Rothwell

--Sig_/xpCfG=8RJgnrsvoCxQxxEnb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYIEkACgkQAVBC80lX
0GwCbAgAgp+6O0AAFfDw8VUhalPNvfbLBhyuQBtS+GvW6omOdjrHM8Bc9UAmZfOK
bqaYhEDNvZ2ExXGIGCqaIvtA5bcqywSV5QpMTxaH4UBO/1eWK9kfvEg8ME264ekY
mPzjhW48HOL5gim0NrFGLWQdtgE07Lj3LUCSiJtOd97X6T7lpqlOvR6oGwwMmSUg
1atgDXeavmfwnreOlubqPE7DH8UgW542aoIkyNHqkwrux5Xy5cydmRYsmH6amvG2
24xYBna18PTr6b1A/IG99xc1f/lxHGrQzFg2cv3PeNv7ARnoOPbOJMozIpHJoyf2
P+WKURgwZWPFlRZ9JMqPPf5j+wQ4Hg==
=jDQN
-----END PGP SIGNATURE-----

--Sig_/xpCfG=8RJgnrsvoCxQxxEnb--

