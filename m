Return-Path: <linux-next+bounces-5459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656AA373F4
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 12:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F64188A1E1
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 11:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DA118A6AB;
	Sun, 16 Feb 2025 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F7wjRwBD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2715539D;
	Sun, 16 Feb 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739705171; cv=none; b=lxfvtgJUpZYfjkz1Ki0DBXj7klHssTDYS9DXADSaTIioMvCLYdZkqLbycbsHMiIHqqY01w96/vVZW1fYEaEu5Knk4ZjbkSLO5InuLsMEoqCb59Z4Y8fnht3l2uKe2cJ1lzwPVma8IBgFSfKbcfuUknTUnxnSCaJkIkzp7aAuu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739705171; c=relaxed/simple;
	bh=bdk9X8vho5mG/wtTpQM+3m9KXs1GJErNwrF2je/WkVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AgAIRc+KZLBVt16sB38MZwnjdn6BEfY2yvxM2Td70YelXFUGGoRN7UxrPGCRm6AUuCw0FcRVjtbzhxQqNAFXONskxVYrDeR1Vb7s01NxLYbk9juQs+KSl+tkWFczPjrPtXzSla8ssuGgNwlwjd69XF7ulxyQ9CaagUFzCNNhqCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F7wjRwBD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739705167;
	bh=1K/3tBE5vPsFJ2r1265VDBL2ZllLYwtTloFAdMB0QPc=;
	h=Date:From:To:Cc:Subject:From;
	b=F7wjRwBDq0SMPCLJ5vv4ePRi8XzIThQ0XdOenrJ+vS1fHgV5/NuGvMOrhqmtgm3pg
	 h1HuuMQCGnFKZrFcTTUEEIIoN/A7pccJldpdEzG0PHNVQlAyxwijXTSYpGXEYC7Orm
	 NBLT6Q+Tc5e82WM/6ZwWlr2+yODIG5GxsPopWo/YxUJe27HQaBBX5S5EFyzkAiwV/F
	 dbQDhAuHKF33PPup5WjmduwfD52h88WAqxp+9pldOmk2xFHtN6mVv6+VqhnkBOmanh
	 W1+aQ/hG3dmdo+IlqORu6bFUMchGldGsA94pEEQQSmySVG3B1PvH1etoAUvHlRUyNq
	 FZ2/H/0UfvW/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ywk4b13npz4wby;
	Sun, 16 Feb 2025 22:26:07 +1100 (AEDT)
Date: Sun, 16 Feb 2025 22:26:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20250216222606.4be119a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sR5GT9w+P2O.6QVNS9WaGMk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sR5GT9w+P2O.6QVNS9WaGMk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8d8c6f1e2c58 ("gendwarfksyms: Add a separate pass to resolve FQNs")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sR5GT9w+P2O.6QVNS9WaGMk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmexy04ACgkQAVBC80lX
0GzgbQf+KgA6rducxC4omvPGmfkk0muDdeUfwg77lkMdWXZA53XDb3eYx1+PDMVo
SMbrWKSj448bP4R/fY3F8FOE7L6tbSCJmbAnIWpeRrB+HJlnHnymtTJVETiHjGql
s/My7erSlwHwFCo1Wm/u00AYP/G4PzGV6PGyJHpT/Krlo64U9MAkIGyjOu+BKo3Q
gCBjL/RSf7lyw+BNiCkJ2+xbHwTyZMNGnf9qLNqVriX7dLV12jP7SvT/BkaU1+XK
7OaVmRoqpkWYU9JnYZchYLEQuMbwBuMq1LE5Woc5grd0Bte8ENUbQvIDERnWo6AX
10CXIAHDpRjVCy3GxWGlLSzBdm9kAw==
=sSV2
-----END PGP SIGNATURE-----

--Sig_/sR5GT9w+P2O.6QVNS9WaGMk--

