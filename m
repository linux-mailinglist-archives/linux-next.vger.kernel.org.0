Return-Path: <linux-next+bounces-4122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7A993884
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47A72B220E4
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 20:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B74418B491;
	Mon,  7 Oct 2024 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IhIB/kis"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C39817624D;
	Mon,  7 Oct 2024 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334131; cv=none; b=Fgv80ONqkEmVmVRPUy+LXU54IceaXsOseY5HabO77FIjatEPAyqb5JcJ5IfzT79QXt37Ezkau4D2X4i1M7+ghzQx8jKQrjP3NlAWJRSSBCye1t1LyAnSSk0BZp+FnNLIvvQUmiqgOZX5Wiq3zO4V7G4YkXB5rGH2enVs2cbetSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334131; c=relaxed/simple;
	bh=1osi9GhWiSG56e6EtdUkCvX7HtRT13GZ84Zo3r3WQOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NYBWpQfPPx8mNtEgOR6X/ct9VN04kPav5WmwQA0CUpv75KSER135LGL8pAd12kG5JFqukaDhF0/YZEcSikAm3PEn4x89ae0LjkBTYQYedkagTAMIVfPQnRngQuQOP5EzQBpmVWEZA8PhwxcsQwN25p8ailybsRE1C5Tefc0tmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IhIB/kis; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728334126;
	bh=FeW624D+CW0mtcadI/P+zBVtZ/+B6NsBsRZkFZXYMzQ=;
	h=Date:From:To:Cc:Subject:From;
	b=IhIB/kisadzBOXF0BDmtVBzRz2dVUXEL+oqBTfH0cZR45BTPHBacP4A6EQDsjrMWb
	 rqK8Bq7NzOF/eoOHMN1Xx8iwGJ6HRijOA1BQjrYeL3NYAI0anjJwlU/852je9nyIQu
	 bAEAq+6Oz7HzT5W276MifSWyZZmsfX9wRZIXMs5mEMfDUJTPlkCLJ7SMBooXia6z3l
	 YOc14mqz03YEh2qwGh5JUo7MDQ2FuPb7qGho5jZI8AC1kTlxCEdEznSc2nl6SBX54Q
	 1w+Xw7wrgvVOkhk3VtF6i683+tmsq5Z6f6ZlzB8h5OF7lPxc8XV4QHaCKeJ71QfP3H
	 s+xs4gajBwY2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMrpk4PmXz4wb1;
	Tue,  8 Oct 2024 07:48:46 +1100 (AEDT)
Date: Tue, 8 Oct 2024 07:48:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arc-current
 tree
Message-ID: <20241008074846.2bb36097@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Kye0p9KUT1snNRx0q+OFAI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Kye0p9KUT1snNRx0q+OFAI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  13a5ef2967b5 ("arc: rename aux.h to arc_aux.h")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/7Kye0p9KUT1snNRx0q+OFAI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcESS4ACgkQAVBC80lX
0GylZQf+L0Rcbpk11k0RzYYA0WE/A3Ix0jCkT1/PEnMxa6/X8CDeVTaPxFAmnDjO
sikZMmMFQyDBIryKGpfEGgEi4qCbEoyoBf+9Nl70ra2GeeYcBiNHKEZqQyMHLyk7
d3g/Y98y/QsogP5GQGNu+kqXjbnB4zvF2pJHwmogwOAHRv6cG5Ugm7qb7BITiW5w
nnh6oAo9ESD/Zpm6X2YmRltYpWY4YMXAwbFN/wl8dc0FbkuTtvLbeXMIQafHbia7
l7TEDtOtuORWsYwGyRkcd7ih67VYc3bLMEXvEly3Ta5/SrpwMK3pqQdzZ7C9iaju
fOlf+tz1QDIIshvMWwDYszu61jZ/lQ==
=kHKF
-----END PGP SIGNATURE-----

--Sig_/7Kye0p9KUT1snNRx0q+OFAI--

