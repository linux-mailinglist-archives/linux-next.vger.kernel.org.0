Return-Path: <linux-next+bounces-7294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A7AEF3F3
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 11:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B02F1BC64E4
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 09:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C288426B772;
	Tue,  1 Jul 2025 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ak2nOvXu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF324168D;
	Tue,  1 Jul 2025 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363681; cv=none; b=ZDDhSMfi34TPWSzKhgWtCEiPeCUTMyDE8Mvh3EIoTeawtXCn+Y6UacVNQzOgl947pQqtC4OndyNHLUnSCbaAo35TO4hDn4G2h8uYid8TKaUJFpJYffU/3Wx/UpMosh9QsDR4Qzr5A3ekQ61O7vJqF94IJPm5tEPLXMjC1cekY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363681; c=relaxed/simple;
	bh=UoNW3L22Hp/Lb0vRKnOUgr4kGA8r2uI0BhOT5H3uk9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WDgaNWNaLZzt1EybK+JgXnEO4Z2l8DAbz4eGDrpZ1gQyfAQU/QnB41z+xIjhQR6i7t6moqmSuEjr3OYnrqeElxRgO2vBMgeRbTcmlM9r11VXJS9FzpBS3FGX7EVUWJ7yCIvoVPEJoOCy0B3l0Vv/7SOTxybyhMx0TsT92jceh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ak2nOvXu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751363665;
	bh=yLbrluiklkwd5wYa70Xm8yRBSiAsg4GLSOZO2I173e0=;
	h=Date:From:To:Cc:Subject:From;
	b=ak2nOvXu8kBXmXGpuyuCzeHyDFGywcAJwbMn+0IQLwEBQWA8vomFKV3tnjfFhRuda
	 IJtA010764DP/PzQEA05oFadwFZhp/8mVp/a7wVrtLrt/bHhcT6Bfzam1M/CDr+xhH
	 a45LVhzjmx/T//AdLrbLFjIhB3ToCiIoobxrIekqirDlTEi4/37RK85uAeYFzdi8XL
	 38nlX+elj71H/gBfRz7fk1MaOU4mototpiLwFp1JpdgjcqVTWDJsKii2nElO1bAXhs
	 m1GzDl0s/XWD7saTgYp903F/jRgnsS9XHAqdMqqzYqsYhhPMApgbrYJexmAUnMbGux
	 igtnJKc7moAnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWdfT4q4Nz4x0C;
	Tue,  1 Jul 2025 19:54:25 +1000 (AEST)
Date: Tue, 1 Jul 2025 19:54:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the landlock tree
Message-ID: <20250701195433.61ba6cb5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f2=2wdS=l0+yJ_OappkQz/z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f2=2wdS=l0+yJ_OappkQz/z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b2b0b621d0c2 ("samples/landlock: Fix building on musl libc")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/f2=2wdS=l0+yJ_OappkQz/z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjsFkACgkQAVBC80lX
0GxHoQf/Q22rAZERcTHz4Hz9PU9S19j2wQnKsw1RAXVHMODpRrMx9iIQIkGEhegt
kMpCUHIBX+FxZxXgy06gIC0T2DVszbYzg88dPLKcIb1pl4ymseTQhfKdJg21dFXj
Ystr5s+eW2Gip44MQ3v9B6wbXK/VojRsNEaQ8Jj/0/lABASQTBSfmRHNj2zF72ZR
nWevcvNgi6oMEbgfZClV14Uf2HYlBY3MWX6RLUN9OXhdlzeeIy5Ji1MiSoiT6WWc
e38Jap4XQqLrjP+un2Cr4TfHEHgp/gUi0ONNSholS3BkuqIlMYDXVQf4BMB1S5+6
USArvVEMbrzn72LkkaL8CHRRt+Hmag==
=o6gy
-----END PGP SIGNATURE-----

--Sig_/f2=2wdS=l0+yJ_OappkQz/z--

