Return-Path: <linux-next+bounces-7169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6555FADE2EC
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 07:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC522189CF85
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 05:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821831F12FB;
	Wed, 18 Jun 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TpCiFQh9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8F1EEA40;
	Wed, 18 Jun 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223599; cv=none; b=rSFtKu4CILXWzkfnMWs/jc2IjmHX4K1S91hmUqDK7IjSZ6tYbFxfVSL2efWPIjg0MPJt/Q24268y7FFjnefoi6VzHwnGqIC7Qv+ziZW66B4Ls9+4uoFgooMEPK5Nh9zAVDe50UCAsO7nz1lb2zDcFE/713NnSR/Jd+vS7dUc0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223599; c=relaxed/simple;
	bh=dHBgLHs2SQ0BgYJQo+ZbkW4CETaPGbLYsGzQVQ57lTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HsET9YAKJvMBvfSkO2Lw99AKiws7RBEaAFXm1hVAU+vR4wQYVEpqGGTnhnH4xWJIM+kbj52tj0dO4nwBx5aq436q78eXouP4DekjaatgQUGFmvZ2+5nvHVaCCDCgLAx4tajwhpx9Em0bbMWkocvA5OoWILQVyxy4snJF7fl6K60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TpCiFQh9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750223588;
	bh=yIHVCIPxF7xdB0tqcZOY3hEED87RnCBwqBxtmKp7hmo=;
	h=Date:From:To:Cc:Subject:From;
	b=TpCiFQh9kvhJWgj9JxwNb2Nfc55tOzD01dd05A4Xqz6XN7IK7bO3SUjD08ea4uQFu
	 I1rwvOpBBnR+5huRJgsB4plZrVp9Ht9pi0eo3cZTg9BM7lHBgLEGRkC0QMZQbVP0u9
	 gAGHcaHr6Io4ru4cWvifYCDo2ruz++JUrqEa5Y7a2B/mBcy5KgGM2NKoODni8YGH47
	 46dQYQziBn5G0EFd92FqivcbV00Ar40yuXniEWrzdyztvcHexvO7CCSodjRU5rRnJa
	 5dtnVpKuhkM/QYvjNCwNKPNJgbKmj6OB4TZpkVqW4J9fA6Kzk2ttALg/74ygRzjVw4
	 CtZiq38hoEGjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMX1v41RXz4wb0;
	Wed, 18 Jun 2025 15:13:07 +1000 (AEST)
Date: Wed, 18 Jun 2025 15:13:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Raag Jadav <raag.jadav@intel.com>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250618151307.4a1a5e17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iD+KY8PERACOXW4l=/R4X9O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iD+KY8PERACOXW4l=/R4X9O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_device.h:40: warning: Function parameter or struct member '=
pid' not described in 'drm_wedge_task_info'
include/drm/drm_device.h:40: warning: Function parameter or struct member '=
comm' not described in 'drm_wedge_task_info'

Introduced by commit

  183bccafa176 ("drm: Create a task info option for wedge events")

--=20
Cheers,
Stephen Rothwell

--Sig_/iD+KY8PERACOXW4l=/R4X9O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSSuMACgkQAVBC80lX
0Gyqygf+OaQ5moAPkZ0CrA2HsLYfWC+3PSQzbVJK61WL5jsOOCtl73OWV62/u7wt
iHfwz1WjzQsR5zcNebpOj9D8cvSBQl98iBdPEASFgrFHTS16JHdOgv+QL/p5ckq/
AHztYucQAD63GZ3alDPJtdCXAiXCbeQgi7COOo0sM4Wt9hBbNvuhHXQsAtBFBCLy
XFrthPeB4kvxlzY/73gEL6OyE1eLTxaSDzouKyerECIooEOcdkVjoTCNIeyCB999
j9wy6b1/3kxs9ts9B2hqViQaVQzopOj9RQrIDi2ny4zpE/ISa7EGFmxcw3sOUH3p
/I7BMoZADm/aWcRrotCKScGWsmgcOQ==
=5AOb
-----END PGP SIGNATURE-----

--Sig_/iD+KY8PERACOXW4l=/R4X9O--

