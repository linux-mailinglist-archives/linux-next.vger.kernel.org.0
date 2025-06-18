Return-Path: <linux-next+bounces-7172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F255BADF98B
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 00:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B485B5A0174
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 22:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322BE27F015;
	Wed, 18 Jun 2025 22:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RNGtVzYS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EAE21ABA0;
	Wed, 18 Jun 2025 22:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286647; cv=none; b=HO4a7dj6CwGky46B/ruj7wyLPoRnPwsAHU4xaKyugfxDT6alGFsPQNsc0URkiMIB+B8RTyiD1WPjRfDtH4Jxa5qIGPbKfuI4wxHXcZd5030Xs0Xqe84MGKpKogYMNC3EAvR0Tr3aEF1T3yoOP1gpajtVhKZJh0RtfiFWl+RT2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286647; c=relaxed/simple;
	bh=zrZWc7TCSgFdGDcyuQjWRBO6ww3YQJUhI+GUCoMIOLk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXVghNlcpmHxXPQOsqK7MABAK12g1DLuvyfWei9btUWM1p9TOkodJdLMJPZwK0Cjc+LLogBsAd4WMRLgd7tjDimxtUueDcefWYZUu+9NZsOFW2a4+y3yL7zWuLLo5/8eNZ8NCM5J33RcI1VtahwPXIl++/dLtjgIioEiy02/eIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RNGtVzYS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750286638;
	bh=zrZWc7TCSgFdGDcyuQjWRBO6ww3YQJUhI+GUCoMIOLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RNGtVzYSpGK0voqSOB3zBZH5aPke3SlW2o88OuhfuLUOu3jFPLXiRRZUFttJ2a9Xs
	 LzRGLr7CNpjVNtacL866Y947/ciOhjlrgKqMt4fepBJJdW/tBQ9765S1MvMz6dOIra
	 FYmXWEez1HSjn3wN3CiQi7gOBkyIYsfqR/UyyAT0V+awW0YaR+OZZOTEcEwS1UQLuu
	 kg7u4bCaW7zmB13YVupURmPHfcMbZCH08rJ8GhRAC+Pj4lcNC9+TZCCZhzuL/TyhSh
	 tZpf0/5Gg4+4cvJdSgQrny2U+Cs/tfALyGLrM9kj0dNlI3uwW5EOn6vvz02Ps/jiiO
	 cEPieos3qfYgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMzLP4MgZz4x8Z;
	Thu, 19 Jun 2025 08:43:57 +1000 (AEST)
Date: Thu, 19 Jun 2025 08:43:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH 1/2] drm/doc: Fix title underline for "Task information"
Message-ID: <20250619084356.788d482b@canb.auug.org.au>
In-Reply-To: <20250618142230.2407354-1-andrealmeid@igalia.com>
References: <20250618142230.2407354-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ho0r1+8o4ltYlHNrVd3a+Hk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 18 Jun 2025 11:22:29 -0300 Andr=C3=A9 Almeida <andrealmeid@igalia.c=
om> wrote:
>
> Fix the following warning:
>=20
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>=20
> Task information
> --------------- [docutils]
>=20
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for=
 the wedge API")
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Please add a Reported-by tag to this and the 2/2 patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhTQSwACgkQAVBC80lX
0GxdbQf+J1fV6cLtt7S4e2bLW/w1EjvGjZxthz9vEdqaijAZW4HUC/N1lDNH3MEo
HxsI6G0JHpOiYTqn42HWLlWW9tFrPtvBTmkHFgN7p7c9INhnetBzLxDNoXFp3t9E
v1uuOmz1E7/tt5/k4JW8OltPhP7cmh92r/xdhXTOYlXOfUU5aIXFpIztMO7a18mI
cUiauySoY41lGTPlY63sVqYG4O+/r7fLEXSv3pozJnZtFGdAw5SAQcGzuG+u+dLc
SX/R69s5hfF0c2EixuOYquDubOZIghauYi3O+yfdiVrq8G34vdcCtSnw+cvTY5ZJ
OGIp8l00HhYtfnbaaGBKP+BfVkIWsg==
=CxKK
-----END PGP SIGNATURE-----

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk--

