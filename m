Return-Path: <linux-next+bounces-4052-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3E98CBF4
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 06:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5362867A6
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 04:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9375014A90;
	Wed,  2 Oct 2024 04:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SBI85lEC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF2802;
	Wed,  2 Oct 2024 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727842689; cv=none; b=UEJslKX/xgwULhDcoTqz5eBICrlmLaY7cdLJzNdFhc84o0uQQ1jStNbaj0a3PiETzryLrZTC9YZ45HrW04izFXGiW8NWwgvC/AwNQTrL8wcJv9yhCbWSjwUUqvTRS4bFHSC6FLqEy5J5TLH08VJXqL3n+Sy1koaeZSHANkR0LGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727842689; c=relaxed/simple;
	bh=ICNRWiMVZqHvfBLcfu08LquaB6OKxP+1TND66rJTAEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ogKdSqYy4Ph6skcRI64qL5xh8kBZhK/7glcCfqWZ2LEyDL1355UQVz2r7iAFWHcT1x2Op0DdqJZp+HgsPAerlWhn+zaMCk+DfK7ao35HQRA6pHI2Vyv93LtG7i2Lalh5jdultY3YzOBj8oq4M+6k7RjgoofUH7v5ben3sApw5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SBI85lEC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727842677;
	bh=Eqt35iLROCnoRolrsZVDnEITXbzUiS2IyRGtACNsAlc=;
	h=Date:From:To:Cc:Subject:From;
	b=SBI85lECG/QJNqxvD+3o+WauTaL4FYhyWSFTkuEOvsdZd0rP/5132QJytnpNln7VQ
	 GlAaQt4TfLZx4XeVUej6YneXdENbiIYRXS+v+SrND/4C3+XfIF46GFAE+eN9ve1zoZ
	 ciuAq1Rv2FXS1TLNL4qbLTX4gCk0sMngaYbPMKqTxAupYAiHUy4At/AKyZZlzPOcMt
	 B1W/6EC2fuASd72nY/6C/1poKqzbhwrBqmqNHg+q1cZD8beWQiZRpI7e0x7RT9TCX0
	 Ia5+SBryXAs1k9WnkigKFyRHqCrwMa8wSr9UfruiaOLEOjq67vUnUn35UOA6LeL8ba
	 jdTgd7qBUrYaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJM3n1YKQz4wcj;
	Wed,  2 Oct 2024 14:17:57 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:17:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20241002141757.6e56e228@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2oeMoali_q_vMSxfyaLGUm+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2oeMoali_q_vMSxfyaLGUm+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:378: error: Cannot parse struct or=
 union!

Introduced by commit

  fa73462dc048 ("drm/amdgpu: update the handle ptr in dump_ip_state")

I assume that the forward declaration of struct amdgpu_ip_block needs
to go before the kerneldoc comment.

--=20
Cheers,
Stephen Rothwell

--Sig_/2oeMoali_q_vMSxfyaLGUm+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8yXUACgkQAVBC80lX
0GxeGgf/bvnFKUPO0AoetQ5L3g+3GSsBX//aGZdWCpYR5IgMId20yr00Q9WvvOPI
grwWM0/R4haNDsHd8yOogZYgZ9QBI9BkjMIv7kaItnafsismjjMl+/H5iJ871iNd
BSl1rlrgUfoD/Hv47wcRX7HggbvOzuefa7Uhqz1tMKZnxNcjfKOTjs07OA3Rtvis
jP62DlBHU0yD3QHwtWTuYWRsShaAmiLKuvPME1XwnNxtjW4+hU/MCxD4qFpCIaFG
v/tobW2X5COejkztwgFB643qsOb5E5OJC91KkA+bS/XlpIlsMB1CofoTlr2fPkki
ir3WND9U6Kllv3NY2CV+Na5P+5he6Q==
=NboS
-----END PGP SIGNATURE-----

--Sig_/2oeMoali_q_vMSxfyaLGUm+--

