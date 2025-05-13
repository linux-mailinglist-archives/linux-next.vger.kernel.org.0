Return-Path: <linux-next+bounces-6735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30758AB52F9
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 12:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AAFD9A6A27
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 10:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174DD23CEF8;
	Tue, 13 May 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kMkCYK9p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E770123C4E9;
	Tue, 13 May 2025 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132147; cv=none; b=kft9i/9Qw+9JWq1eR8Uphe0KhhiXkFmEDN81ga35f1xGaDetzGLe2Yt+7EAa7eC4AHtBncs5/CrLPOW6z4nnMQotcwVi/YafG9VyfR1vLvNHOZJEUvIUc6A/7qLgtegQJqUbcDy/wpA06/XiqiB49LZozj4o8Q56rDEl50LPwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132147; c=relaxed/simple;
	bh=Whpqw76GWD0TCZRwAHM+9XXdDchGzwMvP1s/SLMWWc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I4reg1i4yVws4YZW70Jl+yqwL0f5JcrEgp6o7E7olhpUXTI7XdBVOmGftULbsBqkdgjbAvOBI3EFLO/N8xvzC1w5e1Eo6R/8xXITGLq58vDOnzNSYNlniPVPayGCEgAQgoEj6PY/DWz4xLTDB1L5jzKl42sIeHudI7WmJWaHslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kMkCYK9p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747132139;
	bh=EbhkY8PhCgGNIawYBN1G+sNXIoc1IZNTK+xP9oFp1Xk=;
	h=Date:From:To:Cc:Subject:From;
	b=kMkCYK9ppAgMcYQXkBtnP0Kl1apPIgd/0PIsInlwakklmCMTZmPTGyk4x9Gpuwgyb
	 qTPrWkyq9p8nFHNJOPdGFscbJLR+s6vpY9+h35AOMks1ULUvVAdYyYyK5a4uu6ZHQX
	 i7qDjotE/rbo1ZzqZnrxhrrst7qP645xzuHegN4u6Tq7K7CL2xzk23Q2U3IXAUIXfW
	 +ppDwjLKfW2NZUelzSxE91DAz09GQ8tWehT8XzeVPOvBeoBXjBcPdgTYpY7XczKzfd
	 Vr/HMQP/Q/eyWVy4zU3EN0s8YCgZio+cd5L2gPpjC0IB0Mmq0IadO0BO44HWiS6otd
	 j7QPXR45HJVBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxXkz2cQqz4xQ0;
	Tue, 13 May 2025 20:28:59 +1000 (AEST)
Date: Tue, 13 May 2025 20:28:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250513202809.7e23ed2d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UyvRZZ+3eWJAk/nH2_YL=_N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any=
 toctree

Introduced by commit

  ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debug=
fs interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgjHrkACgkQAVBC80lX
0GxDjAf/YJ7nYC/NWAAMY07hMWZRfNhuioB/w/XVb/HqNISKb2ZRshUR2RMhQoEk
6Dil1SV4kjwB5kQ8m15ax+FvGd4h21CkBTiyGPq2x66RDfIV8nOgJxxHWXvx1M0l
CEVFdkfgHvo+XPfBHVaX6d2BWPjaUGZ0jnFUyU/hLUzRIkAETgj/f7ZnRjrwDi/Q
Wn08ScttL6VQme+hdJKCbvW881/z36ylEQuObgccd8odVZXXTEqGIn4r1nbuZU1n
tYklFLgFK+4/699BM6PLl7HpuCfIEmKImMIp3j8ASBp47OPW8LNOKfl40TOfnjHU
F51Jc8pm7pHJG1g6XVv8FFikhqHYWg==
=n+Gw
-----END PGP SIGNATURE-----

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N--

