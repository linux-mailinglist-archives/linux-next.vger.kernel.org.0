Return-Path: <linux-next+bounces-6557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E254EAAD112
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 00:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2DD468902
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 22:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8387921ABB2;
	Tue,  6 May 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O3gFeU5N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD11DF723;
	Tue,  6 May 2025 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746571224; cv=none; b=kLH0WuBNjx8cydtQBhkWNw2LlpT4QTStvPzmwERaF8IEX1oCOsSdtoDYWTYPH2/zCzSCY1A+PEoz0T7t6FT9sI6pO1e5f1p+nb4ThlGF9qMKQ1n8CwK7XW6Daf0HVr0FiLYD33wrPjlzzPlYuINAjnalnqeYBhYJWUtNfuVs5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746571224; c=relaxed/simple;
	bh=58MuswtWK5vHvV3fOte1SoNuqyyHmTOuxtWNK3CdJgc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cj8i+2eqJUW5XyfJ/EfQI67bE/9VE4031VNJZAKTygqpdCCpvsUWarIHOU9FN1W7FhJluBfWuBYtrfjO8DJTIXxfyd4wY5gMwcOfP/XgCvcpPDgw0sbjbjAH0+cX674zoDNdzsXHqlHPbBn6gYIhZtotNSgn/3iXpz/DGEymXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O3gFeU5N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746571218;
	bh=vQOM4UGcFV2EAkH1U+ltzrtI5kG//euSnT5u5Gebau4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O3gFeU5NB4IxnA94Bo7WZTL8BZZD4JbGzVLLeDcOdx/GBKOC5I3zw5S6WsIYN6507
	 JWNHwmzu3i/gQ1miz4Xy0+mWMrB9JzHU+t1U2KRDVyBWHbA5Nq7A5Hdu4XjldPQgwP
	 GJxDmnv4JZARUKAqPSlveLr5q8RtnzjlmP0E6WdSKgDFcM6ICQZolIevhJkSZTZqHL
	 NtEybXyvTQuZ846bbxISIe6F54y+aT9xA392L7GltqP2AVP/sa6UqTb9vWR+1o0miu
	 KMzExw/Q3D1WoX+F3wfiKxPfQCnN5P8YTAeKsmd958IBcCMLqmyWln5louRvfgc7dr
	 ETMsu8ltR4kkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsYJ24xcXz4x6n;
	Wed,  7 May 2025 08:40:18 +1000 (AEST)
Date: Wed, 7 May 2025 08:40:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm-x86
 tree
Message-ID: <20250507084018.3af5dbbd@canb.auug.org.au>
In-Reply-To: <aBqOiq9frzCAkNm_@google.com>
References: <20250507073027.72fe0914@canb.auug.org.au>
	<aBqOiq9frzCAkNm_@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ARn4BuCttfMFdJpE5ch0g4F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ARn4BuCttfMFdJpE5ch0g4F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Tue, 6 May 2025 15:34:50 -0700 Sean Christopherson <seanjc@google.com> w=
rote:
>
> My bad, I fat-fingered a push.  The bad commit is now gone.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/ARn4BuCttfMFdJpE5ch0g4F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgaj9IACgkQAVBC80lX
0GyL7Af+O6TRi3Liy4RdgxN/+l3lYsT8NyPiFMx28lul6taCgmDUL+K2B2P9c6+2
itIvIVWGnHIbGRk5uJRnp2bzFLp+XSQNXcZuLnSlzb9fgqmoXqSVP6sRErsfIS+u
3Q4yX/Ihgawz0pzc1h1Jas6uv8tdiHAo+dZXSiXh8E05qsUlJrHCDqS8m4EXW9tp
0Jm8wq6C5lPgVeGVQ2sMSx8piOApZzIqGhM4ncFM5Hc4A6T+RLw+u0quGZDUEcrR
tBXzXJAuA1hOhV4Uut6T3nzhj1pkU5ZkAuI6dcT4JIa5G3b+fjV5myF/XxhxhQOZ
ww7paZ/343Kb8wBIRKSLYtzf8NdzMA==
=qcgF
-----END PGP SIGNATURE-----

--Sig_/ARn4BuCttfMFdJpE5ch0g4F--

