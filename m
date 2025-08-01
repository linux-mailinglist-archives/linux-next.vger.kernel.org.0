Return-Path: <linux-next+bounces-7802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9FB17BDE
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 161AF7A6451
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F305B70805;
	Fri,  1 Aug 2025 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cwObEtYV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CE347DD;
	Fri,  1 Aug 2025 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022888; cv=none; b=M0z6FuA5e/jORO0bfUDARpT/ujCi6I0LfJ0A95m30agBR+4ziBLdr4cxbVU2ENfNgwZAZj/WaOfoS8m3SrBNyXjnqzVuFUgR45E7mc9e0bm3R5Xdi1lSACfb3hmG6T1dBJzzCZ8tC0ocxFTBvjPyb27ERwbVGLGcRficQw67KHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022888; c=relaxed/simple;
	bh=exlZuTCivB2juHAVxezylnmTnzOeVwzOZanOgv1VxVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqvx0qNiEBr27FhBO8xMz/oRhTWu6nTW5wAuRWuiTFMthQxxd86xXltL1LEJ8CYqVPR9N58ZxgUjKKkkd2MgAc50RmQetJx0bIWpg409UhqjkG9bdCoD7TVyl8ctIyBICId0VvdXEQZq7wvGeE3oRglH0bJ4Edo11Fsx85H0YUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cwObEtYV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754022651;
	bh=oO4lRU20sEP4gjQMLXi33Cj6UC+YBAezSMbRbz1DpwM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cwObEtYVa9BrEfbKPDOLaqW1sSukNR+OW3NTckCfbwyXjdwki919HffGhYpsRkCN2
	 h5pHcm+mUSQxnt0GXQtY45atoAKXlY/xvgZ6yuNZJMe1dkPbiNK9bS84/i6m1g2l3G
	 4pIhhXuOy1LyZJ3dfYoR10O0uR/rUKZSc4F1V3eAsDwGq9c0I767GU0xgA/kNb96Tm
	 ZFbUZNHw06xa55H1JFko9tk6YcRRTX2NMQ9QfqfYXvBZfssP4PVcWwZAYE/HP1EQn9
	 EDkAkZhm01CtR33t+CnYjDzVEA2HkSCnEzKdp0g2+oBHcNJ1woeRaP34gSDKiH96e4
	 xX7dWN4hCTvXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btY0q38sMz4x7W;
	Fri,  1 Aug 2025 14:30:51 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:34:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250801143440.59e13a4b@canb.auug.org.au>
In-Reply-To: <20250611140933.1429a1b8@canb.auug.org.au>
References: <20250611140933.1429a1b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4.0je3=yvOcR0PhaG=onJs1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4.0je3=yvOcR0PhaG=onJs1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jun 2025 14:09:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_init' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_enable' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_transmit' not described in 'drm_bridge_funcs'
>=20
> Introduced by commit
>=20
>   a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")

I am still seeing these warnings.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4.0je3=yvOcR0PhaG=onJs1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMQ+AACgkQAVBC80lX
0GxnxQf/cOK5eyKavjdPQc03CU265FlRrktAYHiyMfAC5zdlurGLWCJUOCiWPC/b
dYOefPDdyerIOAkWabkc8Mt8PM5ChxnX3FuO62kFbStvm0ZvrTW7QQK81PZ+pwF/
PmMZJbkERq0Hwyk+320C2eqz8uXsL0bGqGYmNxKECnOdkz2oNNPwfw9niAWZ+FHC
UMqq55sKJ00VK3qmGIF1Lcm3eYZEZ++sVzJ9EeLUrdSQ3kLA4+rA6aVvgfaP6DDj
3VATQZz3G6+b/n5xiZlnugE845KRaQfYFO86XQ6As1tsNBb7ssoXqTxNfNIu+PgT
4dr7SFMfCaa6ObsFfQ9d6AB1dpJJwQ==
=6cLz
-----END PGP SIGNATURE-----

--Sig_/4.0je3=yvOcR0PhaG=onJs1--

