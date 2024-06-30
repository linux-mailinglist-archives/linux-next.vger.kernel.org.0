Return-Path: <linux-next+bounces-2728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A11891D4C3
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5E21C203D5
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B801A4CB23;
	Sun, 30 Jun 2024 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nfrMT7Ez"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CF3C092;
	Sun, 30 Jun 2024 23:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719790114; cv=none; b=GqKg3vFVNrw/Nzg5IpNkCoane6QiJHft7lW6QWpetEf+fp5V7+D6WujnEYbQkVGce8IUtCnDCAogiFYdC+xTIdUFIwIHXNNj8814xdJOV7QS20XUmpmRibnPWXYq6pSVIn54c/rfda5RL4Gp4u1ZN6ATtKgBwy8+4fw3CnrWcLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719790114; c=relaxed/simple;
	bh=xiL0Z9gYeXxr6f+vvzhv/fgsT3tMs1U9+TdGNoKmwXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rVEaWT7LZ0ECAx2IfK2A/aOJp22MILTUt/5LdgdR1+UNrcK3eF7DIZRkG1L5iJ780mfsR0UnUGSiM5pzmfz6pFIAfmQVdNcZ9HlAB3e3Qu7Y3+QeOSyPNSwdCCFHNofwhLCmwiSsBb4BO2ysTJyf7thhbOsR535+TuMvzDmAQFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nfrMT7Ez; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719790110;
	bh=RbKLW0+5Y1Fc5nQkF8dWE+xZuNznlxsgDOoT94+FXr4=;
	h=Date:From:To:Cc:Subject:From;
	b=nfrMT7EzFgOQTlAegFlP+84FYUO++Ge6KY1sDLnvy7dt/VK5ti3W05lxTk9Mt2qjv
	 UR2g5+K5E+UN7Qkh7RUK6hjdPfu5RdjEyPo7/sFtyIT0ONfrr0uMhMnquj2n7CQJi7
	 FMDxPH7yjPp2b8aSKT6PEKLSBbizCW17pl0bW09dxBNW3JWITbKLikPSfe20r2l9eP
	 N3CKnyN+FyNixFOjoR1B80CD6n9DeAKbDO4F4WNpfI7dUuGOxW4KcCq8msh9z5MlER
	 bx/yIy6CWlgpTCb7vcswYpgLcC1sCDKwTrYgR/MRsPBdFL5PAw2HfujhV89SXox1xe
	 aOZNIgAk7k/3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC52j6bScz4w2Q;
	Mon,  1 Jul 2024 09:28:28 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:28:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20240701092827.7a4034f0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ae6p6bsEBlgEhRPweKFjZp4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ae6p6bsEBlgEhRPweKFjZp4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d9c2332199d0 ("bdev: make blockdev_mnt static")

Fixes tag

  Fixes: 8f3a608827d1 ("bdev: open block device as files")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f3a608827d1f ("bdev: open block device as files")

This commit also has a strange commit message tag "jpg: Remove closes
bugzilla link".

--=20
Cheers,
Stephen Rothwell

--Sig_/Ae6p6bsEBlgEhRPweKFjZp4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB6hwACgkQAVBC80lX
0GyRFwf+OSBNM7R5W7fvTFTWWMRedZpVFuP+nLVk81kcUTmfJJpu7dLAdpyCOjVQ
2u35vriFDBNLRfYT1/2TqVOTM28PWba0uZBzh+ucirg+jeBOVsBRDCKq0Vem+MVt
uECS5g2x/F7ae9FB0ZZS9pZD8sQnGmyu+QxkzQ/pJ2bJ40uRLdlc/pq1EN5+ugem
e4Wphc2KcM6C4B8+t9Ub2FX22f3CHcEnCODPl4TwjgDPDdpASzyS6wVHtUZxbahW
woIZNK5LghSBZGvMhYcTgRLStD0cux3X6x/+ImcwK/nl/X8z1yidI+WnmTRAo3n8
oxy4Ul7C85Uyfupz1HCOjTi2ERhH4w==
=Ugdx
-----END PGP SIGNATURE-----

--Sig_/Ae6p6bsEBlgEhRPweKFjZp4--

