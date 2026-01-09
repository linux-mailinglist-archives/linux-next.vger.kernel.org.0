Return-Path: <linux-next+bounces-9595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D377AD06E5D
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 03:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9C9B3019B6E
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 02:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BECF31A7EA;
	Fri,  9 Jan 2026 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WfEQ2BkR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44277260565;
	Fri,  9 Jan 2026 02:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767927462; cv=none; b=kEYQ42lgokrlz1bbw8yH3SUnwdXN7WSHndZWnKwQ3Ey6qZ+23d0gghybCzGNHq5N26GHJrrCeKOdPndRkuGJwUngpLgZKM+shziyra3vzuUESbIqO2oGH8SftD57tKNxRE5KjUueixWXRAZPbm+CzYDmU+wQJRSRrym3/iwcVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767927462; c=relaxed/simple;
	bh=Mx01McnVvKgw66Ea4l5kVeaklvE6g15XDO4yi7e9Zlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pbcd6omaQUwIcRYLWkWTwxlmvsDUjO0sPkA8uNk+FJV1HXtc3R6hodwqazUbDXxw5lliZHOOJ4zzavN/osTeNKYky0hkB/n9rmF0gI+5cjfhHdQrPrjxgPtal0wPg+s+IfIX6W5vS26Q5Xn0tAB6bgv8SfM5QDAhimbF6psh5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WfEQ2BkR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767927458;
	bh=xEO3TeyWLzW7DrY/ibN5HZzbOcMsLaLZetGE+jiN5Sg=;
	h=Date:From:To:Cc:Subject:From;
	b=WfEQ2BkRO49iI+pFsCmlPUeJVBQ/yqW0x1tudc0KquIzgRNxypttTKjYM41uEVc5h
	 QaRNzz7kIwfqVLQuM8kxk906VSm+T1WaYL6cSB6ci5uSGcdn8T5WdLMBaomxPwHWvK
	 HLjiKsx78YA+lklAFpQyyglC3kjCsVcrdBwDQl6Aq836Qt09IUpNGowMH5Y/rr1oNF
	 Av8HAMOwn95Y6z4Q3nF+q1uF87wbJQF/x/W2K+zNmYWMjQLKU9o8T3IXnSxq6IwBKS
	 1EFGfW9yh3modt7WGLURQdAFefH/y+LrgrukB6bxgF92IGvP7o4QoTfaTuALJNDx4D
	 nceICbzBCJsrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnRJy3c8Jz4wMG;
	Fri, 09 Jan 2026 13:57:38 +1100 (AEDT)
Date: Fri, 9 Jan 2026 13:57:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kspp tree
Message-ID: <20260109135737.4e702041@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nhbTQ0eDgDiXoKzm06GKda8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nhbTQ0eDgDiXoKzm06GKda8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: include/linux/slab.h:1031 function parameter 'GFP' not described i=
n 'kmalloc_objs'

Introduced by commit

  275cca4fa7da ("slab: Introduce kmalloc_obj() and family")

--=20
Cheers,
Stephen Rothwell

--Sig_/nhbTQ0eDgDiXoKzm06GKda8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgbqIACgkQAVBC80lX
0Gzv5wf+J+uFptm1NW0m9yfcvDAeAdzqxCfO9maONZ9qkAA15ua6Sga+KpYheOu9
JAgJcvIpHW5eJXHGspmw/n3gYc0QuKbAlkwlXGRwuKGH+2wHu5MzpTwXIxzdYTL2
2BHklrMkbHpkYSZvjoI63MJUlbFvctNEcgcn1i9JQp3j7wVjV9RR4HiuHxir+eBi
ZIBlGtYB3BCF8fN0FNkNvNmLWssi/kALXd5pfcfliP2S6b/n6OLqmJff+F7bjVJt
D47+yeifPBsU/fMTJDfUS4CLbPHRLAMqzN6lObCTkrsqwfFfgC9UcNkUBmC8lxcB
MbR5RIiHQ3jeuW6KDNq46yNCakyboA==
=qkZ6
-----END PGP SIGNATURE-----

--Sig_/nhbTQ0eDgDiXoKzm06GKda8--

