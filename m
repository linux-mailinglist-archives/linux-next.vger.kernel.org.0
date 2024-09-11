Return-Path: <linux-next+bounces-3745-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69191974A14
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 08:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD7C1C258A3
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 06:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368A043172;
	Wed, 11 Sep 2024 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MezA2tSs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60D2AF18;
	Wed, 11 Sep 2024 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726034667; cv=none; b=Kheos6foU5uV0M4Pobnwr93cDxL62fYjrK9dXFRzStdkILhgCjh+MfbsDP25lX7tyRyMzYYx87yULvKKH2t0VZuSxbFU3yd3HlYb+XlnxlVeGYny2YbNV32lfHlWWVzdPu+vFUL3p+qoEZCJWsynyZJpcdujvy7b46FWzwhzIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726034667; c=relaxed/simple;
	bh=NGccEAzQho7RQQAZ1T44cZ7/ltWa9N79GNW5+mMbXC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OXw2coyrYHsf2VDhAPBMP6dfQZvFm38A4SObW9nq1iCz7cXUp7MRG88/R2q3edZNeHhosCW1Jdn8c16lrxoAuWPvmp8CKGe+shLb8eL1KO/HWnoNdGAQHZ6LNZism143oZkxFGIz3zyy+H5/i0j4/ArpPmBEeWYf3dbgc5Rkq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MezA2tSs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726034660;
	bh=9AiLuBNs/7aC54Rkm+IEyIUtDABvpTmRemFLe/DNkpc=;
	h=Date:From:To:Cc:Subject:From;
	b=MezA2tSsLIj4Crg7kfrq3FW/LYnC3ajf+7iFpeoUBAzxRWxPG3uNP09CrIwFLQWtj
	 mpMGJuwqW1JWApIA2MgcHYHs9+p5EpURjo12OWxqL1dxUVXqwqcPiSL2TB9PhSYr2S
	 Su+GrsbrcNn4GjRGggvov88r87g76FRbCoXbh4mRqWrHZdJjsrK888H3xNqVmcBW4b
	 YGLJdfe98mgksJ2BQWhkKKfpdcxU6LkHxFNvC1WNeqdgXekDYhqVFnJyG7stBmW9Ff
	 ncREL+A+nFrB9zEygqKzteu2lWoH/1AseJamhXqWv6qTIP9GnMdfeLrsobVIOmqsaZ
	 tfai8Jwr9Vbog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3VQC6sHRz4wj1;
	Wed, 11 Sep 2024 16:04:19 +1000 (AEST)
Date: Wed, 11 Sep 2024 16:04:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <20240911160419.20aa64a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/582N.9D4_/VhahkMF_TFUjA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/582N.9D4_/VhahkMF_TFUjA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/kernel/jailhouse.c:17:
arch/x86/include/asm/acpi.h:179:42: error: unknown type name 'acpi_physical=
_address'
  179 | extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
      |                                          ^~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/acpi.h:180:42: error: unknown type name 'acpi_size'
  180 |                                          acpi_size size);
      |                                          ^~~~~~~~~
arch/x86/include/asm/acpi.h:181:35: error: unknown type name 'acpi_physical=
_address'
  181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_=
size size);
      |                                   ^~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/acpi.h:181:63: error: unknown type name 'acpi_size'
  181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_=
size size);
      |                                                               ^~~~~=
~~~~

Caused by commit

  9adc485684da ("xen: allow mapping ACPI data using a different physical ad=
dress")

I have used the xen-tip tree from next-20240910 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/582N.9D4_/VhahkMF_TFUjA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhMuMACgkQAVBC80lX
0Gx7DQf/RD962o1RDRkEQf9nkOtLj/Uiy/44PMz2jH50hkl9p1Ji6HGiCICqt7lR
1kXYslR4yv9r0oywo/LaO3/pD+Q6QfgRXIrj8oLwVIVsErscyqBpDwoJI1pufupx
q21+oHuYInRtSvLOgyDXZAJXeW6jIKumP8INzGJBCVYJhEN9OU1EEkr0tmK64Wh8
4ZgiJsKsOOfI4B1u40oy0lnRzh2bXin4SdZHBtOIhxmAjrL50cB7aCVrtHG6ykEh
xjic7GrimIgywqxSRf+1NkiHQa9B02tJzBIZwj+u5ldcHJ8TFnUQIKAmgVmQOsCl
KbrtiDKRqhEiKVvoLVaj32FFzjLwTA==
=8S/U
-----END PGP SIGNATURE-----

--Sig_/582N.9D4_/VhahkMF_TFUjA--

