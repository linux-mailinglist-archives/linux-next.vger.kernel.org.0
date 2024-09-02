Return-Path: <linux-next+bounces-3534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DAE967FC2
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0B0D1F21A7A
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668F23A1CD;
	Mon,  2 Sep 2024 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vKKE0hQw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D71F4FA;
	Mon,  2 Sep 2024 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725260095; cv=none; b=CEkNPlnSiYL7ZgxcQQIXWe9QCoKIp4Ix8SIyTzn7zcaCZjCKiIFT56mQrNJPrDdwVXYcCmUiaLFF0iOUPqUry99IomBs4ltI2WtPNsw2PhEi3v1yIRoCr+sCWsN6iSPH1ASf82+LxgwLKq7wQgQR/PTn+my5ZAUXlTsFX7TifFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725260095; c=relaxed/simple;
	bh=mi4nCDxac8MvL+ScLcmR3txGCpviaN/HfY/5GPk9EDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbx4JFr9cwFCX2C9UVcmg91V5LKXnFVGHHIZcaXx3H1RUNbHGftD7AgQS0W9Pto6pfLgSDQaT5f1ox/PASrLvrI2OguDz6ZoLxRZu9Vkpwrf9e3/whx7eDVGFoakRS83144vP7+6pbbaJxHgJAQ53sncv/eExtuDuhRFWZQ5n2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vKKE0hQw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725260090;
	bh=mi4nCDxac8MvL+ScLcmR3txGCpviaN/HfY/5GPk9EDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vKKE0hQwbEN9feU3GS4isS67unpocr6DDTs0EdA84jEYrbD0NufEvWT3nKqQ7utVm
	 z5djMrsHOXJ7nLEujPfUR7AwFsTw2sE9SkkEWQVyCSWI0p/FtxxJRt2jxsCoQYzt/i
	 cEMPhjlU+O4gIikWDbbmyg/h2Z673lcJdCULV3258QzXavQsXq4uujdYN5pO9JHVhR
	 hLHK6Y4f265QdG+gA5sgIYvjTpmLWTY6Yv7VRmiHk6QAtg6MgsjU/xK6fILyOm5jGm
	 TJvgBUfbiiG7XYoOyr0E26UUFhT2jjVzOgg5uTju0FL1yoriS4XwNt1tKTFlAc3MAk
	 bdt0RmCCzEyow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wxzyf4gXtz4x9G;
	Mon,  2 Sep 2024 16:54:50 +1000 (AEST)
Date: Mon, 2 Sep 2024 16:54:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound tree
Message-ID: <20240902165450.00f614f6@canb.auug.org.au>
In-Reply-To: <20240902164916.1cba3f03@canb.auug.org.au>
References: <20240902132904.5ee173f3@canb.auug.org.au>
	<20240902164916.1cba3f03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0duKpR/Z1zbj/pjrmsj8Oi6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0duKpR/Z1zbj/pjrmsj8Oi6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 16:49:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> This became a build failure in the i386 defconfig build, so I have
> reverted that commit for today.

Actually, I used your patch, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/0duKpR/Z1zbj/pjrmsj8Oi6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVYToACgkQAVBC80lX
0GwEBwf/Rwk2lqJBagKQNidRK/Vsife5Lcf8EFhQ/fqVIYIOvJ3INtZMw8ERyS9I
u8qAnJrPY6jADVMc8XsXwfT488oOUfjnXxfKMgf9sAXS+64y3CWNeMYFZeH3wXt6
9wYMIKUsbGynNUIEcFM0V6kHiL/y/h3BhFVojKUZmONJ4jJJ6ZSLZqgeTIQoWXvi
jf3/MX3zS0yk4xfQCWQa5Np3Pw31BAbjZI2iwuxq5X6Ga9411lE/NPwN7eBT8Qa0
N0fSSNd5Ve93dbYf2UFlwIi09W8HiJhjcysxqrgtRRYY4GeuMKQ9fpK9F8mJMiH2
YLYPcO+JwTTwpe2EQBiGwdXl6XtIzg==
=5PGB
-----END PGP SIGNATURE-----

--Sig_/0duKpR/Z1zbj/pjrmsj8Oi6--

