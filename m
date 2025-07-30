Return-Path: <linux-next+bounces-7767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151EB15944
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 09:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 762314E0D3B
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 07:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7979A1F1932;
	Wed, 30 Jul 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HmSM2Pps"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BCFE55B;
	Wed, 30 Jul 2025 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859171; cv=none; b=NzmYjIfb58CG8yg//cvK+0p28pABVu4U67KhMinM3BYgTo6l+ZOEgJfy2YWk9fmcOux3LDIGSCeJz8mj8sC/lzYlI5i3K815siKRjcPr4Qnto/WJWJO1G1Lw8aRA72kriy3NtZ57DsSk5AsxpI9NzowKIwJhggMilX+zThAvJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859171; c=relaxed/simple;
	bh=+vCPByQZ4Op5rk8av3XZTGG2/QHCOCpV9F6VAsqa5M8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffJZr+/KIy5WJmrYIdl/RYJLMLhVXZ+zt069TL666PBz/nEu/3ji9K7oW1IJfyCPOx7tHlpYXcfFQRyEY1lpG8F3AT84kk/vzgJCpd/h/gIMeLslMrQo2Yk0DIoXX96awl385+VV13iVWk1ydlhpW7jdt6kVynlxT+wS5HqkLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HmSM2Pps; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753858948;
	bh=2VSwI1KdT3JkI0vBtcLHx4GoFkPHNRi+1JQ3ziZwuAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HmSM2PpsqeEpaMqGAup5dEDY0+Uv/VuRqyZNgqUlLSJAxAijfG+VFHlp9NZkzdMuK
	 fN/pnxF6dxLB2Ok9mLYyjodqh35nSdITrGXqlqruOLu4V44xc2i1yG/x42PTiJGIKZ
	 KCJVN0bxO9Ebq/Bh7lGJsM++3P1sjtSxBShJl6DCHw8LluhEfYgrXpyg0m+8Dn4A+u
	 qste3AIuq1frzw+GIAmW65claZYCk18qUKueXsPOg55TFA2C4o9MijnqIzymQF0hGa
	 YrhT5XaoLhQfcDzMiw5UD9Kl9wExxTJhHdvf2sBcHfLHDm7OOEn2qzZRhyEu/7j2UM
	 iKauWPL4LEXMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsNSh08Vvz4wbY;
	Wed, 30 Jul 2025 17:02:27 +1000 (AEST)
Date: Wed, 30 Jul 2025 17:06:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 30
Message-ID: <20250730170603.7bd453e1@canb.auug.org.au>
In-Reply-To: <20250730165954.46f741d0@canb.auug.org.au>
References: <20250730165954.46f741d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2mJojM6zrCVvNObw9.5s_pw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2mJojM6zrCVvNObw9.5s_pw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Jul 2025 16:59:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Changes since 20250729:

Please do not add any v6.18 material to your linux-next included
branches until after v6.17-rc1 has been released.

This tree has not received as much build testing as usual since I
currently do not have access to my build machine.  Only one set of
builds have been done after all the trees were merged and the final
powerpc allyesconfig build has not been done since it takes so long.

--=20
Cheers,
Stephen Rothwell

--Sig_/2mJojM6zrCVvNObw9.5s_pw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJxFsACgkQAVBC80lX
0GzpEAgAllWIsCaZTbpQALzGsfkBiZXrhiY/6G+TSoGMgrDybDzAvyRxlqbZvOTG
+YqdKU6qLC5fQs4IHknO0IP6Ju4mQWGaQQetV5jzpcCY75MDtQ5uXK1fa5KJnjhR
OEMDQxC6LnGrntZH1GxVbzK01KK2pGh9X7u1z1sRIpdpAEw2eSrOTA2tc2eim13o
BiGK4g+63azCBIge+NWB3nsfbXBTc+NJrdKm+wvt/waW1V7qNAMkeX7ppVBYQpn5
O/cEtf3J2wM7fGcupxf6oaRCDC0msGoQhBxGGf3P8Ab7QbGkC2HPT2MPcPvyS5d4
7JLvmLcQBcERGgVpS6gId+0ox0Z4fw==
=TqxS
-----END PGP SIGNATURE-----

--Sig_/2mJojM6zrCVvNObw9.5s_pw--

