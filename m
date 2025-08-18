Return-Path: <linux-next+bounces-7970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185ADB2971D
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 04:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FA5201A0C
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A08257846;
	Mon, 18 Aug 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JDQ82g3L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4FE1487E9;
	Mon, 18 Aug 2025 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755484889; cv=none; b=uz2nCH2hBFEkI2AMK+nS+SEkD97th3cxKSa66pdTyplCLgwgvDL0S/WXXQirRcvt2028RIctK9sJQ6eQyWsW/Fp989r568Ww/fRBYd5HA2vm45WzPW7b+xjq2rQAAJWSVJDKH/3SWL2eq7RbU+h1KmwOSh/X0LAGvaWkm9/VcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755484889; c=relaxed/simple;
	bh=OYJ2wV7YEGlvd8sEDJAFrhHuUSIj06ibu6OWBTnRzNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hVkjQ49jAHBGej7xNVZKxbpoTgl9S3n3SdDamfzuATW7kWgs5rWhPUJCqHCa+OSPyN5PFL/026Dh1M+nbdfc/dxnytnpOsVezlfPQbBFMEdgWvk2Ba2mtCPzQ9AOskaP54+EEYOMuaXF4Z9l4Zajb3hVsn0AAROSu/H72f00njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JDQ82g3L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755484885;
	bh=91ewaRB55Qgui8mCKdfj/EGnVi6e8/XSVqU1CqvlLts=;
	h=Date:From:To:Cc:Subject:From;
	b=JDQ82g3LrHVrl/1gsxqNrYp81p4r3pmDujIpCxJ5kX2vEzV/RAa89pFLwZuYNoroO
	 5ROudGemaxJ7mnf7vEu4gVsMVVtkaayyPZHLyg/WpGRNHakLt06dTRC69QbVXWhYvw
	 yjfeBNow4BRhKIWmwds0XS2itwYN6FxJXDxxdMT80/aAhT4Xo/mXm+lIjB4bSrQXAV
	 B1W3+oT6TjVeUuT2GQ7+OVLxyUuhQecktYc9xBGx0c3DJmrREW8Nti9jKQlsgCzqe3
	 t0TS0Hx1rWvWmgfSjF5oi7ypfthpxGZCGVuzJsee8z2YZJMewW5rT4/lDcZ8Zabtew
	 aErUxSfOPW62w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4xmj4jltz4wbr;
	Mon, 18 Aug 2025 12:41:25 +1000 (AEST)
Date: Mon, 18 Aug 2025 12:41:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20250818124124.5b978e64@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SkvU42YCu9jiRIKc7gQxG05";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SkvU42YCu9jiRIKc7gQxG05
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/iio/adxl345.rst:161: ERROR: Unexpected indentation. [docutils]

Introduced by commit

  fdcb9cb9178a ("docs: iio: add documentation for adxl345 driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/SkvU42YCu9jiRIKc7gQxG05
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiiktQACgkQAVBC80lX
0GzL8wf/WRGcGuhWBBIeKf3QsMO/X8K4mFT7wHQB5PH7KjzDT4NOKYSwy6N9UlFu
j8LD3cnLLawrfMcxXgWpPHTIpZKFKMncJ6yoPhpI7rkNV8d/g4wyHxEe5/c+jU92
dgjq5KUKKnS4sSQRpQfUbxhvHxpIF+lbr9Lb6Be5xybhXa34NaX+tQEhlgieNAx1
x5kfx1WUFksP2uML6gQiSPnRnV6WJw/5azZOo+iuguVbS/wW1hntGg4CPL9poO6t
7h9UKzzXVu//t9Vh1p3bUJpK28aDttRq/iVoIwWRLEJYKPKTNEoI2TSAnrnQG+Cl
uqmpCTRfRi8Q+yCuPAQjFwmnONPOlg==
=0Xsr
-----END PGP SIGNATURE-----

--Sig_/SkvU42YCu9jiRIKc7gQxG05--

