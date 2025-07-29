Return-Path: <linux-next+bounces-7743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B715B147BC
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 07:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83FC34E3CCA
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C133723D289;
	Tue, 29 Jul 2025 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aZw7k7yn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954F23AB81;
	Tue, 29 Jul 2025 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767774; cv=none; b=MGM/r6po1tw9NH72J6862tqhgIdFTp0P5p0sxCwKvWc857dQhl04WFHGBBn6mpebLmPViy/lO+IXp5r7qg/amLQ1cZJ7GWe6SGaH0vlgDAWgw2mIXqHMyTYwg5Es6jv1e92Lg0yh3jDpX4Hfkr2/mbQubLPbzd/8Q/WmHwRwrU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767774; c=relaxed/simple;
	bh=eh8c/DduTNvRfCeh8UJs58AEYsvQXLzQ/ynY/RjkFi8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKuBhXsqSMcG0b0n3UEzIrqhR6aMMcZN/fR7m0Hdoscv6M59g4cEvlcHzU3Y4q+LmaV5+VPTU3/KeQLWvXh2l3yN5FE+EgugKgHt9rQeqw2h4E1wGfBVrj7EopLoaD/i+t4mnuzk5YyFGMXkgJoNSX7KKUun0Z6cEBGJ3Y02lxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aZw7k7yn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753767561;
	bh=uNf91bX5488v58yCIxagCDw6W3NBZZ5EB6Chn4pVJqk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aZw7k7ynu84foltaWnWLeiqMc0GQMrgBx82eEthIr6fp/G1s81lGH2aeNlF1cU25q
	 ffwQF0gXIkTeBr5/3N/lGlb2Exx47FVKDkBcWuqE8iRASPednJ4dmL9FcZrkMfrmgQ
	 xpt8PVjsrfduvKdGwyJLTCJJAEX/+OMB/2NbO5MxDDqs8he3J52KVO1s7N7bZvXELU
	 bzPDjDzwmUlB77FAPdQLiBerlezumGjJrNiqLrRA+s8WOrcTSW8piI5siDic/xDBqX
	 Tbdeb/xL15kN2MCkW28dkyTQoOtUcoNI9c5v6Tu3ai7mMhWracJK/nihCj3aFli57g
	 aCB29FIVpawRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brkgF18Vyz4wbW;
	Tue, 29 Jul 2025 15:39:21 +1000 (AEST)
Date: Tue, 29 Jul 2025 15:42:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 29
Message-ID: <20250729154249.0523ca98@canb.auug.org.au>
In-Reply-To: <20250729153510.3781ac91@canb.auug.org.au>
References: <20250729153510.3781ac91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EXJRLzDieicAozjz4NmbgY0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EXJRLzDieicAozjz4NmbgY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 Jul 2025 15:35:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Changes since 20250728:

Please do not add any v6.18 material to your linux-next included
branches until after v6.17-rc1 has been released.

This tree has not received as much build testing as usual since I
currently do not have access to my build machine.  Only one set of
builds have been done after all the trees were merged and the final
powerpc allyesconfig build has not been done since it takes so long.

--=20
Cheers,
Stephen Rothwell

--Sig_/EXJRLzDieicAozjz4NmbgY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIX1kACgkQAVBC80lX
0Gx9cAf+KjIAE5pivZNVsOYbk7qwFuho9baGeSMV/3OIG6DHc5HTK4JiRODzcGQ5
hRXXvqAMPSr3kDlyI4JiUfb+f8r8zgl68QkJcxYuHSnA+8AWMfCRBTwUrDX5TGly
DRMIs6Kb3ZBkgCkYbnSgnnue0kvY5HKDLz3B2OLjzmAtRxsoDg995JWiTOAJw24h
thG7TKTyf1fTxgK9FdY13ZXhxzPzhIuAAczE+HcFf7+jMWyIk+BGxd9GBbucq/JK
vN3DQflwmZcrhLpEZkMJNQhROlkdoUECoUiybS4fSud1pdtu89lFIKozjNGeOGT8
kBqWBvjxs8RmDC/f9inWDX1PoM1ouw==
=boQD
-----END PGP SIGNATURE-----

--Sig_/EXJRLzDieicAozjz4NmbgY0--

