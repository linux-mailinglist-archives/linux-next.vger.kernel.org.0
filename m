Return-Path: <linux-next+bounces-6929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D82AC3B0F
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 10:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 921BD3AE46D
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 08:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316FC1A29A;
	Mon, 26 May 2025 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pqMvfZM0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0464256D;
	Mon, 26 May 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246636; cv=none; b=kXv1r190TqHRcMaXhk2MvAfG0fDCv6swbMLeeKyFPqDfC2Ude7dAu00Fdw0lPWwzy5q1R9v28GkVVUTlbda9hQo26J5R0IqRpfyzbJW63+uRZP3KA3YHxlv3mrZBiSk5HDG4T1vblTLF8JW8YWsMcPROoxsSC9yvhabYhsvsxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246636; c=relaxed/simple;
	bh=i1ThYJx35hPnPfnJr3jAkSqCIh5RNLHshZtJ++qnFeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BJsBHN5jmijMp6JeLSMgYe6X4TGYPv8oJSUBCCqmMqpSzZVlFu8mbNu7xw93hSJRXazUydwMlZlIUc0hrSs1djJ9bLf3JRkm2xI00FusHxfQWKBxaqeA13ZhPWYE8SIosvdWiPdlO3CBnIR9fpzgxT5E4ShepczF9lu4D68Xd/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pqMvfZM0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748246631;
	bh=67dL392PB2ONNjmFxxYvc4+Ev8u/3ESyfez3Gchqzf4=;
	h=Date:From:To:Cc:Subject:From;
	b=pqMvfZM0b7TN9T4nPEuYersFGui8lpsZ6L120c7E+Pk7ok+Dj1IDfv4VVY/tkBvY4
	 0ZNux89+iD+6VKonQdVm95p0QMmZZIX0ZF3Mm1FiEk8s3h4tIXND4D0vE4lTEmWTtZ
	 uNhqX53oE6iUS/QksN3HjRgY2E1NQ7QHEtsHVg+jHNceDEiabPGwSiTEINYacp4PL9
	 CEP3xIzDjOF2nAPHF5clBIBxPa2W33SMn/lxuIKcuDopKmlg7n5Mr55RWX3y5XVUCE
	 YrWDJLzYFtJ8ICDg/ydSv3QvImrHGHjG4Px12iokM5S8TViIeESvxPSB9Zt9+3r0vx
	 47byunztFxJ0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5SvW3HWtz4wd0;
	Mon, 26 May 2025 18:03:51 +1000 (AEST)
Date: Mon, 26 May 2025 18:03:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20250526180350.06b825de@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9DWGryP6VYiW6mecoDHyxMY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9DWGryP6VYiW6mecoDHyxMY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis s=
tart-string without end-string. [docutils]

Introduced by commit

  707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/9DWGryP6VYiW6mecoDHyxMY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg0IGYACgkQAVBC80lX
0GzvJAf/WdkTpvoCWyIMh1drkDfuzuMQb6IUU39t6h3/6EtB9/EFvPSb3Kewr+6r
5S2lLO0+k2ZyItUOjnZij8D1o8INcpWHi7BsdSLtaEUV4Ss4nSc0zYV6S0obHrFc
AZ59N7dwMBGMQN8ChbtPLUcCbISYFnn8asIu1+4SKAEDwudcmP6iYE97fO7A7+vt
6t0w2WNCm91Fmyh+RAA69u3nfed8ovNSuPL5QZ/KRzMpf4ZoBKBsveLC/Qb1i7P8
FaP71tw9WAFG8zsuOKRgoLQdT0hknMYWMNuFqGt+kBVQfaJ50sUzcveAeIylRVDi
Gc6oc2+1DErhCs6Chg6rHSs+7tCF/A==
=jsR/
-----END PGP SIGNATURE-----

--Sig_/9DWGryP6VYiW6mecoDHyxMY--

