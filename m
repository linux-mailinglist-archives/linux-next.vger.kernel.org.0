Return-Path: <linux-next+bounces-5163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C1A0AD34
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 02:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A58188555F
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 01:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3472C3A1B6;
	Mon, 13 Jan 2025 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZGjFb8tS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073512EAE6;
	Mon, 13 Jan 2025 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736733147; cv=none; b=J/A+jJ+79rUyZEW95LaYKEIS+3xd2nHjukdbrceCLDyHH7jA3wNUIBR4Nex9VZef3j3BoBh8p09j7V3kR7JDTzeNWrZ4y3wJGkKqJuDbclLN1XfrjSts7EnsukTqwe8pZa3t+GDUeMXqXusyCsHw/TAnhY4rzj4uvaKB9EZiRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736733147; c=relaxed/simple;
	bh=bnv0R/WAemvRPpgEEFWu8QH7irOaGM5Oe5Kuti5x0Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ne+Tc7OFkY9CcZ9NoTP1Wx+BHS2BMAOMGxdjsdbI8nQPZRyEqvzHhUgv9ZQ+s8ZArGc4iaNjcPNbSe3VYNGBj/jAT7ioMCUfIwuAiak1gZivYogD1JM+eK+8/jILn2aXKmbZHzAyXtRUoNf/qDAJkVXrghb9RIVEVov47aoNE/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZGjFb8tS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736733132;
	bh=lodxSqV28S/ay/+Deuyigy53IxS+/cTc3p72f2T4tmU=;
	h=Date:From:To:Cc:Subject:From;
	b=ZGjFb8tS+q06Z0VHELqOAou2FM4xZMg0L0Bp+4Hu9gK+Sd0Q831FdH+k0PkTe+hom
	 NYs1AG7C5EROtXPW2eJ7Wp17Q03hVSVm5/V85jFw9rvZZEqRX2+WT3iGDRPdSKUPJy
	 sWCBBtpbjrrje9Az33y8tBoD6rSYZxz6YZi2s7URruE3T6RrAtRiiGd4adN+0/nIpd
	 p+wfi4AnawLr1DDXOxP+VwDl1LALqRoIfmuhYmJSdchXv1pj6s63O7uoDZdurAePZU
	 7M44Hd397Wo5KEsaBjaNB54MDtGKYsPkjdFO/3KEiVcSWQC3PAKgQVvTzKqxrxafL/
	 kjBEfce4PXrKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWZy36b2Cz4wcs;
	Mon, 13 Jan 2025 12:52:11 +1100 (AEDT)
Date: Mon, 13 Jan 2025 12:51:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20250113125142.001f056b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J6wiZ8M60efcmDuY94T/IbG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J6wiZ8M60efcmDuY94T/IbG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by 'dr=
ivers/md/built-in.a'.  Stop.

Looks like a missed "git add".

Caused by commit

  7ad00dd67641 ("md: reintroduce md-linear")

I have used the block tree from next-20250110 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J6wiZ8M60efcmDuY94T/IbG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEca4ACgkQAVBC80lX
0GwLjgf7BreJ2il3pJiitKhNEJeVZ/VLHnBP1Pua9kdsqW1zTe6XBFIKStaN6HyJ
6qB1HLJn/hojCVN5oB8gCumXlkYBjX1ZLNGt/eUBh2BUL4MjXYVIaXCjSyHPnmzE
9uzcy2riyCAXXcCpyxcydlInJIfLloViUw8poZHa0++OqzSNKCtp+wIstVsQHWuR
mvSt24xXNVFLr2aoQZA9VzYoDcbrDarZRcozTuX/Js5pCPDACs0D5+0pa1V/s/3d
RQskIOGFvNnYTwk7eE2uon4AgVthWbeU6FFFsDNX2MfXZInbmkTPlFFWt+WZaxn+
H3Xkui1v7hmSQomW0EOMiU5b7VAUYQ==
=jVCh
-----END PGP SIGNATURE-----

--Sig_/J6wiZ8M60efcmDuY94T/IbG--

