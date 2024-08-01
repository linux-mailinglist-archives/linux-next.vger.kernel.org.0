Return-Path: <linux-next+bounces-3185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F694415D
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBDD1F2228B
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8F413C81B;
	Thu,  1 Aug 2024 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PXF2+1o/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766251EB4A7;
	Thu,  1 Aug 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722480346; cv=none; b=eZUCnRnCNzj4QpkYLpydNsU/d5YOTQwXWY5CgytBJ0nHutSXZgBwzbX6JwzkZikpzp2GU5t5WkdARMTSt4owWLovd1KbQMTrnFO43xiq8GT792fYZvGgvdfs6Y+YH1tiXNp1t6WXBGx7UBRandgfW7Thl+7p5hrSgrl8D+tEOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722480346; c=relaxed/simple;
	bh=OCEQucURQA51ip8O9Wh3TmPQT25QtAL0oA+ETRvXMaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FD/3PoigCHtBju92VJGcqu6Pb+AFZ8eDysRODm5aSO93uwEZ1shUEzpco2/Bd+SSvWtc/5tRg7tI01n3pSMrTN1Ws/Dc4qsmnBOGNMGZXGQKo4wgsvBZtZcOUpu4y+aM6HG93h02ebIUXdIesBye9wqMXgam7H0cBwuhITDUqio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PXF2+1o/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722480342;
	bh=mqKwWK0wTt42DVGCxoukkr9fK4GGvC+LFqLdL5CRgGE=;
	h=Date:From:To:Cc:Subject:From;
	b=PXF2+1o/7sSePmBZC4ojYn1I6nMsMPjsiFK5Nh+3PqOlYpClE86BaxC6A4r+aDSvt
	 QSbmB5rk2ClVJUyfSqj9LYRPTAkN4mH5o/wsAmZje0h/jYW55RY6zpRimVkL9STiNl
	 rbA/aXzoe76HCNrvzY/6Y7vCSW7gV656NNJEre5fl8PWUU3FCLK92vTY3/imCkfvYm
	 r5/QElbSNEttN+ZOeoLQ5hqHyjJrF63EMLUpnkyjLejjOMvf3UnXHuLwQiwESPGfpP
	 Fna3Q+VwF4g3+v8wjD2Ta/JCKu4Zi/lVhv3qL5ykACJu6swQxjcT0j3i8t+R71/Mi8
	 jkd2X3u3Eu5FQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZCxy0n21z4x6r;
	Thu,  1 Aug 2024 12:45:42 +1000 (AEST)
Date: Thu, 1 Aug 2024 12:45:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tianchen Ding
 <dtcccc@linux.alibaba.com>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20240801124541.3deb64b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_///nmLwtO0mOls4/y=RU0GMk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_///nmLwtO0mOls4/y=RU0GMk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/fair.c

between commit:

  faa42d29419d ("sched/fair: Make SCHED_IDLE entity be preempted in strict =
hierarchy")

from the tip tree and commit:

  2c8d046d5d51 ("sched: Add normal_policy()")

from the sched-ext tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_///nmLwtO0mOls4/y=RU0GMk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq9tUACgkQAVBC80lX
0GzJLwf/TWcih3Q16A4Y/DypEX9/MjWn5FeOYm1W2PEGv1s+9lZUpDurTOTBbwwO
BBonzpeEID12p9VbCborDPgE7WWWk/xtSNbWPOIUBhyn/hQ0Q8OHYjjaHfoKeN9V
fMAts+N+nJ3BYmX8jbLiODcWNIz91crmFgGF/SjtKR8mAGaNr387C+0XpdokEs3f
z4luuqUXmt1p2bsZiMo7NAtbUtl6P9ndwk/BsxTKDi2NumE+0U+2EgCRmh8vYVyH
e+TSyyT3c3ARVYgMmU1uuDDUYS18i7BOmbvokmkslMnfzmF1UFk3igdpa91LD9ZP
St54kCZCoeTglQjmqxkwICrefRXosw==
=HPUC
-----END PGP SIGNATURE-----

--Sig_///nmLwtO0mOls4/y=RU0GMk--

