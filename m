Return-Path: <linux-next+bounces-4406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545A9ADACF
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 06:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26140282936
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 04:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2642216130C;
	Thu, 24 Oct 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uY9yxN+f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82EC15099D;
	Thu, 24 Oct 2024 04:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729743335; cv=none; b=qIr9ufmyd8vcKBV6pMDu8Gp0FXCdhwQUsZGNCYx2b4U41KQNFnyMZhfn+MgHFXw5VDBhb8RX+kH8eyMl3iRGkeZfB5PWY7fyNHS+hBUmEcLDp9pQRCmLWhk/fnZJqDSlOQNFstPw+rofDFRM+JT0emFqMwHGwMDByg6+NAGUYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729743335; c=relaxed/simple;
	bh=FA9HwSO3ejl4RGluV6Emz8Dq/LYrny4Jzjq6BWffdZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VTBY7ZE+HM7Gtuy8Bvn4aBB21/243/bLM3DeqbEks9DNYD2KaatdqlYepls041mS7Jsb8oT9xgRJ7AtEkTYEClNOxcwNW5NZ7eogAGkhgyStm3HLkk0YT4NAkCaqHUj5JYjhNOi6m/oX8uP8L7m9caMm8hWs+PsENcJU2V1IrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uY9yxN+f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729743328;
	bh=4J3vDMVgrMEliZzupCQHWOty1ue4L46Pht41KMTpiWI=;
	h=Date:From:To:Cc:Subject:From;
	b=uY9yxN+fCXGaz3HDxxjUdLMVnhM3k3ikA+G448eb15Su9TVnEx/l7QlW3jF440ypm
	 mKDVLgAeWwEnflLqDrr0ncdeslwINcZKTSYU1r6yqCzIG0ujrBhK+L+OStZKCLiqrv
	 fhzV/cQoxdCGdYcyHmmuE13HCHeaZGiDWvkRa4EmIRPegub3odMxjSar1/goIGWyNO
	 Qt1VMXelrGgws5lmAqHKJ5xOTLV5TMpVWdVV1z/DMWyAS95nUZyeMFKfvcU2lBYoHy
	 Bf2if+QgqUQx6kraa+oIM9dWaEbUHgx5nScjqojjeV7VleWvfF3UxhpUHt/mlqdoVo
	 X/ciw49cheaFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYsyl1blcz4w2R;
	Thu, 24 Oct 2024 15:15:27 +1100 (AEDT)
Date: Thu, 24 Oct 2024 15:15:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vhost tree
Message-ID: <20241024151526.162b4c4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LapE3Twm.6jL/s11E41e+GF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LapE3Twm.6jL/s11E41e+GF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

  9d0596c68f32 ("virtio_net: fix integer overflow in stats")

This is commit

  d95d9a31aceb ("virtio_net: fix integer overflow in stats")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LapE3Twm.6jL/s11E41e+GF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZyd4ACgkQAVBC80lX
0GzVZwf+JOE2Y8B5ANwZ4PebsXxr+YseynI7sHOUOLTX2dnWQbBVsmkHDebuGmzl
EZGf5reNySreAPhFiHBl2aKLxj2pgKYLWzYWSmdvr5eJ5KmGecDnaErRsHQyrthc
bgM6m36ABeGkRbibJzBuWKxCAsyUvU+VVp6lzzK72D8BmQMN6SUnYDVQjxYnn5B9
UYUbyo1YstIOt9SaonaRoygcZq5smQxP11CW3hZF+V0YPUEgbe2z7dUfL/mAax62
01nOL3QX15zpdDkzS/bouPo2sYQEvTxxoqNmdGymSXtxhDFU/gtLqsHOcYpaYSft
dlAgjXGGyd7n1CXEn2hplxmbopB42g==
=UTE0
-----END PGP SIGNATURE-----

--Sig_/LapE3Twm.6jL/s11E41e+GF--

