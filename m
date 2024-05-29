Return-Path: <linux-next+bounces-2414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C68D2AE6
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 04:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B9E2B237FA
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 02:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C958C4DA08;
	Wed, 29 May 2024 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Rts1GErr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD817E8F0;
	Wed, 29 May 2024 02:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716950136; cv=none; b=CuBO+403GIu0bzWPes1UgIdI0rr1ihR/6P+JOF84jBZh/uf4R5xb4NLgkZBsQEJfL65HODMAkur95YLvSkpaf152Ivits+e2Tr7B4xLhPUcSL9Jp0M9DUC/6Se+ICFRK9U9icc8ntF2djYBD7Q2k+gL0ClCVoIU1SA25vDuCVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716950136; c=relaxed/simple;
	bh=TW5Xcn0xnAv5EBBgJAhsWxo81BhjhRFk4kTlGK3u7GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QIOxglp+97cATOznbfcFmsaRQQFLbwMPEJD3EghBToK/4XQgufJtdYIAMv9lAPiueqfuo160xXDL31vf/jCXjbs7pgi89FUT4jCuxpGBOLvnAQV+waXBOgFBKufn+5/updSVMnX/aupnq0GmWaEqRsrXfRCd72+XM0+9Wefq+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Rts1GErr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716950132;
	bh=i5TmU9yV0PI4EyOM3a6WHyyJ8VIjw9e4O1pSXH0Dlcc=;
	h=Date:From:To:Cc:Subject:From;
	b=Rts1GErrSQLI5NRtA6sa7Bxxqqnf6uj1hUUfRIA0LDQDhEVfn9ehV84mgJ22KLFKC
	 pd95hE5wH42QThtq3d1LObI0lVoVrKeAylFjoekiBkGNkjflUGskrpMCpTCK9K6gg5
	 NqQQwWEnRmBDC1I1R2pLcrBzlh7l9RuvmdluttxlqMvWbpJUGy/AB1z63ttdQsfzZR
	 bjuPQFUtCoQ6aMamh0jxiiW0EJ8GsxpBYO5pPRp+eHVhPX//hwhQuqBzvFrNgUPm8U
	 iL++BmGFNUNrgPXUancfbr5JtK9z6jgbi/ZhGXuFcPrJp5R+tH2l4VXw8gGrfjctJI
	 3umQSuOaz0hJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vptlm16Wqz4wqK;
	Wed, 29 May 2024 12:35:32 +1000 (AEST)
Date: Wed, 29 May 2024 12:35:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529123531.324226b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sWwKsn.AeqU0RI8N+udYfdi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sWwKsn.AeqU0RI8N+udYfdi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector_m=
ode_valid':
drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaration =
of function 'drm_connector_hdmi_compute_mode_clock'; did you mean 'drm_hdmi=
_compute_mode_clock'? [-Werror=3Dimplicit-function-declaration]
  213 |                 drm_connector_hdmi_compute_mode_clock(mode, 8,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 drm_hdmi_compute_mode_clock
cc1: some warnings being treated as errors

Caused by commit

  ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")

I have used the drm-misc tree from next-20240528 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sWwKsn.AeqU0RI8N+udYfdi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWlHMACgkQAVBC80lX
0GweSQf/TJeYvl4unIeXnWL+HOHTA83UiOZHhpsW1EA7OWowgkXskxQKCeFt6wB8
8snvO+7+4F+XmxVewkN3NiH4UdT/bYN2S/Z89yMlQn9F+JgGN3SjR/Nd4A+pVSfT
IsiSXicRn+XQvsOhkSFYILjiWWf7LVDF3dQCyjJ1nlolGV0F9OMFZT89KsAHFKog
pzjVXX2rvV7D8Mt/0BVzwCQ+hA1B6/QLZOK2r4D2fX1QABJKNe5ZR41pqgwQEsBn
b+RhfGXfaEriC9/28XbWUNj+qVs/VkatBZN6k7wjSiBLWJrAhyy+GYh1eJAHQppe
5Yl6eUeGHWY7395orb+64W6rrykApA==
=NZY4
-----END PGP SIGNATURE-----

--Sig_/sWwKsn.AeqU0RI8N+udYfdi--

