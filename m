Return-Path: <linux-next+bounces-3125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304693B8EB
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 00:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9570B23504
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 22:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80C513AA4E;
	Wed, 24 Jul 2024 22:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TYiEI7sk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDD127E0D;
	Wed, 24 Jul 2024 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721858438; cv=none; b=AMoa7BsdtzUIO8pMlYoknBp7lSPItI6SiT5maqiwYDliGil1lTcEOGVkUU7cNiDf4YT/aC6StgTL4QTHFklKeJWQC6T9oX3BGAMs55ZYMZHK4tY1RLqHjqjMd6KrMWrSkXun2coL+X3dC2E6mwkbSqJ5ASJ6IvVTK+xIFMMDiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721858438; c=relaxed/simple;
	bh=HthWq20seG3D0KG4VflFiWm+EjMWBkWl+PY8SXnGwsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fka6pEgUsBWakWf5wYktOIT4ecn3l02VZ8XC4CA9QOSWkqVb3rUWiBFrZDY9jdf2NIOgEq7sTcxIIXspg3Su3021S153GJXrEEz9NUFWMv5r73gP74N/01++4mbQXUgT9+Yv2F3mjonayAgIqukt6liLNF5nDHBzqO49hB0Ij54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TYiEI7sk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721858431;
	bh=tXDwaxltc3zquGyulZcCmwpu0chmpdzseW8zLT2uRlo=;
	h=Date:From:To:Cc:Subject:From;
	b=TYiEI7skrpyKHrsNFZqxJDeaieegS8YlDneIe9Q/4keks3cIK61ImClCGSqmkz5iC
	 C5TmHvI+oAZErr6N5YRzF9nHz7bGL5YAaFLloEdCXOszOEr+efPURUGLicUWjaV29a
	 92wCCAaphioWmfwhknqIWXPxhNbncaHqszZ2qLNU4p/IGP6F7PBkxIu75AiPfbKk7p
	 j2vdyWUjssYWOesxXSHsbmxCXefK350jSrLJs6So9LcqQzmuGry0fHKnG9Pp2uK2mb
	 IGdqpPnlgb1jU2V++di1WMdB/+c2hRnkFG9KC9DlnVpF8lsQuE7o4GAShicfLJl9Km
	 kJ3dRsuMzs6fQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTny72hw5z4w2Q;
	Thu, 25 Jul 2024 08:00:31 +1000 (AEST)
Date: Thu, 25 Jul 2024 08:00:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20240725080030.465434f5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uncT=VUaAWiX0Y5nhiP=FXj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uncT=VUaAWiX0Y5nhiP=FXj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  284004432c83 ("vfs: correct the comments of vfs_*() helpers")
  714f0ae0e968 ("netfs: Rename CONFIG_FSCACHE_DEBUG to CONFIG_NETFS_DEBUG")

--=20
Cheers,
Stephen Rothwell

--Sig_/uncT=VUaAWiX0Y5nhiP=FXj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaheX4ACgkQAVBC80lX
0Gz1nQgAoZPVrpTVW1OObaSZ3ABh4bOBpRzja2r0xQ8LIvFIenAjiAL5b5kJ1Gc4
pCVPiTAAnTX37YkyQ9waZcUjxQc2ckcG19YjeSe8PLj8kn/UnpqwZB3vuI4heSDs
sEIDlVP1qhw80PaI6kyIt14kMv/lZt1gnaCEIMgtLQpNkGAozaK/jSU0dN8/Sphf
Ol8egbt/vzDEXZkOKHqZZOO5goOK92+mMnf7kWGrIrxcTe/6+kg/n1O6qsj80IhQ
gmEFVzujXU4zhO/RaU7UUbaQ8OD3ZYaqEbqUqpXkgPEKOG4b47nQ3D2uiQOEQvDE
Wr3gmdOVYp5T55PWz2SCcZkDtzX+uA==
=kUZ7
-----END PGP SIGNATURE-----

--Sig_/uncT=VUaAWiX0Y5nhiP=FXj--

