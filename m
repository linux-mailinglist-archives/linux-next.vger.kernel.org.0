Return-Path: <linux-next+bounces-4232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67F999C5A
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 07:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF4C2832AB
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 05:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D600C1F706F;
	Fri, 11 Oct 2024 05:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tp0HmZJi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE9219FF;
	Fri, 11 Oct 2024 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728626276; cv=none; b=LtdKTJsCXbb0TTmiPUkvd3/+ua3AueG0CW0P2q7Q7z+deZT2IfO6NFNicgxNRVSFGb1Xg4VpwjKIgAmfBvHhxuhGi6BtvvsgQBOu4hXUtN0WYIjDD92+a+uLEOQqnc28yeLCMe+Xo6865jtZWg/Ko511Y2KLK3M7J0PUc3zd8Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728626276; c=relaxed/simple;
	bh=3UA/Wj0tFj7GNRCpRe1eBnUJ45UOVruZE8go1YajMgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VV+VpwtbYgI/EVkdFbs3Iy2lESY24VPX4IQ4zpE8D0xGcc5BlwSwEHCr2mrV9TLHJM2wZre0k0MLXgx4GRxiF9/SsXkSMyKEfvWR2TMBxhhzShVhJUKh0pP6fwF11NlU4wTTz6jrNEkkpDge2mGZkwjNfVdgNNmaM66dHWx84MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tp0HmZJi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728626267;
	bh=ebMRVSKdlSNzb2lYSQYtSXhlEhms4xHDtbLgrCBEC1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tp0HmZJibGu27WTzEQP63b/ugb/oz0d6bE+ApFbp7vRVpKFNX/2AnpgPLWXLxhMc5
	 H8XqXstEt68wrR2ise/rDf7/TufRjGznJoGsMgw3M0JkBe3mJUm/d63MAaq7I8ASiJ
	 rwdp0cCIQ7r8poTw21WGAPPPcIorB9ccGD+Bn3+0oJ82wRsV+UqpdfwnIgDgibG1mb
	 KOn5PBs+zlRbXCaTFU2c2vE8ozPFrZv9WxfddHC/K2pk4kdg2qhrhvm1wPIxR5/aAx
	 GRFHkyqmlnb2U7KSiO3Iul7SWHOAq759G5/Ve19IfMWZNXO/+Fw0PTG1xGeX8FLnU8
	 k10MQVk79fkyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPwrn2Fqkz4xKl;
	Fri, 11 Oct 2024 16:57:45 +1100 (AEDT)
Date: Fri, 11 Oct 2024 16:57:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20241011165745.64781cf0@canb.auug.org.au>
In-Reply-To: <20241001134331.7b4d4ca5@canb.auug.org.au>
References: <20241001134331.7b4d4ca5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pom3nNLcN5g6uw8R=nY2fOI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pom3nNLcN5g6uw8R=nY2fOI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 13:43:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-intel tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_int=
errupts' not found
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_inte=
rrupts' not found
>=20
> Introduced by commit
>=20
>   3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/pom3nNLcN5g6uw8R=nY2fOI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIvlkACgkQAVBC80lX
0Gx0Gwf/TzMYLAvCwD+l3JQGo0WsVY4xXIQRCb0ynZJcxdRuX8aV3Tw0f+3m+KS8
PSjinOF8W7dm/WhszXmxHEE9xpWSUWI5jCpNizWrYk6vcsXiFlh65rUFM5Pg4Rbq
9Wo3hcGFoOAEFSQZ1v3iy+IZF9vMDCID+98F2qgyxDfRTA+9wGC9SyS81FVrA2KQ
13d/QDa+alAzcv/JAzBytjoFh9ihFl4M3RHL5rWWfsp5qoz3EiWJSRyN0vpk60By
ttG/YK/sJccQDYQT4hNsxG1qBbJ745XlASj4Ii39rc8fqFfrRvG1Usps4lmOthPu
kK14KfOxYtBsGYTIfHPj92CEH0bTUg==
=C6pa
-----END PGP SIGNATURE-----

--Sig_/pom3nNLcN5g6uw8R=nY2fOI--

