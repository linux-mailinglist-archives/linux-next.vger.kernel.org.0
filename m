Return-Path: <linux-next+bounces-5171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725EA0AE87
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA8F3A46DD
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7F41494A3;
	Mon, 13 Jan 2025 04:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D82L6QuV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA91474D3;
	Mon, 13 Jan 2025 04:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736743805; cv=none; b=Sv0Q4vSJTjh8L4aZ/aIih+PtrsCpeUIPH/w79Sm99EYIDo7Nec3HYHV/ubvE8zDjOs3MGOddiuJINvdx8RRhkswg9+7B90DWWTwfybhYD6/2HeoyzUilcGbYLcqjeU3JAbr2V/pwXuAKGI4xVgCB6xkfG0Az3bmkNA/TolIfLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736743805; c=relaxed/simple;
	bh=E8f05a19Llp3PgJ9LiymBhyBjnMMEqkS+rrzuu4d2IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kTZnmnMiv7h0pskicotx+t/hP79yiZ2EKLAUll89ZzIfcPs6M34r1MyxE08EyBfVdps41gyx34b4sWaOwkr9TOPf6wr9VRUhLMTf+w5QxSUZBCCGev0cGodwq5IvTh2zPE+uDR4Q22FYZyqLLpxxoIVkAaYrLFKEdviuArKxYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D82L6QuV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736743793;
	bh=fQr+58xnM3oJy/HYq042b8flRj12HzL2Ipg6OlCRmkY=;
	h=Date:From:To:Cc:Subject:From;
	b=D82L6QuVpPrOmpYlkVMbql/UCzimdTU1vPoGUYaW4Q2N4UGuGnTGabEZdoLChP76h
	 wNvqHGV3ZdL0664DVkQArXhXLJsBjeM47r68fy9wFNlhz3KVdYfbncIvpZlvkw6qaK
	 QoyI5y+bGwUUI8B+ITqpAL9/bGlgSLm/IY9GzHS3U+LGsxOWdQjxN7T9AJxotCBBTW
	 4pAzCKFvPFUeAPAa4nTFSkw2DCohj2bs640X+S29ObTgXjpSMafF7NlL2lUlQW75CX
	 jPEyxPIokBfvBOuYjdqAN1ejmi8JQ6Zdn35lJCezpuXtS/taWmgI6ejQpUWeyguSNW
	 MDGBx0ntSQVwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWfv55DHXz4wdF;
	Mon, 13 Jan 2025 15:49:53 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:50:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250113155000.4a99e7b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jPZdqc6wwK3jDdABfZRnDx7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jPZdqc6wwK3jDdABfZRnDx7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/gpu/drm-compute.rst: WARNING: document isn't included in any =
toctree

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/jPZdqc6wwK3jDdABfZRnDx7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEm3gACgkQAVBC80lX
0Gw7WAf9G3VI2OIiny6CEEKf5PU0q3Pi7VyTnPdw+1Zq0xUVpHy6rANZDow3P1Ki
o/Dm48IktlZKdkhlz+VKf+k375M+3HTzyDhEp+Yx0FCPpGG2fWTAAgi9QWx9ailO
IG24CDUCK5ldiUPVyCIfyuIBopuXmpo1w4JVGJnfvQh6LziJoDha/2f0oBRR3527
OyCCK/mZR0bmEInwig5tFNLavGdrvpAe0LCskKd2XZ4FcLbux1L6vbAR3pWNvqIr
UhQGQv/7IdSAvDSE6+X5GVjjR3bk6NR1VA4uI0EJ6rYCiq94xWYcEjr7xvJxKiBX
F0QGMCNwN3E40queVClNK07YaTaxUw==
=l76E
-----END PGP SIGNATURE-----

--Sig_/jPZdqc6wwK3jDdABfZRnDx7--

