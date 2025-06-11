Return-Path: <linux-next+bounces-7133-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D20AD49F6
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 06:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7072189D117
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 04:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C9E1D89FD;
	Wed, 11 Jun 2025 04:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OrHStRM2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6E21ADBA;
	Wed, 11 Jun 2025 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614991; cv=none; b=cbSNVunfp74SSkSGN/qMGttdp3e6wGLfWRtx8h92uiGzpCZlSRyAGb33NRMG66mpxrnHooc2poMoyBtZjgudKMQvPl3c5p9tqfWGx4tDI2/hNc/DgTZS8xOk5NbVI059f8oS/MRgZwhabQd9aUsHSc9D7wp41J0OgsV71rc9kII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614991; c=relaxed/simple;
	bh=RQgdC8APOYJ/VnQMNqwHu7JJyOd86rIS4tIsNbOCJXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Omcc1zcQt87BopBRV0+RtzXi8aOFW61LtlbdN5MfwTmLDy5CH1uGhtPCSRcqTuS3NRaes5lS5YlM7ukF7q5Ih62woT3S2XZcG+2e9DOftfn1bpOI4z7Mucdyheu/iqlSnl9fNXlPxl4FGO6ITYHqvmEf98of/5sNa3xLn1Duihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OrHStRM2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749614975;
	bh=l6N6qBxGbKoR75gXRlJQAPx2Ke8Xm4jzW89L0JDBexM=;
	h=Date:From:To:Cc:Subject:From;
	b=OrHStRM2JMPQSfIiZhj3+tLjTPTvbat46PPxLn8Y3/CU9sosKWyrLlx8Cj+EZvnAB
	 TSX0ui/NW7mPaD2omCsDPj03kXTFNAc5/3WKcuuNM6L0XiqiAGHR6Ubxt9cNbC+glO
	 HKY/c8ABVdjI9J4W6X9AjyrlbIUdWefSQx26tq6+FXrZ4FtUm43cH8UbWrELukc67h
	 7UEm0sgX6jMl3u8zDiUeb3zWy34mK1BwNmB5KLTeBHYRHP/LnQQ7LlCME+lOKre0lt
	 csPX4+qSO46ZhBHU6KEo2pe959ipTCEOPf8rMdjDH346CycuQ5KwEnE0gMd5nlaEvu
	 Fo7wVXhAIR8oA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHBxp5x1rz4wbR;
	Wed, 11 Jun 2025 14:09:34 +1000 (AEST)
Date: Wed, 11 Jun 2025 14:09:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250611140933.1429a1b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=ysdFscAmXuLr1BblmDBjb6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=ysdFscAmXuLr1BblmDBjb6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_init' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_enable' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_transmit' not described in 'drm_bridge_funcs'

Introduced by commit

  a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")

--=20
Cheers,
Stephen Rothwell

--Sig_/=ysdFscAmXuLr1BblmDBjb6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJAX0ACgkQAVBC80lX
0GwMYwf9F6YQKrArb2QjOVGfFE6WQ2RdhLqrv3HI89g0k/5fpINHl922ZxuaKyYm
ScJ868bjjA6oFTENiuxtoZdx/xwO4y3aHRkuc+QND0o4QHr4Qhg6aw6QtTfMm4Pm
GeDO2wU8bYeQbYSe0VStLSonRAX5+tzHYoiBrIMiOg/kj2JoE3lFiM3y2j3qNPbU
/Gxc++SVzKVbmn/T8JcBjdxes3yvome+W6TgF05Yc1s/A7L50YUpkng/Erh8nSF2
yHwTtYY14wvdSAqr0d8KEP9RM8BXBe5Xk7mCRzz8PYnXDs0/rpeUwppm/cDCjc/6
kp4LRB7TscM60mQddnYa1Yr/G9boFw==
=8xyK
-----END PGP SIGNATURE-----

--Sig_/=ysdFscAmXuLr1BblmDBjb6--

