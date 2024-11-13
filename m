Return-Path: <linux-next+bounces-4772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF069C6953
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EC11F2399F
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 06:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214D11714BC;
	Wed, 13 Nov 2024 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LBjR4DNQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827D2594;
	Wed, 13 Nov 2024 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731479626; cv=none; b=IAdbBDDyvYXN/TRWs3pY5ELIFcKyWa3b/5LcpRaOIND8pCsYiNL9l64Qm80N4iNfkOxTllXcnmyYuinDSoif2SHSWoiUJ08T9vmKF6171YIY9hmFWZaLvStMzSJTiwWWKYklcdibRPg33wCpMQfF0n/Le4THXZVoWABkz6zpCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731479626; c=relaxed/simple;
	bh=9MpwJWZVMUAOmqlA+VSW/+G6o0J8Auez/wUZnbya2KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTD1/oOo9d+3cgna6YHh/GKgNXqScvqVjI/QtqBmART1h9693mo5ELx6gNjeFHrerqxW1kRGeL9i0gCYFYHdgEY7lB+W2YO7cildbkVfuyrXDzRtYUsb1lJKZpiNc5nI+svV44SZd/xeaeixzDZ0UM7h+C1B2E84nsvsy9E4nLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LBjR4DNQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731479619;
	bh=ygUXM9cyet0rOB7Ae8SPe/FAe67XouoFd1A9KN8VhFY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LBjR4DNQ26MEoHy9VbkBURZir4obe0otR8txLnT/CaIaxhqKzg2fExa4OByRaQAIo
	 Txgk5kBo/docNDW2qjePZ9TNdIZAqEwaRh+WGMGHabok7qlY1bsxpb6nHtL2Hmaojm
	 aFhaF9s0p1RtDGc9rDxWuMr6pwgIiqVwItYhTMRGFuH7Pr2t/67mbHLHV5jbnn6sVC
	 vQn+U7puqSlfqP68sSfNUCF+TFb0256uDV7o5Q/h7jXeYYGF/beMHPrdpjENhn9avy
	 xIgi6kY7Gs34ATVtPYN5yiJzhdGnP/3Qup20PEXmfvqA/dUGd/AgcwgJMRFWHb5wIV
	 D1pBUo0Yyqn+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpD4y4f7bz4wc3;
	Wed, 13 Nov 2024 17:33:38 +1100 (AEDT)
Date: Wed, 13 Nov 2024 17:33:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Philipp Stanner
 <pstanner@redhat.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241113173340.345a196e@canb.auug.org.au>
In-Reply-To: <20241108175655.6d3fcfb7@canb.auug.org.au>
References: <20241108175655.6d3fcfb7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q7TG3z8kTKztApVEjDuHvF=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q7TG3z8kTKztApVEjDuHvF=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Nov 2024 17:56:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/gpu/drm-mm:571: drivers/gpu/drm/scheduler/sched_main.c:1359=
: ERROR: Unexpected indentation.
>=20
> Introduced by commit
>=20
>   baf4afc58314 ("drm/sched: Improve teardown documentation")

I am still seeing this warning (now in the drm tree)

--=20
Cheers,
Stephen Rothwell

--Sig_/q7TG3z8kTKztApVEjDuHvF=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0SEQACgkQAVBC80lX
0GxDNgf/THbv3cMa7n0KQ39opRw5GvltAffCB8zEM4unatKuWQcaYn+BgvVPUM4F
I32JGSduDqXPlUVlSGJmYPClmCzIHOub7vwbnE85d1UvcwfBO22FY5+TenCPjbZD
QtEEpOGYDQlgzcM9m9JqaQPjso0hpXswCfmmyf95UGyFRn/CXT0R4kXoWxVEKeUF
EWJci4iiWveDwvIWeIIYOnYM/FnoIWxDobuX1KGjDsO/7wfbpU9VzdnGb0jrw0eu
i05/QLAoOlpwpuPnsZT7Zlil4uwIh5jZLKCEoTwF8cNPeKHviNNigT3YInJqi4n/
NUhK/E0PAQ1pBkyraaSjDcBHo/5XGg==
=INO/
-----END PGP SIGNATURE-----

--Sig_/q7TG3z8kTKztApVEjDuHvF=--

