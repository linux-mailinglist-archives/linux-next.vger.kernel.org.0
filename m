Return-Path: <linux-next+bounces-2945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6C92F219
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 00:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBC35B20B74
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 22:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790F216A382;
	Thu, 11 Jul 2024 22:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BuL1cyuy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBA145B09;
	Thu, 11 Jul 2024 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737484; cv=none; b=BR6xMlu+lvUx4EeQtYdftxTnDv9+7KcRLOCGv32ScDEb+QYLNLX2A41MnkrQpFs0yOKpiJxb1nuNRkSzh3PBR6JZ1IeAnlLiAvjTcVQpx5SvYpL8bJxyXfFwBLia5IZ8/wEslCs5FQ9HFQBs+F46XYbbzwPZ2IIpw0n6xIDqJEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737484; c=relaxed/simple;
	bh=CoNZbP9OQ+LKL0jagX9qDIpckuUefL6zlyLvgzt0ZVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=emhWOsFbaOUEjI+gkmhhVZU+7LBeQusdedAz4P8nzhH8I01zEtUU1XIsDnioNHXxr8avaputkCT0MCioBH/yiBzFlEqCkFuGdDbrJcLKXL+z18kk2NO9xO74fr37SY8wl5Afd6jKmz7sg37hp+I6rvoAtsMio9IkoVpLa6MYUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BuL1cyuy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720737480;
	bh=NrOnfdF4Y/4ef0yGhUGiaSB3gjgVLlJAR0yi6h0AOkY=;
	h=Date:From:To:Cc:Subject:From;
	b=BuL1cyuy/H9GVIf4CVTM7Vk/5KWMvNN+MTteKW4qU982HeGahcdOTjSy0QN9BN+N+
	 Wcmshv88M2nT2c6FFEQne2VeidxKynVc3h4QewtwJ+07mtmPeoZXCLNdavyw0kWd2V
	 Upik9COz12KcdrTWuyAQ85PWCdjo0BTY1cwOt68FtSQxgI8oYw8pjIEhIsrI8N/Mid
	 rl6ib/7gHNCH4D+EQ6HcCC99mwABR2RJg6WtHFLP0zz6SpATfp+Ryc4QXpWTVGZTBM
	 nlBONxEutJX3MiBwCexC6Bh8el0bCiRZkFXbFk8yz+vASqzqboeuw4IraXXJJmBXB3
	 4q99neMGFgpeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKqPN5z05z4w2F;
	Fri, 12 Jul 2024 08:38:00 +1000 (AEST)
Date: Fri, 12 Jul 2024 08:38:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the device-mapper
 tree
Message-ID: <20240712083800.3e118900@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D=.iKKo=cCzWDMThpFSCxbr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D=.iKKo=cCzWDMThpFSCxbr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a96fa275449b ("dm: introduce the target flag mempool_needs_integrity")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/D=.iKKo=cCzWDMThpFSCxbr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQXsgACgkQAVBC80lX
0GxZdAf/Y8MpRN/OCiUZYfSRcszKNG1qs50zmHFDxok0qz9EvDp6CEQ3+Ax8OiwF
KHcL79kjqq2704H7Fs0PModSzcu6XqkEuKYRo23t4SU9C2vwBubnLbjFZPkyFAvp
LoXSQqpwobQXsMqGt2ZV/ygHJKc+MFFzNzgGcfTIa8SUDhP+1Q/g3l2PjtGi552T
YolRevKafNiqd1mvxFTz44dTfAXMr9T5jSlxGOfSOf5RrAlVt7b1NO+ZiiEBCVrQ
TlhvDy4Hx8wcSngW6y8zUW+73KkKNCodEZuW+BfwaLIoC0EEXy1fN2gS54mutNfh
IXRf/K30bUYE/qyW2g17IT8R/T8yMA==
=1JuE
-----END PGP SIGNATURE-----

--Sig_/D=.iKKo=cCzWDMThpFSCxbr--

