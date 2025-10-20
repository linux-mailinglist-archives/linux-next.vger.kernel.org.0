Return-Path: <linux-next+bounces-8646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C1BEF21E
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 383AA4E9725
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C66277C8C;
	Mon, 20 Oct 2025 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HmTZGV00"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2E42A9D;
	Mon, 20 Oct 2025 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928824; cv=none; b=AMWeSqNP7IOqKXE9eulrtcqqIlcWljw+o+qFi/v8glinJsN5MtzA5ebsZJguE0CSkWq1f3WhO+fLvxkVlD1vODEjiIMXmZ0kD7iCkmK+LgE7vg1sLBty3rTqrcnY4I2Xy5ZtCuSO/H3TNWKDr5yFcldDFcwCfpONGOzw92vdss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928824; c=relaxed/simple;
	bh=PX1w6KmaerK5HvXDCeICTSWdXcNw991p7sA8iOUH2hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XfiErMjkSE1aDXdUVUhUDoUGqJzqy96kzh5paYtSquC9FhU/QeA3bb5wANnJ39YgyqN05f4jTmzr1pTUbEfrupVolF413/QJGTt6VlCnj/T5KYmuevnPADhTLAj9ytnngjXxBgiLjauh6zJEeqTyPQOefQdcmX5/ARif2J7/siE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HmTZGV00; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760928820;
	bh=lXfqmGcVLmzJ3mm9axj+6QOkmdBIZfjNt20RVe2CZ/c=;
	h=Date:From:To:Cc:Subject:From;
	b=HmTZGV00OGQMYxgqB/6DewXrtytBfxVGU0/k6fCge1+bKE4TptJPtogBtoQ8yiauw
	 BPCmYNoe5CsnqnsspNBQrjOe7dI6Co4f6v62pkwB1b5iNQQgvF2PgI7WrkGRYyeP4M
	 BekbO+JbEdjrhmJqlUNIO58MoiNPGVOEUevFVDr/I0hPSSqgqY+AMcmvU7d+XwDFp7
	 hOhBJ84LxBdYTQKpWgqY7ThUEMzphv+W0CAf5MCovz0i0EhzgREuVoYl46Co20/LT8
	 2cbUWDdJ1CosQCDAZyf8s2Oz3ZZyu6ZcqDleKgHmBEmGqhxJ+DnSti8yu5E3Yu9Wr6
	 UL+7ekHFbaNgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqg3l6tZTz4w2J;
	Mon, 20 Oct 2025 13:53:39 +1100 (AEDT)
Date: Mon, 20 Oct 2025 13:53:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>, Pankaj Gupta
 <pankaj.gupta@nxp.com>, Linux Crypto List <linux-crypto@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the crypto tree
Message-ID: <20251020135339.5df5ec50@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lJiicAoeIun5HCPlhVv86uw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lJiicAoeIun5HCPlhVv86uw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/security/keys/trusted-encrypted.rst:18: ERROR: Unexpected ind=
entation. [docutils]
Documentation/security/keys/trusted-encrypted.rst:19: WARNING: Block quote =
ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  95c46f40aac4 ("docs: trusted-encrypted: trusted-keys as protected keys")

--=20
Cheers,
Stephen Rothwell

--Sig_/lJiicAoeIun5HCPlhVv86uw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1pDMACgkQAVBC80lX
0GyslQf/XZQNZBhQFJil1YYNaKL0KY+F9yWWMbXOF+/WLtOSSeXscP1z0tmZxTMg
z7H5bOTjuB+DvJiBelOFo0WptJI1qgM9lqBOdkKLeQPPkihDrq64eIUxpQrTiYvo
t4XhDrBxKhFp+n7CVCJ+cEEo09OdX6BahKur71UnSPl0mBH6/f7Hxt1mJtd+FBYH
lRZ+OkrzK2c6MIvuBPcgqqWsG91QrfdQj/QVN6SzLxwoR4DDKWvVs0ymTh9wTLJE
y4gyBRnnU3mrt5cY+YllkyOGGh9c/7qmoBY3OGeZC+oVRXtRKA5baXJ96Bhu+U5r
sOE30g46uGKgxwh5lc3tdqOzBoXP0Q==
=NS/g
-----END PGP SIGNATURE-----

--Sig_/lJiicAoeIun5HCPlhVv86uw--

