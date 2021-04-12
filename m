Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF97935B85F
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 03:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbhDLCAJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:00:09 -0400
Received: from ozlabs.org ([203.11.71.1]:55537 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235543AbhDLCAJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Apr 2021 22:00:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJX430Z5bz9sW0;
        Mon, 12 Apr 2021 11:59:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618192790;
        bh=6KGoMZOipkjgLvY90G4k7+1g3YVKH18Rop0rlEB1lvU=;
        h=Date:From:To:Cc:Subject:From;
        b=abOWwMf1zo+XbYWczVMv1RypWHkK7nzOmeOjLbq1tMqJTX730iRkeVip5Wo/iW+ok
         e0P4GjZm2QmkSqI8z1kBwEL85zCjqUrFVpKres05n2mIm6w5fxnmEpe96SWGpu7nqP
         LS/deU8zxMdrUfipUdFhGWVOStmPElCWbmJFaUgeVsbxG5w0ESSOup2I2fh9UfNs0z
         Ee8qvDw7xqcWdTp0/6y8YWGIUqOAfaK2RiF57izPlgaxRsj41SsHh9YeCwBwREaY9N
         FZnDcIg6472+emOZuHWmktoqlyRs5gfWgFQxorLY2bfdJyrAp1HvQZ8ZwnjDpEf53W
         bFqEoyZOyGG4w==
Date:   Mon, 12 Apr 2021 11:59:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>, David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs tree with the btrfs tree
Message-ID: <20210412115945.2f2c3485@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gc6DPT+Gqa21ZyyF5kh5Jnp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gc6DPT+Gqa21ZyyF5kh5Jnp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/btrfs/ioctl.c

between commit:

  2911da32d543 ("btrfs: use btrfs_inode_lock/btrfs_inode_unlock inode lock =
helpers")

from the btrfs tree and commit:

  d9b32b140987 ("btrfs: convert to fileattr")

from the vfs tree.

I fixed it up (I used the vfs tree version (which removed inode_lock()
in various places) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/gc6DPT+Gqa21ZyyF5kh5Jnp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzqZEACgkQAVBC80lX
0Gy4Gwf/actIlV7I3h5Oi75NlBgId8+ZIutZImV5qau8DDdzTyIoESodNaPtJ+l5
1fOOU6Xs5udfI7OlmmvfRIzCFufcg1StjECJ6NtssqaxmxXXFk2/YyHKI8ixxTPJ
R8VoVsxB2UMWfLHapPU3+NKw5AHMc5k8TaBQkQNcfbVyX5/NXMwgRQO0cIZmmtjQ
vGM1iCUv/pzSsWBeOS1VTw6Gl5BKtIomEztRq/whvC63TcjdAhdDzW9dJl0o5jQn
ImTIl/Ig8tSfM3bG71G8AItk9l6tDm3/u3D2xORgeSCSEbgmJCYkZXIfJaLOStO2
+4dc57jkkMGikIn6z1lhx79wks2jag==
=S+LU
-----END PGP SIGNATURE-----

--Sig_/gc6DPT+Gqa21ZyyF5kh5Jnp--
