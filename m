Return-Path: <linux-next+bounces-2447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75A8D7980
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 03:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168511F2166A
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 01:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A144310F1;
	Mon,  3 Jun 2024 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c8uLSRjD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94297631;
	Mon,  3 Jun 2024 01:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377012; cv=none; b=pqVH/1dFdVZiOqBPmsFE8TeFcxRMLb2voPrvU1zvGf0CJ22y6YDEKDu7Lt5C25rrwj6u20IHAFl3Nq8oCnC1m96FsFK0hW8CiEEwMpUxRyz2RltMVSgOXYAV1WYEhn3L4Oia/dHs7Hs9PNp6LNPKzz1r7cA9+PMmeZoMKDevI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377012; c=relaxed/simple;
	bh=f/xHKW7Ysvm1bd3WP6pR49s5/DugJKPpNXUDeQh9d+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BT8AY6xuJoQjCiu0VsIqZ8zTedgKz3MxvDTrH9gG9bnl9hGgadkObZpT5MXpbioVtWiDORWWu44L0IsFF7BG6eK0lsSXV+TyQnlTP0mVDswc7mUoCITwFUBHJNs6R4E0lJBcgdWwm5pbHvurW0cjcTAW9lYGdUKFum+iv1B/D+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c8uLSRjD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717377009;
	bh=ImW7Tk/YB5PKo4yi/ok+H73hx8fmz/gqcBNH9mva6Sk=;
	h=Date:From:To:Cc:Subject:From;
	b=c8uLSRjDTTE80UHTUpQsAvKwBGfADH3uCmrfFJqvqed8+pcK4skXwFt9fGz5/ACNB
	 T8fxe2brr2UGjV3sEKNkjps5uuaeVXU/IvxKn5l3k7cUuSd1I3vbLtQNvu49OtK428
	 Yqx+jAIAxhDdvZbZfy9DNm8Stgh3Fa2nwfuLZMzxCkgN6qEmCA+tM1xSiGwqJttJR0
	 MZ5AT9sg7HlG1J2Br8zUxHdMyWsGVNcHHWaVxprevFH2JjGjuU976IIdl6Pd8qlosO
	 cYlpXYr3ESMV82bmmr72GVBrEomksVHiiwQxaI4eZVDKZBR1LxPyfgMm6ALFZ3Aghe
	 bZhwNnW3d1Qqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vswcv5Y61z4wcq;
	Mon,  3 Jun 2024 11:10:07 +1000 (AEST)
Date: Mon, 3 Jun 2024 11:10:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the i2c-host tree
Message-ID: <20240603110923.418d6bf7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Arm3G9iFtDhC.b+WKM0dwQN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Arm3G9iFtDhC.b+WKM0dwQN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the i2c tree as a different commit
(but the same patch):

  a6b250149c79 ("i2c: synquacer: Remove a clk reference from struct synquac=
er_i2c")

This is commit

  e6722ea6b9ed ("i2c: synquacer: Remove a clk reference from struct synquac=
er_i2c")

in the i2c tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Arm3G9iFtDhC.b+WKM0dwQN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZdF+8ACgkQAVBC80lX
0GzxSAf/c6AUab/Inj7D7ETnkz9cAAsAlo4zdT38e4e3s6JTvbFI7Ub4sGZ94vLf
ZvQoJhE26w8JrsLX7hYVzBafwBBrgZAs2jfLv2BOyvKSqX7A/7H7R1+0BzRpv2gL
T4RDzI6aByNoIsFv1rFBykpRstq/LhjBfbyLu1A2rtSSBb0FBgLnBzTfa8+DYd1G
CoRLujAliQ1Eo+/1Nx6G2dGEmpeG+7wQNoBy3zEOb3JQljd0WZk8S9La3Arhde/D
XS/nUCFeAkDoxKVimb02faLAxzbCOPxSSjRj6u6jVq9yHc7A6/yqKKO4AHhhLdW0
T1dATnay3Y2dBKadbKRCxbZevFEHjg==
=l3v8
-----END PGP SIGNATURE-----

--Sig_/Arm3G9iFtDhC.b+WKM0dwQN--

