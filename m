Return-Path: <linux-next+bounces-6056-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C78A7441F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 07:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C34189B9BA
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 06:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438781898FB;
	Fri, 28 Mar 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qNtDTwoo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9528373;
	Fri, 28 Mar 2025 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144422; cv=none; b=rH2wesNJ1RRcsgUOwKS80yctXaFy2P5GMGTA0WCRHrculF2deXBKfJbu6O3mLMLh7PN8g/4LKMHKJ1moJgE6vULHZRH/RNdn3buED5CwLA6tLAOGQtN5L8hZgp33Fjk1DgvWxn5KJXB4fzVhmUP3FrtmPjGG8u3/DPWT2r11MTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144422; c=relaxed/simple;
	bh=OKR+lC5VJRVqCMVJoDGeDWGZtabsFBTTKPUGjfyXcz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dnggRjElI96ISQbYKlqU0q7eK705pk4iEe5pMQ6mzf1QTT6WCu2tg8BeRLGaPtY1FfcXk4R7mEqI153ivx+cccJvG1IVO2zVvcAzMGeT1MWGFM05q9wUdJrzMpZpqpWA4dTv6WERcT6pch6P+qxkbiW7Hnwk9Mr+XWylJgIq83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qNtDTwoo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743144415;
	bh=VkGqOeM+Cy9eGR0P4x50E0Xk5FAKhBuvVhH5nrmgQnY=;
	h=Date:From:To:Cc:Subject:From;
	b=qNtDTwooxLqZIzf4t6XOqquiG12RAnqG+bYXoDUt9FoWsXAbtzmI7PqxxVPE06pLT
	 4p4uHd5cLQsus0B0z4enKViaQR10lvjcIWBXGyHCex9OVBVNFGSQF7+aeVIDkhumPO
	 W/7YnZITYbi/24+apPCQzavY3/sDWOflEonaEZ6jWKOMqN+qS5MbPysxFeZRBoU3wh
	 ejE6EKQyVNumg8KoPBWEULZlX1Z2g3K8N7qxyjnBf+XMzKYY81tu7qxINXJcPfPNOP
	 vdZlvbRU0iheo12XOAh+R2/q9BQG+4Va9QfdO+V5QU6h1N0WKFZTZIWhSwdC+Tt5ff
	 8L2OKmEHDg6+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZP9zz2tPfz4wcZ;
	Fri, 28 Mar 2025 17:46:55 +1100 (AEDT)
Date: Fri, 28 Mar 2025 17:46:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250328174654.06495cf9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YZ5vVGqywSakGg=/C8GacBC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YZ5vVGqywSakGg=/C8GacBC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

lib/sort.c:222: warning: expecting prototype for sort_r(). Prototype was fo=
r __sort_r() instead
lib/sort.c:1: warning: no structured comments found

Introduced by commit

  f79965d13aa1 ("lib/sort.c: add _nonatomic() variants with cond_resched()")

--=20
Cheers,
Stephen Rothwell

--Sig_/YZ5vVGqywSakGg=/C8GacBC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfmRd4ACgkQAVBC80lX
0GxM8gf8CRir7QeqMBhuNGly2sqJBvchj0mpZVVWiMF6RdrEskALGGMdfTB4tMI+
RiG0V+2tPdJGaSwJfc4zSC5wfgt1+UjiQdmCIOwfXi2iu9GkBe5iaG8vfSSI7Phy
UJo7s9x1PL7zQASszYiKA8YwHY9b3Nna7WqvaSrPsdEB6r1hbk+LRKjdtRPB8Ay+
iO4co6v7Kh/Z7sGzHbpR1Fqv9wSJz+Ioa9qwpEb3tcoJMUcDgo8WRXzIWADsU3ht
Z8JJQrDGv+7wKXjCRDawS0o86CKDu38KuhM4klifBvdQuDmjitDS6gEXpI0KlAJl
Kz/yrWMZfzIvJC8TsJvVdMexLCWeGQ==
=t7ay
-----END PGP SIGNATURE-----

--Sig_/YZ5vVGqywSakGg=/C8GacBC--

