Return-Path: <linux-next+bounces-8949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30060C55A38
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 05:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6FD14E03D9
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 04:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5540C2BEC2E;
	Thu, 13 Nov 2025 04:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O3xh80Kp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD992BE629;
	Thu, 13 Nov 2025 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763007802; cv=none; b=ZTseamLUltojbqW9Z3hy8bhSniGxjPbuLKeiAB3Nhq7Luc1PU47LQQOHTUkAEytued7xKraPwuRsJ5jEDf7xaxSZPAkFbFeEtCqGWJ2GJx7nTtNt+3Tzb8B1AHtIKgKwYb7nFj/cSeZdjqR3OVrPw6of6gbOhn+68pYb3Vhr3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763007802; c=relaxed/simple;
	bh=Xvz+Xuc7Y+vhCg3WuET9Z7ozRM61Lmu5lT4vf+qo6G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R6K5K21T22IOksNAciEQtjkqcpUKKpRBfnM2tVu0KkLx4qltD8xAaXs59yHppoH/S+XDLVgQMc1gh0EdAOVjx+gXFrKqIk938WkvTzCJ+cNBA7mi8gqVomqvoYZTh+3Ddke1LER5vtAvaHflPTCuDu8dS1tv7SyaqiDsQzWMOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O3xh80Kp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763007797;
	bh=rkSKirlfJNrKqmdM7JkvP4+6DlB0RhjRgSCJwL6W+04=;
	h=Date:From:To:Cc:Subject:From;
	b=O3xh80KpylT7ozWwEpv3kO3cAva0J6sa4cEGjIj/NamaHO3d4V+JJqLtWpCUJPba8
	 Jw5fjzbj6AwPaRV0+DuONt11z0mDrHqQwICVhN89ZE8XW0siGeVIqdjuhh+LH45T6p
	 B1ukzMJSJBr3WUJF8LIzFWFFWlgaHEWh+Lqt8plH0KQ8fNx3lVBwiD8LrNQeiLghW2
	 Sra7pQhj3/3eG8WQxDBiEY6vsB2dkgN/UvSLWjLD2iYe7HtfzIDy89LqILRjkPz/Ld
	 ZhzHExYMI6y9Fys28kBh9mnlFDYC8NzoV62JzbX5rtwdRF1FVXQ3sDR6iSHvg0eSCt
	 Nl+Rc33wkRJtQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6Rw52282z4wBD;
	Thu, 13 Nov 2025 15:23:17 +1100 (AEDT)
Date: Thu, 13 Nov 2025 15:23:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-x86 tree
Message-ID: <20251113152316.7f7e9e50@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_+6ntTY=hoCvGRMjomjXjXn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_+6ntTY=hoCvGRMjomjXjXn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a4551f2b4d9c ("KVM: TDX: Take MMU lock around tdh_vp_init()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/_+6ntTY=hoCvGRMjomjXjXn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkVXTQACgkQAVBC80lX
0GwRDgf/V/fhPWHIc9QOXDz0bj9CP52yBLO4r4kxpybrJsQjuLvHK2IzjGmVmfNe
BGolTzkl0u/0qWOePv2m4P6O0mVtrWVSn6TwbgCrtcNWe3bb+f6yvkI1rC19A2k1
UBIKrvbd6X8ftm34wl61nyow+65d73kSZp2meF7VGvuuAIlH54SDwpwqjknU0MwL
n4chIVe7CIy7c2XevWNrNxTMOOxMxHoIZM8Aq4dgooD5TuY8atiZkDFXydFH4jaC
5BiXIFbUMhOuouY1gyafginZMBCzlEpCrxrye2KKnA/QpQSNqRpFK0cOxuX8glGm
08iSFWvOQdXT8rbd6OqGJmremJXo+w==
=D+Jx
-----END PGP SIGNATURE-----

--Sig_/_+6ntTY=hoCvGRMjomjXjXn--

