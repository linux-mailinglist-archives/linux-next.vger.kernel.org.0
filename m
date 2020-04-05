Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B8B19E863
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 03:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgDEBuG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 21:50:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46583 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDEBuG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Apr 2020 21:50:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vxSX1v2rz9sPF;
        Sun,  5 Apr 2020 11:50:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586051404;
        bh=hqbS4BMllKoL1W2DMcUleMpqqT+nI8WE35XafdnNgr4=;
        h=Date:From:To:Cc:Subject:From;
        b=Qesqe82350FZrwaxKnoqL1DdgLs7gl+xYhGt+LHgSh6DgT2JWIdkGuJVWMp9ckl0Z
         968b3SxpBHFmiaiT5XlDTKRdH3YnFWUtm0ljBNBjuIpyUrQv2izNwgHQO932uXAJwL
         K5pNgNum+jGsieYuWCMJli9Qd9HuK3DELXi7tloqba+XmxbYiPDNFOtsKtaCCBtuiM
         TEYhTwRdClhRn0vi259RsaAmJe3R5HSaobzrr75TQDwK58xP3xyW+FNNT4JRKKQM3a
         Qx6WEoPog3GfnvVNZ+E/VomC2c+ctz+EGY10UtfZJxProL/KuEthqJ7SPOclhxsMh8
         uDjz2qjzq7PBg==
Date:   Sun, 5 Apr 2020 11:49:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20200405114959.335eae46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q0soA7kkX4l2KYlfx=c4mTW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q0soA7kkX4l2KYlfx=c4mTW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/trace/ftrace.c: In function 'ftrace_shutdown':
kernel/trace/ftrace.c:2924:3: error: implicit declaration of function 'sync=
hronize_rcu_tasks_rude'; did you mean 'synchronize_rcu_tasks'? [-Werror=3Di=
mplicit-function-declaration]
 2924 |   synchronize_rcu_tasks_rude();
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |   synchronize_rcu_tasks

Caused by commit

  59377f3e06b8 ("ftrace: Use synchronize_rcu_tasks_rude() instead of ftrace=
_sync()")

synchronize_rcu_tasks_rude() is only declared when
CONFIG_TASKS_RCU_GENERIC is defined.

I have reverted that commit for today.

Just asking: are all the commits currently in the rcu tree actually
intended for v5.7?
--=20
Cheers,
Stephen Rothwell

--Sig_/Q0soA7kkX4l2KYlfx=c4mTW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6JOUcACgkQAVBC80lX
0GzLZQgAjFpC67Z6bWDQokr/lAF0cNFieAUfXQQ+p3Mr0M+0MoKZqKkuodtvLBFV
WIc6mWlCQLDKcUIyva8CxATTYxuHQ9UZpCJ7soVSZKDvlSofCNJyNvvPdrRL8v+w
DZ+ngJzzEIUDQSEnmwm0YOhCRt3jP70bhFKaTAS2EJ5OHjICfbeb4k2QKVF3dj1w
xDnB+X+nBR0ZPeT2Rd0lMqF9oUL5J8FINIccXReIT/i1+J6N+DjOUxPiqUaGvMy6
wPR3tSO8JZuE2/7Pfw/GXCikilL064plPREXd5TB+pMVd1rhTas2V8NjTkGY7ju1
M6zaVMDgcpbxSlFWif0r+iR1dn3Z9w==
=Rl69
-----END PGP SIGNATURE-----

--Sig_/Q0soA7kkX4l2KYlfx=c4mTW--
