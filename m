Return-Path: <linux-next+bounces-2476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6508FDCCF
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 04:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F1942825EF
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 02:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAC218638;
	Thu,  6 Jun 2024 02:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="URoURIvQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B1179A7;
	Thu,  6 Jun 2024 02:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717641304; cv=none; b=XqFHy1ZVFr/V70gv4cDpqbGrXqCE+fKPNLnn6jJAnGLrfEAXTtboDZWqXRMs8oAfE7+/KZbzN/vYFLB/2wPul3tQ6lZkePlQ4uRxgLhP345GOJCT14vwtlN1T3H7lD46VFjVx8EZMqv0Kvv2PzKQbhesEcy5bP4eqvwtQSYkPF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717641304; c=relaxed/simple;
	bh=y7WNMKH1TghW1c2cFiLkX9FG5HRdxMYw3D4JfUDZCVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KYcW/FoSkwAUUyn5izLeD6VDMVuIamXDNXAhZ9Rxj22ZG2EYzRDveB/+w2AIDQ4pmEZzbl6PDk8VYnZFnNkdLQ1SbTYhaefG5bWYuIXVkN+6mTfAnArFinTmej6q8B1IQUluS+0NYKvXH+X/xwRs7VFmdsa80QoP3NUaqlmr6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=URoURIvQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717641300;
	bh=zSIVS0IoWqE7ioFrDQxLmG5mx5liyW0YWn0XhaIWeog=;
	h=Date:From:To:Cc:Subject:From;
	b=URoURIvQVLT/Cmh7jJQIpqER2KK5MyFOye3ujgxiGUoLsGokh5bFNcjyMioZb0t42
	 ereaT+2hHV0Qeslv+0ZCXFGHGuq3QcvM0L55PdmMCd5NsOLHv8Ny1cpgj75csU/uHy
	 fWlEByC9+5MWaiz/inaFfRKfYDU80QKESN9T9oeIUK9dTUbDGBdjW8B5SLGuskgLBe
	 l/F5jdQBX+m8OgTtYrZ5G1WQbPqJo6SJ5/EU1hMTlRTetRIsKNdtfMxhGhc5jiTQOy
	 ykDj5e5hN+nRe5evs5y9TI4t1JKdNUJD9+2OhTv4q+0niCP7EjQPB7hh7a3c5hSGG3
	 h7/dKnq3sI6kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvpMR5FYpz4wc4;
	Thu,  6 Jun 2024 12:34:59 +1000 (AEST)
Date: Thu, 6 Jun 2024 12:34:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the char-misc tree
Message-ID: <20240606123458.3cf18e4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sgvLgFkW/vZ3+lIL95.uSwn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sgvLgFkW/vZ3+lIL95.uSwn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  5a71c0d1180e ("dyndbg: add missing MODULE_DESCRIPTION() macro")

This is commit

  62112a466412 ("dyndbg: add missing MODULE_DESCRIPTION() macro")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sgvLgFkW/vZ3+lIL95.uSwn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZhIFIACgkQAVBC80lX
0Gxrdwf/eSvtDuo4S+MnNPecY0buhrQfFcIoA1oYQSigpMDGSJf/E2UyYcgphjq6
NxXw/4o8nDDa6q8ONm/nopEJf1J/pGwttyfF9gz6ksGlBwu/dVcTJPsOGbr0OPWu
NElT4TJsC90QVLU9wcr4iCojqo/YvysPstJ6ojkbkuw0qVrtw0CZyMIe7UQTGuBw
/luVWHm81McMdXEYWz350IqJimk5+zjGl/wmNyz14oJAnqKC/TWCF7/CGz56hjnB
xzOQWg0XL7FK07RY+WrwKEgy9ybAuwJgNXPy1KDnaB44uN8oUQctmWBEt/nuLmVX
3V3Ywc/oNFz9/rataTcGIPgH7wuIFA==
=L92u
-----END PGP SIGNATURE-----

--Sig_/sgvLgFkW/vZ3+lIL95.uSwn--

