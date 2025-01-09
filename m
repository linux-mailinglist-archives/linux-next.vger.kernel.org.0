Return-Path: <linux-next+bounces-5107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE2A06CE9
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B691889AFE
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 04:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3DF17E900;
	Thu,  9 Jan 2025 04:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XP47j6rN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1B1607A4;
	Thu,  9 Jan 2025 04:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396752; cv=none; b=qiKCyralaKxKw5jwf69IDQCdK8jcEl7qnS4PaqbAqDo6UdaMZgEqs6Y3nHJIxtcT1inV7nMlcN5FsMuN0Drd5Q9PKELVEcwetYSm4Tpv4SmgkrYXCfFBjKhw3IPIHSvIl6AM5ZvH3rGFOMUBLqKf55+ldnUphlM+RUp2o5DIEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396752; c=relaxed/simple;
	bh=13maPaIjH5SAqTEAuGFBo7muyHiVcssuULQVJ7g8v1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XSY3pjynlD/ZKqlPXTJc3PzMn4WgEATSAoVdiJJzHqeAR1Q2nFIyNbSmkGaMEYmEnDevRyk8F0V+rmHpBebwP3x7zfkqsIgGy69N0arAH5PVF1/niLSQi8woxrezBTw7B4ZXJANpbn/IAv8SDWAkGZLmpbmZBahkNA0sk79VlBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XP47j6rN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736396741;
	bh=589fkOrlfiCibbJ5GDGvffnqcrPqxUH9IuoXoaeQ0sI=;
	h=Date:From:To:Cc:Subject:From;
	b=XP47j6rNYjHth37XKGovehWLbrbCJ5elnlPlPDAOwvJW3ebdzbynyel784OLBInjK
	 WuBUc2kUrVu5Yf7owPEusUNZqC/YTTkfHJM/kqsMaUshHZOmghZFD9CnnP03/YP3Ev
	 /ko6ETW0LX2VPcYV98DmhZbmCAuNT0bwTvoU3CgHA2veRQioh6ErEIde8aZe7xDkcf
	 T/bWfBlYQ8loSRPpaofZJhEIUaU2gE3TjVWvUILDabn9/6wMpnK7Z/nkA8T7RS/tfM
	 YXgBDTTeZcBvHrz+E11ZMLwfw4i7QyMlg5BcLbix+tKXk/l3NMU2pPpuRi96uv+mao
	 0oSKAoAI57wtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTBY05G6Pz4wcZ;
	Thu,  9 Jan 2025 15:25:40 +1100 (AEDT)
Date: Thu, 9 Jan 2025 15:25:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc-fixes tree
Message-ID: <20250109152546.4aa502b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yBAX58asrkdTQxAxg.NNGHF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yBAX58asrkdTQxAxg.NNGHF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc-fixes tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/sound/codecs/index.rst: WARNING: document isn't included in a=
ny toctree

Introduced by commit

  088fb4ee17fc ("ALSA: doc: cs35l56: Add information about Cirrus Logic CS3=
5L54/56/57")

--=20
Cheers,
Stephen Rothwell

--Sig_/yBAX58asrkdTQxAxg.NNGHF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/T8oACgkQAVBC80lX
0GyEPAgAhp0wxQfV/LZ8K6B1CHCv0ZdFImgiDxnnFjfff+N06t0cgCCcrCWsQlUh
YId95nDiBf/l+J9Sz3zkoNlbHA1QExrJAtwEE6OvEe2S4jfKNSMyUhiPUdk0nNwY
x7UT1rhOFzuWOmL0FSVJZMVxYqXbkw3/0NDr4P/uIetlpt5LAZYFNWMNsXiJ+6p3
0nTzhWhS8yx1r7WVGsr8yA/8d9wAweURJf5jhUAX4sMgG4ZRKFvF09GSj3/cqq0Y
hDSygKxedFQ20fnZ4rVaiohfiwOIPMFAGOIoRmmCYyxpmvKzgRk6iluWdmpMRail
uLOG7kSvVrmJXY7FOvLnlKeWgJmT/g==
=ayoH
-----END PGP SIGNATURE-----

--Sig_/yBAX58asrkdTQxAxg.NNGHF--

