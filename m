Return-Path: <linux-next+bounces-3783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB786976486
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 10:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF431C233C8
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 08:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64F518A6A9;
	Thu, 12 Sep 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="emP8N6Qc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BEF18DF7E;
	Thu, 12 Sep 2024 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129817; cv=none; b=e75Io+dM/hOWCFP+JAsXDsd8v2J+kC1UEUacbRI4Dh2Bhv1GPubfZccvQYsmDqpSdkMwJc3riL+dJX9gNphzuVb7f6hNqTa5E6JCoSGoZnca12m9cKhW7pHmKho4u7eNDH0ccSmyzeg5gjkr/tLsA5U15GvhqeDcbNpMRhUGSuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129817; c=relaxed/simple;
	bh=5i/YCjWwVMx3uNZnk4aIVy97PGYM0OWIx7cepN/R0bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PD1E6tnmB2VAMQzwtjkFkdBSl0ChZfbhW4m6IBzVSq8MKNdcioj0H4ICBOio+3YzhtOnPk2g5kZM67JVDr9RxSXWVukMUh/phYumFnAMHaTbhPSXH/B8DXVRDT4gJYwXWxho10ifyJB0H7pizNcurIRZg4BG5IN5lPR/iPgdRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=emP8N6Qc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726129812;
	bh=ZTygpK6kE/x0OmW4gBjQYK1dH6vP7NZt0HfXwF/ocJQ=;
	h=Date:From:To:Cc:Subject:From;
	b=emP8N6Qc040yEX90EYchF+KYx6C44o48KLvuJe0MwQHLSamiWu56HKkykhRBrZ/SD
	 br3Kf+Rlsu5ZJh204Zq9B7fmZMTWh38x07da9IllmtF4gCfZjopD5dncqEQ4eqee2z
	 u2x6iJoDBW/+kGgk6us7wIx+qDbtXHeNWNsSvqpe/03/V/t8rjhIMAW2KZYt6M+zKt
	 6yCTacB0WpKubHDTUJkcN12+KGci2EAcX2zdphDs/6yj+X7o2diUAvRXGViwt5bTmc
	 ki4K3zdpeN2FVyTMP4EyJuAaY/21uGsKKET1iGqqnQwLukJIhNhozY9jwqne6CCvuK
	 hjqJHWIkbjKUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X49c371B7z4x5M;
	Thu, 12 Sep 2024 18:30:11 +1000 (AEST)
Date: Thu, 12 Sep 2024 18:30:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cxl tree
Message-ID: <20240912183011.6a8ededa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/klDF=XsH11d3uh2hE/jQkfM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/klDF=XsH11d3uh2hE/jQkfM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) produced
this warning:

drivers/cxl/pci.c:200: warning: Excess function parameter 'mds' description=
 in '__cxl_pci_mbox_send_cmd'
drivers/cxl/pci.c:200: warning: Function parameter or struct member 'cxl_mb=
ox' not described in '__cxl_pci_mbox_send_cmd'
drivers/cxl/pci.c:200: warning: Excess function parameter 'mds' description=
 in '__cxl_pci_mbox_send_cmd'

Introduced by commit

  bb10253dafc1 ("cxl: Move mailbox related bits to the same context")

--=20
Cheers,
Stephen Rothwell

--Sig_/klDF=XsH11d3uh2hE/jQkfM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbippMACgkQAVBC80lX
0Gz8Gwf7B7HkNX8PukUYu1e6bVHUFQ263dovc6XjLKFAXbYqvknZfLggNWTve2R/
qw6kxOeLNydTU0LoC3+R1Ns56FkegxwF6ZZGsvbEQ0fcVbl+6VXIVCc5PadrYbur
SOSx7BEtvPExj2hu/Fp9NOiHw7BDdWhSlZ4N9s42zifuVrVVRJMk/O1wkzyiR7eb
MmNNqCYXxTzxjcI8hTWzpQtLUR2AlplImyBnq6VoO45Llu1vsOxPcSNg+oCNklUx
eEELOp0LlL07HvAYl234TeEf7ABuab7tUmJzsb4qtqBJGlDnvrAyfW/dJBacCynA
vW+zgi3oQEKPHwRoUXDeWMRcPT/FwQ==
=c5vH
-----END PGP SIGNATURE-----

--Sig_/klDF=XsH11d3uh2hE/jQkfM--

