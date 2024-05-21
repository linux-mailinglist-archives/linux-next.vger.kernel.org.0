Return-Path: <linux-next+bounces-2374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CF8CB60D
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 00:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29353B209F9
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 22:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2168148822;
	Tue, 21 May 2024 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y21L3u/K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C43BB21
	for <linux-next@vger.kernel.org>; Tue, 21 May 2024 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716331146; cv=none; b=dOtPzL2zY+zvUbyAymMdGgUE2HSMqe7WG7s64ie0JDX0UpOXDlDlJo0YK9YMv4C3maUb04zAWCJfOX5wqdfojm0FA8tODMpGLXadyh9eXDFBpMD7MmW4p4nnhePQ5CKfFc2EXrH7v4v4Y1AJSU7mqAYsH9nAR88VgedJ/jS+hPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716331146; c=relaxed/simple;
	bh=SZDkuQ3SImeIHJaRhFB86TT7Y4icrJbXaBgXD4hM/QI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FfielRODSgw61tjQsEbHNpzBuG60lQUOEFSIBBdSWR7jeUeQcx/VBrJF80RfKGUuwEqZxMvVVrFJ4Ivw67AQXGfQYoxMooFXHqGLi8ZxLkSGVa/P+VqMZ2wHJixyNNLymS06ZhFdQDblgUsSiGGFq89k1qBIXxbxJZGr5/t6sVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y21L3u/K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716331142;
	bh=p8KNo+cfG2R+IzfJIWpYnsdYSibDV/vD9YF0M7P6XEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y21L3u/KloKPi7GEMb9w5jzvYwbk3NcJgLc74pNoS+p+jZXFuQHxE0jqIGtzPbOuQ
	 OwEmR82HuOrQZhPsovT+MjRy5lIrHLvgVhKbb86ItCU+kzu/Y7d0ZaczPLC5djLi1t
	 CydgJsTTZvHxG0Kc87LuWyvvX/uyXi4FEPj9qWXkBiTxVXhyJb4H7JNNKuN5AWoRXy
	 ZrxhfyhgFVD4JtfTZP3w0ZxerAiwGvM2EIZgrGVDD4ousjYVGvAljwZcmME9hkHsYz
	 BLH2SsKWDnz2pdKV7gJTgHv/MBYqAycKZwpxqS6LfkhZ5CUeS+ZJDCeljpyG2swzOD
	 YyTP8vR96dBDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkTr55f2Bz4wcC;
	Wed, 22 May 2024 08:39:01 +1000 (AEST)
Date: Wed, 22 May 2024 08:39:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: FYI: drm-intel repo moved to fd.o GitLab
Message-ID: <20240522083900.16040a14@canb.auug.org.au>
In-Reply-To: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
References: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YTcK.kgb7TPTW7wJgNgc4FM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ryszard,

On Tue, 21 May 2024 14:56:22 +0000 "Knop, Ryszard" <ryszard.knop@intel.com>=
 wrote:
>
> As of today, we've moved the drm-intel repository (upstream for
> drivers/gpu/drm/i915) to a new location:
>=20
> Previously: https://cgit.freedesktop.org/drm-intel
> Moved to: https://gitlab.freedesktop.org/drm/i915/kernel

I have updated where linux-next fetched from.  I used the URL but added
".git" to the end to save an extra round trip delay when the above
redirects.

--=20
Cheers,
Stephen Rothwell

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNIoQACgkQAVBC80lX
0GwIgQf/f/34jIyZDXAwnTErf3irYYWtX7y0Ch2OFWoq9l6Age2TJOtN/Jc3ebII
55PYWd4ENGDGC4zmMtqFQjTh+EMG28NKZJ6d75vrotfZ+Bgm0a+EB8ZuGMFN0+3y
f/Rb5NeK49ojPPX/3x7axsPtTupSInoSixh1Pg0EFhu7JKzS34VnHJBELPzmRxWy
f6lcbC/IBE/5kOuK/O9UoDDqQm7DA9MQtb0eppYoOmRPK2Rfds1KGVDeXcr+ktwx
tHXYjiI0ZIBcp6nPr0ir2i6G2Bc12gn2yf9FCsEcEGlFEtKCeLxRnUIWUzjeWil3
5AAj2SccwDQITK4Tsnv/rHIYfUveUw==
=Mz54
-----END PGP SIGNATURE-----

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM--

