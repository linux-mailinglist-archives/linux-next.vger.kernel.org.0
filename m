Return-Path: <linux-next+bounces-5332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C09A1FA8C
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 22:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A614188564F
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 21:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DD61946BC;
	Mon, 27 Jan 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n9hSsvm2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481315B10D;
	Mon, 27 Jan 2025 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738012383; cv=none; b=Z9Jsc3Gxju52Hza9j/BpeS7BI+nRm72Gw4GxbnTh9gSIs8foA/O+d+bTF7xBimIt3zxQba0jMLVCEaM8djeMbs30tt6/8+qSR7RaXBvnHYVXCUbRWegsxBX2MBpxcX0DWfBTQpZ3+o74toEUZhCdHgywgZ8omQQAiwaYE3OP8WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738012383; c=relaxed/simple;
	bh=ud1u35Sfg1sfqTbAS/YOeteaWFgf03ugWgEcQ55gA1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lqyt1WvTTZQ8iKqoDBarrmjOp1TO6EF3pp7SDIztRDK4YwqGtiXbE0vziRipTmQiPZ8IrKkt8eUTbVrX4KksHIaARnL5r3yAPiAOypJDKRLmqn5b6oIsahTDcLoeXhQ1bvQM7hbR+XMVj/gMJtASn9cOT60xwDlzFJt9jH0nJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n9hSsvm2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738012367;
	bh=m0GZawHoB0dngE8xI493+Wp1K3bd9T861BCtZER3VNg=;
	h=Date:From:To:Cc:Subject:From;
	b=n9hSsvm2b+rJqOjTosuomTf9/GE1B2JAG+7vkWosORBRIiLDt9AnLXbFzSjovFpW9
	 CrE4wNB9EG14xtejxpRFeUCpxA0UhCmGrhiGT1yIIjeRo2C3lDJmHovHS5HleYv7cr
	 53Eye4nJVXjGkMnmMcbKh+lfVC+3q+chNzdj/vy/bJVTihvILT0SmSG0q8+MgXiua6
	 9TSgRsUQ5TSWG4u2nAUzwhAP6qkdvBbmxRVAtMU8uNYPudrKdVZkB4YzOTlnYCVQaT
	 nur5dtwlmaogTBkhZn/9bPPKKHKIoPzPdI8Y1IpTAOHwT1xhjY3RTnjjENNuuHDUeN
	 SDjvJGNCp8w7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yhh2l4X95z4wc2;
	Tue, 28 Jan 2025 08:12:47 +1100 (AEDT)
Date: Tue, 28 Jan 2025 08:12:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the perf-current
 tree
Message-ID: <20250128081222.0e16ae68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jhAIB8MvTmr1_DW/LUuQBjV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jhAIB8MvTmr1_DW/LUuQBjV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  191f1bd6492a ("perf annotate: Use an array for the disassembler preferenc=
e")

is missing a Signed-off-by from its author.

Looks like the SoB was after the '--' separator in the original emailed
patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/jhAIB8MvTmr1_DW/LUuQBjV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeX9rYACgkQAVBC80lX
0GydEAf+NZvFgnhWvzrraWe9Bnc5nBX0MRKc4XwaC+wax7mGyjIdOVcY8UkYG1uH
oC7DgB2pJBBgWzj/WyXuJSeajHNuC1HXRHw4xQqYBWD9fTbVnO7tM/1SIwe8CZlt
JRLOzR8no0bKbrVHKQd/s8E8tdaE+XAcVjtrD7Q/TOczm3bg89Kunmo5psFjVD+c
LErmEGHwVecpBPB+4Oxhb56m1ZMMzaS8nPKUlvXn/IyGmnYUCkk6jGQJ9WPUToqT
d2SFdzb4nu2V2CChj/4+1Onaej5yKc4qprhoE2Zxwko9VoKek3zPRXJ/FhfV8dnt
MNLmPWgx1X35Mtqykie8wNwlqDHE5A==
=47ck
-----END PGP SIGNATURE-----

--Sig_/jhAIB8MvTmr1_DW/LUuQBjV--

