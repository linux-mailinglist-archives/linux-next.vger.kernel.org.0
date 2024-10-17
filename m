Return-Path: <linux-next+bounces-4313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C72339A1801
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 03:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EF48B252D3
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 01:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD81F1DFF8;
	Thu, 17 Oct 2024 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IFMQwRSd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180D182B4;
	Thu, 17 Oct 2024 01:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729129603; cv=none; b=NwN3bQRCbymOFeQQRmirXDzOcpzzS/G+j9h1K3w66I5oNnjRtKluo7AjxWb53NDJolRkc/TZr9h64i3J9PP+/2gCqrv5XlUlCQe17xunO0opZA+PvG4D/BgJo3+DQiw2nZDe2S4iZaJloVPn1l5/vfE8m2smFDrxu+HI4/nGSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729129603; c=relaxed/simple;
	bh=wOKtNHhE0miy/ZmrlCNvDmE/hbROgyjd7pvprxmj+dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WHYUiFuoO4OFz7G80nEu7y1F3aM/asVVlLIYkIRs3RCiB+axKugBK57ZnUs4t/JOxyfIduQYldAjblHXEYAkbu6ZfEPRqIfYXUN4sVAohExeMKVQSIf52kB1SJWwkB750ulLAWZtiZjE6F9Ez/WN3xepszV13ry4BUD7ad9VTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IFMQwRSd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729129595;
	bh=Wvh25Xp8rfKVGy+Ju1bXyTQJOsfwnmnO/HE03wl9oyM=;
	h=Date:From:To:Cc:Subject:From;
	b=IFMQwRSdilyvS+zLrBQDFRDzBXr/MEf0hPjM8nOIYkEaL7N/FFXGyNF5+xyqRj0Gs
	 8/1Omqhqw7IICJhrVl9MdvIoeS+WAzS+YZWC/91pgLjgE3PQSSHYvuuicCPycWp/qZ
	 BTtOKh0posrGyv+8DdYAeRf9M+hrwdLwpfVuL+ocHt6a8FC9eWw6T0w7naJIHNnBpx
	 ylzFIrJ3dRFXWgZXLALTY9jDIWUQoapQJWqe6+ZTDB5dttcaR+mKivdZpba5GLPYyh
	 hrNpLXBpD/WEFn7vJ2biafh/hhXmbKjb3eCIP/lF7JKndoir9iDpmvyc+dqifEAkkU
	 fIlbvbFJrS6eA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XTW0C4Bldz4wcL;
	Thu, 17 Oct 2024 12:46:35 +1100 (AEDT)
Date: Thu, 17 Oct 2024 12:46:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner-fixes tree
Message-ID: <20241017124635.3298b1c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A1XZEYjjfiGreLl5TsuAOcA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A1XZEYjjfiGreLl5TsuAOcA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner-fixes tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

In file included from include/linux/srcu.h:21,
                 from include/linux/notifier.h:16,
                 from arch/x86/include/asm/uprobes.h:13,
                 from include/linux/uprobes.h:50,
                 from include/linux/mm_types.h:16,
                 from include/linux/mmzone.h:22,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from fs/afs/rxrpc.c:8:
fs/afs/rxrpc.c: In function 'afs_alloc_call':
fs/afs/rxrpc.c:152:42: error: 'const struct afs_call_type' has no member na=
med 'async_rx'
  152 |         INIT_WORK(&call->async_work, type->async_rx ?: afs_process_=
async_call);
      |                                          ^~
include/linux/workqueue.h:288:34: note: in definition of macro '__INIT_WORK=
_KEY'
  288 |                 (_work)->func =3D (_func);                         =
       \
      |                                  ^~~~~
include/linux/workqueue.h:308:9: note: in expansion of macro '__INIT_WORK'
  308 |         __INIT_WORK((_work), (_func), 0)
      |         ^~~~~~~~~~~
fs/afs/rxrpc.c:152:9: note: in expansion of macro 'INIT_WORK'
  152 |         INIT_WORK(&call->async_work, type->async_rx ?: afs_process_=
async_call);
      |         ^~~~~~~~~

Caused by commit

  dabae7218d1c ("afs: Fix lock recursion")

I have used the vfs-brauner-fixes tree from next-20241016 for today.  I
had to use the vfs-brauner tree from next-20241016 as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/A1XZEYjjfiGreLl5TsuAOcA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcQbHsACgkQAVBC80lX
0GxNRwf/bThdCLrPXkWzQ1+Xk0eiTiMJTYtdkiO4++LxFPlPfws7pmJPyvBQoUNU
WwbOcgmcUlPoZ6KhIPFKXbyVdYGpj23GRue494oG7ZoXKq9JqRyp6+GvpSAeHSW+
FRRbbK6h7M0UnHrmPmlrGu35Zo1f6g3VEzD+cARR7lRPcZpJEnkq4NzXx8mFxQ7t
+0q9NFmxhXxgNLnQ+fbV6hfH+YNKqJXjZ3/ffHVH5c48hwqy2h2HaC3XBQDENnDc
sEz3ntXWEzlF0ZOI639L2xB2hFMt82CeXxGVduLYLff9PODKvVelJslRsewWmN29
rbUgwH1auRVn7sp25MHCLCWc2/DibA==
=SNtb
-----END PGP SIGNATURE-----

--Sig_/A1XZEYjjfiGreLl5TsuAOcA--

