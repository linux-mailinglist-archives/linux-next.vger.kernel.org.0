Return-Path: <linux-next+bounces-5173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB2DA0AE97
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEECC165D0D
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9C918D63A;
	Mon, 13 Jan 2025 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V2gBNrQn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82061537CB;
	Mon, 13 Jan 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736744620; cv=none; b=dMZtt8nMUiN96i4PCmjwCGs8YwuMTcoikF8Oj9M543MVHS4e2EdfHfKgpyGThz2/AN8FghYvGhlbOqVHUph55ZE8vV+IJfpkyxW8Mto/f/I4UVACRicNNQ+KpucWy+lX4bVUcl2mr81GyZkP6bQsXfRsG4tkTru0e3tFuzb84Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736744620; c=relaxed/simple;
	bh=Vhio5Xsxo0s6nDLnOThakD7Ta5JsfkDk0toaa2VQ4Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ob1O40Dvc2AfPp7UoCzXGuGxTRkmLGg9WuOe+WziZcrMlK+asgJvgaU7AMrPqvZQ4R5V1/YXMfN8ET0JL2jLIvFAAOpLfvHDGL2t//kwmFmNhgLxBFbBYQ4Nhn5M4rwEilmt2xlhjWhdGGAUWZHEL5x8CbyA9rmKG6Z0DBh7U10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V2gBNrQn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736744608;
	bh=yMYUVdKiQc1gQZ7Tf3KQn3ZaPzIwNokYINqh23B5kCg=;
	h=Date:From:To:Cc:Subject:From;
	b=V2gBNrQnkTyapQtehlXahvjneOO0x1vHRuyHa/qFN2eFtz9en5UWWMT0Kz+KXSHNe
	 yl6W1eZUfRXiGlZwKienJ1tXqzHT0rLeKEj4OFPO3RhVfR1rBl2BO5AJTh+RA2fuhO
	 dzOGgF3ArBW2d3W029iowAyYBRMQF4P9vNQ2tNvrjD2E1+3PDuFO1s7fFIyj4CSpJA
	 KQh/woAIY+V7yE0oRzx9CFCa725XEFsP0XAEOF/qS1whaIycMqxtDvY/1B37S0kZW6
	 SzeqQWkDXcIdDwNZBZ+oaHg0x5CQRypRwNL9Wea8+LpFOQ3KT4LdgxsmPre25rqnuR
	 /TIx4IV4uBGaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWgBm0dgbz4wvb;
	Mon, 13 Jan 2025 16:03:28 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:03:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20250113160334.1f09f881@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hutv5y9_DgXrsftH63naBGD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hutv5y9_DgXrsftH63naBGD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

kernel/cgroup/dmem.c:300: warning: Excess function parameter 'dev' descript=
ion in 'dmem_cgroup_state_evict_valuable'
kernel/cgroup/dmem.c:300: warning: Excess function parameter 'index' descri=
ption in 'dmem_cgroup_state_evict_valuable'
kernel/cgroup/dmem.c:635: warning: Function parameter or struct member 'reg=
ion' not described in 'dmem_cgroup_try_charge'
kernel/cgroup/dmem.c:635: warning: Excess function parameter 'dev' descript=
ion in 'dmem_cgroup_try_charge'

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hutv5y9_DgXrsftH63naBGD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEnqYACgkQAVBC80lX
0Gz3dQf+J8bDaYxs9MuSCBgwHQoq74a5xncmyg24Py7N5srX+HbQ8Uxd5aaCTEO2
IOr8r8sCPdumLKNe4wV+W7yVrwukV8xpC2+j7lCzjB1axTXezbSU72XmAGavUKhy
8YZNIMlPIgSH6sc1O3+v6Fdmk4ytrxpoW3CIaJfNTsR3PA7QT0g41Mz1jIwlwjCu
Ou227nF2CmLJ8UfpZzcs6Mbf7t69rENsxHBScp5WAkxvIW3BrIPS4ATu8n3PAR/z
JxH47ejDzn4KQjNKO540D9Vy3NIL6UauK83vJ+Wm+FD+hHRrMxKEdlJzLMh6vk1f
Lo9z47Uq7DQMQP6TXKfuHc2Gm0Iu/w==
=oIX1
-----END PGP SIGNATURE-----

--Sig_/Hutv5y9_DgXrsftH63naBGD--

