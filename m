Return-Path: <linux-next+bounces-5187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54675A0FEB3
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 03:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C85D1889479
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 02:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65C6230263;
	Tue, 14 Jan 2025 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WSRyNVJ3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1F22FE06;
	Tue, 14 Jan 2025 02:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736821296; cv=none; b=Pcauwp9AMx90h0CxBhvIrOyDOrnBRcGYzmQ8NjoaxRtm2gChDtqPT7t121+6XZ1BGl7Th7/YaD4P72MQPsiKLMZuzgjquZNrB2WUxb7ORpJzKn4jSWQG7W9p2+AFpgNqykOCxkQseYkusnrwMwHl4JuRorVc1oenwnedGDYT0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736821296; c=relaxed/simple;
	bh=NfxBVFDoR6ompb4Izk3lQBVBnoW137IcnG/BQCz4uns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HZ9XMUmKyUemSQuIE48Q0b/FNKN7GGgpL3f3a8MFWuVi6ekJvinyRQva+w1Hy/e4hy6uCpAGvXiDtfFVwVzomUNr/kEEBynpbqpGaJ4k/DoIYbFOi1OuzxDcILV4g18dkpB5YhyjqIJsmzpL+iLxBmRDPCdopVCIB67S8KIEGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WSRyNVJ3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736821284;
	bh=pdn0FLY1UvVW114ErjAbAQIfPXo4Qt57QW4hdUgSUA8=;
	h=Date:From:To:Cc:Subject:From;
	b=WSRyNVJ35+Xcn9xHxSO1OBjrHrc936rp+1ul9f3FwpM3t9TzzFEIjF4fzBeZemX4S
	 zsm4Wxx5lri39Lujmmm2rycnbdgxPjxsCMHNv/UIha0EE8I5WDt2ClXbvFDBRIEEDP
	 8WJqBMh3+NJHluVLi9901DgbSqN2YdpiyikJAVTUmpfsHBZ6VL+TOxBuUvshFKo67h
	 EVinSE0j77B7JsafsbVU7wcyl5mX7hjX9QhbEc5AxIyKrsUUmiqL5KOVXCMwUyLyCA
	 jqy6L2VFYUeqNI4Q4lwrMYFbhO/LGxZr9LeNHdpu3m63qpXx6vh2Mx5Dh/HWP6PVlm
	 AKR1PhV2+wYxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXCYH3hJ4z4wnp;
	Tue, 14 Jan 2025 13:21:23 +1100 (AEDT)
Date: Tue, 14 Jan 2025 13:21:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the sound-asoc tree
Message-ID: <20250114132130.4a35f44c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UkuAzdaO2bdG=8mv98/_tz2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UkuAzdaO2bdG=8mv98/_tz2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the drm tree as different commits
(but the same patches):

  5b0779ae13de ("ASoC: hdmi-codec: move no_capture_mute to struct hdmi_code=
c_pdata")
  a8e792d3f0bb ("ASoC: hdmi-codec: pass data to get_dai_id too")

These are commits

  bb1d67bf82fb ("ASoC: hdmi-codec: move no_capture_mute to struct hdmi_code=
c_pdata")
  6af45d7df109 ("ASoC: hdmi-codec: pass data to get_dai_id too")

in the drm tree.

The latter of these is already causing an unnecessary conflict in
drivers/gpu/drm/bridge/lontium-lt9611.c.

--=20
Cheers,
Stephen Rothwell

--Sig_/UkuAzdaO2bdG=8mv98/_tz2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeFyioACgkQAVBC80lX
0GxOzAgAnA3RhKJX0UD+oAt/ubD5PnVJI93mikk6zL6GLriDMO75jywDLV1ySAHm
bE4A4C+JubRc5KbkYQbwP2RpiKWGOEBI000VijApn7H3q3z0Br6K95ZQZQ+mT652
bPrWmTVzBDNrFqzKkWvQ8sM2VMM/dH34uFfRaziGVx85L+CBXW6B5BrfMQKdaE8u
a4NBYoeNtmkHsIJHWdc5RtMNY/rby1nSK0aElW0WYGi4t8doQhF66KNkVB2dfKml
0Se4Rl59ETaKn5nbKuqVmoHGZVYe7UavCj4HqAtR1K9MKiLL0jw0np7MiLBaqc2h
EFNilif1ejwv2SleIJ9AbPgH7UiMpg==
=TAe1
-----END PGP SIGNATURE-----

--Sig_/UkuAzdaO2bdG=8mv98/_tz2--

