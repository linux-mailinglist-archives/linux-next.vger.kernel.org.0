Return-Path: <linux-next+bounces-7577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCEB073BB
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96161AA830E
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF89E2F363A;
	Wed, 16 Jul 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pwY4odRn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4092F2C40;
	Wed, 16 Jul 2025 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662532; cv=none; b=sl+R6fZjU17E7OfynbcD3Z1p2Sj5UXOyhkjtjNYKlfBqP+7yxq/PBf2guYwsFXCh7WWhxx7uNpjnCL3xtl9wkaPnKySCKhby9uH6AGO5gL56SvGSjsi58sduusO2kumVgc0SQR6/mNDZBry4QD1kOZeOn2mLLxe1+gBkcTh5h6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662532; c=relaxed/simple;
	bh=8wNRsQXja0BonOAHeoguimSSVXpsRP8N4I4qkzBw920=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IlD8klwE2bOqRxgAqFqFrNf42YpfNfAqj1y9+SCiaeQwZwG621VdsVfb5IcJ+YIs4DmxKk5AivVbf6dhReQatHTcl8JJ/iXUAweVweTswdy9O6FLIYz9mRWQicnoJWej9sX0K4BeL9eIBs0xtILkv/0YRCpN1v7b3cZNQxvlRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pwY4odRn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752662412;
	bh=V8XjqI0Xeld/vTkN1Sm/WV15DBaZz+ebWX7ejp0KgEw=;
	h=Date:From:To:Cc:Subject:From;
	b=pwY4odRnpgJ2yoMg29jYSb1CwuRW/ZIfwRtQ/H61MCAtQyH2mwSHK/X1yc5vbv0DZ
	 azGvEwDy76m+FOHXNRhyLYYuC9pqmZCSDt5zkHvcyDg50/mZ0zJMR2ihCKO2KX6LEo
	 Mvtv6sEB/b1To21QcsDbYwLipRoQJ37gM77EyeSGoibiaspBLA32X11jFiKDDCpW+6
	 WMkVjwM2G5WMcuWpiWuyGRIkVo3bu0II6ozzuGpuOjnCnZpHKi8Jw5AaTMXTs+3m/O
	 025YcNMsLGk1oJ1Wm0sOhjdRUYV8q/3jf/8FX86QG+Rh9rW9wRGAwHSJvn2DrkG5WE
	 pcTuNxQ5ltU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhsyM6dbpz4x3p;
	Wed, 16 Jul 2025 20:40:11 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:42:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>
Cc: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommu tree
Message-ID: <20250716204207.73869849@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7pqnMI5aY_MNELK_M0GirA7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7pqnMI5aY_MNELK_M0GirA7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/debugfs-amd-iommu:31: ERROR: Unexpected indentati=
on. [docutils]
Documentation/ABI/testing/debugfs-amd-iommu:31: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent. [docutils]
Documentation/ABI/testing/debugfs-amd-iommu:31: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent. [docutils]

Introduced by commit

  39215bb3b0d9 ("iommu/amd: Add documentation for AMD IOMMU debugfs support=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/7pqnMI5aY_MNELK_M0GirA7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3gf8ACgkQAVBC80lX
0Gzsywf/SU8SVdg8SJL1mxzrT0n9QASCTQUWlz8ad0BdHJNxKCgotRelPO5i+LGN
P2N3t7yx7hQ8M8HtPU62GhbKt4MPO0K1Oqy6mf9rMRFIwtQFq1U52oUuGjB3noL2
1mqPJ6zbn1kvr9gssrOmVDoA50afNMdautWL9qP2/aA8ZC5o/jFTSC0kyV/VFggR
Tbef4sd352L0CCgpKtFUzmy/bUDktfV8qaOSJrkWOlLsk+gYc/JvZMHdnzHrGrrX
briuYjcGe4TpEOPa0Wo8yEXNhmJ8tOqfrAnDwfGsTXXH+8tjon8pokVAlEDZo87d
bPSP5ALn9t1rtVFmd91kqTWboe4RKQ==
=9/Gp
-----END PGP SIGNATURE-----

--Sig_/7pqnMI5aY_MNELK_M0GirA7--

