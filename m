Return-Path: <linux-next+bounces-6003-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A8A70C7F
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 23:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839393B0D9B
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 22:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ECF1F0E5B;
	Tue, 25 Mar 2025 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RggYCKbA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003D7D530;
	Tue, 25 Mar 2025 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742940200; cv=none; b=AAeoEZPPxAUnOV95AgtzNB6waO+4jezf9ofmjtB+oQ0kEaaNbllj96+KKdhxDPm8w76VjKRSjeEYPW52/UZ0YWL7PVCcVtf472rZavcpiC76ukRnLoKLYKrqQUd48gKiVWeOO89BE9UoiQeyZRN0d+ltNL9BA9jAJmVrKgaqsQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742940200; c=relaxed/simple;
	bh=sOvUY+7IRDk4UFh0A4n4ZbSZW9+agMvEydOR+upZykA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n0c7yTbxzDyhRExRstWdZCPj2YkDGCodgj4rjj3wYoNI6EOsNawxnCSf5ihTQJCrf/wzfqziWCwt/z0zz1WtESKV2EoBmAtKlM7/w0gkdJ42oJfR4R2J8zxfVZSsFvFQnrGgzCzFL8143TlbG0RjEkCnk+QtE2dT1nP3l7PEqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RggYCKbA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742940191;
	bh=38W8upVMOF87Aaqs8SXomZEIZnrWoUhgAIMPG3P4yZM=;
	h=Date:From:To:Cc:Subject:From;
	b=RggYCKbAoCiOHYSJV+bY2Hl3iw6i4MSLGTV5DvNF7h9DNq2h6S2sufhSUSaLXhAHQ
	 qbW3rHyi24rHHrvluWOkTYB0/fyqfqHQ4wUdK2ITeHrgOFEpp0KXD2nGtBZx2c2NPX
	 LZIfQGsXJiwNNV8tFxqw8XAiwASSJ8INdDfykTyDjopnA+kRF71oUSSL9y0dVWIgq3
	 aXvXH6YlQmpjJnfi+wgnYUt3pLWOYstY87gjrFEOSSXY/6fwfLPyLcfgFWyuaPQt5/
	 6pZ/+5l1EcM3BnMCnMKIf0S4/niaX/kjt7pX0PAuKsVLmXrPVlJpEajWOmGm34CSc8
	 8cuYn7MF1DpYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMkSb34QMz4x3S;
	Wed, 26 Mar 2025 09:03:11 +1100 (AEDT)
Date: Wed, 26 Mar 2025 09:03:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the xen-tip tree
Message-ID: <20250326090310.4f162838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FIk6u8s3DQ3M9mmnBRSUw+D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  d9f2164238d8 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain fla=
g")
  cae5129fccb1 ("PCI: vmd: Disable MSI remapping bypass under Xen")

These are commits

  c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain fla=
g")
  6c4d5aadf5df ("PCI: vmd: Disable MSI remapping bypass under Xen")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjKB4ACgkQAVBC80lX
0GwvEQf8Cax0RQJCNfhf8Gk3G999eeL2bfU+Cz1UURF+bFcV8xCQyVjrgqh5iksV
Mod2f+MVSKcsaJ4Ssj4hpuTbU7MJw9rBWuQymBKs7ImPMKFB5XXK/kOg1uhvQZsk
YSygHcbKRTp5aUzf0G7NP29JVQWV1MSL/IK6R85DYnp5ieu9bB/evcXsOs+r/MAh
YdgutM1IaZXBy7wb6StjxGQ+TNtbrEnUS+wUbkvFDt0QwGFOIXV32e95CwyKAXnc
ztgPHPurzAKR7jWqjjdxne9+IopPVwDCyaHE/w0CrV8vhuuAapyuqASNejMuJR5m
quRcnpAzoQOo7S2PECRraGvEdvI6Rw==
=k2y0
-----END PGP SIGNATURE-----

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D--

