Return-Path: <linux-next+bounces-3600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEEF96CBD7
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 02:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0D328B85C
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 00:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50490B66E;
	Thu,  5 Sep 2024 00:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CX0FzHU4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E64C83;
	Thu,  5 Sep 2024 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725496615; cv=none; b=Stflzv3Czyyz9ay21w8QfCOfaDkIVFr2cDQpoFxvEP1U7JlfS8T53P3O3WCc31QGwtAvo3EM5yLL1H2rupTkKJ6xtQJ64CLkaO/WGc/571L/2lssPwoosVcI4eKn0SjpINXRhksqNLhbju7updg6xeiDuuOr19vQXAeh9EqfPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725496615; c=relaxed/simple;
	bh=mT4vV2GL0xI9cYWruCTqmh/6kKkMNd3hrop9/f/fAKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ijoa748Y+jxVuydFdLwkgo9nC3IriYn54OC0lRuU12i5uN8FCH9DI5AnPQxoLAoM6taoodtSA3YPib8m2R66DhhuVIM8NYSW5ahDJl2iIqJQxTakUAYkYCbBl5loSojeaXYSbzWTwFt8rU+V6bgSThiNnh4QoaTfFawTl4GEKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CX0FzHU4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725496609;
	bh=v13Fn+C+IGMNUMxDqgYAvs1wQm4CNdUvoZKi5rFk3Po=;
	h=Date:From:To:Cc:Subject:From;
	b=CX0FzHU4MyJHfWZRqYsBiDUnsy/uLGkBvphhcbUe5Da0lYpIFL9srnSAOSbwU1xyl
	 E2FvZohI00E4p2Safop30catr40yfO/qDWqK5svOAeW5sIe3enB3Sjzy6mFk+Rpa0o
	 Tvy2OSgeYqdcmTzgdQbFkZQbol+84uaWYrm4WMBqL0j2sU2hAyci4LrGgNLbESJQ3J
	 MgOlO4uQe7z0O9JtgRY83RgJcn3hLUOkZSlGKyqNDV3cNSxL5cry01qgzfJi2SiHwF
	 EMNVP7GYvKj0xKtNCGZzoRAndJbMurCIcoGe/6ywzGqs4HhLCDWK7u9yfUOL6j4mBJ
	 aGer+bnJlHfgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzgR535cxz4w2F;
	Thu,  5 Sep 2024 10:36:49 +1000 (AEST)
Date: Thu, 5 Sep 2024 10:36:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20240905103648.676e825d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/09UlWnNXp1.XumipNMu8.Ws";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/09UlWnNXp1.XumipNMu8.Ws
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0993abbc7835 ("Documentation: kconfig: explicitly document missing prompt=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/09UlWnNXp1.XumipNMu8.Ws
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbY/SAACgkQAVBC80lX
0Gxa4gf/V6s/7sUxtDmfCOiVS5BNSioU25vOk4AhyplScDCi0nWaXl2c/BlEihq8
UpzEm5ptoE/xHe2hQev9+9lGK40rGCYPf4aWuTFkntf8z5MKrdgHP+ApEH/P246R
AmmF97RgoLADSwN4XCQlzN35ZSiLXCOsEgiycn3WZTfN7I1l6G+ufNFutq/91SdP
Ogde22GOuBG24FgLJrK8/3S5sZ03QBlwgUAOWRc2WAgBViPLazHiJywbI3VfhI+R
L4049QEWlwXDlrZTgftDnr37UgD238pTdHsKiUxB1rX0/AqCBQso6AKnFDI9L/48
A+R5QczDbV1sGqaDGhav5L/KOPqs8g==
=0aZr
-----END PGP SIGNATURE-----

--Sig_/09UlWnNXp1.XumipNMu8.Ws--

