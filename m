Return-Path: <linux-next+bounces-4165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB98995FC0
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6821F21661
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 06:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7D613AA27;
	Wed,  9 Oct 2024 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PD/e9pS6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949C28EF;
	Wed,  9 Oct 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455218; cv=none; b=RJUegecz9GRbKpFNpeMnwpJftAr15/SRvAWXoYABuQpKM1ayk0eLWkL9NZ6s3dCizTjw2/SDoYyPq7OoooNn7TiUN4nKt7bEhX0feirTeRMboEcIPssVRstm3iwrPEwKEqzrm5JdOjl0yFo9WCeWB8f12u2nzefAs+cPj1JJitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455218; c=relaxed/simple;
	bh=ro2Egh61KAB981orrAAg8jlGBOliEq8zm7Hvs2DS/hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c+PyzDPRUfFpMbcuHGyYJKJaE8+wdq3/ZgOpWgSZgEmahHnQhfX7gfSQLEXCWS6z4b/Wq1W30T43P715PMN33UIKxggVYEGswuyAqfKKAKHZCUHTKule3tr+bkHGfm2nlB8HxGcTbRmpuMlKDebQc4ui8aoZ3wthYFReF9KFbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PD/e9pS6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728455211;
	bh=7P9XX0NI6swUo/7q0hxI88EQjQYARABt9gplTZyTjmc=;
	h=Date:From:To:Cc:Subject:From;
	b=PD/e9pS6Pwz5IPZL6WQCETZMsidRPgUOXguQZrhBGJI32d0IHwyNS5S6yN11bfRn8
	 Kuh3o+QvcNaLmXIVLUagolffKp1RJ8AcYd5uYZqcmL19lFMKZ34246eXWfwghub6Yc
	 YeDk/bC2dI2aWAIkjT3NSo0QShM0u4/szEYsYsuYE0NXtzYlA3tXOzKgLb5K4s8ZSn
	 Fo7U/WHssFXu6uRK04QzRyDIAObgRHSRpcFCfPGKpv0gZlPJuA5dhjYrucQq2UPRh2
	 tb2rlkJ1fYVDtRaSVg4/fbyaRpqXT6lkU6t/VoqrfWGFL6J+Rvr9upLNJX3sbtiPcN
	 CORNtQI/gxefA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNjbH0bjwz4wc3;
	Wed,  9 Oct 2024 17:26:50 +1100 (AEDT)
Date: Wed, 9 Oct 2024 17:26:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241009172650.29169e6f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3.yCEScp.iBobUH9X0xGTCu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3.yCEScp.iBobUH9X0xGTCu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_file.h:400: warning: Function parameter or struct member 'c=
lient_name_lock' not described in 'drm_file'
include/drm/drm_file.h:400: warning: Excess struct member 'name_lock' descr=
iption in 'drm_file'

Introduced by commit

  56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/3.yCEScp.iBobUH9X0xGTCu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGIioACgkQAVBC80lX
0GxqAAf/WTCPEBONare0NFaBPSwyE3+rbXD3ZBePxOBMbAkhk8vlf7cS48XGu2QY
pqvfVu+Y5AxpXO+uWI5E6PhCEdb8IhP9mJLNIW9R08ALMhiFGrZMJ//5GAKMMEoI
45NuSl1QPvCO7yC2VORc91d8e6tMNcv+G3rOT3CW+Ifx8TljHyBjY4q7hSwNMrAp
BU1mHbBh+FqegE7PuR0Kxi/iISu0nldN5W+sU4/S/JUmt4tLw4SbCitzoPz9BIaf
lHluzPYQBMX4+Vv+gGXHXDWeezVBEmzmzCbSHgEwWFLlplBpEEILLyKkCSRib/Vx
6CgT+Z2+EA16Rk96BaWlrHU51P8P0w==
=lH2n
-----END PGP SIGNATURE-----

--Sig_/3.yCEScp.iBobUH9X0xGTCu--

