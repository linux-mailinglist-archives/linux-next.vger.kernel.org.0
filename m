Return-Path: <linux-next+bounces-2315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED028C60D6
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 08:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8E55B21039
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 06:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5113C68C;
	Wed, 15 May 2024 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VOfzYxkU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BB3BBDE;
	Wed, 15 May 2024 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715755042; cv=none; b=Dzz8oH4QrUo+JXoRwCOKbfJpNUMjoiApBIOyzI+wXADodwmW/cIWfoNpxhjjdpEf57zv6ewKudfIeD8X3bLYvvYpIHSeCQmUPHANMqbZKaCCitAdqkjjRGyNHRiTOiH37xSwLtnQ49bVAFPIYvyVcThm1ZRyzt2c+HPZZMSSlvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715755042; c=relaxed/simple;
	bh=eI/hWvYVZn6xmfG6Gso863cUJUBDV94QsvI0YUUona8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UF3IA20+A3qPMacwVOO658yuoMSXYWU5BTDQarIyF1uWQmO0bZRZBIm6PBwgr3o13kZvOknS/kbO6j9divMTwboz01ogS+CDRW5+Yj9Xi+3fpJuBtkyuem1Ucqb9SvGjQx1RHdArzM1h0McM2opt4XYzp75UxyRHBKAfchBHWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VOfzYxkU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715755034;
	bh=APVgJNHkw0GoLhqndKWu3Ob2mj6Ex2bkWrznWolFk9I=;
	h=Date:From:To:Cc:Subject:From;
	b=VOfzYxkU9QsPDnTAGPXwpAfe7vwu78Gb/aJSI8aJq00t536XlyBsOOvr4P3Btg3j0
	 89gHmbFlZ8uhm3SQ7Hsrjl7MgB185+6GqryyarVPHgoSCcgnTTVucJR7XMLp9SdyfU
	 UMxrqKSXkcLdeLfFQHhi7n4hyk+j+QPQ5n63RCqUDHv19Yj/5rKD8tqtvi6u35qPrC
	 B5WHQfEa8v2IZY/aort8uG7qZdNLNgQxlQRNi1vKxQidE1CjFOo0WHR4q3/rf1Q5AB
	 TsU1oSaVIaINYa2Z2qxz56KgJtU9G/q1p7LIRj14oxKm92QFC8yxBusMw3Mro9UHLw
	 fI7hrdrySdLpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfNn563BFz4x1C;
	Wed, 15 May 2024 16:37:13 +1000 (AEST)
Date: Wed, 15 May 2024 16:37:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20240515163708.3380c4d1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zfARr8Q8f9AC2zPVlVguGjo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zfARr8Q8f9AC2zPVlVguGjo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's (it may have been yesterday's)
linux-next build (powerpc allyesconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_para=
m_area+0x200 (section: .text.fadump_setup_param_area) -> memblock_phys_allo=
c_range (section: .init.text)

Introduced by commit

  683eab94da75 ("powerpc/fadump: setup additional parameters for dump captu=
re kernel")

--=20
Cheers,
Stephen Rothwell

--Sig_/zfARr8Q8f9AC2zPVlVguGjo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEWBQACgkQAVBC80lX
0GxS1Af/bFHD2LbuYbe9OcFIUFDiT1c4qaIJtvj5nf8ARrtDwlnxoW5GI4SintL2
ZYIdWZnvw/RrWob7XRUIg6PcK6IDXhwh30a1jz6aEyv+m/MojjIeJpOH4wominkz
tAqSiic+yThBgF0AQQ4tKvlabR1ObtiPd053OkvKiQHuuZBpSkTbG6QgK+3LeV+s
AUZLJe549U7xwnLz1f9ToSvt/qNewXiOy9jBF4uu5q/zuzUkq5wAQdNU01VlqGmS
ADUXyiNLTnUJxwnwoe/itnqlgdFl4tB28KXr7zv6T0IKfFwOK2KovnL/wAZLd/bj
Ih9EZ1K/MhyqVmEX04xjz2/r8+eFRw==
=oatL
-----END PGP SIGNATURE-----

--Sig_/zfARr8Q8f9AC2zPVlVguGjo--

