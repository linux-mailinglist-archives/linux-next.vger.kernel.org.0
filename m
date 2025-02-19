Return-Path: <linux-next+bounces-5490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B05A3B061
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 05:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD003B0AB0
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 04:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F791A8F9E;
	Wed, 19 Feb 2025 04:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kx2zNAVx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937201D554;
	Wed, 19 Feb 2025 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739939694; cv=none; b=fvg26+zn8B6zb+jqLoSkjTJN2XjODpW3e+GXTlFvLD0+jdkzSfGYKME68nz7V2/KQB/9mpwqbNYCSfLdiCA3ht233JojbtMkB3tiBppDbso7IWLYZml4zojGpeKYDX8m4kH914p+F/SUNqVCzyPscuxGfN9W0gjH4zSEJRBIGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739939694; c=relaxed/simple;
	bh=Hil1dVQh9TQS79BbJ6/GD+DnwoXBA5f7kNHmi7ngWK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pk5+FYoUZW01CnHvysu1xMsn6tazjy1pYmU3rtRN56Rdu+PZaYCvIECknmrghTT6dVDQOgn0qbSv7LTdLx9K/4DrQigEspR9pKGLlkKgfmZ4VEcYplBJn6ntGXlRO+ePSEEf5VVj3HccnXDx05MFA+GftESPgEv80yRA3VR13u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kx2zNAVx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739939686;
	bh=2X1ltTdN3jNCBpOVwhieOIU7nIvRgCyT3knYIMBMzEU=;
	h=Date:From:To:Cc:Subject:From;
	b=kx2zNAVxUXkhM+WoVGfYW4T57nBEGmc2Y0m9g7YJrIJQA+g/UdrJ3TRIB7BSyspHf
	 ezeaUt7ly2OI9S9aJ01rrq/ZO7jqW60eCHOZDobetRbpNEbsZ0TrpJ9OMG3EovyAZO
	 tsy4WY45d5w4iHyOlbVd8a7H5uL5XN/V3I9R/3KcYXndt0S1MBdRLhgVQv6gqHvJej
	 bN1LfcMQPk5IEWAdmAeq55G0GJYQzeLGttfVc1NiOzSEHBagsdD8YVrCrDt6dJlCWx
	 ZaS6yJoFj+wnh5UWoDUrP8lvTJEXvRhYNctsFHPNP6GJr3a1E4HR+vAoNJ9ABKjQvv
	 2THAsZhqvzb6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyNpZ1n16z4wcw;
	Wed, 19 Feb 2025 15:34:46 +1100 (AEDT)
Date: Wed, 19 Feb 2025 15:34:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: NeilBrown <neilb@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250219153444.0046e433@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b6Wy0AQxaO+1e8FbPIcH1Qf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b6Wy0AQxaO+1e8FbPIcH1Qf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/porting.rst:1173: ERROR: Unexpected indentation. =
[docutils]

Introduced by commit

  20c2c1baa9ab ("VFS: add common error checks to lookup_one_qstr_excl()")

--=20
Cheers,
Stephen Rothwell

--Sig_/b6Wy0AQxaO+1e8FbPIcH1Qf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1X2QACgkQAVBC80lX
0GydBAgAmWf6IzBb0aNoPAV+XPe3Ide7t36lPtdmUOrfIi3S54pnq6sRLAgN7+T/
Mg9Hds8sg5JmujGZAYlp6NLFtQbE6onu5nN1/6UqnT+10SpJ3F8hHFF4ay5wf8G8
GrfsQOm/p1IQbq7KY+WfiasPOrri/n3gLJ9UO9Pby/b1pqOye9yWlrR6CCWpKPkj
XAaaj7icQ1f0PqzmUNlNJEq5AekYEdgeqCVfutpNuPRW+03wjtVu4VdK/hFcS3bi
iNEYD8xoCQ249uEIQaBoDIg0HOgtuQQ8glqWIy54h4D4UJLo5i6Lm8ShxmLtb/dy
G1f7M+899JoooIdFIi1Ocv2vO6Q8hA==
=azwl
-----END PGP SIGNATURE-----

--Sig_/b6Wy0AQxaO+1e8FbPIcH1Qf--

