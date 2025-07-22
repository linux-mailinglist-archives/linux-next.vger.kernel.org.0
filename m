Return-Path: <linux-next+bounces-7693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3EB0E67C
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 00:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C921C8719A
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 22:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA5285417;
	Tue, 22 Jul 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F3yLZ9FH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DB284B3F;
	Tue, 22 Jul 2025 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753223916; cv=none; b=g6G0qiNnVnddVvPgSbcGtEm3AUi29i4D3VIfQM+3+SYmCcKCqrIWODG1eAajf7XEKGXZf66GPRJWDB3COyv/2kE0F7RpriWPyBe5Qgz6gnIfZysE161HIRnvRrSfJtZh0dczisei2qlT4wGuJihnPXlp5oARG/nuvsewM1tOrxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753223916; c=relaxed/simple;
	bh=OQtXShIE35kj5CDbYc42jZTiZEib0mb/ThNpYqTsteA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lttb9XUfWyMyn8bQQrW7DMCDvav5BxflmwL0y4eg5tq6eMwwu7r5dh6iktDZPnAULup4x9fOxuJc+QyH5fI++DEMJUwfmB9kewwUsNIhLP7/6cGV55oQmHX/s3vAwZxIDF68MC9DUrHU0cvUDIRcJdGBpnZxL3xEOgkw9ZV4AOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F3yLZ9FH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753223747;
	bh=CzMTqux1hKvkQEveIXKWPXkDeDj3OL1RLGwMEzWtja4=;
	h=Date:From:To:Cc:Subject:From;
	b=F3yLZ9FHWvX51VAWWuC4CObGh8Ub9kVmZBrY38XyDrjUTuBmDNm0safLSjf/LF4/F
	 u02UfHSMUkbdu0HcZPux0sO2P2kJ8QjkIefd/5qO91x3AYt15vKoB3Ncx19MRmXbiN
	 QmCTRQc5Y3mOiSnCFJZXTXhKLQG0bE8BBkYClzqFKFf2CX0W7kqgfpzVxVSY3kCgd+
	 LqUEO8aFnCxe3kFax9A88qUcTsGE+JbqhAV/ApCZHoI35thhScL0nD2HViqh9IcbHH
	 9Zal9Dx0KyR0unmLXOJH/Wu8lMFY1BcqJxpQoEFCnj+FPg7vmP16VjJzF/CG8cYD5+
	 YXfpKFPhJwJUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmsYH2qySz4w2K;
	Wed, 23 Jul 2025 08:35:46 +1000 (AEST)
Date: Wed, 23 Jul 2025 08:38:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thead-clk tree
Message-ID: <20250723083829.34ee8f91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mm5xnxRV3P8fPsNAzFUmZLd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mm5xnxRV3P8fPsNAzFUmZLd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e468d81fbf5e ("clk: thead: th1520-ap: Describe mux clocks with clk_mux")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/mm5xnxRV3P8fPsNAzFUmZLd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAEuUACgkQAVBC80lX
0Gzs+wf8Cq4Ily467++ZPNFdS3lg7YGs4KDJ40KBx7vWcdefkfSKa4m1Pd1moOZB
UerV6mySNaDORy5kO9qIw9TCa6BBjGxA2Tp73qxcIoS06GnAWozw2ceXquivJ769
od5489zPm8inoCfqd6/UlEQ5rH+/2LYCXKKhwLi4HPyvpO/IHCKZwJnymvFp1/jb
luYRz+8E0B7R4tKdRxYyIQiTxUc2us3BYTOl1iuw/x5qS3KH8tUktdl1XGl5LX9q
RGdgNMwFNmFErPpwBMLmz2ww26ZXbNCKy4mC3NayAl/c37PDh7/s5sRRPWlmco8x
eS2YdRlR2N7+QCGF2ju5qGV3DD1M0Q==
=RxHU
-----END PGP SIGNATURE-----

--Sig_/mm5xnxRV3P8fPsNAzFUmZLd--

