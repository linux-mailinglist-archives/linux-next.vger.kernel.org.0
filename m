Return-Path: <linux-next+bounces-4194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F485997736
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 23:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEF701C210DF
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 21:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4F5186E4A;
	Wed,  9 Oct 2024 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aB3iPgAF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3040849;
	Wed,  9 Oct 2024 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507829; cv=none; b=msleg9pRSco7oGjhyD5ecsEn8q1fhl5ki3sTvFyObbax3NrPf+mVGHQ2yZyy46rcsk+kYlP3mPFophbvqxpwzlkMMoc6/xiPXfIZ/U4jYhuZR89akcdOgT+xCvSQfRuZfah1OPuuJDgEt/5mzPHlDCqEP4sNJ7h9RIFI9BTH5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507829; c=relaxed/simple;
	bh=izQ6LXTzInz59zs+j7ZJ4F8ARqCJ014jOnzhTY7BkBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BDU8ki1wxV0NuTJNGlNLIhmhhqcLsSExZ5HekcIiG+OLMQAhPQ6Zhe6F+83ZsKAoo0zFk5MFqopzNZ8Rk6qekBuULIrCCYDSSnTwje75wWLP6kB933KGxVsmYg0WlECZXSLdCcZDCP1n4KHTB+IsBMI+SmO7Rs+9/8jq3vXXh6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aB3iPgAF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728507823;
	bh=Zutbh+QZhL4EgflTjh1WBCypdVX78xI1U8TxUWBEa8o=;
	h=Date:From:To:Cc:Subject:From;
	b=aB3iPgAFxmFxeMoOk25z2A+rxyECBj1Xh1qdxf39Ls1ueFAU3jeD5qMSyiEMLHd81
	 TuVaIHqgwPdGfkAW5K7oNFDZGJ0Fo5Y41gCX/8e8pg+4uBHppczjk3zETc7rR667Gs
	 xid2wXJqe9EIEI4FaRAAUY+EUdKT73YtDeO+Oy7fjxJOGzxBUGW9ZM8+C0ibLVp0qg
	 2EWF48kOnfX9t7UlgGWKhyx4ltLppsHH9r9KWlDoFa+xqz4mpFYDQ/v5ObgUzWCGGo
	 cmMqqMUsr52acowoAq+sVFFYl+qCindHilHJXBqyZj6EbvlErWHBmrB7P7PcvEMrTz
	 j02nZS9CMmPew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XP5335W7Tz4wcr;
	Thu, 10 Oct 2024 08:03:43 +1100 (AEDT)
Date: Thu, 10 Oct 2024 08:03:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mediatek tree
Message-ID: <20241010080343.1992ab8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nWJHNi+zf3o_UJ0N=SQWxr.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nWJHNi+zf3o_UJ0N=SQWxr.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8e7a6a0b622a ("arm64: dts: mediatek: mt7988: add efuse block")
  242372c0a236 ("arm64: dts: mediatek: mt7988: add UART controllers")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/nWJHNi+zf3o_UJ0N=SQWxr.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcG768ACgkQAVBC80lX
0GzCfAf/UEv6GtnqddFDTEh1CZIfIdaAOwrg13bZ+8FRtpQofJl0EnqeLpR5ns8Y
e5vHhGbjIsNKEIgjnmPkM0mDstrbCmRhfRyNqRsIOZ+AuPijap81H47dtmVsudaK
XyLB/Iw4aXhuDi5BSYhp2GFJcgQ6VVO/SIgExZJql55eusPALgJG2hSm3VHQOx85
rSUatj7smb3wvSmIVi6yN1cNPON1RSz9MOHg/arH4d/RTisL2QrMwVivxKbY3WjG
e9X01m2VH2mrn13Dw7vPFiKSUHfNJQ46NPjtJW+OJTBcP/k1eKy7G5liFPwidTyP
rt6zAKGnrO6LlBNSgxE7ZTspGRT1Pg==
=uS/C
-----END PGP SIGNATURE-----

--Sig_/nWJHNi+zf3o_UJ0N=SQWxr.--

