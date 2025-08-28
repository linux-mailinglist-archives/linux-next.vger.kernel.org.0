Return-Path: <linux-next+bounces-8129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23555B391A9
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 04:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521C31B2160A
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 02:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B36C27453;
	Thu, 28 Aug 2025 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HESuvyEY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55B8635C;
	Thu, 28 Aug 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756348242; cv=none; b=gF+DTnNFhzlFjaaiLKnkK7LVCmuQRU4HCrLZ/s8YwopvCoSOtL/fdt2WymILdWefl95JhoHJt7YPNCmreZzv6XQudUA5LaFKKpJGpuS7HPVvgHFv41FrfnNaqYZpQEzn/Ua6yw/+qKsrEfTXIki3m3f0HYbgL41X8kfgCCEjckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756348242; c=relaxed/simple;
	bh=iKNiXFRzX1nEeZUk6fZim2JKXbuHPyUWpHKkX4rwvRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AnrAhdXPTLF4R9Kzo7U8MQ2lfPsXXDRS4erJyjY6/tgpNxK5isLyNjkTSCNx0/pf8yHP/HbNpxuIbTjsWz6yb/DSgVDhOsoORt473P3Ylzs+JflQ2xhv7aJqu13YQcN/DkfPnUTSRCdNpw8g/hBRBFX34pUC7EnhKMeEQl05D40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HESuvyEY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756348236;
	bh=kZC1KDfdhq0gkEdYPzIAvbx/+4yF1859Np7tSb3eZ6w=;
	h=Date:From:To:Cc:Subject:From;
	b=HESuvyEYbvKS3i9X3+144iJiERTNwp1GT2sHZULzo6UbY3wQvK9EI2bfLSsHLnrl2
	 EtyFq5dXaTmOvg5JqSDFa9eM+CJZP48w80rzRLKS+dXNptCmImIAVQqro3dIIqZQ8q
	 HgsJGv6mzCDe7ZlOWkoPZet/+K9jM0U+k3Fxh5QEJ+q5hImoNzVHccscolTjPqAk/r
	 mk6FOtOXKHqHSWbBcSfs0pTpiq9+fGTXwAtfZ7ZIAAbglrB53aWdE6hstovEZIg33U
	 mDHd5wX3oWgHHP5/qLJohD6yWDcFkUtP//YCndirg/9s87m7RpIzuwlllAQNZMd9di
	 aZw/pJu3RQN1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cC53c0z8lz4wfs;
	Thu, 28 Aug 2025 12:30:36 +1000 (AEST)
Date: Thu, 28 Aug 2025 12:30:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Alex Mastro <amastro@fb.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfio tree
Message-ID: <20250828123035.2f0c74e7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DnB81n2LIGA20nMA5qLEz6u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DnB81n2LIGA20nMA5qLEz6u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfio tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/filesystems/proc.rst:2171: WARNING: Title underline too short.

VFIO Device files
~~~~~~~~~~~~~~~~ [docutils]

Introduced by commit

  1e736f148956 ("vfio/pci: print vfio-device syspath to fdinfo")

--=20
Cheers,
Stephen Rothwell

--Sig_/DnB81n2LIGA20nMA5qLEz6u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmivv0sACgkQAVBC80lX
0Gwz1wf/YQskcQxuYsHbqSRkVQNybz56+8KcY7bvb3k9YLT6SfyxKp7/gOKEwBw5
v7phb7Fgjtv2xIU7IZRrPsYUjk+BXv/LGYQLxWJuGX9RGylRGJqeaD7iJlfCrvXJ
iV82LRPILTqilrJCNLnoQJAI2SJROuyPPvCWhtThjZGAEVZVwxjwGpJzLmXdQHd1
3DqthAQOarY3QtSNr7RLNokn8kBkT1qT5x9uV6uBF4+5NxnLOdYpJvyNvjs5Me7m
Q3CDlm4HbVMJteEBtw6lp4PQA5m2aJANIz+yrlIo03ZcaUZlVZEdl7A7cN6Afb33
+Mtx9CiiSrGupUG+BXRDMbXvC9BcCQ==
=8kMY
-----END PGP SIGNATURE-----

--Sig_/DnB81n2LIGA20nMA5qLEz6u--

