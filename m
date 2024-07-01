Return-Path: <linux-next+bounces-2750-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3BA91D9BB
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91D3BB2249A
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E608681AC3;
	Mon,  1 Jul 2024 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oiOly9vH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33465347B4;
	Mon,  1 Jul 2024 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821612; cv=none; b=STjXkjLPBafwuf93Phwkcvi0tzUFSMdzg/zW+s3P64KMirFcPHQFnQ/OtDUjLF43fYauXxLyfqA/or8Qn3fVU1kmFwMJqITEmOtIh85/4YqIRKOpEDNTfHwEL/BJmjfdBQ4AvMxAiQryQ0D79q2ahztzaeRY74dtXLTvXxbXn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821612; c=relaxed/simple;
	bh=N1bYsI6wmDxtVtmFb3pz1vlTl3ojYgemUfnK1Wgrga4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aXT11JWasJanPuPO8dYM6FRxIwqWFerxOWLcdqJDWiIteSYrnZH5s0lmsemY7ZL2/xTfv6KdP63E7Q9WodNbLf+zfArtkpWZfR/PMCT9y99GOlgttQyoRyJQbU2nC01hLfAmd9j2RXCDOuOgScQDOHPxp81H0T64LX6lMI3uvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oiOly9vH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719821606;
	bh=/oLgkbhNapBBXvS0ePIZSPbeeUO3NuaFx99dJfiG054=;
	h=Date:From:To:Cc:Subject:From;
	b=oiOly9vHS8cn31OGKs034IP7CgHeqdiqB2sfER6B3BVco9jMbdXv56+jbNoS1QVcD
	 GRXSIWNmkb+mxSmfDDg+qjf3gzVDtlFOjllcVHOxE0RibR3qeHrZUhgm3jZiKsBeEh
	 Q81CIOoz/6Q+nZEByK/Y/1u3Fb9dKFa0k1pguwd/RpZbdZAH9Gb9gjqEOEMxhzUunZ
	 sjpzCn0tx+OjL9xHPt1XzxdiSoiOaxPs9MJJonKlH0GqW3q+SYPBkJRNaoRVaVZrbC
	 iVeXbwmsmjaAvqzHPArhUTdJF1mnC+F7tQTC8CM8QM+R0RUsjlfAxv5IJumHPAEnLY
	 PCfMcK5Ua579g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCJhQ168Vz4wc1;
	Mon,  1 Jul 2024 18:13:26 +1000 (AEST)
Date: Mon, 1 Jul 2024 18:13:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the pwrseq tree
Message-ID: <20240701181325.266539d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R7noGpwOP_WVz3Ar9q5nYqD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R7noGpwOP_WVz3Ar9q5nYqD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the bluetooth tree as different
commits (but the same patches):

  249ebf3f65f8 ("power: sequencing: implement the pwrseq core")
  2f1630f437df ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")

These are commits

  cb28daf2c4a2 ("power: sequencing: implement the pwrseq core")
  4d593268f065 ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")

in the bluetooth tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/R7noGpwOP_WVz3Ar9q5nYqD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCZSUACgkQAVBC80lX
0GzakAf8Dr2NcifsyACZ0+5AW/FH4VNSPQyvkctNZ7kBEBHd5gO1Wi3qETYoDrjX
PXlnyeKuY21++g82ePf3y1/iqrGHJ8PjqNL9qmDwgpP1gois63/CRNSjXNrEFMtn
Qk+vKonbBcp0InZWQQrnlawMQPJqRvEEGz7BtY3MJ7Pbr6EzggKxTZTsuZS28aRv
DAU5feiq+sXz0psxIbIR83T7GRRlK+bobppWQ88BlkWq2bSMc8iT7hHWdvGbhnjl
Ctec/rBOOcpIzL+Q7dT4QMcMh/QBsb9rWbLXzkQo58dCCmaJzK1NBGmdA8xIQNOv
2xJr1IHo5NIMKqHZ+iSFGWASzYR99g==
=dprO
-----END PGP SIGNATURE-----

--Sig_/R7noGpwOP_WVz3Ar9q5nYqD--

