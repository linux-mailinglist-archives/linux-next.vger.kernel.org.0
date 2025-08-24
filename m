Return-Path: <linux-next+bounces-8082-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB435B32E81
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 10:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080601884AA4
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 08:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB01258CF6;
	Sun, 24 Aug 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qrTD9QmB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2173242D68;
	Sun, 24 Aug 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025330; cv=none; b=UdANo5gM1A77XKc4cKvjM5efq9+BsVwPRou+qWlGNW5wkhLENAsbVqicrT4TQmYhioMLb6oitMIYuuCValE9dkV70R/kY98XbEu88ppJLJJ/fj5JlRoMQac6N8SC5e5EuHkIFcgkcvZS9VPYJDSX3IWpvvyVPwQ66iNfp0w8ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025330; c=relaxed/simple;
	bh=4orBvvcMINkAPW88iDXhCYwcEGpXYT0rWNX5WmaapBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SAAPR/WcrBpcypF9phTWJLmMYspnwDQScYMYU8dYa/mEjsB7DKQDIJfzVlwMy2zmnxcVFckkLRmcfI22sfpx+0zhhReeLmRLMbelVmhCxnJ+/E7U4+zfe/5vH0UzBuPSrfHXd71246NprxKx9Xb2kTui/y0W7oD88v/QL+cAMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qrTD9QmB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756025325;
	bh=HnT4Xz2xgrSq25Y+a7cW1JiQUHayHzaVB9Iegb9L/bQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qrTD9QmBbgAfkBpa7+RYuBvi6PG6zFAe68EBRRpUkX4DT9uy8ov1wRzQgRmjiPK64
	 7rUPAzwuWu4BeZPnU05xg5bDa3FFCe0Mf6GIKzPrKrJMsidyKqeMN8onYbLajng850
	 5G5f0wMz54qDyjB74ucSiVatYUw/9rZFLEMAmUwLeSgrkwlwG7MWsEtWCBggRZcojR
	 q5X6qyWPDFZigFMgWr27mNoZxeIF4XwvvOyaXCVnD31N9CN/0ntuJ4hfy27VwQA6+v
	 deSBMiCEC3PGi7c56m0qKot/1a0eQIW/7LTORwksIY2O2Zf1FNfPRHGZk8mzfRiYbI
	 m4NZBF1HHhZKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c8ndn4NNKz4w2D;
	Sun, 24 Aug 2025 18:48:45 +1000 (AEST)
Date: Sun, 24 Aug 2025 18:48:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: Drew Fustini <fustini@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <20250824184844.2994f896@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TfD8SOz/rQ6fhAqFgafI=WZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TfD8SOz/rQ6fhAqFgafI=WZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/TfD8SOz/rQ6fhAqFgafI=WZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiq0ewACgkQAVBC80lX
0GzjxwgAnSVyDlNuJ9M/YbI/wkzXQiASAGwayR6cQ+w16HhDkhGy5bPopxqzEO4d
46gEf2+KwwH+IQ7jIvHLymGbEyc2QY8g3kM2DzcpJssIyEPFtDLTUJdwH1GNIo2L
xsdJ5S4CqJbjpkYDY05F45Ej7Xu1yZ2K71vPhH44Enhb+h435vG4NNNCFcd2bTKQ
VJrF2m8FbifrT0ENnYglrC+6Csd0bd1QDImkm8Z9ye8j76Ny9V5+XC7gLUOYlvLC
sTWW2kt7pKtLl32TUlMunJKiSvVhlOwrQap4R/JL6w+O+xTPqGN7UN+RhDCeQR2/
nT+0KWyYnwmtfW77NNPCJE1cc3jdGA==
=M7UK
-----END PGP SIGNATURE-----

--Sig_/TfD8SOz/rQ6fhAqFgafI=WZ--

