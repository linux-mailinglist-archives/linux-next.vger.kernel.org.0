Return-Path: <linux-next+bounces-4098-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360498FCAA
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 06:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854C41C22368
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 04:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CC343ABD;
	Fri,  4 Oct 2024 04:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="saJifZQZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4064963C;
	Fri,  4 Oct 2024 04:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728015113; cv=none; b=uT8b9l61XoLrwg7MLGoo5+aASZPnCnATFn7/ZJkQvWAwaBF7yTzjYVKCwIOgc3WUubqHUw2BBvuIheXokDfYmnDhxpEL9501qartfMDUISOc26mBfjBgMxDbpfKD7BQ8URl2fDu+sk8XPxmLL4tlnDQvbmlQUX8Lo/CbmdsiEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728015113; c=relaxed/simple;
	bh=MgTVqtBlJXjWxKPbn0IZKf6SX3fSkLXskHoz1Fa8XIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EQKUd64wWDPc15OC2zOcIQRRSUdoPmgb3SRyTY5gy5nKztOLkzCjPJ6c1EIDE62vU7gSrjAwhG3hsd02Z61/V3UASnzcEDADvG2aXUmQBmJZNT9TX3YzeHERWUjGpBrYLOKXbHpk0Rdg4r7E2lKui8Kh+pg6XtYV68A7VCh/eNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=saJifZQZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728015107;
	bh=C8X3wp19MhYN6j9HIQkJ3k0aYHJRnUwd2WunUFnqad4=;
	h=Date:From:To:Cc:Subject:From;
	b=saJifZQZbupn+qOOs5IQJ/PQHFdQZOGdUL7YHEfmCuw7mo3e+lpTO4STtNugYuh1r
	 ixiY7YP1O1hDbWEQxeRrfWYqsWaLKEANHerGteYTo2fVPf/1IfCTgJoEkRjvD2ucER
	 oANpf4yqoyQvYMtJFvbRNrx3Y/tMgoD9Es0G1qhW3wYB2FN3XPP/Z1XRfgieQQ4F7C
	 1c0vTHHw4Fr+siHXQaf+OKfMEZoGc8/M9fh0rVLZ977CoRd6/NjKob71WwXktwKHOu
	 LsOkdrvPyW+83Iq5DQPrfiW6gLq+cB55MbCFM0gGfcYBMg4wuS3rmzf/y/RW9ZOvT6
	 bTiKmTOK4DPRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKZqk4JGgz4x9G;
	Fri,  4 Oct 2024 14:11:46 +1000 (AEST)
Date: Fri, 4 Oct 2024 14:11:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Danilo Pereira <dpereira@lkcamp.dev>, Gabriela Bittencourt
 <gbittencourt@lkcamp.dev>, Pedro Orlando <porlando@lkcamp.dev>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20241004141146.3ce262b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a_2bMlQPhEsExZ=HF+cmP1q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a_2bMlQPhEsExZ=HF+cmP1q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "utf8nlen" [fs/unicode/tests/utf8_kunit.ko] undefined!
ERROR: modpost: "utf8ncursor" [fs/unicode/tests/utf8_kunit.ko] undefined!
ERROR: modpost: "utf8byte" [fs/unicode/tests/utf8_kunit.ko] undefined!
ERROR: modpost: "utf8version_is_supported" [fs/unicode/tests/utf8_kunit.ko]=
 undefined!

Caused by commit

  94d8a0976d2d ("unicode: kunit: refactor selftest to kunit tests")

I have used the kunit-next tree from next-20241003 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/a_2bMlQPhEsExZ=HF+cmP1q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/awIACgkQAVBC80lX
0GxFTwf+IUm5/TfcPcVqNuPGAhJVvYVMRuWAidG0PxMHKD4oxu42+Sln/XzQXWfv
vZldAH0bCQstq0RJGLczRKlrMGnPGiDPwg/s6y57O2kWuRWjuwaL0POSJNOhC5cM
jm1cT6RMSTv5gMA8XQllGfDJ/nE9Om5/n6p6wunxll4y1Ayoy4fHlQGnYh2J8z45
j38U7RmP8Ip0YQjetCMdAvTTY2Tz4XkjkEDoM2Z6GK+kLat3iBgKj8iiL+rkDaVj
MEiuDUs6SWgEGbNs7JRiz85xX0SO4JmDy1AS2FY4VrWyRKK4XgPQwkQXCKflQ00B
guwyp/8/dta10qrGSd9eTnazwtH4iA==
=Sj5B
-----END PGP SIGNATURE-----

--Sig_/a_2bMlQPhEsExZ=HF+cmP1q--

