Return-Path: <linux-next+bounces-5785-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F5A5EB4A
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 06:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C761745FA
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 05:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA4C1519AD;
	Thu, 13 Mar 2025 05:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bHBwYGrR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5372126C1E;
	Thu, 13 Mar 2025 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741844955; cv=none; b=TImY1OxNqTjMAMpakftX8Vw4spp0MlgzYfu+o7H7ASuRM/hdxgMdrUDAbEhW6nxG86OkJD+93ZZOCqJsNxS1zrFdcyLfYu0qJHLl2cFl+RufiLsaHPx3goaIfYD1asSSjUSedqRw2AVN3IaQ2VLKN7SO7H6WYpbfsRSk6xwM7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741844955; c=relaxed/simple;
	bh=LgVHIOpYFYiFMvOVhlqsYaX605qc/jDixS9WUqzPivI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CBngYnUCrneueR8c2HcYJni/IcKXv5tpyp6RD69tG5k1XMny5jdCs49ABZxMpI5XwRnb2J73tcjMudSQkpFgRSz6EW5Ibx5uBUdlpU5UShgrcgRn6mD5a/uO0f0jY0Rlyg9Nd40/iI23/oBV4/eSShpAi5FNhLCb9d9yCL0V8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bHBwYGrR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741844949;
	bh=aN7QLqLK6AYHIXig8XICcnCy+W2u83IoAFjYeIfcN0E=;
	h=Date:From:To:Cc:Subject:From;
	b=bHBwYGrRP/sAE4hBE8OJduqroRQgeRAbpmLP8m/7IkrrlXeBBZck//H1M3rxGjgBY
	 HemA4zbMzVg+g6Y1t13WKsj/0WVlWQ6/BrR/qTFBtrUoIQz3dUtg5qklV3itMPCokA
	 xpW0YxW/C+nfKYj+tsBMh8Ns5jTfJqk71bZ+W6+8fuKDSGcMi1sufxIXe/OqLGJVKu
	 C2NTAkqs0YKX5swD1eJRf6MQxWP7vyPhszZj2+Kc0kKGyTxpVaA9Jizl18q3+4wGqe
	 zsuOGBqZjP9IlxEyQ4D7CNqvNE448EX+E8SsDr+Tds/LgUUBSpkwbPR/Kioouj4ozd
	 NNFJ/jaSjzeWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCxQD23RXz4x04;
	Thu, 13 Mar 2025 16:49:08 +1100 (AEDT)
Date: Thu, 13 Mar 2025 16:49:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, Kaixiong Yu
 <yukaixiong@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sysctl tree with the ext3 tree
Message-ID: <20250313164906.6d6ff001@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UW=m8+dzg/QGJ8+e/KX80a.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UW=m8+dzg/QGJ8+e/KX80a.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  mm/filemap.c

between commit:

  e6529028f9ac ("Revert "fsnotify: generate pre-content permission event on=
 page fault"")

from the ext3 tree and commit:

  73aa354af21d ("mm: filemap: move sysctl to mm/filemap.c")

from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/filemap.c
index 1911d43b319e,004d78767804..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -47,6 -47,8 +47,7 @@@
  #include <linux/splice.h>
  #include <linux/rcupdate_wait.h>
  #include <linux/sched/mm.h>
+ #include <linux/sysctl.h>
 -#include <linux/fsnotify.h>
  #include <asm/pgalloc.h>
  #include <asm/tlbflush.h>
  #include "internal.h"

--Sig_/UW=m8+dzg/QGJ8+e/KX80a.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfScdIACgkQAVBC80lX
0Gw37Af7BqDElLXXxieWbiFDk9qd4lLNDKFLGa/B7JYFzCjrm2i/y5UBi9zQe2kR
UtR25RzxlAfy9qFco6lXIoOpiYKNdXfVS1uJlFRR51oMMV9b5xXWKOEiP+iFQER0
T6bnSJWManox7LYrpECK3guvCp5PGf5bFmG9zaUP7U9zIxVknluvmJi+VZtxQfKJ
DfqInUXFmfaNo/hZTxKyPLQmfIKIsezxY0lgNdiJ1pJkdtCZAQhgi+mmPlr+XijW
DSPRruq70tDAvGbkVQeu9wKwX/O9pBax0RZf7OJhjtpHviTrkdQnHg0BRRMT6Ntp
0q7RyKoTBjVvvtOJqMq3jsBiM7sEwg==
=DFkd
-----END PGP SIGNATURE-----

--Sig_/UW=m8+dzg/QGJ8+e/KX80a.--

