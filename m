Return-Path: <linux-next+bounces-4226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D8999883
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 02:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19F40B211EB
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 00:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23A36FB0;
	Fri, 11 Oct 2024 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b6eiHN9H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7E04A06;
	Fri, 11 Oct 2024 00:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728608331; cv=none; b=fyz1ud3aRYbHRBMhUNgBS85kXmUMemcflwQZN3AR6+DjDt/MK4Gl/uyB8kKR+kduomV91ipchqBOLP0pHaaeNPArUHwkKBs9U3qXUaMWhUSSGLawNNmzw13tGmR5Xf/bChb815uqBtmYXBe2PPw+1vRgjC9lH0wDbrasU9OLgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728608331; c=relaxed/simple;
	bh=grvHkgnfb97jlKLpmMzMve0o6KSSEAdN0XcC0zMDdhs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/cR4++WYi8O1KMnkopq/dVe2GbmTSzKFJNv7PKly+eOwjJNPIIWMcIjgPluropqHEAhlIBwkvoGnu3LPvhCswsYpYDSIkrVLXx1BZYPbiNdfw6xNQ9Z50DjL2GEYz+qCT4KYPnoIsOsxtwZ3Qi5nSteGn8WGM2F3ZCcmWykqV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b6eiHN9H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728607739;
	bh=grvHkgnfb97jlKLpmMzMve0o6KSSEAdN0XcC0zMDdhs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b6eiHN9H04wdbQs9hHLvm3ffkhxJK6twxy1ha3tAfuDZDPBO8OGJ5hoej5mQ+4/qV
	 3RgSbDJSjWimjGnhOgGjClEP0mhOltfIRJ5jDqt+GIIKT6zAfewQBVKhbkFGTbrv9/
	 kpeySY0jjGd0JLsuYPxPyvO9ABd2vLmlPcesvqZWzvdaHB+u3u4b7SsVUzlzM7COUE
	 xiEnVCf6cQ0T2psiKdtq6rJ7Pdg4AELPoeIvgLmNFD3FbztDJgzr9bU6jtqoR6gEf4
	 Aew4C4KCndh/9/NF8E5yl5carIQx+HJyYJaeyGG22bIQ87x42rklCF3OWzYOJqORIp
	 nSvnHybTmlrkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPp0W0zNkz4wy9;
	Fri, 11 Oct 2024 11:48:59 +1100 (AEDT)
Date: Fri, 11 Oct 2024 11:48:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers
 <irogers@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
Subject: Re: [PATCH] perf tools: Fix build failures on ppc64le
Message-ID: <20241011114858.61ff252b@canb.auug.org.au>
In-Reply-To: <20241010235743.1356168-1-namhyung@kernel.org>
References: <20241011102330.02bece12@canb.auug.org.au>
	<20241010235743.1356168-1-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z+9l/H_dw6PS0BSI083ac7A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z+9l/H_dw6PS0BSI083ac7A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Namhyung,

On Thu, 10 Oct 2024 16:57:43 -0700 Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hi Stephen, can you please test if this patch fixes it?

Sorry, I still get the same errors.

--=20
Cheers,
Stephen Rothwell

--Sig_/z+9l/H_dw6PS0BSI083ac7A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIdfoACgkQAVBC80lX
0Gx8LQf+NRlKl1Gef2kwXBDSwhxV2rImCzK23w9KCzQlN3cZC/lO6xsXER1ySttV
YscUE/+jN9AZX8PlI5HHv9UAE637JSgu5HyqVLNcPNazkpUTP8jknxVHnVGetJYi
LoMPrJWgJAPwf3Yx4tYmDlri6T8HZeICiz6ZAio3r0qIPF9VXGBK1vxNYW5UaqzE
rEY8XjjdFWhnIHL2tGyY9lTZezWuDpz7cNwiYOr3iGzH6u12dVg/+FxfahqOzSd+
q+6RdVbTQZMk1sjtTapEieUKrg8VY9lVHQKiAMgQQCqWjxHIEtTrf4DggfZ3JC+T
J2HpiP0yjW6fKEjMdx85EGYACAUi4A==
=Mwxc
-----END PGP SIGNATURE-----

--Sig_/z+9l/H_dw6PS0BSI083ac7A--

