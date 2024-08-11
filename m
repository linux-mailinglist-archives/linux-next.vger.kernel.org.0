Return-Path: <linux-next+bounces-3276-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2594E345
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 23:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A69F0282091
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 21:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050BA15886D;
	Sun, 11 Aug 2024 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oJs9UitY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F19D15C153;
	Sun, 11 Aug 2024 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723410908; cv=none; b=Va+SETlhcvyKmXvVbk+tefo5KdltGEzQk20KG7Zup68Jqzbbp5RX8epPpghNi5WGLIlO4ZXQ0L8ft1kN5jRpLjjL0BkaEArXSICTWcCJ8jNp6wb1bpyc9jT7mG08m0gIN0a4rksiy5fai1LDWF/TiiLRNRZk7skRrB+HzeWA5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723410908; c=relaxed/simple;
	bh=2dlFky7S3YCpupZUZTMYCi7755AgmLSHmrZ0YWMSuxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C9pGlEHgnKB/O17YqGZP5yJEW2qYDVCbsI39MiYctn+WDexoelwd+SKq1azq09qvfkxzm1ZoO4AaVqfJs3iGQu2A5vsfZIVCjwPmMZ0hHmhChtM4OUOx7rO4sBn3xIMdD9l3jE/yDqyMAm0YO/IPQ3pRBDivucJM7/4BnouS+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oJs9UitY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723410900;
	bh=2dlFky7S3YCpupZUZTMYCi7755AgmLSHmrZ0YWMSuxg=;
	h=Date:From:To:Cc:Subject:From;
	b=oJs9UitYN2sR9rr95FQbgP8q9etmTVpI89aj4c+EEnM/bHpzg2EYRpt+AB0K6R/zd
	 ZJb30CIMlRxKuWolr42K++St7GVsANn+n0SaXCD6ygVu+Ubf5esaalOI1azmoAIsGo
	 irNCtQ5Np02JLWMMM6sKJJ0CSAA++2kYididGVOvxKIo38Opc7kfGucWw8KCJvpdKH
	 wLvr0QE+AZRmrnvRH/qSA5+lYWs8BmqBoCpWTTSJ6+Sn0EZnXqyJ4Ck7P74KPOpHBf
	 FZeHh+txJ4nu6/9iE2knOG3Q7brKLavj5NwflpXjdkaZCrGSnydIV3b39MGs1CgwZ3
	 5cGokVON4PncA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Whr5J3YZdz4x8P;
	Mon, 12 Aug 2024 07:15:00 +1000 (AEST)
Date: Mon, 12 Aug 2024 07:14:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: fetch warning for the bcachefs tree
Message-ID: <20240812071459.7e4bfcdb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s1Q_Y7j9JAbuuzXwa3ULVHB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s1Q_Y7j9JAbuuzXwa3ULVHB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the bcachefs tree produced this warning:

remote: warning: unable to access '/root/.config/git/attributes': Permissio=
n denied

--=20
Cheers,
Stephen Rothwell

--Sig_/s1Q_Y7j9JAbuuzXwa3ULVHB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5KdMACgkQAVBC80lX
0GwuBQf/f4J75/B6xisfxhjf6fJePSfrVIATMsCOkjm7pagHDbBqTCjNSTN56zki
SJx8n8HK1853mzTZifgCCCv7jwqYPPZcv1Sdf0pJCejPE00ImClOvpIyRnxv88rD
sAgVfBQs/njlzgJuh5qSqlt1AJIuboPPZK04NdyF1zwIcRfJaVQYiWGRLK0hede0
zdls18ra6wV4CT7DFA4T5UVr/WWQ8wCFQevsZNN/A5mcQQFvJgjKERF+gytfvJD4
bDwv+9euVcGFo4GbA4GXSjQqn9JRBskutrmZdaDm42mz/GKgDff1tMI1Jlp2/iR9
Ei+wftIcjj6yvoVjXcvtyeEfg3X+qQ==
=kZ1H
-----END PGP SIGNATURE-----

--Sig_/s1Q_Y7j9JAbuuzXwa3ULVHB--

