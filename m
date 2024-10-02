Return-Path: <linux-next+bounces-4053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D752898CBFB
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 06:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C58C28679C
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 04:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F3314A90;
	Wed,  2 Oct 2024 04:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e4usjVyV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63875C96;
	Wed,  2 Oct 2024 04:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727842977; cv=none; b=F46RL+WgG1RE/DDfbpdq2vtvp1z+2wSdbQNHpJt+mXPRqKmi32/VXG0bSvtCtwyqMl6ssMK7U+Pg5cSwcRFV0NA1ar3nEKT70J0FYA6tjTGJO3B1LCYs5NhOomx8PjPtD5oYtuNTseOj6YQqwx0pMNgRuJYap36Gjn1h0vaCYBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727842977; c=relaxed/simple;
	bh=ns9jgyW18DaCP99OJ+Wxxj3cZfJ3NcsR1E8HheZOZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H37j1Ci0rNM1FiMOWmv19R8O4fP7zdU1i883s2tplEN17u0E2z9E/wprMBSM7Lp/epr3M7JwLhy3QWWrtTQxExFvWdxt1nXm4cIYmDdrPfm0RCClR8gAyGr1/ksXwYWN34rZT2sO0oUQlfbuKw0rrEkAgnQFugZCj6FIzgSTb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e4usjVyV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727842972;
	bh=BMQmW6lMUealt37gmqPQsqVMi6fyJxn/Ot2NQu0S/U0=;
	h=Date:From:To:Cc:Subject:From;
	b=e4usjVyVA1YzcbWvc3YyCsXGCgegGel4xmtxuODMszE+MuzzCbWTROoGM97zTP/m1
	 03xj5OT3EQwS+IAqLm27A4JbK9EwK+wAtpF2mrP1Youqj/YkLHzXZbkCIdzk0pxr7n
	 S8tIs5lp6jeZzfQt89bvTfIRIsIktHm0RyNayfboqEHUEpz5koxzW7LxOPL/T4haTd
	 ZcCAjb3STgdOPfiGrPU0eWDjBParGTSEt/yrYY5plD3fov6/mqyVV4l0H+nBmR+MRG
	 tpAGLsnxqiiXw7jFsltnypTQ46zMdeVe3lM2/Ude7E5H+Cr82J8o3wBX8+8iZZ4j1J
	 uMgJSqO/VJ8qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJM9R2R3Dz4wbv;
	Wed,  2 Oct 2024 14:22:51 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:22:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142250.07e1c46c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/04yiSVdHGPCbNUj7+Nr/8v3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_dma.c:1: warning: no structured comments found

Introduced by commit

  731fddf4302e ("drm/fbdev-dma: Remove obsolete setup function")

$ git grep -l -w drivers/gpu/drm/drm_fbdev_dma.c
Documentation/gpu/drm-kms-helpers.rst

--=20
Cheers,
Stephen Rothwell

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8ypoACgkQAVBC80lX
0GyB4Qf+PTo6LD2subdaCpdEwsXMvVMoP7SP7B+1IiEYgNLUAJYM5qvZxLTToJCk
bykB71DAXuzhvZS7vdjg4atNKBkylo57iWezS+M2MyAO8i0+nJ7OuVS0NiNTfkkI
/tvf73r09VoUOFANggZfSR3d18ktUze1aG27kn+HEfu4V1BJUvT5TBr1cAA++idl
7bpsqY01fu7kkXrgwTj6FZ8vPZFtIRtEG2ai85KtrSnsbJJgo5UF5+WAzshCkg2E
4CrsB7maa8xivbBZs8wDCLAUbRdeyXrDORIWjmAkxxl89xXl2nvxyx3uSnUVTLBt
G66GqAL2pBehmmKz39FZ2CmTHwXyRQ==
=mX+O
-----END PGP SIGNATURE-----

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3--

