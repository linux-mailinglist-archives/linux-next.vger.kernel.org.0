Return-Path: <linux-next+bounces-5643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF6A4F2AC
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 01:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6BC188E60B
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 00:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527231BC3C;
	Wed,  5 Mar 2025 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="awvP7fr8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3317548;
	Wed,  5 Mar 2025 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134393; cv=none; b=s1aqqE4zbwGdAq7X2aIqt9QXOE3RhLXOdTX9mXCOdWnnjKf4s+lmgtg9Tdtr8IDd3GYsJWy7VFPtS6PZ4salypr4XsBriq1KcREwU+kV1qe3Olnx6400GZd1mSMADS2ofR8UGdfsEv7vNSmtP3GKmHzRChn4fx4QQDomFMJH7fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134393; c=relaxed/simple;
	bh=eX8pDDXLntPgbvz5jz4y2gDu9qBJgtjaZyWUOUUwn4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LjFVXaQJSsVMOr8GEAq9ZRwmFzpuAz9fVSNowRfKtC1lFRJSnoRqErsoBf/Mnc493E24m1/H72KRxxsvsdjbMXm4z0OMFOGb50zzElOoUUalwjUxblpYS672BWyw8h+r7UnwWpLxufJg9cbKKSfAr6vzDwk2M2ac0O8wxl03ipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=awvP7fr8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741134386;
	bh=8UATZmOJQXiF6YcKV6u4m3dUJZra17NIVWNPrQkYtRw=;
	h=Date:From:To:Cc:Subject:From;
	b=awvP7fr88rZzltyrssZH5xW+z/BU7nIGkTXzawinIVqZFLvPAUoLrKD+cKibCzw2O
	 TAgBLHsfGo/1ODAh24MRadfRrYKDVmPmELM/bhudAdKMQm0O5+1LPS7y4oo2bSrRyc
	 VhiQZ1wm8QIWCtVJjoncFGCCIUHFGra6+B+2MfZ8z6r8RRPXGtmTE+XQBaj+Nsw5JE
	 6DGKrXcsVbCr5+a9sfg3wW1Cx300pt5u8HeeIirtvWP2TVxwWTwC0PBmizghngpREj
	 omgR6lj3aFb4bVUEziObQXD2yIkoq4Oep6xcLBAl+0MVcjhzzSz/BmK75fuI7123LG
	 29hoIm2EHt0yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6tdY3Bvbz4whq;
	Wed,  5 Mar 2025 11:26:25 +1100 (AEDT)
Date: Wed, 5 Mar 2025 11:26:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Mike Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the qcom tree
Message-ID: <20250305112624.0806472d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PgKxN4OkTXT2C1Vc4Qf_Ohw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PgKxN4OkTXT2C1Vc4Qf_Ohw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the clk-fixes tree as a different commit
(but the same patch):

  787289a1d13d ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARE=
NT on byte intf parent")

This is commit

  b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARE=
NT on byte intf parent")

in the clk-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PgKxN4OkTXT2C1Vc4Qf_Ohw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfHmjAACgkQAVBC80lX
0GwFeQgAgTQssEjgjJxRtgllfb0q0DNU98zAI8qMAxjXoBu2aqTbuNW9oYkAKh16
AfvivDFPJYQZ4SZYEP7uslsJz50glkWxcgiGQbLLSctjbimkbmui0pJf5DmfnaEG
I3vWq/KEYpgdQ6h96okSfh6e2B1oZ6guWd3PKP3w3dt/TCN8G3aYi2eyF+1OXOCX
EHjr3SWXfUfnR6nMTmoh46EgRRSItsi3fn26GcDq7W5/yQndZq8qkNLUKRF8LzCe
gfWFasnJeX5GkJYoVFqyJjZfr9LKWkKuWomp5ujG0krp+cHRRwzXZKMB5WyhtCW/
fXeQdvec/chr5eEq3+9TC4ykoF1jig==
=56SK
-----END PGP SIGNATURE-----

--Sig_/PgKxN4OkTXT2C1Vc4Qf_Ohw--

