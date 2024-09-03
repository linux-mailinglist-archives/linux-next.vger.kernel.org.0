Return-Path: <linux-next+bounces-3559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC996933F
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 07:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37826284B89
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 05:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44661CDFA3;
	Tue,  3 Sep 2024 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lUMyK5TH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFC13D52F;
	Tue,  3 Sep 2024 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725341860; cv=none; b=RfURLrkHN0xuJsjXjytseEKbYqa463A9tm6M0zrHP/8YS9HsDmAtFW+OBQ2GdgyStMcpYqKqmVThRCW7Nzr9hXGonuG3mORYCQjv8zY09xgqtuYt7zVLMK5nbQQpZZO8RfbmzheMw9aEhDRP7H05oOYlAPli3acNCfv/cND8RQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725341860; c=relaxed/simple;
	bh=P2iHOtKOBUTzQuLn3Nne9X7Yu2QHMlj6NxK3m+haLvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FhImGH8uBPxyge0qrL9SCcVow3OaXw3krVMMRgtR3YZZpipq0cv33/ITuk5tiRQol2X6Y7HekV6+w05mg4DKLKKFN8WGEJqgskZZwEJTd+UMr8RboPFer7TLb+oiKpkXJtt4k1AQvm2SkWNBO1Z/90gZYfRlxcBPiabkInrHFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lUMyK5TH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725341852;
	bh=qJ84AxWHTLQXsOMA7QcTO222yCNho0UAOtRpe8z7+p4=;
	h=Date:From:To:Cc:Subject:From;
	b=lUMyK5THDhHPBxfnbkbYYPESMOaKDGXXQrsYbgYvPPAldfAX0i1m7/JwkclUaMi7B
	 3jLQ/jLyDpoOJjMTxjczbEVRuznG3YVpaQAKWJ1KPtn6S2WJv57iaituJuAG7NNAJ9
	 8g5ZHp4GXOyst2QEv0gWIFKTPelAoddvoeMCH+3FYqCmbfQBbIWXIcYvRtJdg8PKu/
	 IJeZ/n+FjVc4IBUGT6mRrTPRGyjC/U1rvyMsU49d1qMaoX2EL9+qCdyREd4P1q4FlE
	 eLDKcZh4e49lZxz7KZx2JNsoeL1QxULvysXFqLfBU5iuZCP0q16ahadA5KtzvzoiJM
	 ESRxMgwRSTYpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WyZC042hdz4wcl;
	Tue,  3 Sep 2024 15:37:32 +1000 (AEST)
Date: Tue, 3 Sep 2024 15:37:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240903153732.37d6b860@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VkYQo//782u00zBSH1w3Dti";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VkYQo//782u00zBSH1w3Dti
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/blockdev/zram.rst:312: WARNING: Title underline t=
oo short.

10) Deactivate
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  621a80e3b921 ("Documentation/zram: add documentation for algorithm parame=
ters")

--=20
Cheers,
Stephen Rothwell

--Sig_/VkYQo//782u00zBSH1w3Dti
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWoJwACgkQAVBC80lX
0Gw4bQf7BCD3ztgvSRKNlwHtPTTz0aB866F1vBfJToCp7d37mfhT5Qh53bdb97Fa
Wu1f5a8v3oqdQ8TqqUupIw6BpfBI9jj9ROZQGjh+F1tVZGyQqZ8LL5eqCzVYK9dK
3Hh6BxM3dBJTFPpc9tROHpjOymMKmLyL9OvVh79/YxWWu34Km0iFAaQ3qljoa/bt
iDHl16tHn8Qv/KqV7MMzz71S/zqwO3WTUsLRvTFrSiTXV7Qq4rOtuTEU2WyJ3ZrG
fTTmkFz3ZF48AIrR5UFsnSLncGrNir5crehNVG74Mn95Keh/hraAVQBkL+PMGI8K
7p7mi0jh06ejt2VbWAK3eqqb6IacBw==
=UlME
-----END PGP SIGNATURE-----

--Sig_/VkYQo//782u00zBSH1w3Dti--

