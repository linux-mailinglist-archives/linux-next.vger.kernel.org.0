Return-Path: <linux-next+bounces-2736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F891D5BF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F72B20BE8
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B44B4A3F;
	Mon,  1 Jul 2024 01:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mIGrN71R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEF443D;
	Mon,  1 Jul 2024 01:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719796977; cv=none; b=bPNagpUI9rW+FoEzGXatvWcshaUQZ5z4ImU8Pg8xwGytxQtJ9GTuylE9nAFdY34rcP2CoadNaEqn9H3nFXsPaUMUukU7hVwIgYG0ZOc0EjFMcE2tsjjR8UxdVSN9xjkCkIjj4brXMp7oP9TirC7aTzgxH00FMERhARy7wbYII90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719796977; c=relaxed/simple;
	bh=WODodRAHea3EX9OfCeScdQ7RyZ9SH1ih6qJLBTV7Tr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGk4N2FVeSyJKIpRLriGk6pyGeBav+lyTUXMjohR1pDVCEttkjTWiyQprDTZbPiD4ev5DGJ7PDCBeYAZ1Nz5+N5Gl58E8gITwr0witPo3oOlMKSxWl2AUKUFkPW7JyR6plOnR9VjdoklH4kcHo0JfdPDEfZPUIpb8yR8oD7lwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mIGrN71R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719796972;
	bh=uBfEUx5xzm2o/6xdavmaaOPBCa/jcQI1acorQpVGHOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mIGrN71R3JxLejjT2eajCRmBXTXo1OgwL7kH2q1NuHteLn0IL7KFp8hI6ikEq6nm4
	 6K9C6WkYc0A8m9G32vqJFuaqVkQM+kaHSxle1iIcL9O8N5q4i3xLvy/rK0prWlnCUW
	 D6l5mYtWRnQY630H9L2tPRs/wB2TnzTplG1+keFTbAXV8LXzNS+y4c/Psp+mi0CUSe
	 82rOXQeRFy+o2VXYUp1wXKbSARtKF1OxRA+WpRV2sGQtXe6vQZp+0JB4dD6IAR38LR
	 ymXXhzIxLTt7mfUO5aj78yh8TjbWUCU6I7Lc9lJslrKtqmuRITLldeaREUxgJiep6T
	 BE36YOoT8X5Vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC7Zh57tYz4wx6;
	Mon,  1 Jul 2024 11:22:52 +1000 (AEST)
Date: Mon, 1 Jul 2024 11:22:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Message-ID: <20240701112252.1f53c90a@canb.auug.org.au>
In-Reply-To: <ZnqrzC35XKH3XNVg@sirena.org.uk>
References: <ZnqrzC35XKH3XNVg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CTuMr67sPyWVr_2hfEHAZa7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CTuMr67sPyWVr_2hfEHAZa7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Jun 2024 12:36:44 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> After merging the qcom tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> ERROR: modpost: "__auxiliary_driver_register" [drivers/soc/qcom/qcom_pd_m=
apper.ko] undefined!
> ERROR: modpost: "servreg_loc_pfr_resp_ei" [drivers/soc/qcom/qcom_pd_mappe=
r.ko] undefined!
> ERROR: modpost: "auxiliary_driver_unregister" [drivers/soc/qcom/qcom_pd_m=
apper.ko] undefined!
> ERROR: modpost: "servreg_get_domain_list_resp_ei" [drivers/soc/qcom/qcom_=
pd_mapper.ko] undefined!
> ERROR: modpost: "servreg_get_domain_list_req_ei" [drivers/soc/qcom/qcom_p=
d_mapper.ko] undefined!
> ERROR: modpost: "servreg_loc_pfr_req_ei" [drivers/soc/qcom/qcom_pd_mapper=
.ko] undefined!
>=20
> Caused by commit
>=20
>   1ebcde047c547134e ("soc: qcom: add pd-mapper implementation")
>=20
> I have used the tree from 20240624 instead.

I am still seeing this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/CTuMr67sPyWVr_2hfEHAZa7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCBOwACgkQAVBC80lX
0GxGmAf+MXu72EO+Ymn7BOVfc95vSGxYI49XKHUXgKozxtyfcvvYkJ0A6b6rY4kj
+v0eOtQS10BDPivGvUuSrRp8S0HMYYjiT56vB/NAGKuLJWCobdwKw0Bccfm+GOvr
xJeq/tPN3t6m8wgUxfBJsY3UcGeEeabWhE4GW/Tc7cryYrwCUhLAPHpyl3+kglcR
HmsJYKnactESFCuQ3Qns/GRe5HM+xGA3zDUYROjdYaIAIVX16eFh/Besc6kWJU0J
696dynX0X6FiSyhWUMHQwdkcRBjT01NM/P3i2Gk3opiACQrMPfgJ+kVnLQTKDEPR
vNbuBLe5Y1EmjAcALfFgbLhyJil9Yw==
=hKzq
-----END PGP SIGNATURE-----

--Sig_/CTuMr67sPyWVr_2hfEHAZa7--

