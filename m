Return-Path: <linux-next+bounces-4410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99D9ADB86
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 07:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06D81F2300E
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 05:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D751B152517;
	Thu, 24 Oct 2024 05:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ROrOUxOq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6AC8F0;
	Thu, 24 Oct 2024 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729747860; cv=none; b=HP5Vn9NpYR/Ime3wh3nNSywQ0HJgHw+tjGjp2wIaQW0dROdS+rnQcY7h1bcxL/XF+MgRJyBdD4QhxYtTxFiVATHBbaTpAmxq80riesVzrNBtBcFsZhsqptQsbG381LqtQ+TSN/50M+4DDRU9/hHcVoXVjVJBXoNW7S8aV/Cl+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729747860; c=relaxed/simple;
	bh=ZCV1tER884byTXVhFdZ2f/nOxNkR/XjtuGdEcrW9ya0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A8Ygwkn7MGmmdCvThZhyNh/ueuBu1b77RFt6rYEj6xiUEr4ofv9rXMJI812AoU+moscGZTFVX4qw4bvhHpIEF/gZAV1xs7KsEbwT6CWAD+ICahFdlBWfUsSVbMLWawrt8PeLc/RCL8il5QFOMzTgiuG2OwjmdVz/atMjfF/ZuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ROrOUxOq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729747852;
	bh=+JgXnY1w/ueOEsWHErKS/+gcp1Sh9XSIJWMfsDqcc0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=ROrOUxOqGM1z36a+sS5mIyR98irG0dBDd+3hxN9frukZRTm0DY4/tYKPDw6IzaMkF
	 UzjXHxwDcbi6ZHVEGDEBy7GWgjWIE3HVEeds1H0jkFVYbZg6ouF52g3xpb/gA58N9m
	 /HXMcMM3GQAN8na+H8dJO6Wlwo3cy/O8WCwxw3+aB8LiYnlHgRhH+L9Uk1X6RiEyqZ
	 kUmwwmVcKiQnQpj5EfvQYw76OepiyndYkmAhqziEWencOnrG1eQhBbN1FjfEw/DFhQ
	 oiIyf8TfpgrgjmNY6cV4q5sUaJ/uhSH6lf8Toh7UrRvaZHNUrGIDvSOE1lv61i+P8n
	 fMwFeRCLX1dmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYvdm13J1z4wc4;
	Thu, 24 Oct 2024 16:30:52 +1100 (AEDT)
Date: Thu, 24 Oct 2024 16:30:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Suma
 Hegde <suma.hegde@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drivers-x86 tree
Message-ID: <20241024163052.32fda0f0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7C3nmPEYYWc4xx/lH1+bmSj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7C3nmPEYYWc4xx/lH1+bmSj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/arch/x86/amd_hsmp.rst:86: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:87: WARNING: Block quote ends without a=
 blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:90: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:91: WARNING: Block quote ends without a=
 blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:94: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:96: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:97: WARNING: Block quote ends without a=
 blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:100: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:101: WARNING: Block quote ends without =
a blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:102: WARNING: Block quote ends without =
a blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:105: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:107: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:109: WARNING: Block quote ends without =
a blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:112: ERROR: Unexpected indentation.
Documentation/arch/x86/amd_hsmp.rst:115: WARNING: Block quote ends without =
a blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:116: WARNING: Block quote ends without =
a blank line; unexpected unindent.
Documentation/arch/x86/amd_hsmp.rst:117: WARNING: Definition list ends with=
out a blank line; unexpected unindent.

Introduced by commit

  f9ad7a2843a6 ("platform/x86/amd/hsmp: Create separate ACPI, plat and comm=
on drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/7C3nmPEYYWc4xx/lH1+bmSj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZ24wACgkQAVBC80lX
0Gz1LggAkHpGh/VXHoQyRoFKp8lxOny6QiiHLXxRoeCtGEIYTPLAEh9w0fggyn45
5LI70kpvLgUsW5vTLPvukIwqTPelXZ8TteqE9fEDBwGnp5SkgpinEyjUtGmqn+I/
HI34mT8WtBu1N+enwyzlGkGnRSPoZcnSWrCraHwaQeKuL1EG1NKPtbXEFBvJisMd
jx5ZWYGByr/w401cMuMDAB7XLEa891lf0oJ7uugliRO3GgdPWnA73eHDknKqLrya
dEenxFHQJndHvvrAnHJ39mPEKFAVgzKDotKsZp6C8OV7SlRwgs0y/+69/xI1g3VO
fL1aJ76lWfiWwLPN/PJlt3I5WKnLlQ==
=0Lgh
-----END PGP SIGNATURE-----

--Sig_/7C3nmPEYYWc4xx/lH1+bmSj--

