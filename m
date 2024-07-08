Return-Path: <linux-next+bounces-2833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 838BE929E18
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 10:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8822835AF
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493873BBE9;
	Mon,  8 Jul 2024 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UpOJQQI/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D83BBCB;
	Mon,  8 Jul 2024 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426391; cv=none; b=ara3GcPHLxDSoCFlVYcsxCysdjw/IEagz96GUmS3Ehs5lpaJLJO3rA8dPWTwp72cs3WF0tFpanDq7Zchq5Mq+F8pZ6kiqXpp5G4Nxdu88lsShpZmOaN6+VVEwFFgDg06BZrJkV/f5uj9MadSQv4rIm0x+L11S6yQ25PQ80tAp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426391; c=relaxed/simple;
	bh=BFUzIPOv0ySPwMa2mu7N1DXM0azJEfwzaTlkkdwaXPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rijs40iZNZ5xqgqvJNYqGJQ0k7qRcTQ14hVhUEqh5+8Uz8hRASfYVTpCTVHiVzhTqogNqQyCvCqMnBJi2YD+PZJ7gnjs2AI3drbyIiELmgxZsbrYASGfnp8u0BH1B4BvtJUIZEIZ7ywoKyqflzl3iFs9AHzaN8eiap1caOtOsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UpOJQQI/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720426386;
	bh=ehOoMckc9mFUvnGz+TOMtMd6HLV8308mNf5RbSmYXqs=;
	h=Date:From:To:Cc:Subject:From;
	b=UpOJQQI/pC74Vdyw04KOnZ2nVCBeyjAvGoefzjaqz4zpBkvIZsQnLAeI8FAPsJXaW
	 6Lg/W6g2gF8uvozY3x/7J/yZeP/7ApFMNVcH0rbyB3SuHEdd+kcLt6SPfyzeKmBFrF
	 BD8LMq0oQ29dXoLpp2E9RxC43duv51SZ8ND2pyUMxuBqNAd1A7pAxwsuFaAjUumQAv
	 2Fhenu3UQ10b4JOwUbMc6GWInkx9KW0g1heMOtyjl7VaV+XXaWOsXvOueftMYYuaXh
	 uLIADaM53Tc/5dAF779nAg3zMQW/9ySqc5dhjARQ3UoLD3qHOCybubUo4t+b7tDKmG
	 ztzxUFHp5X81g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHcLp0C3Cz4xQP;
	Mon,  8 Jul 2024 18:13:05 +1000 (AEST)
Date: Mon, 8 Jul 2024 18:13:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20240708181305.03d40e13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TyC0BjEyTDRErTGd+_9+y=T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TyC0BjEyTDRErTGd+_9+y=T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2bb98a88edd5 ("clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and =
tert PHY pipe clks")

Fixes tag

  Fixes: ("161b7c401f4b clk: qcom: Add Global Clock controller (GCC) driver=
 for X1E80100")

has these problem(s):

  - No SHA1 recognised

Just use
  git log -1 --format=3D'Fixes: %h ("%s")' <commit>
thus
  Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver=
 for X1E80100")

--=20
Cheers,
Stephen Rothwell

--Sig_/TyC0BjEyTDRErTGd+_9+y=T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaLn5EACgkQAVBC80lX
0GyFNgf9HTcl+xeT5x2N+36rEr7nWz4L/uGgoxhc0mB2wb3o32DZ9d+MYZQ6gX1R
WMITvU8yY1cS/KgrXWHshlSfxzgVniVpyown7Y6MzeSdD+UFFpJVtYlU1dMs9rHE
FWoig4CJnhG4gN9jzH42+l8ocl7RFarf+AmsEVoNYxcgKS7emK6qMfd6a5zw/FR0
8tUh59/j0gRUWErQsff2Ik+qWNnLAPivCvWk/ACcCRcmpeUuSFbnWtmgtRY/w961
QFyiV+6k4F8rcNNRSoh2WXolCcC+Ax9rzqVfdK31xyhQ2NGHQu9TfZ3oSFGJkJBE
tJBUnydtU34cBLQ61+q291rEXd84Zw==
=qlXF
-----END PGP SIGNATURE-----

--Sig_/TyC0BjEyTDRErTGd+_9+y=T--

