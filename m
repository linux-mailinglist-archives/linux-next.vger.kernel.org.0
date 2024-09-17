Return-Path: <linux-next+bounces-3887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9CD97AADF
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 06:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03A51C270CA
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 04:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0D71BF24;
	Tue, 17 Sep 2024 04:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SqxzndFK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DF2B9B3;
	Tue, 17 Sep 2024 04:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726549187; cv=none; b=W/WEDut2moMZIzVN5HPq/WVTq87RqNWuvY2gz0z+BFrJEC9sjyDxHS4Nfl8fedaGXpFHMuifDUF2/IOTc5dL9wzwrR7eAYCfYJWwzaLsWRp6g4oQN35I43gHBEaej4Thh0GzQ8fwIVXNtofV8fY/tMhdDIXvB097dsni+o5ayEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726549187; c=relaxed/simple;
	bh=DwZUZ2SpiL/gq3e9qSka5nJFvofxdDOJh68Tp1JclQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bs/WpUO4WKFNFVOm1fa0lol6/8iDUfznoggERpIvly+fdoW/hESSpBH6c2SrMFZMpn6xFhsMx0cdsmOXW8makPp7t8cj6UP4Ic+FT6P1H6OzMQl10QxK4vnQrADxSPV8H+Acg3YpDRtQkdYaYLUio3W1t/HRnBOYzctjut/1i+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SqxzndFK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726549182;
	bh=I8RZnLN8fIZOZORfd1+gMIR1qybHXpbTW3SBHXbulD0=;
	h=Date:From:To:Cc:Subject:From;
	b=SqxzndFKe4s7bdRcX9dcFWwyBGrfyq4dck4C/HZsiRhiPFAu2NppSypoubUt3nZcg
	 dSi1ysiu+Dq5cr8PaKQOXKO6BhDHRWN4t7mg0HbvjTbJo7UyEp1I+OJnXu0/HaAvjR
	 wUrrqx4XnLTzyKcyKRfqdf64qfpC3PPJCnptR5yOTvbtpMo3mEloEZML077Q0ImMpx
	 x3FhrIU+d7zHgHSJSGUHKLPDr7rL0cs3oxOhdUKw7lBpsP2g7BdyLpSW42olJqaQGd
	 YIqsWlal0by359a1/KZupEBy7Q40iNXWeUyN4D/FsHHgPe2mu9oC+EePWi5XYCpu/x
	 Xq7ReCWJvjLJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X78ht0nDyz4xbK;
	Tue, 17 Sep 2024 14:59:42 +1000 (AEST)
Date: Tue, 17 Sep 2024 14:59:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rust tree
Message-ID: <20240917145941.2c4695a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wM5kYmkIVR/lU/.71QvmqzU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wM5kYmkIVR/lU/.71QvmqzU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-stable tree as a different commit
(but the same patch):

  cc1d98f9fe30 ("kasan: simplify and clarify Makefile")

This is commit

  78788c3ede90 ("kasan: simplify and clarify Makefile")

in the mm-stable branch.

--=20
Cheers,
Stephen Rothwell

--Sig_/wM5kYmkIVR/lU/.71QvmqzU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbpDL0ACgkQAVBC80lX
0Gz5/Qf/S5CRlue+QXC62vDeTVbT7yiGzdLhY3R5e/L6rvYloQDxInvEDCsBDz0s
786cxLIm9w3W/lxnpEyiARHAaflY2VYWU7oMaEgfBpcJuo3PU10AobrcOiUcVATw
nFDxBI16ilz8zwVAk6eMccMougho6HLmx3FCW0Aw6glh62rT5lwtAOMYzfFojfM0
sl6EdAmI9sl0qF8Wap3m3hqnXuOiOB1WxG2LlYpyDaj6266BooTkCBgxbT+fC87d
QY5DILzaJh5/WGOD7jtjD3az9ukZ11+SL9bON/MZr3t8tCB+KH5ODZeAz27lXp7Y
j1g0jo6pQ9froGleBKhzfVbO6Ky3TQ==
=O0no
-----END PGP SIGNATURE-----

--Sig_/wM5kYmkIVR/lU/.71QvmqzU--

