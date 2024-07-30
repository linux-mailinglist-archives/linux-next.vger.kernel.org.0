Return-Path: <linux-next+bounces-3169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB69412C7
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 15:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8908284D2F
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 13:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0CC19307B;
	Tue, 30 Jul 2024 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SLzi73Ls"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091891E49B;
	Tue, 30 Jul 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722344741; cv=none; b=rif74Cy+wuBejLkN6Ejzjwvu5MNW2LdrHnVtg5VRKAc9mBRwCLuKylpCsmm/6Bk3Z8bze/UqI4fw+3XgxlmHtkz1v5ccU8H45WIj3MSGhNbJKpQN6nIY7KF3NR4I59u2ijSIytfykFc2MwBVRupU8Uta+3x4Eog2WoEpJVYsF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722344741; c=relaxed/simple;
	bh=VqjFCD8e+UIbv/2b5/w2G2WUEBnqVMy7Fz6yfwZqW2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s8g27NsaU8qHr8M3/Z7YMWffHvaFEMztSs0KxJTO4xnOF/gvle8OjcU8lGP+C1mBKTzKHnstYl8fGtBiNTfoIyP+kFy/yI2yjGgx/7sQzA+SN2qF9EGnSzahWtzVxa6wYFW1j7kQY5q6P4Yf0iRXYid2qLiOcHYaCWM86CobIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SLzi73Ls; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722344735;
	bh=BzBgqqtmENruNKpE4HET9aSE1+/c/QOTTv7yxYdVrng=;
	h=Date:From:To:Cc:Subject:From;
	b=SLzi73LsgslRKYfGvZqYyHIgbDS9M5M/V/WTerm0xrPsWtDFhT7iOiEyTB5iA/PpT
	 003ztDtMXau8bLB2y93oaR6W7EUmiQqaPU2GZEQikJLOiyCLhTXCK5Dwo5vdS5UWIr
	 stFMDBORFkNbbsptEKwd6TUqiYAFtLCQDmSYT6e5Dkq2necQ5uw0+27jtlWBEAxOnU
	 jXeSL0sRiIO3D/5MiUoKXlw35pZC765otfjnG4TSUpdIqjkiQBWwh8gPOPpH7txKsw
	 E3BkJ5BiZbtJQQTDAQ4QH6ppYx14JUrQkWZ8vJQnh/InxWnvacRmQqIu7nHEK9a4/C
	 UbHRciWZIrxhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WYFp760Cyz4wcK;
	Tue, 30 Jul 2024 23:05:35 +1000 (AEST)
Date: Tue, 30 Jul 2024 23:05:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240730230535.593a97fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PL6KSzpgWH5ybFhbbKCXxxJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PL6KSzpgWH5ybFhbbKCXxxJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  70c3cb72ef93 ("netfs: Provide an iterator-reset function")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/PL6KSzpgWH5ybFhbbKCXxxJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmao5R8ACgkQAVBC80lX
0GxhkAf+PR7/ihY0Yp2AAwlC4xZvsY5XbiMx1eN8QEi0h14jgeo5sRqlF8VsLmtc
/IfeM+gJ4eXEH1ZwjjfrQq71MpJHgFQLj0fqVhoRvpUPzzYsSS3T4e3K5Yq7Hrtp
eGnsdneLLpHh2Dwk04SSaRfWG0P4rhhwXlwYRABfKkXvDssW/rQXKkTQ2/uCxIUJ
AWjwSKuDunG2SLyZYA6rJCttv69N7lquDmCvvyMGFNBbFWWkXN+SMyDsMVEk4sb5
6mW/Vg2+eDgM64YAseond4wd/Pm7NZ/iUc4mtdiVRswqlH12U5ViCkITVmi1uFqD
TP951CgIbDw1Mc5zDrrW1jlZVLp7kQ==
=itjX
-----END PGP SIGNATURE-----

--Sig_/PL6KSzpgWH5ybFhbbKCXxxJ--

