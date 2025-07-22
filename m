Return-Path: <linux-next+bounces-7697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC483B0E74C
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4443B0E36
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 23:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCAF280338;
	Tue, 22 Jul 2025 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s6jcfCpU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E6E555;
	Tue, 22 Jul 2025 23:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753227972; cv=none; b=JITkPhrXoFmhfFN6mxrN9oLCXRzF88D1BUHwBMDDH+ps0Mj+RpSMM2BJtc4A/zbd34aAc0rTy/H2+arqfS5HVOBmIgp/5liWjHxQ3EBuUpWc4tBQ6lGchC7uJMynDV0Tp5WHIrY3CV9oyhwLomGb4m/8QGeS9VyvZVIUQ5H/4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753227972; c=relaxed/simple;
	bh=jcXrRP5I6TzRxlrs7fYkLBzLeKyEl/9AhZdKRjISDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RNTksiyV2ewG//AJzKZcPQrkNbmxW+WcSUyR4uTIQSbF1P5yGZLcZBJNdJ4qTPGEzgSKbhKw9zCLOQyYYFLiZFq28DR3Uwd9dAvfHbgTMG5/Ndy/pfBYMBfvEUcSPgB0q+a7tt5b2S6o/UC02LzTL/7lCO15Hxegtl2qgo1m340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s6jcfCpU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753227796;
	bh=RcSuioHgqQvCMYpuNH5o7E0rW1clnpzbAkq57g8dlHs=;
	h=Date:From:To:Cc:Subject:From;
	b=s6jcfCpUsBKTqHO4zuns4rOE2gE/EkPJ8Ps6wEQv9hscbZ3IIDlBwvgKI+un0wnoV
	 uOSCfKFFESl1RX2g8YkPFxKhkHjimIvdo9d7cM8SIETPnOGvpoGkR0PFeUEtGaJ8hv
	 55BfZn1Y/jSvHqpWMngX+kSVCHjJ2wQiaRK7QNQDdpWtA//ERPuetFrI4R0z1NYlCY
	 vllbD/v/JQ/kXYyaSiIWz6JVkm2JpIvgoeEiP9Cw6RMB+fq+kqclUKqS3Lq8rBHcWU
	 J6xntTfbpeA/b12ITSVaio+ovyqyn0ANtzna86MYREbG4cjNqUb1zQrALkJ0crok8C
	 nmC9imENwZU/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmv372pPKz4wbY;
	Wed, 23 Jul 2025 09:43:15 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:45:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fsl tree
Message-ID: <20250723094558.5bcfca69@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WJAG2PuqecvQ03WJeBM4B/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WJAG2PuqecvQ03WJeBM4B/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

This is commit

  12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WJAG2PuqecvQ03WJeBM4B/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAIrYACgkQAVBC80lX
0Gz8tAgAm64hSR4znmbazwp3rKdkOF6D+jSnwMdhch4uF3Uqf1MXN+YdkAaa7hOj
tuHgKe6uZ+olwXIP+dK7ZStD9GFcLCZ0hNc4Y3PZQJduvMJKtffSlwAqKBLVsDuQ
UuwqdTE09kHoCYebJR2eHiO0PI2gBOhY1OSOH/jFl+Kj7UlLzqNrGT4Lt1RU8sqX
6A+rVmFkHFaESbLP0oXC5u/zzifIXM5weeaXmHWEK8uyeB8WuloY9CWMcJGLhgbC
QkGC/CIK2422WnGG/9ORThsbENFwCUBhbJGuYGMnbTyMIw7XQWW035egC7XXt5BP
y8GiSa2aQanEXYgK4QHxdLdpwZczLw==
=SgVy
-----END PGP SIGNATURE-----

--Sig_/WJAG2PuqecvQ03WJeBM4B/8--

