Return-Path: <linux-next+bounces-5018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8FA017F4
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 04:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76554161F09
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 03:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9621A1BDC3;
	Sun,  5 Jan 2025 03:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lWb4cUC5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCFD63A9
	for <linux-next@vger.kernel.org>; Sun,  5 Jan 2025 03:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736048534; cv=none; b=pEHe1moAZPDZS6YbRJBQYwCxOJYEicbyDDGSy4Ub1o1yp7QatoAOQHoouiv9/Va0R/+yDwYTlUC+GSutJrblftenH6zcD/OucodZyPr8kNlsiqWyONRNzzpjVR0EBQ6c3IEl6hj9h2Sc24+Pcq5eH6NtlyhFzj6b/tG0sCktJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736048534; c=relaxed/simple;
	bh=OUomOZNHlGD3D8yNwazEJiiCSrzdpOMVX71pLchw2uE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QfzAm/z+R/xzo/l41U8Pipw0O244ag/DtOOqc8F2E3IfELjZInJJ7LnJYjT8OvQVQXK19QsS4aiuGuoubB+MdhnFpxAOrtbrOcAZBR3rzdg6s8yEZAyKp6tIiuh0C95dcFOaNzdgSqH4OjpovSU0y09NHqsqF37er5bl0RRSYgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lWb4cUC5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736048091;
	bh=9N0OUs3SYDunsI9lE0pJPy3KiYYKG+/+lSs/mlepKYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lWb4cUC5ZWnVJ/M41o82iGuX0otwrhSUo8YxvK+GdBs+W53T2TtPV/Ks1iKGi31ER
	 0YMi/s09u4za9SqMIoIE3cKp2odSviHS7+5ZeFLOYKKXgrm4SGrraNiMlp8XOuzLYe
	 q/Mof3eqFX2vT6WhoDYzfndZaK8lSuppqr4r+d0Nui6hsFhWNSUL23Hf9nW9K7ZtOq
	 0phrXe2RC7+iih6QsBrR3tK8Y0qp6wTUpvipFbhu85tB7HufUF7T0QpAjhvq49xH1D
	 9l7/JXYUcB7x47iTa8ILmPNRD7ajJlskwtQo6wKxibRKFVvdzkCLY0qP6pLc3uk/be
	 M9AlIltalrdQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YQjcC5t7Wz4x11;
	Sun,  5 Jan 2025 14:34:51 +1100 (AEDT)
Date: Sun, 5 Jan 2025 14:34:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Bondarev, Alex" <alexbnd@amazon.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Linux-next compilation and build
Message-ID: <20250105143457.7188e71f@canb.auug.org.au>
In-Reply-To: <080CD985-138C-42CA-A46D-175FB7C694A5@amazon.com>
References: <4FF05C5D-F7C0-4212-9917-0D94DF3DCA60@contoso.com>
	<vnymur42hlcdiodh2pyoikdc5646zceiuf6sizgde4jmeqd4xi@b7xt7wuq3aaz>
	<94E577D3-046D-4E8F-96D6-593D4F7C808D@amazon.com>
	<20241224111924.14263694@canb.auug.org.au>
	<080CD985-138C-42CA-A46D-175FB7C694A5@amazon.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/974aC0M5+iuIwZzIZirb0qS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/974aC0M5+iuIwZzIZirb0qS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, 26 Dec 2024 15:29:48 +0000 "Bondarev, Alex" <alexbnd@amazon.com> wr=
ote:
>
> Sure thing, we'll see how we can automate this.
> Any specific format we should adhere to? (of course we will include the t=
ag that was used and architecture).

Nothing specific.  Just try to CC the appropriate people.

--=20
Cheers,
Stephen Rothwell

--Sig_/974aC0M5+iuIwZzIZirb0qS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd5/eEACgkQAVBC80lX
0Gwfhgf+MSKyZpntmKNEW7J8u7bhfbaxcZ4cjitFZLqOwpuQfj8skxpQyeOdnjwi
GDFrx0nVhYuvdu9XwiU8oVZ1URJBAFBS9kTDj2+Cx7o52rTM/+eb77OZEagZ9Hjq
Sd7kB44VmSgL1FaYkLuIw1+iyhROF+gS4ojzmKl0D+cn8Wa1ELpFebUU2d2X+KvZ
9AytDRRUAz3v+j+bsXsVo23PflnECQ2+0+c5xm9NFaKWjBldxwEscu5b8Q7IGUi9
eye5n0kBJmqqUBP63g81t0qNS4TPAsah/3RwkPlS0eA6/HFIGuV0Pts1giWZwWpx
cfbe807dRRy5LLFwxdEmYt/chIi2yQ==
=1c0e
-----END PGP SIGNATURE-----

--Sig_/974aC0M5+iuIwZzIZirb0qS--

