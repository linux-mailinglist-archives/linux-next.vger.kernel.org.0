Return-Path: <linux-next+bounces-4027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2E98B2CC
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AB31C21E0B
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77291A42D4;
	Tue,  1 Oct 2024 03:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aFEckqpa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967211A4AAF;
	Tue,  1 Oct 2024 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754218; cv=none; b=e50A6tMDvtgz0IuDHoG3OLmqZLK78oePmBAMQ3WvGhR49+uQiJ0tbuReiymLWR1S+YSnCBn3+xuwnpF9kImxUl0GL/sOlRStx0VBRQyO22Wgm1+DUE0jYVmJukkxo9dWK5i+K48rZZ4WB4sOUlp5eQGZ9O2SKB9LGh+usVTGFfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754218; c=relaxed/simple;
	bh=2mcf5xjo57askW3A4epvaMBzQH8j2aW2v+uALL1jUSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SI1y6nlyuBXOV0+S/VBZX0RsEI1kyJg5Im7uJOS7POVGEaLdEWDhppC0vYZQIypOf91x4xzKySmgJ1feLEdJb8/Jfy4050YYgf0QtSFf80Uf/6zSvwW1hzXQlihtM6fJn2fB8p3bcM2zb5evvC0m9aQbI2PQFOU1xxQo/fKpLEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aFEckqpa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727754213;
	bh=HOCzYcQ02D49k4LYhDveIJyqkuDlctGzK8ZlpbqAKGw=;
	h=Date:From:To:Cc:Subject:From;
	b=aFEckqpaQCGItu5Twz3n0CCvuNG/uIJpdlQsvdYmtys2OK/7ZpraiZhAQ5CCwCtUn
	 8FGS7g73NV/udNZX1uDmcbTE8Jo9wvTkQV0sdBmRDe2wzVH/XxoXc3N7X0la+LsuwL
	 1NGIJ3YryZq3Or28tjaev2/Oa1E5qogmpfXrt6E9XqQKSXeyn2XsfL6Ay3mapmyBw+
	 9JQKR1mjdJNntYYUB0nCntiFR0Z24u6YvDxcy7+TM800Au5wSk4fzva11jurJ2OEJY
	 pwZP2DQTkkAWLARAHoo8sUD9qFTu8RoBo9W2vN3uoe4GMqWfhzSZf3nGK3k3FBBbrH
	 uiVsasKbb6wkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkLX3NxJz4wbv;
	Tue,  1 Oct 2024 13:43:31 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:43:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20241001134331.7b4d4ca5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RRZ.=DI1Tlf32wO5Rudau/n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_inter=
rupts' not found
drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interr=
upts' not found

Introduced by commit

  3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")

--=20
Cheers,
Stephen Rothwell

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7b+MACgkQAVBC80lX
0Gzz9gf+I7VPt66D3CDNyNL44lIdLB94LXtHzyQXBFvfWWk769QfiC0HrCBp112s
JoVZrd5mavkXq5P7Lci4t7Q6fYZaQs/k5MRJc8j0mZtTe88tnqaMrsk1Znc8GrJz
aVYLOIyaVynNMMp3A3UQu99a/8WlDdgBE9DuDOoYx9mJefjW5DaINbzq8Gl0QG+G
+IRxIRnonya4ATMjpEIJLFrBra5PQjLrKOoIoulHxrSOA0a0SHfkTDaB7edaAiCR
u3P87z0kFXIl2lqd5jpjgXauSO8FkGLOEVKjAlZYZ/Rwy4/vYIuL3FF2GP51P+Hi
kckhsUtOOVdUn3zywk269RBZe7cOYg==
=AtqQ
-----END PGP SIGNATURE-----

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n--

