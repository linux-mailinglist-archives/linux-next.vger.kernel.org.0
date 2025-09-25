Return-Path: <linux-next+bounces-8486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D9B9F37A
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD56188ABA4
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775E92FB975;
	Thu, 25 Sep 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKjdubyG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844625A34F;
	Thu, 25 Sep 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802963; cv=none; b=o4enZ175bCkTkTpfGiGR9E7fp6Npz9Xp/FkC2YiIQOjdoHWPkqwlNKJgk4zyVhz4f0do0zejl4L/PR4ArLEyEteYIH4rMfAduqCzWse3CMG2WYwnHtJol02TkEWvn2XMrthfaA+pe1gE+BJiMXj8GffBkQ7nwQleInW3TevI4dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802963; c=relaxed/simple;
	bh=zZBF28tRDR2frf8eQzON0TP2Lhw7b7l50P5IK/QS9yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioqXQYjPAiSaRWo7vB8NzS/hkEKhHajx/ephK8uKCraYHGxFRG2kHDPw/52HQKjc7S2k4sx+1QvekRLOXChOtUV3OV9I+is90/CIPA6JZ7eaDrlesnukzlA1LsuXbBftzHlczWfUgutRRfktISWT7yIqM0LkObkoAiy57t09ESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKjdubyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F367DC4CEF0;
	Thu, 25 Sep 2025 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758802963;
	bh=zZBF28tRDR2frf8eQzON0TP2Lhw7b7l50P5IK/QS9yw=;
	h=Date:From:To:Cc:Subject:From;
	b=AKjdubyG32rncxf63ZxOJWOS1AJ6ITXmgCMbYHD51c7WSwAfKxM3oIBl/E2G9pqH0
	 A3kx+1qBN+CQAwpGVwsWWJ+4TqgY+hhTt77CAz3UoZubCGmAX1buQYvZmcoudshBWC
	 dPNK5ZQsrzKwFe2N7P5BBWUn/f2zZKDnxoGhOMUuH3gmGi60/qIGNTJGAZADroZOC8
	 Ta8caC2GtZ1pElRC7SdSuvEKxv4hSOkL9tEKLDnwQUcXK2mNBNZoADbRug1AKnhwOG
	 WP7N6U+gD6lZ3oZ5/m7CvahIu7uEc+a9iPwtXdVEj2AtHHhzC0Loo6L+R/cAgWHCRs
	 ZRI4UU1lP6Cig==
Date: Thu, 25 Sep 2025 13:22:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve French <smfrench@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Steve French <stfrench@microsoft.com>
Subject: linux-next: manual merge of the ksmbd tree with the cifs tree
Message-ID: <aNU0D_3x5WC9qBzQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qCEHxetgdPmPUDyX"
Content-Disposition: inline


--qCEHxetgdPmPUDyX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ksmbd tree got conflicts in:

  fs/smb/client/smbdirect.h
  fs/smb/client/smbdirect.c

between commit:

  8c78e78d99355 ("smb: client: fix sending the iwrap custom IRD/ORD negotia=
tion messages")

=66rom the cifs tree and commits:

  4e152f2732650 ("smb: client: make use of smbdirect_connection_negotiate_r=
dma_resources()")
  c0a6d2d41a3b6 ("smb: client: initialize recv_io->cqe.done =3D recv_done j=
ust once")
  d5b264e469201 ("smb: client: fix sending the iwrap custom IRD/ORD negotia=
tion messages")
  8435735745f65 ("smb: client: make use of smbdirect_socket_parameters.{ini=
tiator_depth,responder_resources}")

=66rom the ksmbd tree.

I don't feel equipped to sensibly resolve this today and there's also a
missing signoff in the ksmbd tree, I've used the version of the ksmbd tree=
=20
=66rom yesterday and will hopefully have the time to look at this
tomorrow.

--qCEHxetgdPmPUDyX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVNA4ACgkQJNaLcl1U
h9D5xgf+KEOTFpHkkHgzbOcX0jd/n4XDKjSR41m+Tp0rJnm+AHrNMVRSLYgJfKeH
HaZf/MgW2q5eZ8xY6JQQtgWNExnieoINHEkiL60DDbAVXLECipsmw4TNhtCsz2dm
O84+5AQxTVgtpGZfk/v8/LJNYWrxKdLl7WbBg1mP8ODW+cO+HWyI6G25VaaxRyVV
1SP51YtwYEhzcimhctomqCyQfi4jsDrN946wh8zLobjdvJoW9LwTFJFUafIWqu3D
UqC05dAC2MWCtx3jD7W3ncuwimLMoC1KPvYEqjagFIfDlfH7nXG+ETzAkvoEEiKg
zl7bjU0V72h7MUyaFATduKztVyurQA==
=M1tQ
-----END PGP SIGNATURE-----

--qCEHxetgdPmPUDyX--

