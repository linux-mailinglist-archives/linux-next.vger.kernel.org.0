Return-Path: <linux-next+bounces-7538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C9B04E7D
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BC397AC2F6
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 03:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F101DB95E;
	Tue, 15 Jul 2025 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kls0bKZU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9984A3E;
	Tue, 15 Jul 2025 03:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548824; cv=none; b=WH9NI9BpQEOBB43B6eg6C1ztGn4myYWa6OHF0+mtC/qNt4yPh5ZI438ZBMAgTVW0f+yjSy9b23xi/FNdY8u1R3QEgwyzueXKxRkWAWNzIimfdcb4QNj52DaUSHLT0oxyd14zt+3xAhtrzuuxtW3siEh9fedvYUT5RjAZRtYDr0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548824; c=relaxed/simple;
	bh=qnI8s0e4n1Y7gYA2ypph33WZujvuPhIATvhD2PF2BFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rWbkGkfNWGhm2kMkKkf0kaEk83l2mc0oD5/YrgBdGz+a6eEQIcVZiovfckrOdtw1GROVqEyncA0RiyOgRqHAw/JSSczeD/vEkALhGYHvJj8WycJnG9ewXM5C3lQYizG6+IRR4b/SYenfk3mpTUwp2q1DD+6nfWrKwkMU+VNBq1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kls0bKZU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752548707;
	bh=ZL278GixSQSeFNHfFdi55gv1skoqS6DRQLFoBXIfvXk=;
	h=Date:From:To:Cc:Subject:From;
	b=kls0bKZUdVOR2B0kFA8w/N9IBmTF+O2dZ+U6cX26xk+ZxPyuP3Al4NblNjrIrF+0B
	 RSXbUcwJ++Xnd5aBCtk5V2TNu8Z6LENyO3rd1OIJX160bTnaTO8sAE0M++n2GYAAh2
	 QjFe5Q1xRx/na9DdYKJ6l0K+oyavTzvZ36hocBBB6Nr2li7Tk7SrR8dzBRFmctRJ/F
	 1IBfdxgkhxh8Ve8+nVJmWw3WVWj3eJyLQAdvdDYWfh/6692TmMBwYd2QtSdMn9hcSj
	 8+uRHy/43RFm2/st8yhT5MYj5scUp9My6ehihz3CgKGg+3AchRawIHoa5R7F17ZqC4
	 v3Lwwg1RHnDIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh3vl3myvz4wbW;
	Tue, 15 Jul 2025 13:05:07 +1000 (AEST)
Date: Tue, 15 Jul 2025 13:06:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c tree
Message-ID: <20250715130652.5570887f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VopEVp+pIJg+5G7jBrZ_2Js";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VopEVp+pIJg+5G7jBrZ_2Js
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the i2c-host-fixes tree as different
commits (but the same patches):

  6aae87fe7f18 ("i2c: stm32f7: unmap DMA mapped buffer")
  c870cbbd71fc ("i2c: stm32: fix the device used for the DMA map")
  60c016afccac ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
  a9503a2ecd95 ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe=
()")

These are commits

  975b02f641ed ("i2c: stm32f7: unmap DMA mapped buffer")
  36ae42978569 ("i2c: stm32: fix the device used for the DMA map")
  cfba2fe76b2b ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
  7c18e08f4c3a ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe=
()")

in the i2c-host-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/VopEVp+pIJg+5G7jBrZ_2Js
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1xcwACgkQAVBC80lX
0GzGlAf/RQU4XRLjPvVSEBeRsDUn1pUiGx6093JppvfaWC/JQFfpy4yMDiJtqhtI
D74X4658uwJc1cJ9c9vlJAkGu62JD2tsDkAaoEHqmpzVcUcvSZjChi1Xpve88rJR
4KGQJ9AHXyK2AEwdWILevI6V+dZ3QzFnJ7I1R3PIxgQbHRCVHrafgrPy1sboeZJ1
lQFWtmCV02aYZJ3IoZtHzTuGwy4xnxNuRkJ/18WATJJMQIOWiLsqmRB8VAGAkC6F
69thSYeFC0Mg1V0HeVIdEdO5Rj/Lg4IpHJqD09AL6sPEvh15xESF3hSpCdM813B6
jWOt3o9CTKSA2hlViYoPdeH7wGxlKw==
=19Bh
-----END PGP SIGNATURE-----

--Sig_/VopEVp+pIJg+5G7jBrZ_2Js--

