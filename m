Return-Path: <linux-next+bounces-2961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05C92F5CC
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 08:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701D6281DEC
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4404D13DDC3;
	Fri, 12 Jul 2024 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tvDh6oTk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AF13DDBA;
	Fri, 12 Jul 2024 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767332; cv=none; b=g3Gak4R5bI07YJqo5n+fjfsRxirsC6mftoAfzxtvgpdPQNH+hYBw5uaeVJpmV+KX1bkAkbBJLpLAkjjOiFuL5Xv/+IIw5suyLFBuRBbo7/e60TrxCbS5+PSuY2bn7AvR4XNNpm4kTkhSvLOJw6AOtG1LHwg0yJEsrR3gQMHjjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767332; c=relaxed/simple;
	bh=ZbbsLwoya6tixuPpRvni4f3DMKqspE6J9o10Q7PaI/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GCzMfIL6AnvMu7rXvyKjfF03cDGrAO0fPjZzGZDNLPcyDg665rv3vx6M1uh7h9yJ/j6euYpA4GFP7MWbYvyWq/G4mxOayjqb3HJV+WWNRfBBAHBczWGBBPO8DsaAJ8gy0GPO7XpCgpe/rozUXYpnKI9cYPhm4sWy0aOzOr/xgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tvDh6oTk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720767328;
	bh=BZZNIcGexPgDWaQqyvGhePz6Fkk2rKYNueqzc4Ios+o=;
	h=Date:From:To:Cc:Subject:From;
	b=tvDh6oTkI7B87eA/a2ltawR4KNia9dCODo36jEB1I48VYf5QK0GAq1hjfMzB/5VwY
	 jOBt85hsSVIn560DS+sO9nEp1/oO1WirQtzfALTegdopRAJN7Qmri/UzAtTIx9QWh4
	 DT8+loJgaHJPMy7NbKoN6VCW7yQSAHhC/fIHpQkEJ5w5YaG1LONxHNL8XMs1R42ftf
	 CHIt3X4DZrUpRnnoKtZgyPrIi68wHQWhafIUKcLlCJsYFof2RqnJ1yJ3WDwPgnJmS6
	 S86b4LlTFdVdy8NnepD1frLHOw/+y8BsMLKe5VVmxcAxzWZ7gIKgeSRrdMpH0tDwzb
	 voqwXJEyEzdxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL2RM4Zsmz4wx5;
	Fri, 12 Jul 2024 16:55:27 +1000 (AEST)
Date: Fri, 12 Jul 2024 16:55:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the i2c-host tree
Message-ID: <20240712165527.75e4ddc9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OJ0DanheuLF5XTj8kKn+x8Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OJ0DanheuLF5XTj8kKn+x8Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c-host tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer=
' not described in 'i2c_algorithm'
include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer=
_atomic' not described in 'i2c_algorithm'
include/linux/i2c.h:583: warning: Function parameter or struct member 'reg_=
target' not described in 'i2c_algorithm'
include/linux/i2c.h:583: warning: Function parameter or struct member 'unre=
g_target' not described in 'i2c_algorithm'

Introduced by commit

  a93c2e5fe766 ("i2c: reword i2c_algorithm according to newest specificatio=
n")

--=20
Cheers,
Stephen Rothwell

--Sig_/OJ0DanheuLF5XTj8kKn+x8Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQ018ACgkQAVBC80lX
0GwfXwf/Who+FKMRc6v1oya5PAJzZ7PnQn+/ug6gJKQ4WeV/gbD3b30y9aThlPWn
13DVdCCXkhMtBPusmm3LNu7nm56YMLjB8tUZn6hRxurNXfWrB7YQxf5tk9zCJh3L
wsNgXLUPu1sXDreRtjNveU8TwaHeErjL2gPp+cKGWWuxqidmN+87d1RPNdxBz7eO
g1TAn0EzR7YknXDVY/rHMGzX/zJcaQvG/ARJ5RcHIE8MEMqUKb05iit5caHmu3S4
n5AEAEAMHVHhHDojXNzgvYT90MziyiZheeURrU1/66mG14mX32UDRYyhEJCwLD70
weLhAH2u1Gbt/+wBCdWGSmZXWTFQJg==
=Kx5I
-----END PGP SIGNATURE-----

--Sig_/OJ0DanheuLF5XTj8kKn+x8Z--

