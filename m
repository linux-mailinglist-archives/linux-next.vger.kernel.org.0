Return-Path: <linux-next+bounces-3394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E495AC8F
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 06:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19102824EB
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 04:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC93D4779D;
	Thu, 22 Aug 2024 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GEnqyGhe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5844500E;
	Thu, 22 Aug 2024 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724300770; cv=none; b=WlolhpklkZhE/TeLM0nY6FpmcJQvWwWv2eQnBoyxEfehJui6UtCbdtF5F8TVKr/vCw9fqwxSf/LMQE6akpK1z5sigwCnwhoCIOxn5675W2aEFpXShzxRZ6xDvioxGCvolgFvDtB+bvo5TIIGfHlxsszichNcOhQrqsR35hCznmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724300770; c=relaxed/simple;
	bh=0WZ4FYM8mmmylAJa5XP131J3PNnSGiy0LDELvBrO1HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IWU8M/35/0yC/7RlicheyRr/q0IEMdodjbnJ5aui45ad3HDdXTdyVI5vuITIynjPHKtuVmngvPaaXeHZntbETOmfnFP1Y0O7P+3YRwtmNNoMOs4xOCgybiobmeTf7KZsRYNiqX8hdnq1C3RNmeTJO4ZvoSs6ghvCmGJiZ0ddiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GEnqyGhe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724300764;
	bh=yf1PhCyU7SUcZwXqZMLRrM46PFymuaSELkO92pGjvZ0=;
	h=Date:From:To:Cc:Subject:From;
	b=GEnqyGheuIEW7m6JKmxepjq8ILrUl10DrYmSO/vfAIStUDrnaZsqQaziQr/fLsPBg
	 QBnoyRdWD2uYzFLd/yMvHZqB0jA1iUyiV69cH1kO1XyYjw6WaN9IQRmxs0DEo4qfJx
	 Xj+rrG6b1Kd0SBqa+IGYPBRY1bReC2msG8VKGJ6S78V+Tuy9S1QhW14QREq/5MIW3+
	 u9kILQoRntuf0jt3nFbPIhUD82ernqApueaDTmHNhVXyOMN9tOjbCcbD5Ial/T9X9Z
	 YC2TYOfg+v1G6rxhLPBUmCWfhPptIlhJaiF32y1qB8Afhy3XtRk4MTcKJKYIvf7PuU
	 phgrxfVmDrekw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wq9B35D0yz4x8Y;
	Thu, 22 Aug 2024 14:26:03 +1000 (AEST)
Date: Thu, 22 Aug 2024 14:26:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Martyn Welch
 <martyn.welch@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rpmsg tree
Message-ID: <20240822142603.3608a26d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zxZe+7EeYfAOMKrcAz3ZX9D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zxZe+7EeYfAOMKrcAz3ZX9D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rpmsg tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
  Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
  Selected by [m]:
  - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMPILE_=
TEST [=3Dy])

Probably introduced by commit

  ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsyst=
em")

--=20
Cheers,
Stephen Rothwell

--Sig_/zxZe+7EeYfAOMKrcAz3ZX9D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbGvdsACgkQAVBC80lX
0Gx2Ywf+N1QlRG8Pjuedx9BheOXu3kXRmwalsCABwlxCsrKtQK4wNXqHMqZOgA5x
t5xNlummSszChYyB+mLOaOgQB/OR/T7ElLF7LgEBqvGgCD5BtArsEJYbtSxh78+D
oLdvvyaGB4pR8jYifSRvvpRntbcNoYBtx/R3Mnk3NwAKoPmF7Dc/IsJE17KZl27N
qiTBfmsdw/TxQgNCTIkkhy7k9jG+Eq2hRK8dSTlVDt9/C+8MAlFKZu9H37+CKqSE
ME+Llvy/fwk+jIxU1l/FP0mNXX5rDwdeBE3Kd7biFg3L9pkChblamCpZS1ni2VYu
sch/pM4NhG0oL7+VpL21iTTYgqqNSQ==
=4QJV
-----END PGP SIGNATURE-----

--Sig_/zxZe+7EeYfAOMKrcAz3ZX9D--

