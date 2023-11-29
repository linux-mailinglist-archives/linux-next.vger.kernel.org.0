Return-Path: <linux-next+bounces-129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7EA7FE144
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 21:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A58A282460
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 20:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366C65DF3D;
	Wed, 29 Nov 2023 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UtKhshi9"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E305D6E;
	Wed, 29 Nov 2023 12:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701290632;
	bh=4A+EQlBvhHEH1wU+lqUotRj9vZzPseWpql+yOOtqe7k=;
	h=Date:From:To:Cc:Subject:From;
	b=UtKhshi9n3fzS0PBm8X6g398BMZzdQ/i0JtM4zzzwg2YbaCZ+opbhR57zvWEpB/od
	 PpWH60J069O0JezBZS1yolwa+JNqSYlqnjEkIxdkNca/lArck9PHDKKHTY3beCf5wG
	 L0c16a6zzC5opo+nxUt9OmPOigmDGluwe94U+UVVmrvvTjP/877sSkZipmWxli3Y0H
	 zHV6HKi+ylk2doYszTbC4MGkolUj/hNrLP606w75AN7/l8r4bJavUAKU6bMAyVe/47
	 BeqWcsaG1nrCbFCthp3oKW3z44Qi4pRxvkmdCnByJCeJm9ufbXE0OMxv+xlc2Drkva
	 xyVxDtSeWD0fg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgWWW5yl9z4xT0;
	Thu, 30 Nov 2023 07:43:51 +1100 (AEDT)
Date: Thu, 30 Nov 2023 07:43:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20231130074350.7c758662@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/npWNOH8tExtNS7Z1/PGPmKG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/npWNOH8tExtNS7Z1/PGPmKG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f8ff23429c62 ("kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP")

Fixes tag

  Fixes: commit 89cde455915f ("kexec: consolidate kexec and crash options i=
nto kernel/Kconfig.kexec")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/npWNOH8tExtNS7Z1/PGPmKG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVnooYACgkQAVBC80lX
0Gz64wf8DabkCNeRjVazT75wni8IK2iYXMvNDPE88bcNCfoxdktn5nSPSnwSK4wn
Pd0txfPeVa5VaWFRcOPlhzxlM/X4WnyRhSsPd3zMqNpkqqxVhwNlglPtbfVsFiLw
96NEZCEPFprNf7i3zhob9AhEpC+auZRFYxVhc6wkXBqDHHWeoeAJT8YHHF179EEt
6iKfPVYkLFKXT9f66ynThfcr57IvsjggAFC3hGStBeLsZULOpNy+9WlsGW+rXCKN
VCpBL21PeFkj2zo2SFdRbHkp9VD1wCpZT5zCs90G8/wKfNla/jQowEAE1eDDZwso
7HDupjgYOWGjjNI8KS1kRGgYy9dJ1g==
=kNpD
-----END PGP SIGNATURE-----

--Sig_/npWNOH8tExtNS7Z1/PGPmKG--

