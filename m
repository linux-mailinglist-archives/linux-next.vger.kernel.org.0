Return-Path: <linux-next+bounces-2753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D691DA81
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527F81C21539
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636AD84A32;
	Mon,  1 Jul 2024 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YyLg354p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775384039;
	Mon,  1 Jul 2024 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823757; cv=none; b=t3J0zyCBKeWo9KZZfLVRutkS4xGYtyBP8GOt5ZU8bw0dYbohogbtHW1j+9Psb6tt0hBRrtHNiBEek/u5AssP1hliMuEMOHHp70bI0A3/7dwJIOge8HV9bqaNO2Ug2+yjAsj5takGkE1YEanhyJbZI9JsqwSzt4TfPlDHg49n9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823757; c=relaxed/simple;
	bh=KfEdKo5AGU/5u6cPlM7r1WmrGucqt84omok9jAAkDcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FLi3paaivD5SKk57adUceYr+r7DJIzFFPKYZgPuQVLAcJoK/6mtsoChJ2kQAqFhw6rbyVBbb6MA+E8b00zvKG8pBMb3iAvmuCtfPhSjTvlg05Q9rchKbEaOLDK372MZoCKqldD63CgeoG4dVDxvDqvHtuPUfskSrvLVnOHLNzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YyLg354p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719823753;
	bh=7nABFEYKiuHoeqNJHLh5rUbtt/5FhJRFyozgLNAct5c=;
	h=Date:From:To:Cc:Subject:From;
	b=YyLg354psqzFYb/CLv6zZ6Eu437T25JpcjZFKC+43jgLqt6EGhXU9jeRwR1FzCBFW
	 kr8WLL0fDsISKSZ9ci2D21of9xhtNtui2eDJCxo918wYSc5fbS0O63WtOe7MCxmNl5
	 EiMONSc801CB0aB9D7oIhsa1ySmwrO7qOSjTlgQaxpS9f8t6U8rx/sY9pdDNs+ODe0
	 4SkIYJyT3Sybb4uQnckQYs7qc0IJf4Eb5oZzDGL6rp4ZpsbsiZRCpWUlxTahrqPvLW
	 7OfajkLyuP4oHTOHbEcEAB14/D6wnu8rIxmZr+v9jKn4UOnvaJ2oyQ+9hEw0qSAq31
	 GrDZOzrEDw0Ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCKTj2R17z4wnr;
	Mon,  1 Jul 2024 18:49:13 +1000 (AEST)
Date: Mon, 1 Jul 2024 18:49:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jiaqi Yan <jiaqiyan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20240701184912.01f1f9ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/scmasqLmMwdWb2e7ZtizsCE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/scmasqLmMwdWb2e7ZtizsCE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentation.
Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote ends with=
out a blank line; unexpected unindent.

Introduced by commit

  2cba7831f62c ("docs: mm: add enable_soft_offline sysctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/scmasqLmMwdWb2e7ZtizsCE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCbYgACgkQAVBC80lX
0Gz02Qf+Pmy/WRKRdFizPS8nOMJHcsZgqbCzbFjMm9elB9vfwFYlzXn+z5AcqxuE
RqoLYaLhbI2D6cWSShtezK0qtoQzYAIKeY8drV2rlDAe4Jg7Qz1R4O7i5z8IqwES
KeqsSvMJ4fMRCOBYVEv8aNJocz6VBXDHif2RlHLQD30h+rNNlmDkYzYL3pf45NuU
VnlqNQlWLze0q+eNP3iPNMy0d0p2WnKLmjfZld++X3vYPzQkuImOB0Mk9YwvfwPx
oibq57wDjJxp/o4dLFntq1HY6e+BB0y/4AYwR4jzb9dsiKuCEg8NqXDWIJao2oKI
KhJcGgCsAyM/0fe8hYwLEZp6ZKaeEw==
=5d3x
-----END PGP SIGNATURE-----

--Sig_/scmasqLmMwdWb2e7ZtizsCE--

