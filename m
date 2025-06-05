Return-Path: <linux-next+bounces-7060-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851CACE79E
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 02:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38E3176113
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 00:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1668318C06;
	Thu,  5 Jun 2025 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NpgIfcxA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF318EAB;
	Thu,  5 Jun 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749084523; cv=none; b=X7J8f5FE2ljZZ/+tKOOnGixq9HFGEwPOwRNwYcEspWlZ3LvV0NIRz+PqoTXH23rIAl/t9X5lEL5okNqWGOZP2AI1n7tyTliUaYxGDlGl1oM3EQkMSAgg9g6AKONxwFKI6FrbaVuV7QqAvRhnOfzE7cu98ArD6EWeWNZinjgZuJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749084523; c=relaxed/simple;
	bh=Bt1uUIhyXdLS4aUaEfNXLggCzOJf8qDImRaEfyppjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TVzOrYs/xARcfiNnyw2buZaPzYMVd5tL3mP1C7lPQ4LvMUXKbqxhEFSC474v/isr4B0Mt/PXvNb2DJpYb87RDbFsKHb996P5fRHoh1jr5+4uWEAmLBCLxBZgIf3JFzQq9+9MeSLr8b3u8Rf5ViVQuzlL6d5eiVsMeF8NEKoqFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NpgIfcxA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749084510;
	bh=R8riJaruyP3aW/0lSUw4SB+HAC/3LuiYmDZGvpZHth4=;
	h=Date:From:To:Cc:Subject:From;
	b=NpgIfcxAsqj3x8ryDHLX/IgHNzUmk4HbKV68kAI2D+PdAOssvcjv6Xh05G8e3QxwU
	 74iVqMB34aLgnuYqwkd3/XW/NUtTVDF6Po3uBCS1kI2sbLBgzdeHE7Qi2+4XQ8XOnT
	 ybtA8s6Y6R2ThVUry6+jhI9Jn5u63Nz4TGnh6k6wB1iX66lGhoJ3qU2ZAK3P+VOzy8
	 UN0/2gkJXhxEyBXJTpl0BbBW74fzrB0b8uL1xGJL4mK0u+6eCx9wI+T5cEMwtBB/A2
	 Z45nqDn6cNE2flJoieV2Eet4jaGlHAt8ftjzK8S7y0w+fEoqo7dBSDBCtQP8z7sdTC
	 t8qR90SW/HMcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bCQmX5C2Xz4wyV;
	Thu,  5 Jun 2025 10:48:28 +1000 (AEST)
Date: Thu, 5 Jun 2025 10:48:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Bryan O'Donoghue
 <bod@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Message-ID: <20250605104826.3263d45b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S1Jjq_KPyiY50B76mUR82e3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S1Jjq_KPyiY50B76mUR82e3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  MAINTAINERS

between commit:

  4acbaa8794b3 ("media: MAINTAINERS: Add myself to iris Reviewers")

from Linus' tree and commit:

  d6984d0c0a56 ("MAINTAINERS: update my email address")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 95747d11d82a,afbb82858934..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -20429,8 -19975,7 +20430,8 @@@ F:	drivers/regulator/vqmmc-ipq4019-regu
  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
  M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
- R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+ R:	Abhinav Kumar <abhinav.kumar@linux.dev>
 +R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  L:	linux-media@vger.kernel.org
  L:	linux-arm-msm@vger.kernel.org
  S:	Maintained

--Sig_/S1Jjq_KPyiY50B76mUR82e3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhA6VoACgkQAVBC80lX
0GxevAf/d5pOmwV+cJLNzYyJo/iYQD4ZGCQ+tyyUVaGTc3hHdj0k+2xS5p0dzOC4
W7hqb5t2SeEWqtu18pkKdUydC455bcClzfRIju2GN5e+w7doqngNmEkTW/ucmdui
QVJcULvGZ+GqmJeD//jaGh+5VEBAUmR8AlqnDr/QRPMLXNUR53k1X8Gr5j689yfl
aqX04phjltazL4LBGd86+FzKJ1DLAWa5LKjpCTR9pr9XzAV7pm+8LFw24emwS4b2
J9yboGedsoRCBAnz6U6CtHg9Bf8MHQvUNiejY6R84GlCmxQfBU+e+q//GR1rDq8Z
qkp8v6XOUKVPZnp4I3e9PzxYy2Q1Bw==
=3Y5h
-----END PGP SIGNATURE-----

--Sig_/S1Jjq_KPyiY50B76mUR82e3--

