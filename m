Return-Path: <linux-next+bounces-246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7480658F
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 04:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D21A1F217EA
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 03:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D022FD275;
	Wed,  6 Dec 2023 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ij6HNPIo"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F171AA;
	Tue,  5 Dec 2023 19:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701832782;
	bh=+R+s2ipByf0kO1/SdWPDOgyoSLgIykmCOvBVAxkRneQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Ij6HNPIowYy/6i5442tBv3d5GM12UElTdJjFvI7uwnQe0ahUCrvgRN25MMf/7eVEJ
	 mA6ZaEXcMwdyPrYkIiIAGHtj6XONU2FNECwzjgHRcjb9akzQV7jUWP6vusrQYz77pd
	 bwuzHAYBW9wUeqP9PD5WqgbWEI7X4OptzWRRPh9p9eLHiDg+O+yijRYJTYbgnGmjKV
	 nh7zVGJuSMtCPlsX8nHoe9SHpzUTClrzdspwSpiNEB2+VyaeSNXMnNidmhgno3qM56
	 Lq/19zBcuJAWvL/vwfShasA7TeJzr7elX1WM2Q+sEaqoj21Fo1KFj0Jnr99WXNven9
	 94ueZgHt+QkzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlN1T6Tm1z4wd7;
	Wed,  6 Dec 2023 14:19:41 +1100 (AEDT)
Date: Wed, 6 Dec 2023 14:19:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, "Eric W. Biederman"
 <ebiederm@xmission.com>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Alexey
 Gladkov <legion@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sysctl tree
Message-ID: <20231206141941.3ed51cb1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+rRVMoDbvb1bDgkocbw/u/e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+rRVMoDbvb1bDgkocbw/u/e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sysctl tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ipc/mq_sysctl.c:115:24: error: initialization of 'int (*)(struct ctl_table_=
header *, const struct ctl_table *)' from incompatible pointer type 'int (*=
)(struct ctl_table_header *, struct ctl_table *)' [-Werror=3Dincompatible-p=
ointer-types]
  115 |         .permissions =3D mq_permissions,
      |                        ^~~~~~~~~~~~~~
ipc/mq_sysctl.c:115:24: note: (near initialization for 'set_root.permission=
s')
ipc/mq_sysctl.c:116:26: error: initialization of 'void (*)(struct ctl_table=
_header *, const struct ctl_table *, kuid_t *, kgid_t *)' from incompatible=
 pointer type 'void (*)(struct ctl_table_header *, struct ctl_table *, kuid=
_t *, kgid_t *)' [-Werror=3Dincompatible-pointer-types]
  116 |         .set_ownership =3D mq_set_ownership,
      |                          ^~~~~~~~~~~~~~~~
ipc/mq_sysctl.c:116:26: note: (near initialization for 'set_root.set_owners=
hip')

Caused by commits

  a6dd7f5a787b ("sysctl: treewide: constify ctl_table_root::permissions")
  a56545552ecf ("sysctl: treewide: constify ctl_table_root::set_ownership")

interacting with commit

  7608b6a72ed0 ("sysctl: Allow to change limits for posix messages queues")

from the userns tree.

I have applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Dec 2023 14:12:02 +1100
Subject: [PATCH] fixup for "sysctl: treewide: constify
 ctl_table_root::permissions"

and "sysctl: treewide: constify ctl_table_root::set_ownership" interacting
with "sysctl: Allow to change limits for posix messages queues".

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 ipc/mq_sysctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ipc/mq_sysctl.c b/ipc/mq_sysctl.c
index 69c709262f5a..850dfc83af23 100644
--- a/ipc/mq_sysctl.c
+++ b/ipc/mq_sysctl.c
@@ -78,7 +78,7 @@ static int set_is_seen(struct ctl_table_set *set)
 }
=20
 static void mq_set_ownership(struct ctl_table_header *head,
-			     struct ctl_table *table,
+			     const struct ctl_table *table,
 			     kuid_t *uid, kgid_t *gid)
 {
 	struct ipc_namespace *ns =3D
@@ -91,7 +91,7 @@ static void mq_set_ownership(struct ctl_table_header *hea=
d,
 	*gid =3D gid_valid(ns_root_gid) ? ns_root_gid : GLOBAL_ROOT_GID;
 }
=20
-static int mq_permissions(struct ctl_table_header *head, struct ctl_table =
*table)
+static int mq_permissions(struct ctl_table_header *head, const struct ctl_=
table *table)
 {
 	int mode =3D table->mode;
 	kuid_t ns_root_uid;
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/+rRVMoDbvb1bDgkocbw/u/e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVv6E0ACgkQAVBC80lX
0Gz9fgf+KbuBjUj9btCJ8XojP/v7GvYlyyk2O+YiDpVXBoqqzVqo1h/6hVgON8MB
VBySqZGhkxcmLk17/+MbTJzVAV9WUaYEQs3w6DNRGjvC6YPxA0/A6Wni1M90/xxN
80m9pRmDUHcShogsXb5NVKl6PgRe24aRAVkxX3AhapsQbR7JuYR5F9iJnkoZFiwV
MrCFrjqPad10SfSFbFehBjN+tlQ2ciiOvNHVBWv5ZfDPw01IIwnc6xATB7VvSWsU
rldxyvt670uktzxpIyXUagNWlEvfMR/eDJCibK9bjH/Fp/2WBtXQ4bR5+ojwrRmg
76GDLnjmyc2Z6lOws+06VRqKyk8Jrw==
=0QAX
-----END PGP SIGNATURE-----

--Sig_/+rRVMoDbvb1bDgkocbw/u/e--

