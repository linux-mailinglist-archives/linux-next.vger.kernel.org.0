Return-Path: <linux-next+bounces-3297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0994FC58
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 05:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF58EB21A0C
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 03:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986A11B970;
	Tue, 13 Aug 2024 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XLot4f/0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8318E11;
	Tue, 13 Aug 2024 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723520419; cv=none; b=sYyxCJMEf09BbtC//7UdOySLN3rpw1q8ArVHuc2Kf0EON2BYCFXzyZl+NPd4ISpuU/XEGY1bXhjBX3I93JuAeg9MFEKF4xjSU5Fb8tgxyNyuaRMK9MlwVIYsGmU4gSYKT1hzELRacqRt/aZwUd1FweBsfnAHmeRTXptwB/sCRQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723520419; c=relaxed/simple;
	bh=uO9kgFmWrMPj01Urdgt5e3HSPduDZijuUIv+/kaOS4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mMTg0exZHK8FXktRGsqxzOEuyJ326TCIwsvGXg6jL2WEUJIETr5YvP6WwbgPDEUy55z4Ul28WmFdj6p2hXS0Wdrt9/bRNTcDEppva+50UPtq4uW5KCu0chkPDgzzAMMRmRV/n2Zb+KVLUMWg5NweO7+MkjUqSJVp09ANuXWs4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XLot4f/0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723520412;
	bh=95J6f3UxfqmOjyq/Es/1xyMSm/+0Mc6gv3knJdguQxM=;
	h=Date:From:To:Cc:Subject:From;
	b=XLot4f/00K77MMZFcyPypNjc7JUu7xDhY4JhUn/rmfcC/BozvzRYwqKi8NCrV2QFs
	 Nko0rA+FEDjaLMm69QJDeYapuKrlkqgzNrlAQ138PVP2uU8ve2UhvogxXd/HzioGY8
	 gt9W88WOQmLzysP8qcLODKjAERVIsF+zEWtf2DDwaUBLgmmePrxgzvv0CForH3Hu11
	 4N5XJ6+A+YfczoDpZSwKLc8/0JVDlUvJ4R8t9RZo/pGIEZt7ibdJKjUuALJCsTlF4M
	 m4wL6tGnrSnOu4uthWHDRvdTKBJZMEbJ7dk5OhHcXscJk7Em7qHOmJipWlFqilx/BP
	 itXktswOSVb1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjcbJ5TCGz4x6l;
	Tue, 13 Aug 2024 13:40:12 +1000 (AEST)
Date: Tue, 13 Aug 2024 13:40:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240813134010.65d77461@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7WQCPPCHUpW.0==_OLcK/+6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7WQCPPCHUpW.0==_OLcK/+6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm64
defconfig) produced this warning:

<stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-Wcpp]
<stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-Wcpp]
<stdin>:1609:2: warning: #warning syscall listxattrat not implemented [-Wcp=
p]
<stdin>:1612:2: warning: #warning syscall removexattrat not implemented [-W=
cpp]

Presumably introduced by commit

  1810bb54fc6e ("fs/xattr: add *at family syscalls")

--=20
Cheers,
Stephen Rothwell

--Sig_/7WQCPPCHUpW.0==_OLcK/+6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma61ZoACgkQAVBC80lX
0Gz8bggAn+coFF5RLX4hb/T/bD0w5VMUCSXI7INXiz9IDaVrA9TtjdXit3X5jqUD
QwhrTj5gaEMhYVfq/C9nqaCvmo74R/TmfIcfwADK5gaMo205YSMlmzM3ZMjX00fi
cWEcmgiWX4bvx9Y3pq0/UkqF2UJcayYZdBqNIAuDU7fWbqPLowBIT8wq2XnZEyDP
T5YTt4aoWb/dNrfJdKnJb2ZxTugvtze/Cw01mDOQOiysYvh7C9WTMy+Dpz05eNwy
NMz3SO4YqGO8/XEd2/RxwEh0+o3bQczJc064qSUKQ1R1Jg8b2j+P3QOmsfg0e3uV
HE0kgMdFXrWOJxNJgdy6vyZlWOx6DQ==
=fNxI
-----END PGP SIGNATURE-----

--Sig_/7WQCPPCHUpW.0==_OLcK/+6--

