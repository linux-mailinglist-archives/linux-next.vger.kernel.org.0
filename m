Return-Path: <linux-next+bounces-5595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746CAA48A0E
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 21:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CCF11699DF
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 20:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7C126FA42;
	Thu, 27 Feb 2025 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lbUGeptV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AC21661C;
	Thu, 27 Feb 2025 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688971; cv=none; b=TxJ/ibM0CD3eAhstcPavHNzXP3KiRinokQEYmAc8bgPFNbsQZED64ftBuc8vS9iI5LpKAvvIi29SlDdcpWgRa7wjZlq9eSTE6EMBNavLb2/XUNtaaBnyxgo/j/MgoiIZVy+gf3ZbLAAkGm9T0P1eNzRk1RD0BEo0Y7p3AoxTqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688971; c=relaxed/simple;
	bh=Ik/Sr/AYR8XNwacnrej64FWwcECuaQt6n9e3FOLudCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pBXlyP6sC7t4EVVx3p4HSHPtVb9ODVZjnDo4UBR7I8M3YfYd7236K3ZUevqug3ZORMzgtI3NaaGrDPW1d4TaN53HV0TW/NnZNiS9UJ1fmlPm1pxI4BqHZY2WxeEZwXnMHTjkysrT+D1XkmKIil0UdMb692n8Mh9ebm0XCf53+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lbUGeptV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740688961;
	bh=F52dFzypsQnN0/ZcWBvac4G2GfFNedfL8EpAY3+jHFo=;
	h=Date:From:To:Cc:Subject:From;
	b=lbUGeptV8jvRk8bGuX2QBUueTSXKpxZpYQLqTx90n4FrsK77coeeo1RZ1VR2Yx/M7
	 u3sc/scPghm4xELTPQXdPnwEKmtQwppP+tctZO2eFpwVFFytJ+EznkXx5pWQoOwaQb
	 nY1EdhxAx/tOI1G6I9HG5sD3twkIoc98N95ISiMwEdtm06JVIbc7+AXyJmfBXgpMq2
	 b6DFWE3RiyhTc9Ddek5WJiG7nNhJ+xmrzP3KN6ZtkfBV+CkftDbFUok0gp/r6HmS7Y
	 yeXgwxvf9/Us62rvwANOqxrfaTHkWfctAkcdvLjz8svWfEvIQmLehtT5687pdRkrEX
	 DLqQxZDW2c6dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3jvj0xtWz4wcT;
	Fri, 28 Feb 2025 07:42:40 +1100 (AEDT)
Date: Fri, 28 Feb 2025 07:42:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250228074240.1010cab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oPnzTyQZdyIRCgdNQSUi=U/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oPnzTyQZdyIRCgdNQSUi=U/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  2a509818ec2d ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
  980d6e2904df ("Bluetooth: Always allow SCO packets for user channel")

These are commits

  b25120e1d5f2 ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
  bd30e8d7bfa6 ("Bluetooth: Always allow SCO packets for user channel")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oPnzTyQZdyIRCgdNQSUi=U/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfAzkAACgkQAVBC80lX
0GygbAf/aUebDEBx4OIdvd7wVRu31yLaQDA7p4a1ev6TWvOAkKR1nF1cnsBxli5N
nn2wFAPsvA4FmddMFQM6cKWj69o6yoUTsGao5eQIk3UgGwdJqfo3D0qRKm1DkuBy
XdzEg5LU99BI0JbL/TXhXhc8buGizk4xPfdUjL+rMP2qiyZNcGKO/Dx4Ox8IpDK3
uMxev6JQaUCaARjRSDZF0VILOtmpZNAAGyHBvrhoSW2qcVd23+owMArwguTuDeCA
Ev8AFkPDAIDPc7paVUZDY2Hi7j+cyt995ZRmI57wGTFvzSL2Eg2uRk+sXF53tdf4
kIi9SuALkAd10IQ19M4U0jkz4i0boQ==
=L6co
-----END PGP SIGNATURE-----

--Sig_/oPnzTyQZdyIRCgdNQSUi=U/--

