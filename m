Return-Path: <linux-next+bounces-6679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DECAB2E93
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 07:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78A03A611A
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 04:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116DB253344;
	Mon, 12 May 2025 05:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SdNl0N98"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9623C2576;
	Mon, 12 May 2025 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026001; cv=none; b=GVOL0zp573H1/cqGBTFZMYIS4/i67xPx3B9Pf02DyUzAGZHMb6hYiDMYob5jq0EvL8B6rTkTukKNCLDhKuLz5CcKBYkU/MOLmIP2oKvYvyiiMI8NNe7NbvjcWQ8gd20916dNsaqdOrSlBF1IKd6j1eKTBAST0JdzoNxCdSoIL4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026001; c=relaxed/simple;
	bh=ykWKrufQ0dMbuXkuIxPpctFtUq6dfgKiscLuigvbZTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nD277c661wMKajLGuBtjR2Nd315ft1YNHaYUcYgFcWCH6RPv4txjyjZag8He4X+g6n6NRaoKAaVcs3ukCBLAgl+d/xI77Y6prsE1yipDfm4Nz+qdpJrcH4LE+wJlIeKroE9Z08AXnuacK9zyIG+Mk0rH28AKMOq0PXcyZmmY6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SdNl0N98; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747025996;
	bh=S5qjjpGj8L93gzacq4gjUyXCTFYMtYUSw2NjsD+Uzs4=;
	h=Date:From:To:Cc:Subject:From;
	b=SdNl0N98LAQB70GWoJTSNCAar7COzr2dmFWKvfOA5a4E7jBHvgS6TNgxNbaLPdIr+
	 GU+6MR/fQFNGvFi63DCpV4xXZH42DlDIlCKtv1jL021df1UyVcPNiJQaILiWLLOMoF
	 2mR7JQnx/xmOei9+ZBJT4eGWACuICVTTAFgmlBNQWLdNHJoehIhSNWco9k29Ogi+7R
	 tlnIOaXUQ7CKtKYnl5ETCl4hQczobbbNZXBKubezzEHdMsILmNjB1aTKP80ZZVKJPn
	 +mlnu9PoEtGgm9XwFzZmkrUHItnszb2wPul8Z1XyD6HR87M8VH1WG2b6/+5rEAgX35
	 Bgrimt+ZAGAnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwnTm1PJ0z4x07;
	Mon, 12 May 2025 14:59:56 +1000 (AEST)
Date: Mon, 12 May 2025 14:59:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the dt-krzk tree
Message-ID: <20250512145955.617fd207@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CVJ1apr.sNYeeCjClOwSlRX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CVJ1apr.sNYeeCjClOwSlRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  b112d9ffaa65 ("ARM: dts: vt8500: use correct ohci/ehci node names")

This is commit

  7dc891191e64 ("ARM: dts: vt8500: use correct ohci/ehci node names")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CVJ1apr.sNYeeCjClOwSlRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghgEsACgkQAVBC80lX
0GxxLQf/ZUm3ITcmWskPpu42TrKRZe/HqM9gGBoY5Mpj8FrUfYROhtvOYodAXydO
Q/KJjEkqO6tKdjI5+1dHnZOLb3ezYr1UFlX9K1G/7klj0uag9kdxJcYbEsIM3W9S
5e1lLgIedtZjB1qamag2GPCv/dByw9cDa3WmxBJaYZiIzuckxJeXgkT6YcNeeKyh
2xBhkOhESKYIJHUGGvWn7C4Qkt32cr7uVCUZ9N6aXHXyCnekPbocQsZAou3QMGw+
5RTx0kcNdMEQxJhYhjRpUF5GlH95+0lXS+L4qNvcgQ1hHMgXoyU0c8kPxfPRHyNH
RHBcwsDLZ5Ch+BsOI6x9hcw96QSCNQ==
=xddM
-----END PGP SIGNATURE-----

--Sig_/CVJ1apr.sNYeeCjClOwSlRX--

