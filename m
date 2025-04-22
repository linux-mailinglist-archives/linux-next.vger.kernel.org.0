Return-Path: <linux-next+bounces-6318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE2A965F9
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234D03A5ACA
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8538F214238;
	Tue, 22 Apr 2025 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Dc+CZMlZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF421EEA5E;
	Tue, 22 Apr 2025 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317802; cv=none; b=JQUdKfDolOtFSyrMSQKXAia3AB15y8CAnL9gyZeNuXlI7Hobk/mNWkjr9yiK1BT6NXyK9TA5McCxuNSqJE2RRwB6svk2+UVd2/dsAA4ak5+W/QYF9nBlKxUlV9pSMawzd9jexsVaA9hYWaqOd+QhES3t0qC91F6EnBaG4o7GkTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317802; c=relaxed/simple;
	bh=P0bCh9wtESgeLjsWQVExDsJtTBDzFI9nvThZPFF4jSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fvshKEsGaUWNNNXRnzi0vFXJl+a4adm2/ikNyB02ebCZz7tmDrG4tTx9sFzc30HPUzeEYJO7lDtlFUAVMY/zrVZ9/tcqcDxytZ37EZUzTsd/LDhWi5fLoGvcVONihlJQyHoIvr7LpsUFHWp9cr3dYBS3t612FjJhGoHLSLgtW9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Dc+CZMlZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745317797;
	bh=EMUT1paF30EBszmVtYpyKORouvmWGn9igjUanXXGWps=;
	h=Date:From:To:Cc:Subject:From;
	b=Dc+CZMlZA1GOPnSq6MXPpiUoa9pzL5nIPhY7aI7n+mwUUQRi2mV1FMsZ3rcLpqX1T
	 KYkLgT3hgmUS3b8TJm5fzrSjiLeZFzIh5fd2Km+6Me5TcnDvN2bZXizAHPBvmmk00P
	 pvET6rpwMYDpCK8khZJ5v8OYgp2HuzVWi9FRSos542NAAOyLXhoSj2X4UxNliIobtL
	 6QPYdoZS5JaY/03wFGhCp32YQ/j/jEpO4+XeBKud6gQnhHz/02zo1XGkZBG/OZBKpk
	 122rU0bpL9Fo5DZDaQExa9UdXhCwXmz8TmrulStZqMHAPQrkkjZDLhEHkZw8m1QZx7
	 V1eeM/tNX13ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhdln0hJcz4wcj;
	Tue, 22 Apr 2025 20:29:57 +1000 (AEST)
Date: Tue, 22 Apr 2025 20:29:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250422202956.176fb590@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xU/5VwGKUP2t23Zeb=qUI9i";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xU/5VwGKUP2t23Zeb=qUI9i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/amdgpu/module-parameters:7: drivers/gpu/drm/amd/amdgpu/am=
dgpu_drv.c:1119: ERROR: Unexpected indentation. [docutils]

Introduced by commit

  fb20954c9717 ("drm/amdgpu/userq: rework driver parameter")

--=20
Cheers,
Stephen Rothwell

--Sig_/xU/5VwGKUP2t23Zeb=qUI9i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHb6QACgkQAVBC80lX
0Gzvagf/di0T7gMO4BCVrLhuw+rBv2XZcji9BTXYwzF3ij4UToh0TdzcHOwUlOjz
ivywHcZbVT2GfW+qQTg6/dzer77WtCI9yXD38uidlP/059orq6XY0itXI3YX/vf+
PFybXdbQGi+2LXri5yKP9vjxuGJK+IeHfCjBQmPoLRKRkhVF+4sPuhiWFQOMvv6n
IUlEHiImabWt+T4ndvUYB1cqlHUrRLTPbttpLXxawhgDJ9FRKU0QfZ8OKJb2P0+x
s4DmZoGbsQt7Ps2rLicZGgsvGFlTFYA04NeagaV7iBbnUJ/jdKJP2rmkgEBRXvjS
1rLf74D9QV2obZ4lf67KWMBv2sAd+g==
=tSSX
-----END PGP SIGNATURE-----

--Sig_/xU/5VwGKUP2t23Zeb=qUI9i--

