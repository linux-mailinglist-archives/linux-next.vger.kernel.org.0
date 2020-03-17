Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2327E1877D3
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 03:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgCQCbX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 22:31:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgCQCbX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 22:31:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hHGw0HmHz9sPF;
        Tue, 17 Mar 2020 13:31:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584412280;
        bh=ZBfJWtuoYYV1XtPRPArMl+724QILkhYjkgBwxYGuOY0=;
        h=Date:From:To:Cc:Subject:From;
        b=o+UGXm5XCOLZ9Mj5PS4IImKFm43j+hXF9vpTUbNYqEl1ETH+ocEiIfMQ3hTmfhsvj
         ImK8DJGsnW1sPjaNHIj77RbaFvbXzQjpIEXq9ZEaI5PI/uMNmlq/o/mIImd12I0E/H
         rZ3DzvN+jksQ4aGospbQKrdI3/8AJLFWG6zKobvkkeBglriXwXGuwb9p68InqLDlPY
         KPtR3shNu3/lh5w9a6R0IO9qYQGQE475a3nj/0sbfq2F17l6oFz2cTDy2ttowujf3f
         JigtKkkWdRK2mSHg/uAY9hYdrAe16A/8zRsu8771790q7YeVscHopuSJRoC5e5yXXz
         juZqBOTfc5kXw==
Date:   Tue, 17 Mar 2020 13:31:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Scott Mayhew <smayhew@redhat.com>
Subject: linux-next: manual merge of the selinux tree with the nfs tree
Message-ID: <20200317133117.4569cc6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QrWTEzrMvwuCGuAWfBhfOSX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QrWTEzrMvwuCGuAWfBhfOSX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  fs/nfs/getroot.c

between commit:

  e8213ffc2aec ("NFS: Ensure security label is set for root inode")

from the nfs tree and commit:

  28d4d0e16f09 ("When using NFSv4.2, the security label for the root inode =
should be set via a call to nfs_setsecurity() during the mount process, oth=
erwise the inode will appear as unlabeled for up to acdirmin seconds.  Curr=
ently the label for the root inode is allocated, retrieved, and freed entir=
ely witin nfs4_proc_get_root().")

from the selinux tree.

These are basically the same patch with slight formatting differences.

I fixed it up (I used the latter) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/QrWTEzrMvwuCGuAWfBhfOSX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wNnUACgkQAVBC80lX
0GyHVwf/fzO6n0OwdU9ZrALMJhLWqQN84OwCQvQQDFJYKDGuPkXjtJBeDHZT2To2
epx0ZcHfNjpVIMszv+44hz+iH06tku75EJFHRZ7KmYM51dlqbxSnEBYJgiB/54im
lo4rewljw8YvZuTKYhK2szxoypxf2Hfe5/3h+jUD7VGmG18t3QOLCENC4LBhhylm
BB6lMph87B8Dg7nAb6f6IKSfECIfRpOr1CQ463Tj4qziw8KKFPZBZX3/LE7+JIto
lLhL5E5/3/qSvDnwFs5ml67bU7hKv/3KPNlyAyEA44ImrcVwUfVmNkO6Ijz0sEK5
7m2s8IOSNwnAQZvBrF6cspUdXSYxGw==
=YN6V
-----END PGP SIGNATURE-----

--Sig_/QrWTEzrMvwuCGuAWfBhfOSX--
