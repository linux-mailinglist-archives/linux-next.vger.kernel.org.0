Return-Path: <linux-next+bounces-6416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41AA9EF74
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 13:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA5C1A80DD8
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEFB2641C6;
	Mon, 28 Apr 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CpukX6sv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A378263F5B;
	Mon, 28 Apr 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840329; cv=none; b=Ji+85UNMaaa0HKZ5oLuudvObVpR7v8naICuA5RJuyj3ywA0YdLa+YPqFWzlsxU/8Lu4vIMYZiWxoVTm3RC7xEqHdghz1ZMwmMWgeFdbV8Jeex9URKW8cblGzKSRm803arWQNRbRbyY5/AS2b+ciX71O95FY7tKl1Nq37iSY7G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840329; c=relaxed/simple;
	bh=4cpvRsbrs+OFOHOlffa586ezOSMHPYLTzsL3WEzziSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n9Af7kSRHmoIRD2VpCSy1VqWpw4hUalS7DaBVItQKxXGJ7s6PnkWFADwgric+4vb+0ocpUETO4v5PFmhG5skNaEh51naEUpGOfBgjTdnSbuo8rdMwOlM57+TWgCdiTX+0HX2ermC1clzwxJfkatxC1WP7o2eaCJoeMJbiwI2fSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CpukX6sv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745840324;
	bh=I12fWHgs69X6sL3loq0v7C93iUi9OzrXMYCznnNHNnE=;
	h=Date:From:To:Cc:Subject:From;
	b=CpukX6svm5MJ90pJqNDao3H2sQGzGfn5QSibye3qbOXyAmCjOjp6TAlNj2iqLdwSQ
	 vZWeyw6G8QaSTTrbK1DgYO2JI3LTMr5Bo/MIHD7EHVYaF8dyTtS/VWWpfjmW23mPqz
	 s8SHIYRhWBnDSpc8kJxvq3SBZeNKi0wZHOcyuSkbWWsitmuTt1G5qsnM573+eBvKfy
	 df1lSBk34WKhLPv39CUZnlDcWYwTcmSfC72kpUopCPCsmd8XYEiG6wm9pEpFjJP5o0
	 EUvqgOQ5usABE/WWuXxt/iqxxJ71XtZJ9lO53fufWJaVSeVV5QBNCsfK7G2hyTubm1
	 NwkCLOJMZR0xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmM0M2SlVz4wcx;
	Mon, 28 Apr 2025 21:38:43 +1000 (AEST)
Date: Mon, 28 Apr 2025 21:38:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sunxi tree
Message-ID: <20250428213842.6b0cbde3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nLlgY_uyVbU2u+FgyAFu+4j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nLlgY_uyVbU2u+FgyAFu+4j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (arm64 defconfig)
failed like this:

make[4]: *** No rule to make target 'arch/arm64/boot/dts/allwinner/sun55i-a=
527-radxa-a5e.dtb', needed by 'arch/arm64/boot/dts/allwinner/'.  Stop.

Caused by commit

  dd97ddc4da0a ("arm64: dts: allwinner: a523: add Radxa A5E support")

I have reverted that commit for today (and commit

  3f2bdc908d21 ("arm64: dts: allwinner: correct the model name for Radxa Cu=
bie A5E")

that depends on it).

--=20
Cheers,
Stephen Rothwell

--Sig_/nLlgY_uyVbU2u+FgyAFu+4j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPaMIACgkQAVBC80lX
0GxvcAf8DHmyPMXeULn25ly6HGTWxwZxGJLmiCzQRZJsXCyyPqhgV8k9JwO6m8+f
TAjSYqKV03UIOroANq+aQh5NcRQKtia2FhsrkAQUMciFaMHfLUjKty//ersJN9vp
JfIYncCoUHHKZLG9hisF8qxMZWAI8cGhO4OX/MXt+q4Su7SvhMmrNNeicA+r9QyY
S2C79Imur/NRH3ogZl3DPVe8JmdH9AZK9mRJdSx+Da6KTKU2dnp4Oq8SjBynTwCg
kahuY4Ph7WaU3cwd5PSlk65E8TGJ6E/M89FuaZZpYpnheQcAS8pWNa4tGqDj/sSZ
RkRIGDkMCASYaOJgzzq6MbSzzs3UIQ==
=rjpf
-----END PGP SIGNATURE-----

--Sig_/nLlgY_uyVbU2u+FgyAFu+4j--

