Return-Path: <linux-next+bounces-7674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE88B0CEA9
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 02:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 759B77B1C24
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 00:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8891876;
	Tue, 22 Jul 2025 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DYuCVrvi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81241388;
	Tue, 22 Jul 2025 00:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753143484; cv=none; b=e5l7aSLCyADGWVuymmbSJRWMCbtQSStHP8kKSH1EDgSnqOxhaogiyoLaTQFMbXVUThP8FD3hPn7oHHvtbV5K1oIUBBMgztZuzvKsgG5LSGVl3ZdWzRKvCOar+Tc49hB3fWe5pkgahaqSTk/xFYsCu58Xswx1pffR91lQyU7ddB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753143484; c=relaxed/simple;
	bh=QOGxX4Ex1zBcTzisu11nQ+ZEFsC9wpK644WaSn7XLHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e5mvadB2V7b5RRaXX8Gq1YlpYEjTkiZnp+gUdg3fYyof7sb/mXkqk85QINSh8ES1+CvHZ2/gn77tOkTqZOLhjzMtHhqjesFNT+deF5bFRXDdUP75U1GmKb8HrL+mizEY/Yp+Em/YF8x+YgRiXjnvmfmuU3TpVkdTMpkXCJqhrNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DYuCVrvi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753143321;
	bh=Ip1rpg8tH7CwBm6qxnB8lmPFPIJENFQ9M4qTy5yBDYU=;
	h=Date:From:To:Cc:Subject:From;
	b=DYuCVrviuH9W1xobzCr+6duAApDpTnNyLlFTfxkqL0aNWDRBX8DjV4i78TiDKITq+
	 /vSVhhJEP113/feJRTsh9EspNsCP/9fzc8BRt9CGXTH0W+jJxLJrm2bgmywLEa74QD
	 8lwVHC8ZtA9o0gBUZPnoGYNuGl/L9lDJ8EjtR9eBCIo8k56MFw56q/4AHUx1EEOlZc
	 DDfNP6DIZzGh6nJoPjYd5abvT5kb7fw4lwhXsdMASqFlPjdHpaQ39dI8Ui7KM1ikhW
	 b/ub20ewFs4HsJl++gz6iN9Rhel4n/o4AlU/ngh4v28lczqDac0Fbg+UYt+SuWNQvg
	 /rm6t9PRGMp8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmHpd3RtZz4wvb;
	Tue, 22 Jul 2025 10:15:21 +1000 (AEST)
Date: Tue, 22 Jul 2025 10:17:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bmc tree
Message-ID: <20250722101757.76c39d41@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aKjoULI32.t+HhehiwuTXmu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aKjoULI32.t+HhehiwuTXmu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  532bdc65a79f ("arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions=
" node")

This is commit

  8e7e63fc479a ("arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions=
" node")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aKjoULI32.t+HhehiwuTXmu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+2LUACgkQAVBC80lX
0Gzbdwf+L3++kJzcxCtxJDhaaZ0vQDCC/jyB+xgpE8thZFUj4pu1yftrlzU5zEwP
VJSnvcFRw0d4ThqzJalTt94ZjLs6gYrsD6u/2iFuiO7jRZP+7gQRT2Te14V1xeKS
+d9GvBM63va1gGgrryxOVBySI1s1jh7n/1uMxXWnm7uWal8DCk4cgCnicet5IsSB
jza5mb5/JSnXjio8uQeeVVXZ0rLcZwVTY8pMY1Jvm2ozNyoiKF+6Lvk4VF7eMUvu
6KEuQBlkDUTjCc3u4x9GRdZ0BnO1WjJGehMxq4pmiUqJ3sA0HkcD66B0aLDQDw8b
ZrjBz+wQI0W1a6fJY+weFVMXREIrGA==
=5Yg2
-----END PGP SIGNATURE-----

--Sig_/aKjoULI32.t+HhehiwuTXmu--

