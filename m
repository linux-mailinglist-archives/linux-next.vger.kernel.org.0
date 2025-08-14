Return-Path: <linux-next+bounces-7952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D03ECB27306
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 01:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF14B4E0F53
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 23:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645BC219E0;
	Thu, 14 Aug 2025 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LyHBL5eJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3C13A244;
	Thu, 14 Aug 2025 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755214352; cv=none; b=CA9pphK6b32U5YzqjNSJVnW7PUMST0X9mmf/oKBq2/wxwBJRYdPVn3ZCrQ7scgnly3WgNVknlENecAKHEhjSROPchty6pOlIFlGx6cN3yeI856UDjhC70+MOVZAg52PjoT05YQH5Z37UqadDuUsY/cRtjC9fU/ofsO3frkhNkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755214352; c=relaxed/simple;
	bh=dWP4+uv99xLQMayYuPPKsY4+QZ4LpjcB+cQoINWJnkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Io5AYLCtQp/iUTGafu9XYNH3dTXZREq0d/Ejk0mnVsErtULVmJAvvpm3GeXWAY8XhA6tNM1p8pNLyZOdn+fWlRqFvhc5MHNNC6u6CF+bdSCPHaJ79KRLrSywt+Y00RbO30AjZYmc8zlnyBOOfmvAJXYKE6yaJTEiUjmWAmktugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LyHBL5eJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755214344;
	bh=ys28pH/y82uYyk38gZ/1RkVV4Ftw3J9DsI2yIX36ghs=;
	h=Date:From:To:Cc:Subject:From;
	b=LyHBL5eJx+r4yy1180DVGG5rRXzowlOxp+KFgVBE5bd46algDDPgoqBC00crHesV1
	 gHhjcb1Imc0x52vmexchQq+w1GUChvuqlsivmOY8+Ife0O+CFZ6pT3l3LaorrSL7c2
	 hrrcHTtSRPP+OXqALXfCmGqWhjafxC/44SVzbOWeYmhg/4FpTxXeAatyGH2WHOz5Sg
	 Xb/m5KHb79jMv/l48UajFALxi2P4RKba/OXDtd9oz2zDAXojirmLloBq6+EewaSXtz
	 tIRFwHvcS5UbtRoQLL/VQPIZBGZceYMydrENcEdQg35pgNB+AU0vxelrDFSVH9ZcYv
	 I9WC26L2YtzWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c31k03BT7z4wbR;
	Fri, 15 Aug 2025 09:32:24 +1000 (AEST)
Date: Fri, 15 Aug 2025 09:32:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ksmbd tree
Message-ID: <20250815093223.0ad56629@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TYCw+O6BEPAUQ50Kl9uZzGI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TYCw+O6BEPAUQ50Kl9uZzGI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  862d28dc8b48 ("smb: server: split ksmbd_rdma_stop_listening() out of ksmb=
d_rdma_destroy()")

is missing a Signed-off-by from its author.

Actually this is another case of a mailing list replacing the sender's
address. :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/TYCw+O6BEPAUQ50Kl9uZzGI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiecgcACgkQAVBC80lX
0GxnhAgAkOw2ynEO/sGaSwwIKJhtmTeZxDTo2eJqkF0NTQ0nE6HGVo/HKkxS1gml
39bGxkSNHUs52kJd/ran6thl3uQwL1YzrYJRy/YYAeSEpzaQVzGLYkYsJ+XGi4tB
6DBqbPmrrMHoTbj0EbusnDX7v9D0kh4vmmPvJQ0RBp5irTnBEC0Z/chNcVuPW2Dl
SkeGttkSY39Ga/vV5BmSQWEPz/mTklOtTYvID/fWaM3Cawq/Ba6A2K0IEJAIp1aU
tbs4B/oHYZabGCuOR5ClYhQIXg7/NwoFcOnhIshZ3Cb6WJm0UyULkHzjY6z1eQS6
78Kc7nJtTLNtlDBWw9bxNMszr22+Fw==
=jazA
-----END PGP SIGNATURE-----

--Sig_/TYCw+O6BEPAUQ50Kl9uZzGI--

