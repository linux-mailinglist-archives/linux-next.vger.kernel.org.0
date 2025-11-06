Return-Path: <linux-next+bounces-8870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE51C390A8
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3700734DD93
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796942144CF;
	Thu,  6 Nov 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pyUBCBu3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D418DB2A;
	Thu,  6 Nov 2025 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401588; cv=none; b=g+167eLKIV4Qv3Dz1KKFMGEHz/7UwhjW95CzpWdfjKWMT2pqIptk4RoUDfPsGCUC5kj8I2EWYONxU4iqynaUr1hRx/1pqEtaqNFmK41eug/YKjfhlVR4R/N2I6a71xXJkpXJtYuDL4TA39hzo+05Gg02IRE6KZUbzBHautUvpqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401588; c=relaxed/simple;
	bh=iMfwHlmlLvEXG9ogVal0C6KbfhLFSELWFSbjMXAq1D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JjPY/FKGefT79I/vebD2tPaCkuN3OguZxFfT7DycJM/C7dAss/Mfe3JZ0mser5E5EAR6l6yjre10xpF/A9wkslSqPAoqMHjXYmt+1pDCbGvV6yh9b8sGDZ7AdMRW/14Axe0U2YhXaMV804wM/+BhYaFpYAox/tzPlB5mCvhprxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pyUBCBu3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762401582;
	bh=Dygj8HzwGXLBQFe+enOwK7YNhZXyIRUG3yXCsDPvuMI=;
	h=Date:From:To:Cc:Subject:From;
	b=pyUBCBu3tLVhxxuKTU6RcP/aaqzaPicGCL+CLRI6PpbI5/M+0vmIogBQM80yCCtBR
	 glEXze7dT27ah+XW2KvLw1RRkaGE+nNG9GFuRxHFBVf8VwmO4uy3vUS/TpTNAsJwhF
	 G312sGjAG/kk3lXBBaFi6XqAs94Ygl/Vcc5B38/++6PAKeyL1ya2E0OArh4GoZY22h
	 I8H9tQDCnyjvleuR0/jdCStGivDQLz3Zrgs2GBk834lpFFE2K9iyM9m0/leMzEm6Z4
	 RcmPaWsS71siV6cz0FdrzE7yIJZ1jrilRcfbqiGoXcbyWj8DbdPQavxvlyJ0pQiu8C
	 o4zOuO8/xQ5/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27k65JxSz4wc4;
	Thu, 06 Nov 2025 14:59:42 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:59:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ang Tien Sung <tien.sung.ang@intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20251106145941.37920e97@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bi7uSFvWCPX12oykLwE/fwK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bi7uSFvWCPX12oykLwE/fwK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced this warning:

WARNING: drivers/firmware/stratix10-svc.c:58 struct member 'intel_svc_fcs' =
not described in 'stratix10_svc'

Introduced by commit

  e6281c26674e ("firmware: stratix10-svc: Add support for FCS")

"make htmldocs" was not reporting all the warnings for some time.
That has now been fixed and this warning showed up.

--=20
Cheers,
Stephen Rothwell

--Sig_/bi7uSFvWCPX12oykLwE/fwK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHS4ACgkQAVBC80lX
0GxeLggAm/9UXsCW7CDpptJTyK2IOO4Eh8DC3UFf/+9T2NWIa7JNA/q18SROyJMV
sjxJiJKlyzyZkK272WL70lb4MS9mFtT/8dBGBW3SsmkijhklH06cwfjnacTD2i/R
szuCoe0aHoXmOedZcA0Lb2jyj73LGDXLUDuq/Qabb8zCuc+4t3o7u8spzwLxMzZN
7Q+8xOhXBDgJv20MxGzw0fmrG+zvmxLk7LV8mExkauHn1O3ZGiCR6jUXLK4dtjiH
bwzqABvyu72B8bs89lkPEFbFi1znA2zABlhEhIdv+GD7mGJWEQCtj7w1ZbE79xz3
lRHkDeLtardCYWogcSGPJXcK8/9o4Q==
=uXTZ
-----END PGP SIGNATURE-----

--Sig_/bi7uSFvWCPX12oykLwE/fwK--

