Return-Path: <linux-next+bounces-5359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB905A2518B
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 04:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7236E163020
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 03:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0A8C13B;
	Mon,  3 Feb 2025 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f1WnX9Rf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8913224;
	Mon,  3 Feb 2025 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552063; cv=none; b=u27/B5cduJLBkPlQe5OPcKMIsTZrmyK2JQ+PXoh5J7ApNA2Hmti/Y2YlNurXnVpfUtG7AEIWChfdixRnLKS5AiNP3ZlwgoFDAb3VVYZyXovxcoT8iYI07yp4+TDzU4GKgRwaNStIS9zJ/a2lkf6IGQ5k3d6doXxx/2MPekteWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552063; c=relaxed/simple;
	bh=rve1UfvXu2WcRaXOoIRMlfpPlvzYfHds7hSa4brqU8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMyZjP4Eo+kga7jrFneWNlcr06w0HM0eL8FZYIv+MzTWCYfWLm81MYwnVrEFXkOBpGlf1AvnHQbAkRP91JL6jDgH1lqsKWWO4vWTkNyckdHbmoYW+2f0BPlIPGvkae0rqxL9FSYhoMATpufaZxVY+B+CoDtqgZ0qjznDjK3NQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f1WnX9Rf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738552045;
	bh=Y0lO513B42kqxJfj8XZj59f2dcHy17wgTrNDvTUPqQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f1WnX9RfydMc/yKS3dRUAl+BQh5ePi2sdF1o18twH/k33Bffe+877BungHedHu3Wi
	 xL6XCJLM6jDvAgV7IdwK68zsJ0sNvvOqw9HLwvRL/R41x1YO8plSDtYqqKtRYFoXMr
	 1zI0um9WBihnEJaRx2z9zVvWip23/29mdiZRjMgIK+6wCVjLrsOw1l4lWcraQGQwZG
	 ieKscY2R976OVGkhF4USuXsb0QXGAJJKGZ3Jbl0gBCHdn8kxJYxT8eOlvYkNqTZ903
	 no3X1k3ITbEgcITmrSCYQFC/p7nlV9vTut3JdNm3EI9FgutQ2NLHjUR4Rq8XDxKI9D
	 XicES4lcz8Agw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YmWd90743z4wcD;
	Mon,  3 Feb 2025 14:07:24 +1100 (AEDT)
Date: Mon, 3 Feb 2025 14:07:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linus-next: stats (Was: Linux 6.14-rc1)
Message-ID: <20250203140733.4559c16e@canb.auug.org.au>
In-Reply-To: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
References: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ay/PXc3nM0Sy9eAs9yXjWWI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ay/PXc3nM0Sy9eAs9yXjWWI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20250121 was the first linux-next after
the merge window opened.)

Commits in v6.14-rc1 (relative to v6.13):           9307
Commits in next-20250121:                           9041
Commits with the same SHA1:                         8416
Commits with the same patch_id:                      370 (1)
Commits with the same subject line:                   20 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20250121:      8806 94%

Some breakdown of the list of extra commits (relative to next-20250121)
in -rc1:

Top ten first word of commit summary:

     56 s390
     27 kvm
     25 net
     23 drm
     21 cifs
     16 io_uring
     15 asoc
     14 riscv
     12 rtla
     12 loongarch

Top ten authors:

     27 gor@linux.ibm.com
     24 hca@linux.ibm.com
     20 pali@kernel.org
     14 kuba@kernel.org
     13 tglozar@redhat.com
     13 charlie@rivosinc.com
     12 isaku.yamahata@intel.com
     11 rafael.j.wysocki@intel.com
     10 kent.overstreet@linux.dev
      9 asml.silence@gmail.com

Top ten commiters:

     55 agordeev@linux.ibm.com
     49 kuba@kernel.org
     27 pbonzini@redhat.com
     26 rostedt@goodmis.org
     25 stfrench@microsoft.com
     22 axboe@kernel.dk
     21 rafael.j.wysocki@intel.com
     20 palmer@rivosinc.com
     20 pabeni@redhat.com
     20 broonie@kernel.org

There are also 235 commits in next-20250121 that didn't make it into
v6.14-rc1.

Top ten first word of commit summary:

     33 drm
     25 kvm
     24 btrfs
     22 arm
     19 bcachefs
     19 apparmor
      9 tools
      9 arm64
      8 nfs
      6 soc

Top ten authors:

     19 kent.overstreet@linux.dev
     18 john.johansen@canonical.com
     14 johannes.thumshirn@wdc.com
     14 imbrenda@linux.ibm.com
     13 michal.wajdeczko@intel.com
     12 michal.simek@amd.com
     11 neilb@suse.de
      8 wqu@suse.com
      8 hch@lst.de
      6 ubizjak@gmail.com

Top ten commiters:

     24 dsterba@suse.com
     19 kent.overstreet@linux.dev
     19 john.johansen@canonical.com
     19 imbrenda@linux.ibm.com
     15 michal.simek@amd.com
     14 michal.wajdeczko@intel.com
     11 anna.schumaker@oracle.com
     10 brauner@kernel.org
     10 akpm@linux-foundation.org
      9 alexandre.torgue@foss.st.com

--=20
Cheers,
Stephen Rothwell

--Sig_/ay/PXc3nM0Sy9eAs9yXjWWI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmegMvUACgkQAVBC80lX
0GxR8AgAgJNi7l6upkytj+pKUk0VoWxhW7T62mT8SzBloYza2bUH2PQiIzTA2bl1
4lcCvt+Jjm+ofMS++P5ULLsusmTKGMuOQ31BEORTD60/DiqjBhNaZotveYkwyAa9
IA79gbEnJIMYsdCMuxfvcWuYuQb0Hi7fyEt1cuB/ELLiMXql4ZfaCnb2W2SyQE3E
+FQYcIajxl1gsCzniQRZ218vfdMqPp1BDmUmmCAT/8NM+cVMVNg9c+wX3mTnbZk/
gZXgEn1R/DVnrc+FwfdJFr7I+4sEpfwTTBjTsl9sx8wB817e3NnlpK7iGNn/5naD
cC1Nmg6dGAlx/bwwAAaqNBPYfHNK6w==
=0pG3
-----END PGP SIGNATURE-----

--Sig_/ay/PXc3nM0Sy9eAs9yXjWWI--

