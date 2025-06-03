Return-Path: <linux-next+bounces-7046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7BACD01B
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 01:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9781F3A6C9C
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 23:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F68A1624E1;
	Tue,  3 Jun 2025 23:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J4NSXC0B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AACAD51;
	Tue,  3 Jun 2025 23:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991744; cv=none; b=ruWVedaKpxoHaZMKMsiL35rRZEu0ibAyfn1v1K7oUuIaR1hOtOIpawmh9WOuURuVnONxsyPO52ulEzj3iT7iLdkgYSgGQNxG9jNQ/l5SEoGIHmIORl/c1KNnF9frdQWkTelfNnHx54HyAroARLwLkeHr6rNnL1y/lKS4Psw5VGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991744; c=relaxed/simple;
	bh=4nEwfF4v8gc+6O8dQMD5X50ekrMJYvDA7ONoB1wjc1g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Egj96wuxXt7y6SAFGPwUyVAnZf3CA8VlO9lSn5wctohNuFfHoHSVlp65RUScU8FXPrl/uM3DcZPaRw7FpdA+5epZll56cWKNOOHjbQtdH4HFmGwtholMGeF3qHViP//AK4rTMePhBFADFX5VCHEA62NdBQz/QLH9YFHyJUfdQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J4NSXC0B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748991739;
	bh=8YxBNWpC7l6o7mHHvyfAXJfQe7CZW3e+CIY5WujsDNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J4NSXC0BPTyVM3EtyiuLStRMM33lhVsHBMdd/4JhokOLkjcrxWnJjrajlwZm77uI3
	 Dlso4UvFc+xtwV1MqujyVV6LzwPuALIs8tbSvC9TV0LUtMImS4X/V8n7LUW61ZMmPK
	 GN/pk+yc4eMH6ByvLFaETEJpwIMgMiTOhG1rEaJd9ToLpvfMMn7erRKpbZ57i7Y2hj
	 Jz1x3Unb+T+NJ3Ekh1tQ4+xrhck8o241nC2ipDrDF55CbwQtK66qr46R/6aDBOZLH2
	 8oiY9EJZeLOQ3Jza9FNEKF76xk4iC4KCd9CkAqRQRL2GyYTV1h3dobw2XiQyPnBAB+
	 wTbSyNQS45pHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBmSW6NJpz4x9D;
	Wed,  4 Jun 2025 09:02:19 +1000 (AEST)
Date: Wed, 4 Jun 2025 09:02:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20250604090219.29f09a62@canb.auug.org.au>
In-Reply-To: <20250526180350.06b825de@canb.auug.org.au>
References: <20250526180350.06b825de@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SIP0GdZxpfmEqMqQTCFMtHx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SIP0GdZxpfmEqMqQTCFMtHx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 May 2025 18:03:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the kbuild tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis=
 start-string without end-string. [docutils]
>=20
> Introduced by commit
>=20
>   707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")

I am still seeing this warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/SIP0GdZxpfmEqMqQTCFMtHx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg/fvsACgkQAVBC80lX
0GwYqQf/Sq7A3p32+83Bd2dcoMcimvSl62kKzVgY4th7Q86Jv1tYBVEp0DNa+Mpe
zxoGBBIonA4IFpYj8+Y8IM6RV+UM8wFHxc1JBP6dk7YIejBMmUuMsDK5AjKVEQA7
on2RY2UCBZxfRu6fCigQqLPhL2bs7jdp4P+Pp3VACPQtUN0IgT+MpPDwF+eYzrFB
0pO2X3j/w4f9CAZ2Vtqo5GQTvTMip1Eq84Or5t2KMUyH2fqbfI1fjKWYu4eqblyR
HYJKdWFg6G7T7hDTQjW/6M/cVolsVn6V9npn/7G/e4e8PNgBMA6waK1kxYNF//zm
FlLLORWKgnbC7BpkOmWJ6obb3YYs/Q==
=M48a
-----END PGP SIGNATURE-----

--Sig_/SIP0GdZxpfmEqMqQTCFMtHx--

