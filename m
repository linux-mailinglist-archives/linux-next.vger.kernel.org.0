Return-Path: <linux-next+bounces-5169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C6A0AE25
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4D17A25CE
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C650175D50;
	Mon, 13 Jan 2025 04:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VG0B+jWH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED5170826;
	Mon, 13 Jan 2025 04:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742323; cv=none; b=eHhiW9ZeBa9uNTBCY3EwAyXoCkcfITY42ZhyWb4QnjbsTjrIVypiiUIMH+poAE7h6QVOspH6JTXRrw9ruW85pQvxxKHm2nIx9hlo9eFDB2+yFhKh/usoM80V3QX/A+viDxRnaJjNYq5g53pYbRMv6qraNLJzEF/LB8XhIYEwa9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742323; c=relaxed/simple;
	bh=+Q+JrJ4U4zJs5weE/xVLXwf/MtDVGbGj4dRxtgZiQ3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MFXOa7vxrt348MmgCX1ZglTTcvOP2yM8Ohbdrleoot41kTs7H8UVvogCHWw2icgvEv6sgQEunLttlfuLtbKY1StanfSgVLKby1AN4AiqCjGfi650nDqVDrt3jN+r/OpvkLCuSdP2y/xARdp8UF9To8dcUvgC1JGqfS5tPkA7piY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VG0B+jWH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736742305;
	bh=77J5PD9oh2uRMoaHuDq/jMstIc895u2vInXJG454mx0=;
	h=Date:From:To:Cc:Subject:From;
	b=VG0B+jWHt9G55PL5oZMseTZcKHqEMeoKpbB8Ok8HqyZmyNIK49XgwKwAVvoQmNEvo
	 OjmfCjcRiwG31RuiXF5uKpEbi3yftt3X7xNBEaynurQA34dEVRjH3jdAumkaP0y3M7
	 X2ST2Y+kTAw/mBnjYXah357yPYfEFzwYSKwg56Zzp2zOLHQc5ecyG92kRMkiCj63xl
	 syu/HYA6nHXTil9r/E4HfDZFC9sOrECIDWN3KL5iLotTPA/KhMp2e51WzyrVR9WSfJ
	 02KyO1DTQTvbdDUb5E2QmMQlcwkVah77foJhPXCx9fNWSpdyoFMPzisxxikY6SIaAE
	 1RYxERP7Fhv9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWfLT39Cdz4wc4;
	Mon, 13 Jan 2025 15:25:05 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:25:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kunit-next tree
Message-ID: <20250113152511.4f7f382b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q_cZn/dBGtFEuYYu.Z63OIB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q_cZn/dBGtFEuYYu.Z63OIB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the driver-core tree as a different commit
(but the same patch):

  875aec2357cd ("kunit: platform: Resolve 'struct completion' warning")

This is commit

  7687c66c18c6 ("kunit: platform: Resolve 'struct completion' warning")

in the driver-core tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q_cZn/dBGtFEuYYu.Z63OIB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeElacACgkQAVBC80lX
0Gwg8gf/VYZrfAKRLE/kd5vKEJLPe+uMd4xXU57RdH9OALr3zddddVuZJxGFsg9t
4DA5N88Qp8iqA7kguNTWdbqHg1IbO7cu0nw+kVPvietf6EaJiKgN1lfir6+7jVkC
yvPOiNDqXYg240lRTOpNJ56bxkEoxLNXjPidAk6/kywu+P8v+2KyYD1+KILvx7+2
v0BKFwM9J2BKwR0/AEwteGNKqWSD30ez3IvV8TkutvNXYd3E0rfqrAbXV5KBCek1
ndB2G2TWVcGWleBCEqFup85c1aiByc4/Pdr+qJK4DMcR9mfYH0DbnD3aJQgpq/ds
FgTZlAIob1kctUNoi4G+FUvrPBq1kg==
=Eb04
-----END PGP SIGNATURE-----

--Sig_/Q_cZn/dBGtFEuYYu.Z63OIB--

