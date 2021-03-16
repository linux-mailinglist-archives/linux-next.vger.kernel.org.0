Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B766733E17D
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 23:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhCPWhs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 18:37:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231373AbhCPWhc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 18:37:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0Spf3xW4z9sRf;
        Wed, 17 Mar 2021 09:37:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615934250;
        bh=9Jllk9Go9QG9H8tThwtHdk9OxdCKgrZveanCv5ECwPU=;
        h=Date:From:To:Cc:Subject:From;
        b=Sm5fWYVqSE+mSXCtux32LlU0i08Dq48LAzUdu6uehb41T7XXNryonullbSzHklrU2
         N0wWiIEKYLl8JuflHcVZF0YfZw4kLd4tFxKKRe+pXcomra8dYFWiJVNwN1WD3qto7Y
         MPBw5UKpnjoPVt6cYg0cWy13W1wLKaSmhdLN8fgMJw2n/U7/OhZczfjIKi2622fXX1
         S0Bb60NHzX2GF+6HqbrbPFkdKtNMOlUJpS7dUIbCk7Ik18N2dIMz86mlYrt8wSceui
         1cdZRoVgu1uWJeWR3lYmnEiilhQkZxarBb2DbyIdsPl4+nw2Of4dqnQ4FyroScHIWU
         VujAB0w6LEMcA==
