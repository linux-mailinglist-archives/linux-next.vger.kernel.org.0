Return-Path: <linux-next+bounces-6583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24CAAEE88
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 00:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A53B4E25C5
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 22:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09537253B5A;
	Wed,  7 May 2025 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ocx+z8a1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB91ACEC8;
	Wed,  7 May 2025 22:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655877; cv=none; b=uFh81s5zDanIFh6nBFlAD9rVTjVd1Cg5SnFEhD7bQYFrZXbGQxRnq7LjG6xaSBULhyUCYFH2e2KPKrLmvt3Knc8ukZoZ1P453bj+m5e6wfnl111BmF7izpqmyLzS6oKEgKuY10Y1rueATVJZP2WwpiEosU9qF89D+CHFmyLzTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655877; c=relaxed/simple;
	bh=tLCM/GoYG+APai4dUWJszRJSyFC4u2ftRrMwY8O+Gro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lxmx4aD3yEGY/JKyxkvLOGlSgDtDxBdAo7d/u7vYQdiaSgmbFmjQfo7dohtRim3HKnywLzlN3h+LVrD6Rk0v1yVxKRh7P87qpYmmDeCXLiT+xqH6wlYOMulDT8vJrYSxSusDkWEPjvyBn8yeZRv4o0m20kXGY1RMXixHmS4vBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ocx+z8a1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746655870;
	bh=i7/HWvhWvwN2iEfu4OMjEV+nd4l2NQi6u4l6OZGSROk=;
	h=Date:From:To:Cc:Subject:From;
	b=Ocx+z8a1r2OJIhaIDpEqreT15e+HJKrmIXEr5L2ty51UBTrvkxuWYaVW8WZ/+Tcov
	 V+ZFpy8C4nluRnTuzVKJvP+mspjZBQkj5IExMC2awWRtK+d7PBMI/yopOBavKLx53U
	 H8wv+BJ9eNNIROvCliExsd+o/9Q1zFortgZzNZw00qrPRVn3+MPu5+9/fu9NrK3d1y
	 HUU5T42incIXwWyyzGTMYoB/pmR0ABPsnNRn0TUIJdZVtHdVzE6zVD0MCqidgNF25K
	 WCmDQsvf2Q2Kw0k9M2/VxpZqxqcbN6RGM1hnn+atiWhxQAKwv9sAcIkfe/wq8UWW/X
	 rTE7hR1P/kw+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zt8by0sSMz4x8f;
	Thu,  8 May 2025 08:11:09 +1000 (AEST)
Date: Thu, 8 May 2025 08:11:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Corey Minyard <corey@minyard.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ipmi tree
Message-ID: <20250508081108.7fbdf523@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4mRuToLH5FEvtdig+vTYyL.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4mRuToLH5FEvtdig+vTYyL.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  14bb8e8bbf92 ("ipmi: Fix parisc compilation")

Fixes tag

  Fixes: 54671f9a9d3 ("ipmi:si: Move SI type information into an info struc=
ture")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/4mRuToLH5FEvtdig+vTYyL.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgb2nwACgkQAVBC80lX
0Gzzjwf9FzmT1JlapFu4yCs6xrn6aHhOPE7udoWzhP/OBy5LABu67L8U8+rn48B0
7IlfI0lz1BC7Y02TrHau+RI/+hfo0whgM1KrpCXtDgdn23rUWlxJ7igHYNzrtwsw
94lCzqR2X5wA73al0DWU5/ZpwA9J8t5D4JGPaWBb+XglRAGbxr+gxkG4SzaRkHtA
G8V7is5oUR56aq2oh1cVABDyqFhY1nt/Nox6iIi73PdAi1gF6povGXaEADlXj2+o
o+pRQYTPm8158HSIZOXEQ963T9wMSIltn9P8Ih5R7n4h2taNQYoDfE9G1FzhAEyC
NbU1xnX8HQlGGxP7kPsLbA5NBITHTA==
=/m5m
-----END PGP SIGNATURE-----

--Sig_/4mRuToLH5FEvtdig+vTYyL.--

