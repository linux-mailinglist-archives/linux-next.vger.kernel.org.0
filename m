Return-Path: <linux-next+bounces-4317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9B9A1D79
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 10:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 830A21F27AA0
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A213514E2FD;
	Thu, 17 Oct 2024 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D2DOIa9h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF61D416E;
	Thu, 17 Oct 2024 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154648; cv=none; b=fptT1rauB2Jyr8qp0vSUOvGTCqg4xLwyp49n2Iy1BzRSWQyoMc21rmfGnmi+Oc9QpRdRdpTMsJaQDKSRIMO0fTuRWeuJ/fiGTnVrT1L7SHAzcwdfWiXht149nG6DKj1njSGbmKwiMmvwUPZcSvtqlhBH3ncYXdopORDz5ppDjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154648; c=relaxed/simple;
	bh=KJ+uKz7hiruQG6oPxtLuE/H+TdtGCVX7EL2n18iLCqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LtE5IQ/qgVz2DF5VQFtm1MxghPErzNre609djZgXcKzxgxnxMQB9btoWf3owvt+aXjfUHIcCyUatuhczLAQZa9x7d7Ylc1QFJzq+Njj4X6+OsjNR3WZkf8BqN1b1+mNnCBAQ3MN3FhSMKAQo6JiBILfbCQAVetgmXeft6+c4lNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D2DOIa9h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729154639;
	bh=r5FVlLhQwRv2SNxi+j3A3LBRsD97d7qLUp0YYhGt7vw=;
	h=Date:From:To:Cc:Subject:From;
	b=D2DOIa9hqQ/EEEg1neEL5tsUoWiLqYxGU9nuwL/+tJnz0yUUh7vwXJHCRazX9QAp7
	 4wN8auZ1hqsVKehu8R54aEQRnaRZvE8KmhLLYnFuLK1FPpigNKjnVrbdtZhgXPw/+Z
	 9nhQAGLr9A10fChNlnP8/DG/hvkrW0loCgO7WQTGDzPrQ/YitAY3vbMcy/OXZq2wAR
	 41DJH5F+D9pGZh80eBg/Br8dI4T9IIQRiQLUCpr/Z1x4uUcgXKmEgPRRAUg1Qxnr2r
	 jkUPRwzQB4bbEbn9TZnnqljhccRQgtOp7XOhyU+DFJXNPWwQrMsiwcx2WV075rIJA5
	 kK+a8CVl0mCRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XThFq0gx6z4wcL;
	Thu, 17 Oct 2024 19:43:58 +1100 (AEDT)
Date: Thu, 17 Oct 2024 19:43:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20241017194358.4e670183@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OioVi787eFYJPe1uscPK0a0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OioVi787eFYJPe1uscPK0a0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/translations/zh_TW/dev-tools/kasan.rst:410: ERROR: Unexpected=
 indentation.

Introduced by commit

  e9e8f3f3eafd ("kasan: delete CONFIG_KASAN_MODULE_TEST")

--=20
Cheers,
Stephen Rothwell

--Sig_/OioVi787eFYJPe1uscPK0a0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcQzk4ACgkQAVBC80lX
0GyoywgAhmGFbkHHgS+HSApBKpGU9luwtxjEt0ThD2DjpFexiV5wEbBJQ8xeFdkR
AuhuCp0JfluTGBOaRSke7Zanaor5x3Hd9JbT7thIV+FdRYsgveeanGVa0h5biSHr
twforbYCBfZz7BY9OB2kYjB3itAgZl0UUfb0AvO92Ce8YdEqKZSCQfT1thUAc6Gy
/YlhuKKsE2JE5Wbj//YPvgJNijXmeygyeKhK1lojcunLrhNbM6GZKvZbpXP8HMA7
PPlnfhuEG3heOvNEyKy8KBZG5ZqhYpLRFdbIeeNaXlHLLMrlAAgTJ1zilwp30zvf
v/qTbAABTSfY6WwNYnMMm5cJXIpjyQ==
=8YYx
-----END PGP SIGNATURE-----

--Sig_/OioVi787eFYJPe1uscPK0a0--

