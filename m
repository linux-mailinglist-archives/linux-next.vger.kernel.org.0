Return-Path: <linux-next+bounces-3916-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9201097C1F5
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 00:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA78283BEB
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 22:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052B1CA6B4;
	Wed, 18 Sep 2024 22:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sy4ayfqM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E7135417;
	Wed, 18 Sep 2024 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726699996; cv=none; b=iwl9+IEFBDzltt+hhVv5P7799bSYABUiDu1utuc+n1NXBsYEiRPlSfDonCdGhBJlu3tI3cSQUk3FKiRfU4WbXpIMPt8EbUy8IbrP30cq6bRtNCX/LOCHOCvQ2+qnFqSP972gXtr+OQN+m6b+0PzMsDrjT/PCt65BWaY1LGzOk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726699996; c=relaxed/simple;
	bh=cnfy/Hr4/cgTNhxdbPxEeeVZiQUWu0bu0FmFpa/qFKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z0IyVzjVQ/idIrarbcY56MjdplbuSw72/B1XfPHBejP1TXvaPSpFLzKsuv8twGFZrZl0zI5q79fyu4xyZORhFHoBCOfTSrXfuaFXEXdQb9tj9x19qvzrMPwPf9HIp4kcldP4PblAuYBi9F/SlTT18GDyU5pOGWOIu9AA6e3Q/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sy4ayfqM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726699988;
	bh=cnfy/Hr4/cgTNhxdbPxEeeVZiQUWu0bu0FmFpa/qFKo=;
	h=Date:From:To:Cc:Subject:From;
	b=sy4ayfqMYj9UR1ACm0RwHPNYc/p9zwxJk1U2QWDjcWCLyGKFBC2wttxlCYj4/bHWw
	 mlO3pd5OsjW1L+Ag95nSvJJtbpeLtzh8J6y13xbg2Muv7zw9mkdfztMagxATf1nxmj
	 RG1/GVdYh0g1ZuBZqGFCzc3FQRvSKzKXohz+bwYIvNvPdhOCrx/sUBn9eEKVRdydxI
	 sZe4gp3T8ub6ItCqn3ez2xjkqfiks/M6k68KVr9bMrCO9jQv9Mn/ZMGsShu6VxCl9L
	 dVBXBhDFWwGfBSNZBCAKEHpfMsf9Z1N0pqOnMqAEOYJjoae2s5T0gqieOUdzz2jBmm
	 Lfw+rVyRoZBMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8DT05bVbz4wnw;
	Thu, 19 Sep 2024 08:53:08 +1000 (AEST)
Date: Thu, 19 Sep 2024 08:53:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error while fetching the drm-msm-lumag tree
Message-ID: <20240919085308.1171490f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=EUkMPDciMBV_EdZ+IdBt64";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=EUkMPDciMBV_EdZ+IdBt64
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the drm-msm-lumag tree
(https://gitlab.freedesktop.org/lumag/msm.git#msm-next-lumag) has produced
this error for a few days now:

fatal: couldn't find remote ref refs/heads/msm-next-lumag

--=20
Cheers,
Stephen Rothwell

--Sig_/=EUkMPDciMBV_EdZ+IdBt64
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrWdQACgkQAVBC80lX
0Gy7HggAnvs84v4PJjj8ni0APXiPL0RTuTOyBmE4E51K25WAHVVMPudo6Ie5RgXa
RuSdRncUOCUaLtONh89CWiz8ix6tmCpjg5cMM4uXj3IKVFCt734xI6mRiAi6FQAM
uMcB9gD/dqDqAbY6iLgt9mADFZC+PnLD2XglrzYu/08PYJfqfrjQBbEkcAbv+vgE
hHN6tmn5BdMOr18uC+z14yQfW0eAt1QT3eP23FURp3Gn7teRlQODubVrd2i5dU3b
A4L21Kp67W20OEH0E8KWyqoVjRY+e0kR1RFkT9jEUUh9hL4O2NbPB5RHSetRW6Iu
EwvFSxT5yAnldC/Gu52wMzHLSxjopQ==
=/mq0
-----END PGP SIGNATURE-----

--Sig_/=EUkMPDciMBV_EdZ+IdBt64--

