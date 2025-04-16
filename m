Return-Path: <linux-next+bounces-6275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E204A90F1F
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 01:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB22190002B
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 23:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772C023815B;
	Wed, 16 Apr 2025 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="StI+o2AW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5928E3F;
	Wed, 16 Apr 2025 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844676; cv=none; b=RuevLwgO1bY0b+BK/0ZQljoXCENGPQKLtXCi5e9fsqD30Ow32eTLzYspgOZkfqBJLDSqCIAG/pDTx4njmb7/IDFGGj650jQzs6BORBaHerVLdhpCfRbzzhvo885aQ7LaKPYJ6CK3txSBz4Jl6tp41blWpNgHYsLV09hAymNifZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844676; c=relaxed/simple;
	bh=XwNVqJjnIx58PmJ4ZGTJTM7whFHRqF+H61fwv9vOs2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UtC4nkuk9NVK8hM4yQ3TqfsJ+/LZ2erquAnKZTqmsG15YikPiaf23y/qNNSYL6ErPe1tf0CBy2TnBixamQmbzswHN3H/imgRAcSK+t4Wy0gLlCU9si3mOkCC75QlY1VXB8lmN+3ghwtJ5DWGm4yaxGK/k0dcYCQQYePG/7cjo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=StI+o2AW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744844670;
	bh=XwNVqJjnIx58PmJ4ZGTJTM7whFHRqF+H61fwv9vOs2Y=;
	h=Date:From:To:Cc:Subject:From;
	b=StI+o2AWKX+xvFb68DDbLZMEf4Ay6rJySu3cweN1vduwCVC3DLTdaDj6Vflu5db3Q
	 QzJamDTRqoCNWmTT++7t7PprlEXgFnP9y81kgoJT1aCjk9oSE8vFqnsERSlRyzr6NL
	 gYhYYVDQYwMKi2gEEfeOHrXBY+NKUJqhiSBAKTPBVQhh/UtbP4gKnqOLQyPwJWIkv5
	 A8XrPo9vlUf5mGr7mOZKh9QegKZNv8PnBU489zVNJcVINMinh4+j1g+fptXIHUClgp
	 xor86DaoRZwAybWCsYOoe543+otInMo25rzK50P+/6X6vHGXE9MoupV2WuhiO50gGG
	 WptP7AX0e9bSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdGnB6FNWz4x8P;
	Thu, 17 Apr 2025 09:04:30 +1000 (AEST)
Date: Thu, 17 Apr 2025 09:04:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the clockevents tree
Message-ID: <20250417090429.39e6df77@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WbJ/oqknz9kumk_JDehRsRg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WbJ/oqknz9kumk_JDehRsRg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the clockevents tree
(https://git.linaro.org/people/daniel.lezcano/linux.git/) fails like this:

fatal: unable to access 'https://git.linaro.org/people/daniel.lezcano/linux=
.git/': The requested URL returned error: 503

--=20
Cheers,
Stephen Rothwell

--Sig_/WbJ/oqknz9kumk_JDehRsRg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAN30ACgkQAVBC80lX
0Gy1Gwf9Fva/eE9NDCgJ3Q/OazQ97KImGHzN27oDW+OzlBHjK7+iWsq/NsA19Qo/
56MRgB/V1Ok6IWXWTleg8aUcMk/YcCimO7hZM4GKZCbtRy9O04IViqAWjFQcHPUO
S5bdbl64RqZ6E2NCXbPmpVqIjNlwDW3XUsGJ8879Ex56MUXXjdKWRc5YNutufZ5Z
MS4RVFkaGp3yBVu4OPRPZZAldUX+n6/Zf0TWjcoVQvT59iiUjrRFUM5KyCFAu2p+
Mo9oVN0Ppgp9BeDOIvtYIrRBrID/PQNkjlh4WkeNefWKe0C2d7054R11BGlSpTPu
iaQU0dQWJJk0JoGzdlb6c9v//skcMQ==
=WeoW
-----END PGP SIGNATURE-----

--Sig_/WbJ/oqknz9kumk_JDehRsRg--

