Return-Path: <linux-next+bounces-9112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F113BC73696
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D9904EF3ED
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 10:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C15E23AB8A;
	Thu, 20 Nov 2025 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fq4hCRSy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4728B40E;
	Thu, 20 Nov 2025 10:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633502; cv=none; b=jEeYL0ybS0FIxY0XOILi7EMbf74SIl5J6YlyCiv+qk00v7WcyuQXrzS8xnC4mJgrsxUGUNr9VsQssewDkw5Fccuo26KPDu/l/dzlOMmexFQjFWKEaUTd6V7MeGHwJgXvzY9YalIOG6eSU4mFZXQX8GXKix9h8YlE8YhUQb2gS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633502; c=relaxed/simple;
	bh=EUChKYG3IIHuCA7pDHQWCMsELEMuF5TYirkwP1IejC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mk28pEac4pOj0NnK24+x6FOGO7LZkaMzUIuvHRyUBoLKD5ik/NPyXKjIAWpgE94hWxA8A4o0ftp/hvd9xiFDnpfjIlBVp7wc9mctXVboJtptXPCqKLSbjD+VCT8MbTk0LwGixgce5oketOgP6Q878TVMuEXJu69OQEBSJnCdfBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fq4hCRSy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763633497;
	bh=FKsuagV0WACvSv34YHHyz7uQ3x77T7Vu6R1Q+FbAas0=;
	h=Date:From:To:Cc:Subject:From;
	b=fq4hCRSyr48IkDT7mcFI3Gf/e9xQlkgkdcDm53bz05Wr+65CH7s/HIWUCdEwzL9uc
	 BH49Y2NZSi3Sk8E7dCZfEaNOVAhf+92DpcC25kW3MCIL/8F/7kfPff65VNuDcJSOdz
	 /H6XZ6y0X6N+DbUw2kOpDYVNUXThR9Z6ddVvIn9+EyKFCed1W1eu/YRa4owN43wLcu
	 ELYJASWJVqJp2z0HvUjerFl3Y0zxParFnCj4FeriEBoa/M0Vbb0t31kM+M6uNF4fhR
	 FR7s4CPD2EXJH8LawA2XvPXNPnWhRcmVgiBsekw7/lQ5mqlVdc9PpgAkkGxNsq7SxM
	 QXCTogSCdlGYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBvJn4rsqz4wHY;
	Thu, 20 Nov 2025 21:11:37 +1100 (AEDT)
Date: Thu, 20 Nov 2025 21:11:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20251120211137.2fbd77ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x1wLkX8_QVWDUySwWDkcs1y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x1wLkX8_QVWDUySwWDkcs1y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c10b3595acfe ("ovl: remove unneeded semicolon")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/x1wLkX8_QVWDUySwWDkcs1y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmke6VkACgkQAVBC80lX
0Gzq4Af/Tr+qGa5meCtc8IK/MQauZy74CJAYxET7rbqSGZwAgHzJA3nYV365NW8w
6lISql6q1r39lWJvaDy2xpe2WrocyV13QBKVfgo3CaA835fZ0LQwbdnrCkvZ99pR
NRu5Y1AoCRmROivl2eBnndp4jKh4AlIFTez7/BQAyu2gRnrGT8hcWEzFhyAstCdp
ZKay1nVrCwwBhU+Nuh8fCOyeA3g8WIzgut/jR02WfuOR6p0DWY0I0LCIR/12WYvf
T8L17GsekSQAA1rAyg7RM0W4e1btUEWVxeqcnukCxqESFY+t+FWXsGOrLcSuDDco
cxEX8YkeDunIpJlNB14XKl5B2DWaxw==
=vGKN
-----END PGP SIGNATURE-----

--Sig_/x1wLkX8_QVWDUySwWDkcs1y--

