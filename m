Return-Path: <linux-next+bounces-2734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80C91D5AA
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B86891C20B9C
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9228BF7;
	Mon,  1 Jul 2024 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UkSft1jN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAB8BEC;
	Mon,  1 Jul 2024 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719796403; cv=none; b=b4hbYtkttPVRpESc8Xca5MoDIMy1MSxcxbqSqNQD0WmVd81EQhUVDrNpqxN2lT9Y7Th/lS/UgkpLWCO5odlfaTbNSnjBF9gfWrDIGaPf1fBn4ibbvuFcqNa3QFip23aF/htZLpWrUT+seI9WoI6mpCQ3gAF/y92AMppfMJnGo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719796403; c=relaxed/simple;
	bh=4Jvc+7ahpUiltNQJ4iSl5EUcG+vLi2fprklKXNSOOTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M25XomeS2B14vmBdx8XnvYpp03Mdm4G8Ahd6kNQvVTD6wwjEYRop+pxc7xA4PWFysyOQpA0YZTrRHd2plCRmAaX70ZrTW0zRvS2EBFPtsAMuJnQ38fZg8S/PvymssOkaOzgkEt2zticvg0EClnbCfqZSeqZmmtyyD/GU8HsNlFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UkSft1jN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719796399;
	bh=Vjwv6tTRyww9Y9OjY4kFwU5SCnflE4oAuKH1ZG27loU=;
	h=Date:From:To:Cc:Subject:From;
	b=UkSft1jNgEruWMrk0xGMnGukrtBSkiZlk0PZzCdDrQBsMaViOE2sGoyxYQMotmvAj
	 YKy0urU/8dbCvUORCShvudhIfaP412SLG+OOBKUjjNxodgViOVwSS769LoNi9YpIb5
	 A25uqDItHrROSz9immQjPwb5hh9WqFIbB8WAay9aeBHuUCEpqEv6IG8FJfJ2NjoWmv
	 h2xoQQc7pWrFL4xSWy1c6LXP5ZuUjFpe4cSltMAd0z/Nat8bfbQMwg+HTw8WiWKhF/
	 oaR80lRccx4q/HSfUQ+wCv5PIzTCHi/oa/Q6aXMBp0CaM9Ov0d3uhAoiDZHjrmrfLN
	 oVEupEvkHRe2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC7Mf6tzlz4wnr;
	Mon,  1 Jul 2024 11:13:18 +1000 (AEST)
Date: Mon, 1 Jul 2024 11:13:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mediatek tree
Message-ID: <20240701111318.675d8bcf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/smFqEEH.KjpmVuFN_jveMDB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/smFqEEH.KjpmVuFN_jveMDB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  047ce9d9deea ("soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex=
 table")
  5d6ea873c931 ("soc: mediatek: Disable 9-bit alpha in ETHDR")
  ac21fd549d09 ("soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math =
operation")

--=20
Cheers,
Stephen Rothwell

--Sig_/smFqEEH.KjpmVuFN_jveMDB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCAq4ACgkQAVBC80lX
0GyZEAf/RAwGuGEoEvRfoiNOYkOqpK4hFY5yamX5bw7LI3CtxfA2ig5i3bmZ2l6b
7mWcN+XH+ZduWO4Zmi9rQlpwrsxOQA4RoBMguWDl+Zlc4rAcRC7Ii4Yiy8UNwtw6
xWurt/uaLabhhVqDoqiPQbQv074bg6FzR8UeoudxpRazX5/4R7kLiOJB5ChgSOL5
6NRwBcbuZvKoGfiwnyiYFsbPid5xy/7EET96Jk+PRhmDAoIkMvj+E8aM6EqLOygw
F4YW+qDEr2rrWA1WEKXcBnlTFq19jdujmyr7gHwy3lL6KvBREcLNmXzYU9uSgcnh
SRVtpbP3n0hetDzSEp1368RXYDPIHg==
=uZ0A
-----END PGP SIGNATURE-----

--Sig_/smFqEEH.KjpmVuFN_jveMDB--

