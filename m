Return-Path: <linux-next+bounces-5287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6FA18642
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 21:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDEE51889ECE
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 20:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2171F8662;
	Tue, 21 Jan 2025 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P2QcU2mf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E541F76D9;
	Tue, 21 Jan 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737492660; cv=none; b=RXallfGumRkvs73pZF9utmwFFbbVRcuI+MeavXq6lAe19bunUeTOvwBjfledEJilCB//AWZg8e8hwLgtagS7IoDzsoFHc4IUWx3G/SFgTPN1QWaMiMzyptDROt3JVnwVHNTeTNdBzCtsFnGQYvYOyNIsdSwACD7hTMSTwOWLH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737492660; c=relaxed/simple;
	bh=XUVl5jCWxGyjtcH9691AcyRy7lnQzvz3as9RrJW+7nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SKCgpJi/DeuA7pGNpyClQzH/BWGK61IZOwSV1OG8wKfoZj0WBhGmDnu0ST9v3mfRzWwPugv0k1hrKes2QZ3Q5UJh6MK7dfnpQ3E4C/v3c1eFvwcqrvgX8s2iANag1LXKlpCwqBQ5WAuK/TuJC1WPQ6AcIIwU3e1pfmSwWen5nk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P2QcU2mf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737492648;
	bh=CX5H1wYUPbjC2gqstG2nP4Vv3CUn4bkXg0OZEq2oZ+4=;
	h=Date:From:To:Cc:Subject:From;
	b=P2QcU2mf7O2FTKcx+QBSWcZk4UVT2E6mLN/bcz+kNe71IzZMbomulwivAakb9Ugjs
	 kPm1fF1CBva4Jv0GQfIiBrJqOGMWfBKV8NSy8NCnjLTlwWUavLYkNiJb7AaONagM/G
	 Js8esbZUR2T0LrSDQgSYd/0s5/QRJvKf4jzx+aMIo8WSHsCnqUFS9wygQWOTMaL+zd
	 1O+WZ7vmvABR8sk94D9qRTLM/n128wO0FcePCVJB9opUP3+WaPsLaBTgUkpnQoH73i
	 xgFqLWqBPAEa5T1yGgQ+OK00dx1R6t1zOAt1gWITXWcIRXiUO7Y+vLJplBNk+WMeP9
	 HnoGujR+OByQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yczr764dyz4x04;
	Wed, 22 Jan 2025 07:50:47 +1100 (AEDT)
Date: Wed, 22 Jan 2025 07:50:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Dorian Cruveiller
 <doriancruveiller@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20250122075054.49a0313b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vmzzGV5pdWA_yyJ=I=VgqhC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vmzzGV5pdWA_yyJ=I=VgqhC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3b9f41078507 ("Bluetooth: btusb: Add new VID/PID for WCN785x")

is missing a Signed-off-by from its author.

Also, there should be a blank line before the commit message tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/vmzzGV5pdWA_yyJ=I=VgqhC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQCK4ACgkQAVBC80lX
0GzDaQf/dfPtPPa/gpb7xv1O5OKkw6KciN3omm3E1MyN+bGAU2kom7lRnknGSqhP
o3iC9UYcgOWKtTbcILPjWcwQq6KQ/FCx2CGAixW4mPc4TUFSiA0Xo8cldrpYtrS5
qfO5b6tv9BqsD9ofNMf+ytSwO0vPm4MM+cXkMTvSGixa377dk3PPvL9DKKOMNR+R
jzdSNtzrJKji2p/HkQYZJDF8m9VCMrkcX7UJ9ci/L6BY/bPBt9lTX/1F96B5K2Wn
tJrXpNtttS+MITM6j7YdYdNJ7A8Q1z0zgw3QAD+53MIfPjpr16VwBa0OlT8bPl9k
rYeb7G9El9coLrMAI2kWcgRDtItA3Q==
=wZ6A
-----END PGP SIGNATURE-----

--Sig_/vmzzGV5pdWA_yyJ=I=VgqhC--

