Return-Path: <linux-next+bounces-1719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A888B43C
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 23:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985D01F612E0
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 22:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12C273167;
	Mon, 25 Mar 2024 22:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QNTMAAh3"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81166EB6A;
	Mon, 25 Mar 2024 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711406217; cv=none; b=R7DdJLv1bHlWOWiIj3WaiGPxbtetyCttLENQGO60da8gb4Br9LLvm7qT8SEbmh6y+h0YbhTFn8+5HN24ncVAggn7lFQx8vuYDdEtuEw4NHeLz8Xuoe6/87fwdBYo1TKaGT+/5iMzG2AbMPCNqvmGyJAxVNjPigks7lYYBMeRaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711406217; c=relaxed/simple;
	bh=ssLqTCLG7f4jLUgKY/9k31Who+2s6QehuJTm7mFncqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k4H7qY3dWT+5QkrgqvF8qJnV4220uzd+uhZZZqpQUyPBjy2/9pOtNA/zi0cvPB16X2v7qcfrafGiVE8+pdzywTG0P7WeN51+HVIzBK6sUGlEcrkKW9w5zpbM0xDcG+WkM7AFPWtCT3SkImgkZwgQIPbCB2xcqIEGgX0yKIr1I80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QNTMAAh3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1711406206;
	bh=IG516quDQVjB9iE4IqtZ5bEMIy9SynxPWpITdLg6zLk=;
	h=Date:From:To:Cc:Subject:From;
	b=QNTMAAh3OP8soPObfF4Kh5tMjmnTKOmkqfm+Egwj33fV4ykTPgzc8mcr1koeVu83t
	 45MIlA7BAVKDhPk/7RqZdKUYCCPA+1bVjNRZJDURpBadCmh0/t16B8TuSTRjcBzLDE
	 7NH9jnBYTu/ufToDN7e2iopHkMf2Oum70J/Hy+xZmGxEl/Z/yO/kOlqVfofsnEfyS+
	 lCkONxQ4rFUWkbHnM99VRMh4Xemd7ocE8uiPzIcdtAATArdTET1VtZkrjibFXsgPMW
	 rIdKp7lvmI1x1WKafOqiRpMGCaKIErAV2iWxdtMr0Ur9HnEVXM2yhTZJWdOJ1Q4uUX
	 JOmPp+u7SILSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V3STp3zFgz4wbv;
	Tue, 26 Mar 2024 09:36:46 +1100 (AEDT)
Date: Tue, 26 Mar 2024 09:36:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20240326093644.72646050@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5AwRWDU2MUxcIMemAAPzqTF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5AwRWDU2MUxcIMemAAPzqTF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the btrfs-fixes tree as a different commit
(but the same patch):

  a9c9b8c80225 ("btrfs: zoned: don't skip block groups with 100% zone unusa=
ble")

This is commit

  c13e27e4f639 ("btrfs: zoned: don't skip block groups with 100% zone unusa=
ble")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5AwRWDU2MUxcIMemAAPzqTF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYB/HwACgkQAVBC80lX
0Gyhfwf+NzhLvf8MCuM/dpelWYU1yyslX/3909jIsZCRwmWD2FXyz7MrxUuqjAeD
V8SeLfoLBE9VhgpiaDipz5bspiWkcAOjIPQdQ9Ozw9T9ad3ttaGX6M+2vpdkwLJ3
uu49JUNy4tGl7HYec7w/EHUqaUBgUyuGBJpMPKM199RaGAxNwZKupBO/GMAH3PXP
tI69I+IJbvCUmnWLQx6U3ufpBersTIVNMSmEjw8SmBdR96zEIJr9Pk/iS5NEHX5y
tLmd0uDWbhA7Wkf5gv1WJH8gNyeVXXxRLHPjKSDjtXyMw2vRPV6lhcla8wvnzHhD
vKpnLjKBmEIMLgkMsqqfG4V5F1FFFA==
=34Bj
-----END PGP SIGNATURE-----

--Sig_/5AwRWDU2MUxcIMemAAPzqTF--

