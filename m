Return-Path: <linux-next+bounces-3616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945D96D7B8
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 13:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E191C25207
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 11:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615D619922E;
	Thu,  5 Sep 2024 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZNRwS3u3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D50199225;
	Thu,  5 Sep 2024 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537358; cv=none; b=lmvyOHcelJR7WZCpv5j1drYKtFmtkLJjFUZgGKWJzgDLdZRwH8G0j/QXyPNOmQ5EUVGZYjddHo+mnGfSR+nBl4RaEhBVlpahYJIJvdDwn0y2KslgLJXuVIBniNlolOqWrTzZ46W9YxNzw3Kqrf6xPZmhckaFOYPbmtIbNVI+Bjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537358; c=relaxed/simple;
	bh=JT8EWNZueLEM+qj0zh/s14/rywuTiMT+omXl6JTKCP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=daUel+WqVFzavQe+Zmf7yF7mLW9NawTHPCmB3YTZNrbQqMfcOs2G5Ifv5vysa+Z543n+ozp31CggCMJw1fhDXcvk/jFXIzxfPIUUzVGsqdYkjOBZY2ZuKrGIqLdFacr3g7cpPr7mJKExWZ7cQ4JKnRUhhnEx5tagbUB9aL0EnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZNRwS3u3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725537351;
	bh=tcztKIZjqOeDq7GpcnsyIRJWOqLu95zr84hrLzRWHgc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZNRwS3u3zdAETQfpxdnm6VOI39757y9Nx0kPgbJ4ZBDMsGUq78oRSne1uVImdiUpP
	 bLxAHmcJkyLJXxVH1uC6IFBdQdHvu6RZO9Rll1n8JOHIqKToy+ne+NGjVYRIptBaMK
	 PJjmIxd5wzRlJ1bSDq8fi3Fj7JU4SvC8MyE8lMiyrxW+FS2fw4TVDg6VJFLLHI04j5
	 BUzHHr1b4laMKlrvjX4+04/Rbvv3aXsJSB7vOhaQtVF6JQbLWRTa+/WVINNQTKPkkr
	 EXoIAXlGdqeH6GBMNFmOtrFkr9beV/7ht6+BoVshH8pIXUT8j5yTFauzZmloqHx6Vq
	 CpqGDDv2BbLgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzyVZ6y1nz4w2Q;
	Thu,  5 Sep 2024 21:55:50 +1000 (AEST)
Date: Thu, 5 Sep 2024 21:55:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20240905215550.1a8bc109@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rVv2.AHl9MFEWiC.GMzwqnE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rVv2.AHl9MFEWiC.GMzwqnE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  42fb50cd00b3 ("soc: fsl: qe: ucc: Export ucc_mux_set_grant_tsa_bkpt")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/rVv2.AHl9MFEWiC.GMzwqnE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZnEYACgkQAVBC80lX
0GxhkQf9EN4wH4fz6H+2dB4mXpI0+eJYPc5SEcHpQY9VCD6cai0DKZIPuTj+VSyl
5ft+r14hMLRQHrPjN6xrtqyIjeA7LYlaqhcAHaSbaCsIRYv14DkKS8UHJmjzYAuF
UsOMqNrXJGdFdiozZCdC+c1a2U2llAkHCCJpspXJDDNgNM9j1BPoLqVZ8qVYRtN8
Jz3kWyM2qkXS0pwrule7Mbf6qpLxSmZ+qEmBvhSbcLg3TQZ7sSQ8Xz2b4ODUND2B
ISBcKqSjcPWG0s0aKHDcuhURDDLq/EEv3WZwJyDNTOZq4swUUHk/vVcbkMV8m+gF
tsD4SvKob9udhQ5U6P5o4tDTq4wwJg==
=R3xW
-----END PGP SIGNATURE-----

--Sig_/rVv2.AHl9MFEWiC.GMzwqnE--

