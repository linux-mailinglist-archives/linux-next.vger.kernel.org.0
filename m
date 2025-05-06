Return-Path: <linux-next+bounces-6553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BCAACF28
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 23:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBDDE1657E0
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 21:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75FB1F4184;
	Tue,  6 May 2025 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pmrK+fV+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0F1FBEA8;
	Tue,  6 May 2025 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565436; cv=none; b=O0jFT4LW/VUWBkdpOOJ5eN3z2mpaakAJH5CqqJxzLrL6SGRzg8T9/9sR7TCg5mzsX7sOXxPCgHLf4zpBLs+OjOjLtSa6LkCjelBBl8ZeanprMvzSkFmvK4V9dDK9fs7b1SuzZ80R2G57Q/G6eFV5FWEINLCDyP8LSLGNchPXjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565436; c=relaxed/simple;
	bh=LHrYhKlqZILVgbd7KYmKwZwzU0CiU83Fx5NpSx6UcLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=srMLDek+udBr1fiv0VgM0jWAowbKpC0IC+CfPtQfeqFGAUFkbRQIDfA7bAOIB9JxGMsA6xfDrhmgYHx4o3EV8RBPt0BBqfhUILqV4D4B4VfyOdluqle7vyonmiV2DwtA68NtcFxf6lYuJ02ErlKokBrEpMZJdnBUywzaV7yAGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pmrK+fV+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746564975;
	bh=EEP0LiccBuacFAQRnC3jVpubZXJBLSGWuCsUWqexnv0=;
	h=Date:From:To:Cc:Subject:From;
	b=pmrK+fV+zrOkguPQjf3rlcbFqMTocqtLL4Onp9nAMDLN9HHV0srdrghgkNas4A4TF
	 94CTB9CkvKhfSr5iNmUhKIgQ2CFBg5oNOQ12wGFU8Din5S5ZBW6aCAsRenV0ANk9IY
	 6iCT111GpsRrT50IUXHvb3ZGggj+Hf8bUKm3DbFJUKbNdr09dJDcwVKoIQL5ilC5WR
	 poskeGCfUFVrc+QZHRtIlAsu8wdRjjqErZOx7YZ8B0dg8NLnEJ/R7CYgl25WY9Y8on
	 5ohlXSyXWIOcEEmYdzlArtB12pPyIN27qYTK4/SSETpGPsc5zjyxxdBZqANbZjGPpB
	 76K6owuEC2HHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsVzz5NJ5z4xN6;
	Wed,  7 May 2025 06:56:15 +1000 (AEST)
Date: Wed, 7 May 2025 06:56:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Stafford Horne <shorne@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the openrisc tree
Message-ID: <20250507065614.7df38178@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K3rCKtFxv1l1Wso9mtjCfPF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K3rCKtFxv1l1Wso9mtjCfPF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  218b8d897551 ("dt-bindings: interrupt-controller: Convert openrisc,ompic =
to DT schema")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/K3rCKtFxv1l1Wso9mtjCfPF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgad24ACgkQAVBC80lX
0Gy3LAgAm+z4XI+r1ZL4zbBG+yAWxfrrTRwoS0Mnz6452P1wBtygA0+WeBjzUQan
kxXzmtz1E9lVFAG4HdBn4VcACDcN3U4NMHPlqbI0Sf84/gQPVI7zM9RU5QzYVdhO
zp9aJ7wu9j8uht5t8/dO9qasgwdN8HZ1TbnuwSLpNBw2d857DHYoAqRsFYu77vHw
0Ag8UUiHftsUFZbPuzJDHTVXP4qn+8oHEzFdaChBUzpeIgUyEO/yIlspEG26p8qP
NG+88IlPPOkbkRLUkeWal1I2DOckbnJqGLNwbMy7QoItH6yGpK1r47MLEqjYbyqD
lbddbzv06rq2PvJGhYZC+QJdByMtcQ==
=7+tH
-----END PGP SIGNATURE-----

--Sig_/K3rCKtFxv1l1Wso9mtjCfPF--

