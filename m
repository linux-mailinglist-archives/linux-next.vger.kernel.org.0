Return-Path: <linux-next+bounces-7924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE4B23EA6
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A4297AD3FA
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 02:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6941519A0;
	Wed, 13 Aug 2025 02:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KzVCQYIX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0826C3AE;
	Wed, 13 Aug 2025 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053719; cv=none; b=CsgmsDhvkiHS3OZfCEQHQfk/ENQU61+i3WV3ebDTF8acs/U5rGHM2Qca4DzfoOAgvMiL4u8RtH590Qb6/k2rMzew4qwQSAUF0QOf1QNSAZV531oX4do42mwhTddo455Bow2HtqjVs5rw2H2uZtK3Dy62kScyuYv1hrdxtqYqEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053719; c=relaxed/simple;
	bh=ZGV2zci4zRjrcowgKXj4nNCeXLKgarUld5xg9ej0dys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WbL4PKFGHoryAZ557O0Ll4mem2SkTtJw5TEZ1F+kUGWq+uKJLjiRPJKqqbiZEb02BvREDIiqU5+lavWdX4o5S5cXdqYu8U5ZqsCNFeb47fbx1llXkKAi+u/vEKz1d+XWKat46E8HM6whsEx571rhOfuTtKlyYs7fUPzANm/43Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KzVCQYIX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755053712;
	bh=Kdl3Rl/BaIdak6TzJZ0nJvfRK+mxProty+p73AdGBnk=;
	h=Date:From:To:Cc:Subject:From;
	b=KzVCQYIXMG+3L/5YT11wLTojGF9UunRJZlK5VIR3MUaHlpJ5NLpMtg+3ZdXaZ5U3w
	 I14c5JQy6bMYu72uem5WsjbU4hEFjIplj7vvz4h4sRMN6hUCK8bvDEl4PzV3AYAbA2
	 JK5pKTAXhONHJxW/zSfe7b30W4Fg4/OyVydW8B4V4XFM70IvyY5ZVR/uGWutQyC5e7
	 GT/mx1e6hC7qh+kygamfd0Cd8Hn40BC2E2Mxs898oMcOoaZLwzvH+pK59uWjNPQZyZ
	 N7MxyapKCINrCk/5zX9AKHUuznOrn0k4QHi7nfCgeTlX1Zs2e602yA4DUT38qFk2WT
	 uz6Qgw57N6sRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1tJv6bw9z4wcd;
	Wed, 13 Aug 2025 12:55:10 +1000 (AEST)
Date: Wed, 13 Aug 2025 12:55:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the phy-next tree
Message-ID: <20250813125510.186a1636@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/11YQherIumL9DCLC29Qyjhg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/11YQherIumL9DCLC29Qyjhg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the phy tree as a different commit
(but the same patch):

  bc9c59c46b35 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie =
phy bindings")

This is commit

  aac1256a41cf ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie =
phy bindings")

in the phy tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/11YQherIumL9DCLC29Qyjhg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmib/o4ACgkQAVBC80lX
0GzORgf/c/7tmDvzOIO0XhVcst82qByKB51gmBYHLZo0BjTiSOKWYngbVsgM0Ued
nCdvS0qe4d3plWoF7dKabTiWeVzZjhF428SaCOsAs4hWkYyTSJn9nUHFuDCgkIye
oqdEXgr+i+OApzeHRvViY/FiLIDI1wApKtr+JBY8mCEeXjeeM4sYVYaYaBtdtOmF
dmR/j21DnpMLyW2Si6sGIguBGZ/bjYV1sgKOxJbO10yGb/W6itgtA1qgQ48rCsOL
XZ/GCD2QnYJmVyiJz8cv6vnWk3onqdy+qOXHd/W8N0Wqs+Y5H59F25nAr/8ndNBw
3NrXa05LhnZd/MVEoqDNbIjzoYNHUA==
=WxlX
-----END PGP SIGNATURE-----

--Sig_/11YQherIumL9DCLC29Qyjhg--

