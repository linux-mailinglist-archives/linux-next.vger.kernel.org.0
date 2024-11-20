Return-Path: <linux-next+bounces-4821-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137B9D3373
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 07:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8BA1F23C26
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 06:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667701581F0;
	Wed, 20 Nov 2024 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="APANFcbe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA21494A9;
	Wed, 20 Nov 2024 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732083190; cv=none; b=J/zQHfKL4PcA3qv7j0hSA5lYpM8FGxOeg4owouwJLDNHmrupfzDQ0uU+Cpci0mCegGgvpp8bYtsdDycOCDrsfqSkNa+1lE+BlGNaCowl12FRGMoI5sug/FAW9Oe2erVQosygX3bBkdYbRfqhPQAdY8RKzMF6uDYRho7ZHmsFMhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732083190; c=relaxed/simple;
	bh=17U++7VGhfQ7eox+qFG/2n7by/Iu3dJm+P3a+r2XL9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JwsZkzKv1w3Tf9fMXXAmbAfpnDrl8oItzoNi185+kCx0tbKR+lkzJSVX6f86GdeYVSc8kgGkbwXoFXe/FrO4JbqyMvv6M0wN+4WpQmUQlFu3vi14bFmP1nzvwKIXfzz+4d+zh0lWwx8X9YsPr9oMhfcF+0Rb+g1wb+2xMBUfOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=APANFcbe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732083180;
	bh=oaAk0jN0HME8JFbAm9/nZx668KNf3WYWiySyRvweP5U=;
	h=Date:From:To:Cc:Subject:From;
	b=APANFcbee5sFVUipPTelPshAUAKyWUfuLxAUU9Ii9+VdWj2AOc+UozEv/Ip9cMWpc
	 yU5sdR3EClyOC50QnWRf46tjwkBxPmr4LWR709IiWUogwNL73gcLNuUT1aBrpX2XDq
	 BJvMtTgU+wJRqvLbtNkhcpTWlX6Kheaj9lM49xoiZmrZ4h4PbTM6Vwmm567Xn+fiGP
	 Larn52ACyZh18ZodJxjb6kWYVsNsCTMNMq+5R72iDMmCKSG8epTysh7aFGwodi7hRU
	 SCInGQmD9Lo0wa+AxITJwu8hAxon3v3pmIjSybZQhECycsnq57bktePwxYK9AVciZb
	 mlsnHXC5vt13A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtWHw2F4rz4x6Q;
	Wed, 20 Nov 2024 17:13:00 +1100 (AEDT)
Date: Wed, 20 Nov 2024 17:13:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Cc: Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20241120171302.2053439c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3UyAIJa8z0TP/bWtkTFqD0A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu:2: ERROR: =
Unexpected indentation.

Introduced by commit

  4ae0b32ecee7 ("docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Documen=
t sysfs event format entries for vpa_pmu")

--=20
Cheers,
Stephen Rothwell

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9fe4ACgkQAVBC80lX
0GxQLAf9H2blWbiYsDh+gEJzxjzOlJKqYTkzl0b5MhuxXUDaSxmp+zTXIsgNTzkc
E33JUJOyi6bs8UAnqgDJLuuUUx9rxnQDHbEIRyWLgwyWFfTqqr72YKu5zQp9EOaF
ixQLS5kgWIGGB2OGPwuk6d5+kpaNZU7dooKYcsUE7s7zhmfQaWEdyk2882V6qkES
sLHZHcJG03aEoioYiE6oSLsKX6b7P/Ox4puU4hKkcym86w19kBPKFWzRCwXl8Yoj
9Pw7nbvWf0we1ZNuIzsOAJ6KKb2hhQT2vm27AiEJ/RcS7ZPBiQ7yqQAgIwfQlfQA
rgnbBPAS404CmaebLBqbndBuCmueBg==
=xnxR
-----END PGP SIGNATURE-----

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A--

