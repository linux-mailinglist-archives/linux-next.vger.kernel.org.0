Return-Path: <linux-next+bounces-8027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB06B2D283
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 05:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0B0587694
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 03:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FC826057A;
	Wed, 20 Aug 2025 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b8eYZVFJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C8198E91;
	Wed, 20 Aug 2025 03:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755659942; cv=none; b=ZALg9syUwzDwRKed1CHUWMohEvJpecpdPiQgXkkugrXFDQMYbe89YuneUtGmj5vyk/FLkTtAIRCaFdeDY4GVj8bjwoJSSaKaFciSULHKrPDN1LZEPZP8hz8iG/u2qmO9M6zKR5Am9YZW26reK2dWG+X0YolBeWlAfaJq9bObJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755659942; c=relaxed/simple;
	bh=FOaAVhAu9FkF+aXAVCUoNSC5uCMlTMmQtyNQK4rmHEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=REO2Z7Bb+vasc63xGh9nCdN7ina/Q4zw/QQPCBzJu+WVvSDTf8jzhDbEJ5dryDvpI84HpPbgrCoabOqFz6aUfzggVYRkNOVP2RKvd6YykcW9IT6MJuvwxnBDLspBw9604VM6E6rBKJcUJyELhKA8gvxYi9NI8zNTs6bqRpsSIP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b8eYZVFJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755659937;
	bh=MO8wWdLQZvHERmdt0cUAbTX3U//Gd4AFGV015HOgWBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=b8eYZVFJeAORpPhmnKRSAeDIJ063UrByw5NzzEyeXHrk6EUOib+HxtpLQR9fyrS9K
	 On6uU5wyR2l6e4PSGWrO/sRWi4q+Ls8464CMHI/olznT+uPkn8GG3bcfxv13NHuvGv
	 taVLi/Prha5dMePdEANpGuRZJM+2Sx409gid/HfARc7fc6ajMSaWSGwZGSFivA4kdU
	 WU5wZIHf4RlFSyEEDRzeOaWm+BpzpWL7BqSeKag/Oy/CoEc7fjZkhS6tdAv76olk+S
	 +whTt3gASIG5oTg3NupGF2jAMppYa5F3KFZni4qiiEWxB0Jm0MSIha8KKNBLlQmOH+
	 AwHC1gAGFjsxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6BW419xZz4w2D;
	Wed, 20 Aug 2025 13:18:56 +1000 (AEST)
Date: Wed, 20 Aug 2025 13:18:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fpga tree
Message-ID: <20250820131855.0257c13f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nMVeVnUUMwXsRm__C2F=ATE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nMVeVnUUMwXsRm__C2F=ATE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  4f156ee58bb8 ("fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()")

This is commit

  1ca61060de92 ("fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nMVeVnUUMwXsRm__C2F=ATE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilPp8ACgkQAVBC80lX
0GxNNgf/folf3j14vJYRuRZNshjnatTxPjiPvXuoP5VdOqYVvL7qEGTNv8eBgFhn
2a+3Drf+A9vmlWwHzBjw4xYON2joshX4t6koUL6mUBpKkfiQeErNT4M0m4lkSMmZ
qvCdX853rwnirOjITuPSFIMUcog+9cc4Qv8DHudbSA4WwYEoHjlqNTChPv1KDpEu
48DJVlruuDHszUBxrr5F6Necb6HfQUSOUW6W7kRQ50Si91SxiNwzlC31Y0ZaOxT0
OzO6zIj405dNKksYyj3/hIHULAFjgMHl91q6aaJUA+vzTnDOQCguGmqvqqs6oGTt
1CoV1yp8LMWaMk7ez1qIhMEcdhNMcg==
=FVjn
-----END PGP SIGNATURE-----

--Sig_/nMVeVnUUMwXsRm__C2F=ATE--