Date:   Wed, 17 Mar 2021 09:37:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Steve French <stfrench@microsoft.com>
Subject: linux-next: Signed-off-by missing for commits in the cifsd tree
Message-ID: <20210317093729.3cab3f2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2_=5RXEnbX8l76i7CDWoLlq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2_=5RXEnbX8l76i7CDWoLlq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5c6ab7c9c301 ("cifsd: don't clear ATTR_DIRECTORY with ATTR_NORMAL + other=
 bits")
  37f12f1a9e76 ("cifsd: remove backup file lookup restriction")
  511fbebc9d3b ("cifsd: fix racy issue between close_id_del_oplock() and de=
stroy_lease_table()")
  60f4e4de7868 ("cifsd: handle idmapped mounts")
  8e1b809f11ee ("cifsd: use notify_change in set_file_basic_info()")
  8c1930014c34 ("cifsd: fix the issue of change the directory to the file")
  608b7bb0e414 ("cifsd: fix potential use after free in ksmbd_vfs_set_init_=
posix_acl()")
  a53327ff87b2 ("cifsd: fix memleak in ksmbd_vfs_set_init_posix_acl()")
  a98dbc20cbdb ("cifsd: Add missing path_put() calls in smb2_open()")
  ca46f5254981 ("cifsd: Fix error handling in __ksmbd_vfs_rename")
  bb932cbbc781 ("cifsd: Do not print timestamp after processing Maximum Acc=
ess CreateContext")
  76cd471c09e7 ("cifsd: add v4 dos attribute structure")
  f2b993deb1cd ("cifsd: fix random failure from smb2.create.multi")
  01a8bf060081 ("cifsd: fix smb2.lease.statopen3 in smbtorture")
  534cf891fdd8 ("cifsd: Remove call to ksmbd_revert_fsids() in ksmbd_vfs_mk=
dir()")
  3a1bb9e2ccc3 ("cifsd: Make sure ksmbd_override_fsids() is called with Dur=
able Opens")
  d69623ac1609 ("cifsd: Add missing dput() in process_query_dir_entries()")
  7caaa1dc0f84 ("cifsd: Fix incorrect error handling in smb2_open()")
  6b457e969def ("cifsd: handle an error case in extract_last_component")
  57987aee520c ("cifsd: fix a typo error in the name of a funnction")
  56f3ac5868fa ("cifsd: fix SMB2_QUERY_MAXIMAL_ACCESS_REQUEST")
  e36e95b4a918 ("cifsd: implement maximal allowed desired access")
  1b9f1e136e8b ("cifsd: fix build break with linux-5.11 kernel")
  4a26a8aa4189 ("cifsd: macros with complex values should be enclosed in pa=
rentheses")
  affbd69c2cb5 ("cifsd: make xattr format of ksmbd compatible with samba's =
one")
  b0467288c502 ("cifsd: fix a memleak from netdevice_notifier")
  1e5eb460e3e7 ("cifsd: Use netdevice_notifier to configure TCP listeners")
  58dcf3a3aac6 ("cifsd: Change alloc_iface() return type in transport_tcp.c=
")
  eaa4fa7ab91d ("cifsd: avoid calling ksmbd_override_fsids recursively")
  8d1b5f668026 ("cifsd: set supplementary groups when overriding credential=
s")
  901ce4507f08 ("cifsd: fix integer overflow issue in ksmbd_vfs_fqar_lseek(=
)")
  d76abe30e48d ("cifsd: downgrade "unexpected oplock state" to a debug mess=
age")
  f6881be8859a ("cifsd: fix racy access to ksmbd_file")
  5441ad0cfa45 ("cifsd: prevent ksmbd from sending duplicate oplock break n=
otifications")
  62a5df744681 ("cifsd: enable SMB_SERVER_CHECK_CAP_NET_ADMIN by default")
  597357deeecf ("cifsd: update cifsd.rst file")
  9fe8dd069399 ("cifsd: set SMB2_CLOSE_FLAG_POSTQUERY_ATTRIB flags in smb2 =
close response if attribute fields are valid")
  fdcdac101a2d ("cifsd: fill times in SMB2_CLOSE response")
  1e831f7ccab5 ("cifsd: fix permission denied error when querying dacl")
  ec03266638d3 ("cifsd: rename FILE_{READ/WRITE}_DESIRED_ACCESS")
  96f1ad1dccf8 ("cifsd: add support for recognizing WSL reparse tags")
  e7ffe8d67f4b ("cifsd: set O_PATH to open_flags if desired access is FILE_=
READ_ATTRIBUTES")
  c98dcf7abaf6 ("cifsd: fix unlink permission error")
  4696fa2903b6 ("cifsd: fix stat permission error")
  ba2513ea3367 ("cifsd: fix invalid open flags")
  3ed1e35ea23a ("cifsd: wrap vfs acls functions with CONFIG_FS_POSIX_ACL")
  0460c98d086e ("cifsd: open file with O_NONBLOCK flags by default")
  8aecd712e0a4 ("cifsd: remove repeated word")
  0db918db34a4 ("cifsd: replace ENOTSUPP with EOPNOTSUPP")
  ace29fa5db87 ("cifsd: add missing create posix context in response")
  3cbb1a2dc880 ("cifsd: add smb2 POSIX query dir")
  6139ab2e0432 ("cifsd: add support for statfs for smb3.1.1 posix extension=
s")
  f49a9cd0596e ("cifsd: add support for query info using posix extensions (=
level 100)")
  e19a174afef6 ("cifsd: add SPNEGO-based Kerberos 5 authentication")
  affb750272ff ("cifsd: add IPC command for authentication")
  55f9e825b44b ("cifsd: select the preferred authentication mechanism among=
 proposal")
  ef24dca82789 ("cifsd: add support for ACLs")
  5c240146de09 ("cifsd: get subauth values generated by ksmbd.mountd")
  14246142f631 ("cifsd: add support for lsarpc rpc")
  5b0cebbceca5 ("cifsd: add support for samr rpc")
  11a01d92f833 ("cifsd: fix racy issue between kill server command and dest=
roy_previous_session()")
  504e2b3e74e8 ("cifsd: fix wrong goto statement use in smb2_open()")
  73d8db2f78c9 ("cifsd: Use string functions to copy strings in transport_i=
pc.c")
  906acf03d78b ("cifsd: fix suspicious rcu_dereference_check usage warning")
  04a9683de690 ("cifsd: pass a sockptr_t instead of a plain user pointer in=
to sock_setsockopt()")
  fa593b54c05d ("cifsd: fix potential null pointer dereferencing error of t=
fm in alloc_shash_desc()")
  a740fb3bc1e3 ("cifsd: fix potential overflow issue in ___server_conf_set(=
)")
  296a653f43ba ("cifsd: don't support FSCTL_VALIDATE_NEGOTIATE_INFO if conn=
ect dialect is smaller than SMB3.02")
  3fc4b2e0a056 ("cifsd: fix auto negotiation failure when setting min/max p=
rotocol is higher than SMB 2.0")
  6ce247bb6eda ("cifsd: sign session setup response on SMB3.0 and SMB3.02")
  534a0a9ee699 ("cifsd: make 8byte context alignment when there is the next=
 context in negotiate contexts")
  395772f5f42b ("cifsd: fix null pointer dereferencing error in ->set_sign_=
rsp()
  5c6ab7c9c301 ("cifsd: don't clear ATTR_DIRECTORY with ATTR_NORMAL + other=
 bits")
  37f12f1a9e76 ("cifsd: remove backup file lookup restriction")
  511fbebc9d3b ("cifsd: fix racy issue between close_id_del_oplock() and de=
stroy_lease_table()")
  60f4e4de7868 ("cifsd: handle idmapped mounts")
  8e1b809f11ee ("cifsd: use notify_change in set_file_basic_info()")
  8c1930014c34 ("cifsd: fix the issue of change the directory to the file")
  608b7bb0e414 ("cifsd: fix potential use after free in ksmbd_vfs_set_init_=
posix_acl()")
  a53327ff87b2 ("cifsd: fix memleak in ksmbd_vfs_set_init_posix_acl()")
  a98dbc20cbdb ("cifsd: Add missing path_put() calls in smb2_open()")
  ca46f5254981 ("cifsd: Fix error handling in __ksmbd_vfs_rename")
  bb932cbbc781 ("cifsd: Do not print timestamp after processing Maximum Acc=
ess CreateContext")
  76cd471c09e7 ("cifsd: add v4 dos attribute structure")
  f2b993deb1cd ("cifsd: fix random failure from smb2.create.multi")
  01a8bf060081 ("cifsd: fix smb2.lease.statopen3 in smbtorture")
  534cf891fdd8 ("cifsd: Remove call to ksmbd_revert_fsids() in ksmbd_vfs_mk=
dir()")
  3a1bb9e2ccc3 ("cifsd: Make sure ksmbd_override_fsids() is called with Dur=
ableOpens")
  d69623ac1609 ("cifsd: Add missing dput() in process_query_dir_entries()")
  7caaa1dc0f84 ("cifsd: Fix incorrect error handling in smb2_open()")

are missing a Signed-off-by from their committer.

One of the issues with rebasing ...

--=20
Cheers,
Stephen Rothwell

--Sig_/2_=5RXEnbX8l76i7CDWoLlq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRMykACgkQAVBC80lX
0Gwn4Qf8DI1DdePgsnM70UhRWKPXfAWwE2PM9Z8/WFK5W11izylJRADd36ftsXpK
uwR1wjgmo5aRsb6WZtJp48DX/SulkliniToeV0Z5Pf9wN2ZkOratF5jT1tDjmvPK
8Sdo9ClFW2GiuZ1Qqc/JsOX10qDabUy5VJAg7/O9EsDI21LiwpaL+vkQQI8gvdih
31jrTCW1hBwqTzS0CajIYYZsxcr5/04puXeLkT2PPfh+CmKm3XwHgcrerNu/E6XC
xvmyCnQU1ca/WLo5qKifaBO3JA+WeyUiqJXNazclfL/tF5/bJBoaw789xjF6ekAF
wPrv1/fPK7f6Iz5JQgricvkMI69dhg==
=69UI
-----END PGP SIGNATURE-----

--Sig_/2_=5RXEnbX8l76i7CDWoLlq--
