Return-Path: <linux-next+bounces-5363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD79A26A87
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2025 04:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A9C165374
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2025 03:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF0152532;
	Tue,  4 Feb 2025 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p5xCNtIF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227B14B95A;
	Tue,  4 Feb 2025 03:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638753; cv=none; b=TP+UpqPCvRoRccwVc7D946/Hx2epncyj5t1FmqJGjo2YawAS56Kn6RIkSk67Mhgwl5nj44gBst9JA1DnSnpRSkwDR1H2MDfmVk9dWF3xMj/9l4AtL0xfioNS4PsrufAI0KgjNZiXFGG4BVF7QdvFYp04TwrdW3RUDDXsIL2BvIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638753; c=relaxed/simple;
	bh=bWBGMgRAKuAdlhYCISUKx1XSHPekvH7x2cnwoU7eEc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HawNOX3POUfQXxqsLjCkXwOtB9R0vyv2LQBOxtev5EsA0VbHyEfGIVCPWlkrdptHrfHeajrx3swe6xXkg+kb+D6UzquzDxa7LyAPpVj1W9f3pKoZ8d5SVEMoKPaio6F9Ww4hQD4p3oMhkq1QKrcddcfkgZs0X/03kLULPSkp2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p5xCNtIF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738638728;
	bh=1trQlRTLNp9wjO32EPhFJy7KEWRyXy/NFF1VhEJA4xU=;
	h=Date:From:To:Cc:Subject:From;
	b=p5xCNtIFIfftO4JRvMirl9BJcsyiBZEtcOjqRXigDWzKVG+WsdkVWpY3bzW7GjjZF
	 pYEEYP5EwZOJTV27BHkac5eEluQjTouV6jQVzu/fkDzCbfWnZJezeTYLNRkpCapLEi
	 v1c5HEn40dofG8W505XSkwHTU8j/t0ERLJw9uotOWFuMNDH5ezQAbfFKovttmnqdK8
	 +GBD459pW+pysIxmGFR9hmwtyiOHR8KviCsbfuknc+90vmjSfYuJA1+FWyKMLbQbdK
	 9cXQQnu3yskRIlmDWAGzY6aE4Xs1V8wmrPkx/XtleD/g8qGsA8eNUYpDrWcpAjeYE4
	 mHXLs/LUdPgWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yn7h80Fttz4wnp;
	Tue,  4 Feb 2025 14:12:07 +1100 (AEDT)
Date: Tue, 4 Feb 2025 14:12:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20250204141216.4a2635ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oBg.k1p7sHw4K.se6nIYKfV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oBg.k1p7sHw4K.se6nIYKfV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/bcachefs/SubmittingPatches.rst: WARNING: document=
 isn't included in any toctree

Introduced by commit

  444c005babe3 ("bcachefs docs: SubmittingPatches.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/oBg.k1p7sHw4K.se6nIYKfV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmehhZAACgkQAVBC80lX
0GyaQAgAhYEx0CyS9n0bSrLZbUvzcjWLNczHHUQnnl+WmLL+OjShYLBEQCQ1vMxg
DFy0wTQOb2feZ4cwKH9cPZC/B34nsRsG7WeIze2NZfvxfjhXVqq4scoMTj0zfVFG
F7Q1vnOgrJ+W46noZ1sRpkhTh+dX69InXZNlo9ukmt1pZoZVyryDzM6XC1dzFVZt
cLKItMAoWjkrr89RWqQ40MEogc52eAIsSlQ8KwvnoPTs17sWGgArSidXYPh9grz0
ldbdYncfnxieAkstk6Mo6ERA/mK+IRIak7hsFc9l4zOmWjoFAtj6qbkvs4ZQ8bmp
bBi/jXuW3zoGlPcUhUL4LGKvwU876Q==
=G1ru
-----END PGP SIGNATURE-----

--Sig_/oBg.k1p7sHw4K.se6nIYKfV--

