Return-Path: <linux-next+bounces-3254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98494B309
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 00:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F511F22E35
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 22:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F80145B26;
	Wed,  7 Aug 2024 22:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OmUdrDor"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38308364A0;
	Wed,  7 Aug 2024 22:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069856; cv=none; b=exyWo9oWHMS4aL+J4l+rNR6v8QyB4U1LPj9Sd/qSXAQYu8uhpQm/G/4jOaiNUFEnHxU8QtgIEqfdx0ONynwRzqRlHVpuc8lOpBWZYzB1DAHubFzMFHPHEPo6qVUeW1f/NQFazaJhF46XMyWmY9i3O+vm0q0p+GhZGDpVezIC2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069856; c=relaxed/simple;
	bh=rIoH3r3/EvdJogO/lteX7W0WNAxAB9gDhvgJ+TSSs4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IiF7qvqzIjB51IJc3Ml+b17BlPGx1geTqsOVCy3aE83MaewG7OF+N/Vwg+37u4T9qz4EvfttJVZpVoT5rCy6m9DPfbmoWs8BRKfEIe+KWYXAUayCj1vaFMIMFjoruX4eTb++QFOZxskjoD7zXeo7OEA+c1hMzDQnhx44ZtRVUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OmUdrDor; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723069851;
	bh=P55Gboe0gMOsK/8axlDqV+WlXd/yhxHFfxsQtCZIUEU=;
	h=Date:From:To:Cc:Subject:From;
	b=OmUdrDorPxxCtllzjPxC7/hu8xXMqor3bhx0V9GKzK2/risyxXtTwMCJtGdj7qdW2
	 i869lWMo7lMcZYrTSqwtbfvVNSP4WtPaAbsfAyVS3Jz1JoM7YOSXkArXAx7Rtem9cN
	 Qh+6CHhE4FMRy1jEiMLu+I3Ssr3sda5RyvSvXi+I7q0wudXgRFWcfSr6A24TqVWZdw
	 6ck3H7Jwer4DIJ+Ua9OQzmLXUfcnK345BwVB77Meal7isWmRoxUbq4HeNW0ohoJ9AQ
	 OFk3MYRQVccC3xQPGAjGpSFu93tmQf2GUgwuXNKzQO0Du+rq3GET+dJl743KE4Hjk/
	 UOd8f8GCwwkxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfPyg25rjz4wd6;
	Thu,  8 Aug 2024 08:30:51 +1000 (AEST)
Date: Thu, 8 Aug 2024 08:30:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nvmem tree
Message-ID: <20240808083050.6ac578f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/21K7G9=.+/G9F3/e9+R7o/2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/21K7G9=.+/G9F3/e9+R7o/2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c258adca4fb4 ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvm=
em")

Fixes tag

  Fixes: a0cfd5e99782 ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt t=
o yaml")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c7f99cd8fb6b ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to =
yaml")

--=20
Cheers,
Stephen Rothwell

--Sig_/21K7G9=.+/G9F3/e9+R7o/2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaz9ZoACgkQAVBC80lX
0GzBDwf/ROw1lA/cpCGmRbLJDwJaAxpsBcy9qC4TnYKeup05L2H7QrER2JwYXAT7
sUNGLi0v4T+c2WIjuBR8mXF+aT/cNEY+XU6EyKAwuK0c9C8jvGOQusfOo0yX/Vet
tmfhjuuAU52eOkDCwayiayCYtu4Q3mqqOIeY3cQV/uMhKxAwQs2v7kqTBhEElPJF
3USPsKdyESg9IU7rldJF5/P3a0lhdaqI5RZ4xis/mhWZH7FHpDuZcc7K4al/V2k2
lUf1Py521v7780gLJAEJOHxfYxMq4bUXFTRvU0PRlNNEgJJjOK8eQSU812twyQ5E
Ifs0jkMTN7GFELpE7qDq0cSeXgvU8w==
=R/pk
-----END PGP SIGNATURE-----

--Sig_/21K7G9=.+/G9F3/e9+R7o/2--

