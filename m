Return-Path: <linux-next+bounces-4916-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B89E8BD9
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 08:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C885188460A
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 07:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7212144A5;
	Mon,  9 Dec 2024 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L+qhVa51"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13D1EB3D;
	Mon,  9 Dec 2024 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733728239; cv=none; b=OXUE4od7Cop68oupgFZ6wlEXwEtrReG8XxEZqW+NAcXD14/6YgWsoQ361LCDbs2iSWTbUePZo65y4El13NOMnWWX6YXO4sSZ1Swh3WL50/AU5bkc+J59nPyqOkQUBir5RQzrhXhYC+kJpkhzxZkWMkuggY5KgBRbSFRVP/x+Sm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733728239; c=relaxed/simple;
	bh=48KQuS8oyCZaAq19dJitmgjyxc5M2XIUV0rEp8n4qgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KNn21n8n/dtRa7UuN1mwRlkXf6eskfsjcZC1KNQonSD+uahzD5hvBd7eEd8K6VFLCY7mC7hc8mg5eHWVRdIPKs2VTTV2m8GyogMtEL+V4GFMgDS4S3nFzOqRSzHTb/7C2I1S3UufgMIwDGv2Iss9lQKkcn31QhW1Yjh0EGQraPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L+qhVa51; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733728229;
	bh=hmtBH/7DV/kfWzMOc6sFt5gBaT4OEjEyhiJ7/Zg4pPA=;
	h=Date:From:To:Cc:Subject:From;
	b=L+qhVa516qK6vOMclmjJLxeiceL/q6uwssmxiEopSi+XJEUD2K5m61IEOfIm39+8a
	 aEnzCNn1ViUB6zCLkUoOBl7E3Tz8ZwEPnVbCT/TpKrvL62O0MGurA1iLvMX/dzFBeu
	 /mHMMT+6Vow3DlS1SW+k/3lqsYTYBP9yqlGdppF65CZSeXdOlHYqf9zFiG8WjS/px7
	 aj10yrKuF5Tg1M/5jbsnFHTDmYwvgy1Kk1nbSrcRZofCsTGY8XdCc91vInc0l3DWg/
	 Lg0CnaRmD/VVeJv3cR1ZBEwaMXqynLvuqwPOybgJzKvaZBfnyikYhnOc8oa4LI8rdC
	 0ls3Uen5BhvNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6CgS4cYlz4x3d;
	Mon,  9 Dec 2024 18:10:28 +1100 (AEDT)
Date: Mon, 9 Dec 2024 18:10:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>
Cc: Olaf Hering <olaf@aepfle.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hyperv-fixes tree
Message-ID: <20241209181032.444d7f36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//Qa.jh0AydpSbRNqfrQ2+4y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//Qa.jh0AydpSbRNqfrQ2+4y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8ade047144a2 ("tools: hv: change permissions of NetworkManager configurat=
ion file")

Fixes tag

  Fixes: 42999c90 ("Support for keyfile based connection profile")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_//Qa.jh0AydpSbRNqfrQ2+4y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWl+gACgkQAVBC80lX
0Gxcpgf/SgVxNkhrNpfXCiaIvrHhlIlTEl3wqcOfLOlZR1qTrCgBeYOGCBM1/Et8
2Ou8OzhfVtLHLcXUDZSXacTixa1H7QuqPtJZANjb2gtZ4J2nkmzueYfDbwN0Dh0u
QW+KkPNXX5NAuwdUakq+utz3j+haDtsFfqhxP9ZEBEx07M1jrXEBKZgEN2Bn4oYi
SJtQrhhucfA36VRSwLXoiTOjpiBUoBgX3SQEwz/dl3KN9jR4deID28MhSSKUtbeC
37a/twQw7e9ARiYBz4alDt0cgvJF1LgwjZBCZUIRIsS91VfnWauXh9iVu40GnUSY
y0AayBdlfnF5fnuR/MeLtTprxZEI7Q==
=ttui
-----END PGP SIGNATURE-----

--Sig_//Qa.jh0AydpSbRNqfrQ2+4y--

