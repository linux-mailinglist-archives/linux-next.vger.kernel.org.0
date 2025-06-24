Return-Path: <linux-next+bounces-7217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B5AE5CF5
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 08:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882ED17512B
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 06:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2DC23ED6A;
	Tue, 24 Jun 2025 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TupmyhE6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170E246BD5;
	Tue, 24 Jun 2025 06:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747181; cv=none; b=gsfzNUUfJmkWw1EVkqQIhgA/5oLumAJexuaZMLHjPuw9+RMIyrSQtDkmjjVTJ1QCWVvZXXzf4Hv1F9RnUOJJoacSACM7sLkgGT7mYz2CapY0SHOuJIatL3N30+LD0quWEC4zTofwFbgSr9no96YLGa2YRLWYKYzeEKsZ7XtBmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747181; c=relaxed/simple;
	bh=4UDpWb4oqK7dIdfFQ1BVr9RnoNbfmlOsqLGMKf0NRCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IW9jCPKwt1lyI374fOGoFgVIWwuGe0rXQMxNt1FFwsaGAsuzAl19dl8JTmQQZKXOEIPqQy8zUz5VvoFDimmNNdh5Gz7sq5qb/tWGWS/U8wOepe8XsvK7Ink1lmaobHbgMY4I9Z8czKWcZeCMTHjpo/WVm8Hbk0+CTGkrrgbsF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TupmyhE6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750747174;
	bh=G1IsI17RWmGATITR3RmBRzTs72yUy4kkHxGA+QJxeL4=;
	h=Date:From:To:Cc:Subject:From;
	b=TupmyhE6W/O+nemGwerE9m7O3Z1w3NTjFErzsysK39nu3DMPuqgXV8pKZjIh8/S4t
	 yz/9/crg65nGfxoK8J6wc1FsHEluvkpy9KhSi5TEP6y/R/JedrubCo7yu4t8j9Tcar
	 5GfLUw6hvvfY/IT0LqS1vTZSYuuQpFoikcAGshGMxf6eIq0+9+bLjkziCuUQWmOoQu
	 mSkrbVA0gkoqr2tej2/rZ6n+YByiL/WNx6VLZ0C8bfTXrCHcdVFk5uMIycHyqBmYrz
	 EIUpQa9Y0jtVvUgqEqRHvRkXpzKLNYd8oyFrS/seT/N90YRq92GwIsmRcEZG+H2eJT
	 MDtW5QAAciJNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRFft0wWnz4x3q;
	Tue, 24 Jun 2025 16:39:33 +1000 (AEST)
Date: Tue, 24 Jun 2025 16:39:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tty tree
Message-ID: <20250624163933.301e7859@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xHe5DrNHoQqK4Xr=3/WaGON";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xHe5DrNHoQqK4Xr=3/WaGON
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (htmldocs) produced
this warning:

drivers/tty/tty_port.c:400: warning: expecting prototype for tty_port_tty_h=
angup(). Prototype was for __tty_port_tty_hangup() instead

Introduced by commit

  2b5eac0f8c6e ("tty: introduce and use tty_port_tty_vhangup() helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/xHe5DrNHoQqK4Xr=3/WaGON
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaSCUACgkQAVBC80lX
0GzHBAf7BjgzvtCkkCPzAIvCQvcxM1rXDa+4eANDp/KjFun77Y5oM55ksTmL8HLJ
Kh1WAofGcFLsA1Jb5vDLT5cryTEZwKVsXpvaq29+YpeNw6xi/4R/D5CcuWO8lgAE
KPm1StrSsi0jzmsvkjxiFhaQ5DJ715ohg0IlRgbtmOsIHE0Tr1778l0AuFMWo4j5
3WAfyx18rQYbOQk4LTqC3G9jyjN0xi1lLCoZ7gDMY9EZkfCCVAIYB9B150vTh9hz
QV/KEhjuPSAzzQejL393stVs5Myzx9EAvx3S9tbhwN08CDgr5Uuu0lkdOV2Tn9wL
tMTjZ5Qb4ChsY0aAbMamhcYAqzR0dA==
=+uoy
-----END PGP SIGNATURE-----

--Sig_/xHe5DrNHoQqK4Xr=3/WaGON--

