Return-Path: <linux-next+bounces-2645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AE91534F
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D850B24D86
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 16:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED5019B590;
	Mon, 24 Jun 2024 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLjOTljl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C42142625;
	Mon, 24 Jun 2024 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246010; cv=none; b=VlRb0xx5tE3+mnqpCLpTUET9bBiw8/OvCwZsxRFzEfYI3fhS16u7/3rUU1zDKT7jtskWOecemPCq/5kKEEFnzxGR/JcBvqsH8qsnHjN+OEWRee88/4W5EGOggZ+U7l0yUBkSJQp05snPxYrB8eoag+sJBk5ki1k7MHnTQtcAaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246010; c=relaxed/simple;
	bh=AgvsOSPEnCgrZaz6W0t4pbDzzCo7NW6+3HZm5Pcx/KU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5o4v766t40Bd1xqd3Xcj4eAvaLEZS4kmmjGnuaVGTDx5PvqHBWkncIj4qpZRbJQAdaHYWma4yY0rNZz4Et7b4uuOvyyic6mwIc4sZ+bn+fw0asvC26SsqVueJOLtk/U3GshX3J0Dhj3vCzJJUGW37dSF3qyHUAWw0oFnLmotqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLjOTljl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D20AC2BBFC;
	Mon, 24 Jun 2024 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246009;
	bh=AgvsOSPEnCgrZaz6W0t4pbDzzCo7NW6+3HZm5Pcx/KU=;
	h=Date:From:To:Cc:Subject:From;
	b=WLjOTljlnQZ9POS5c/v7SwB10AWJhRjXZajdh7ydjYjrtqE/yjpXSHglW00309NMS
	 iTVJK+TD2hemAJ8IAK8uA1qGIG5ucb0hnNvR8/4KyiKoPniD3y/u7jRInqEB6GQ72Q
	 sn99FL4si3ADfUfzMnYbajYp4km7crXhs4jG1NAq4DaYSwlZv5W/50Jz4zFkq1RY8x
	 HevdKkWd4kH5iDe0bbByc4Y7kFMEp4/HrlI1J/TTMcQs1zfQ7RMCRoFLKQUuyCdUki
	 GP0DsdfSMskicYpTu14j9CpAiCwygg6gkqFVmR3aOu5D1Y0PwP4GsmMGYYAfi4UZLS
	 ijrFMw7jtaQRQ==
Date: Mon, 24 Jun 2024 17:20:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: linux-next: build failure after merge of the drm-msm-lumag tree
Message-ID: <ZnmctV78elxIFtCV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OzhFpMnD5U+YYOyJ"
Content-Disposition: inline


--OzhFpMnD5U+YYOyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-msm-lumag tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

ERROR: modpost: too long symbol "drm_atomic_helper_connector_hdmi_disable_audio_infoframe" [drivers/gpu/drm/msm/msm.ko]

Caused by commit

  000d1940c90984 ("drm/connector: hdmi: allow disabling Audio Infoframe")

I used the version from 20240621 instead.

--OzhFpMnD5U+YYOyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5nLQACgkQJNaLcl1U
h9Dyhwf/aE00dFlj/i85JoOZOI+HoeBOECCZ86tvhBvKOXwkqPXK0RJ/pda3pQTZ
9pmQsEalJvLRMcIpAIIfQgWA6dd53MUesshXZwnlMxSRDszMxXFuwCTRpNdOmcTH
qCOZREc5QaHaiaF6ABDKK+f6JVmOuoYk6ZljTDkhDazce4hOJIyWYgtC8si8MS4s
K6HAX0wKNoVCIjeVD4YE2NT9RWsEbZZTlmNZQ3VTxxuMngPXTI81fr12H/F9W3C5
AxQ0AtSGILqB/zbDicMsGZeo2rtG/nmbixeIh5PC5jUo2gn5BpZ3l7+/2yHNZZkx
avod9t5pp6hTvZBrPOQNJ8hn+qoOFQ==
=Bkdn
-----END PGP SIGNATURE-----

--OzhFpMnD5U+YYOyJ--

