Return-Path: <linux-next+bounces-245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A314180654F
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 03:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D422E1C21069
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 02:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211963B3;
	Wed,  6 Dec 2023 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tfJoT5Uc"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D961A5;
	Tue,  5 Dec 2023 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701831454;
	bh=Xew00TzhJeX9h8OoFc9MuWr95HLDQ8hDCzCA6kpkblA=;
	h=Date:From:To:Cc:Subject:From;
	b=tfJoT5UcFg9R+rGCLulA+8B5wHpmvHkdEfDK6zaJ2qIWAd1l1lVWztrvL/299aLOv
	 wMxfh/t7qWjsPR/X1UN/7v/3fS4ORS+i/LASkm+PgkLSBZm+D8b0K6mbFLAmkmYWXn
	 jee/spt99D7Wu8Mpcynd275SdevIJ+WwqzLRy85eAM4l21oKShFTF4AmCsoLxGyV67
	 Mg0MtYHIHKAzTu/1Sx8KAbgmk5f2jZnX8o31Az6jbTsBU0JVYjXq0X09YxugeRxmJE
	 U0bLAQTqhCta+JlYQGyn7udaiCSKaveGBv+yigRJ3vhabGMLj4sKMRLpso3FIoUhgO
	 9YdQNHM5aYzbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlMWx498Qz4wd7;
	Wed,  6 Dec 2023 13:57:33 +1100 (AEDT)
Date: Wed, 6 Dec 2023 13:57:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, "Eric W. Biederman"
 <ebiederm@xmission.com>
Cc: Alexey Gladkov <legion@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: linux-next: manual merge of the sysctl tree with the userns tree
Message-ID: <20231206135732.46d1b2b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vnGLMUvy2kcP/dSEqZio71j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vnGLMUvy2kcP/dSEqZio71j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  ipc/ipc_sysctl.c

between commit:

  54e1011bd95a ("sysctl: Allow change system v ipc sysctls inside ipc names=
pace")

from the userns tree and commit:

  a6dd7f5a787b ("sysctl: treewide: constify ctl_table_root::permissions")

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

diff --cc ipc/ipc_sysctl.c
index 01c4a50d22b2,d876f96f5992..000000000000
--- a/ipc/ipc_sysctl.c
+++ b/ipc/ipc_sysctl.c
@@@ -14,11 -14,10 +14,11 @@@
  #include <linux/ipc_namespace.h>
  #include <linux/msg.h>
  #include <linux/slab.h>
 +#include <linux/cred.h>
  #include "util.h"
 =20
- static int proc_ipc_dointvec_minmax_orphans(struct ctl_table *table, int =
write,
- 		void *buffer, size_t *lenp, loff_t *ppos)
+ static int proc_ipc_dointvec_minmax_orphans(const struct ctl_table *table,
+ 		int write, void *buffer, size_t *lenp, loff_t *ppos)
  {
  	struct ipc_namespace *ns =3D
  		container_of(table->data, struct ipc_namespace, shm_rmid_forced);
@@@ -191,21 -190,7 +191,21 @@@ static int set_is_seen(struct ctl_table
  	return &current->nsproxy->ipc_ns->ipc_set =3D=3D set;
  }
 =20
 +static void ipc_set_ownership(struct ctl_table_header *head,
- 			      struct ctl_table *table,
++			      const struct ctl_table *table,
 +			      kuid_t *uid, kgid_t *gid)
 +{
 +	struct ipc_namespace *ns =3D
 +		container_of(head->set, struct ipc_namespace, ipc_set);
 +
 +	kuid_t ns_root_uid =3D make_kuid(ns->user_ns, 0);
 +	kgid_t ns_root_gid =3D make_kgid(ns->user_ns, 0);
 +
 +	*uid =3D uid_valid(ns_root_uid) ? ns_root_uid : GLOBAL_ROOT_UID;
 +	*gid =3D gid_valid(ns_root_gid) ? ns_root_gid : GLOBAL_ROOT_GID;
 +}
 +
- static int ipc_permissions(struct ctl_table_header *head, struct ctl_tabl=
e *table)
+ static int ipc_permissions(struct ctl_table_header *head, const struct ct=
l_table *table)
  {
  	int mode =3D table->mode;
 =20

--Sig_/vnGLMUvy2kcP/dSEqZio71j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVv4xwACgkQAVBC80lX
0GyJNQgAiWO/K7L2+KjmAFLk4pg11cH/ucDqiwQPtAI1OY6Kvc6ubjgWKiEpdZjb
JzKLev/6kALbH4lk1Ch3dpuNmt74b+muukh3h87RIXz+KQuTSO1iYsXhklyLgDwn
0xBphoed1pWUYkmssRgrrgTQHXyhsXgLVt1ZKQhv8jkKPFv0lqDZ0NhI1LbynW5j
OC5qROlEryuQWZiPduDTDA3pY+Coi5O0wnMXWYWkXrxd/s2xJ4RkOFhPXyrQtDza
76JJgfaGY/amqcntB252jS39LQBx9WVez/k7vxjvwQSHrWgla3TXh2o7GifvUC4r
xB5YO/3fR7gP+g53WpEh6SLvEiE4zQ==
=3LaM
-----END PGP SIGNATURE-----

--Sig_/vnGLMUvy2kcP/dSEqZio71j--

