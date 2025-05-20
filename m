Return-Path: <linux-next+bounces-6860-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF912ABE68C
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 23:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538177A231B
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 21:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AC5261588;
	Tue, 20 May 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aJVAAuwd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE426158B;
	Tue, 20 May 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778047; cv=none; b=hinHlCb5SfHSV70d3IiMaZRsq3IlpMJHnK6zLW2QNxsfPOys4KpxWczYL6uGffHmnkOBHg9oD6kbsLLLE/VtteCjuMpJ82pn1bm05vrjLnKQYlsdv/7wBL1nskaC5l7UItNmilTxB9eepacPJM4q1qlH08nk1CJdwnkn4mIASl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778047; c=relaxed/simple;
	bh=QP4lIBNgw4FCYxusambi2zRPgHYLNLdmxTeQdFGYpFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=glul+nO/UNPTTHQRfHmMTOLh0Bno5f7racOv4UoPWMfOEUXtV7vtIiOZrv3L5kGGk1AlyKdOywmxYGNtWQQ/kSBPQ7MMtNQNH8Ed/V85KRjj04yeBBt9zf35Bp39JFKU0qTOAZHXAFYzmoT+DZzycc9bKSU4xehu3n66bB19NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aJVAAuwd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747778039;
	bh=p20V7rjuqfmmTQsbb0mo3u/KPx4CbrQEvuN5liEFahA=;
	h=Date:From:To:Cc:Subject:From;
	b=aJVAAuwdpyFaDCjJmE/ehjIp1Jb+W4vQSKGMgMnpSDJaRmg8x4U7rg+rOgGc8gE95
	 B4KQG8XNmtgw59qqO6z+iFX27JEIRkVez9rPYvR7Z8fPp9IWAxQRQuUVum4jTy8lij
	 hZQ6bdn8+yC8+NV06jbFJ3u2nOBXGE5sFHhYd5m7lJSiFp6bKL6rjcmo2oJJ+YXWo5
	 AdnBYrEAZcxKfmCppl4s4H8G/Qf/Q7VW07OGEnwsgFK0jdXeHrbsz/d1nN9fytIu7K
	 kBIZN3EK3ZujOREofuWo7s9gTZuTYXargUzK1jlx6p6CPcVtme5s+Jjd9s4I5lvACU
	 pEp7vl8Jj/CyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b27c73Qbjz4x9D;
	Wed, 21 May 2025 07:53:59 +1000 (AEST)
Date: Wed, 21 May 2025 07:53:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Marshall <hubcap@omnibond.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the orangefs tree
Message-ID: <20250521075357.0e34ded8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hOX+GBqf4=AEmff.L+x4wfD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hOX+GBqf4=AEmff.L+x4wfD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  ddaa7202a930 ("orangefs: adjust counting code to recover from 665575cf")

This is commit

  219bf6edd7ef ("orangefs: adjust counting code to recover from 665575cf")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hOX+GBqf4=AEmff.L+x4wfD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgs+fYACgkQAVBC80lX
0GybIwf/Yipzc8EuPCXPsTKEk38IHEMhM1rvOQ83q7ercVUBhHdtaBC5+ToduvFu
+71ZnELTlp2FCIkbjHaAb9E/QIBIIU1ex2IAM1PgpA0pdRhFL8oIFy3kN8yeGFYF
z0M4z4Z7eJayLLZlXMibvuE5oT5O/lv6AO/6s9WE4ZeKXeI/oWwN4DmOopAQafu+
7iIX9nHZr7K9uecVbJ3Yd9O0o0ceUvAejINxtYOaVxwot7dxDLlMhcNsmzG31QK/
I1Qcqpx/NwnxqqdU1/pmVJkpE8eAOs8cbli0sEpUmWprWyuczzzsPcX91M2PfkBC
fvGOXJvhaBLgOljMz5LHQq0pVuNZeQ==
=/SHT
-----END PGP SIGNATURE-----

--Sig_/hOX+GBqf4=AEmff.L+x4wfD--

