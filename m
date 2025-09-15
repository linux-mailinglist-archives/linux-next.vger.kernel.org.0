Return-Path: <linux-next+bounces-8312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5021B58654
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 23:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EDF4C40D0
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 21:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990411DB95E;
	Mon, 15 Sep 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TMEtBHDd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5E296BDF
	for <linux-next@vger.kernel.org>; Mon, 15 Sep 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757970302; cv=none; b=naQAxvYtplAJ8KcxIyHgNGzgv66V+YkRWcAAkwIqkxOc6emTDZ84J+GV/8DpiytlhCQJItzC2NTbRz/u0FUEdds/q4IOftuj2UmP0Tw5TsYwkL043rZVhQhkOSo2MyU5ebcPGjmznGuWRpi5gTkAZu+E5adXUA9jt8fFX5mNXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757970302; c=relaxed/simple;
	bh=kwWCKHxwLqZgvWTjTnDQrD34N3T76maPRJJ7Gi2SqtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJvV9SjcgoQ00X8Vnd2jheevGMM2VI7MsNAyNTf5hkS1x6zk3xsyWRCpAGeaACdZrnl9xIHc/QlU4E34xlvJe4cIMVlXQFLWEG6ZqR2Sn8ES/ra7e1EMjQiJrpMMMM2iUA3xfkd/inuXwfM7Okm6MmS15gOAzGDMDaMp6KZXFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TMEtBHDd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l+5R
	O/mlRa3f5lfywdYD5PxYcu0VimVPHxg457+Xecg=; b=TMEtBHDdlolKthgGTQTg
	gfWVQz10RX3IvroSse9PYtYr1J+4NYu9RwyCIItdrFb/WG1Pcp8kwERu3skpIsqy
	Zm+iy8L5GX4qcsy3CBSRPT6aphXQKCHUeXWf839qRGlvvEH68Dsv6idfkxGHJ1Co
	ZXu4Iu/aVciytPqK+5klmTsV1i/KGnrImUWR5JEO6hg70s0G15VjlcVxq9NJoFY9
	iv0vpq6Eemi6VzNekfpTiqTVPGccgDgLFsfV9jtKYxCvPxlCyc+pHWaTvQVtlYhx
	Vb22rf+KEXW9SHOwX9b4N6a/t9O/UmK0fw532JEpDNpUR/MDBtvkAorXuNOqERLO
	QA==
Received: (qmail 2512761 invoked from network); 15 Sep 2025 23:04:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2025 23:04:56 +0200
X-UD-Smtp-Session: l3s3148p1@nkUIW90+zOkujnt7
Date: Mon, 15 Sep 2025 23:04:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
	Kartik Rajput <kkartik@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <aMh_eKWqkuLODo2r@shikoro>
References: <aMhR9TJm5V5EqaoC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QX2JGX+OmvkPSqcL"
Content-Disposition: inline
In-Reply-To: <aMhR9TJm5V5EqaoC@sirena.org.uk>


--QX2JGX+OmvkPSqcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> 's linux-next merge of the i2c tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>=20
> between commit:
>=20
>   804ebc2bdcc85 ("dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264=
 I2C")
>=20
> from the arm-soc tree and commit:

? Usually such patches go via I2C? And v6 was still under discussion? Do
i miss something?


--QX2JGX+OmvkPSqcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjIf3QACgkQFA3kzBSg
Kbaxqg//cU0Nkzb/5JAYf0ksxhJiI5Fjx/r4+rMK9/JV0S5ip+FfygClcTh/100y
hjP/M17jt83HJJpHvROGSZeu1vrjVX6DJsyBeyYvMJTF+so7TDwyyyjbOwJpT3vf
ztIubUBHHMarrIVvZm1fXnDHP9Yp0/SwQzzaz0VFSoS70HYtADmRL/Xzx0yB2wiz
s4Gvkjmjpsgo///5etKEbGLK/bQfFLIZsZ8BPQFn7iqRoc1ESVqPVxfDykuU5R1n
QfGpqLyK/6dTq/bqOc8WWZQY8NaGm+aA48K9itM4haaDwxmQlmT8aB0TlX0E53cV
2AUV+CBs+AwPPQqZ5xzDNTYFh/J8Ej/4SRCbv8n9USC0nIZHWtX5KG5v1UCEqTgh
VBapuuDtBxEKl+TgMMujDAV1LEhapLv6r563DxVHqATami9EdguHoveINY3Oz0DV
wmPWH4MtiwQaG51z/aYfopy/wx31zHkQBNoMJIy3NGkmcFF6dbswEE4uK0cpdKGK
Vp5S4Yym4HmXljReUpSzG5jw7uoTBIdmstZFCesZASV76KGHz5VHicFaEh7lHr84
2/QUApju1FSQJUJ8vD5jrS+Ue5FxdghUid+476yBIKBcYESaFjLwqXPFn0w4c7JD
FDWw5HSCVEC8qOCZdN+uokumWHhlX4Y0jIP9+UDUOgW2UBi6hMA=
=oGeD
-----END PGP SIGNATURE-----

--QX2JGX+OmvkPSqcL--

