Return-Path: <linux-next+bounces-9041-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2002C628FB
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 07:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A863AD0A4
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B8D3161BD;
	Mon, 17 Nov 2025 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CvDacDL6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48D4315D49;
	Mon, 17 Nov 2025 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361744; cv=none; b=uafNbCKhowu6pKvwdiWifOB3yVATHmdsAZQq2iH0cAgEzVRueYJ92u73CSoZZxWv9u+D7i/ImoAKwOLbJ4OR+IKcLofXGBNl+rXZ0eYMROIWgAqq6fGzRrB5rLnHFO3C3FrqZujh5F/NY+cYWj27n7Pic1YgoP/rZCqoNQdz/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361744; c=relaxed/simple;
	bh=Cat1pRx07iupnDKb3hg13bklwTHgYemu3Ni+Mubc50s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tcNLFSMho9gWlnWWwwPrycHTKWMW1niRZtizy6C5jyFT0vu2NaSq2/G67JizVKivMiQrfZD2LCsLaIFlX3jXUPKqpkiYUrWUSOA49IO9oeXHv9Mmr9ihl4UgQCACu/jcqg6BsAE7b8h15UfJljWjNii+sd8PAGL1/jTsd3HBZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CvDacDL6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763361739;
	bh=edyUgeBWgsyozIwapdVYq74pJyPbv/3jMRsMWA3Z0Ck=;
	h=Date:From:To:Cc:Subject:From;
	b=CvDacDL6prUCWha+RreDk/SGOdarajXSOWI/eWZ248FsUoQ3xIyE/tDuprtSO+imS
	 fS1/wZF1ULswle2fQCY7UHn54dQHg1tuWuHuHdUHUDd4AyUAXx2q2iOzJv9t8RqYOq
	 Xj5CU3OwS5vOipM3Lq0lqQj5LnpeRoDoK2gHNg3RcTgnCOvJOXMrW8kT3FTBmmGiDk
	 mSF9Nqapm7iol3fnHCgc8z6UU9T0paiZi3Wj5cMzZ0NnY8hZ8Kbr8k9G3W9YLoQhOR
	 5v4RZsoqoKoVs8NCk2CY7wIqjMC/nYhYjvfLnng4YGWIpdjq49ElNqPB5LLprTHOvr
	 x6ooHSquaCr1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8ypg5xXHz56lV;
	Mon, 17 Nov 2025 17:42:19 +1100 (AEDT)
Date: Mon, 17 Nov 2025 17:42:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the nfsd tree
Message-ID: <20251117174218.29365f30@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f0vSljLVNNgQ8d+G7cuKvg.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f0vSljLVNNgQ8d+G7cuKvg.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst:185: ERROR:=
 Unknown target name: "nfsd". [docutils]
Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst:188: ERROR:=
 Unknown target name: "nfsdn". [docutils]
Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst:192: ERROR:=
 Unknown target name: "nfsd4m". [docutils]

Introduced by commit

  3a1ce35030e1 ("NFSD: Add a subsystem policy document")

--=20
Cheers,
Stephen Rothwell

--Sig_/f0vSljLVNNgQ8d+G7cuKvg.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaw8oACgkQAVBC80lX
0GxpaQf/cID+mrew+eiSE4NwIAuYw4m+gx+wyTvu35Wlsc4MKBkQuE09M8c+wNho
zOZtePUtJnTmVKNN9YtIcr1re/LtIs/wmEnthTiAJp1Snau9/8DpZsdMFGnY8l5M
Ob5+L7zWQbaKm0xodZsJoQU1i8yU8k4cgP8QOYGWXFzrtmmwyyQPGLVVtul8RKPR
XRuiS9ckcGKCxZ40rQj4HcaJnLuqp7FNy753oOG8hUPzOUf8oNwB+5VG01itc0cu
8IJheqagw2HXlooxcmdLyuNs9M0FOnTSTlcjN+Bb3HoYhNT7ZB+Z3rhJReK1iS99
q+sZQudd83JHDk2jFa+4U125E0OvxA==
=eY09
-----END PGP SIGNATURE-----

--Sig_/f0vSljLVNNgQ8d+G7cuKvg.--

