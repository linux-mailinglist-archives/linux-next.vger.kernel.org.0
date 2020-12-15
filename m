Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1EE2DA4B0
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 01:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgLOAZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 19:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbgLOAZp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 19:25:45 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC55C061793;
        Mon, 14 Dec 2020 16:25:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvzY72hkFz9sTX;
        Tue, 15 Dec 2020 11:24:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607991901;
        bh=vWuotdgS5TcNnQbSwFlC8XfEJ2wodbtO7HjNeFZHOTY=;
        h=Date:From:To:Cc:Subject:From;
        b=DJF0kIZ7iVctY+RhcNm7MvzEYccRpCvuSdEiD5BK4rd3kP5RfNRdfW6z3VpL9wYlB
         BkplIwBcGUFGtsM7xDqXUhKTXlw5/zZUrGNXgYl7Ui6SB+o9xSAwTLaf0+6zC5qQCp
         29RSH+0wp4MM/k3usjUERu5uH2A+UymkjWC5tFbWgeKkWwVymfgkv/P77CyqVtUk/h
         GvhnbV67pkERVg3FCGNRFHkFHoR7srM6hOvTZlIMnuNQjvR9BLDCB6LrNBv828iQli
         S2+b2CjunAQoDxGUP0MKR7Y9qErNBaLc7e2+R72Jo31My6rtg7rG9lLU7vqoeA72GB
         xYdkrW2olsj0g==
Date:   Tue, 15 Dec 2020 11:24:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Anna Schumaker <Anna.Schumaker@Netapp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the nfs tree with Linus' tree
Message-ID: <20201215112458.4081eb26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/66g5Ef/Gg2BOOj05mVBh5PK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/66g5Ef/Gg2BOOj05mVBh5PK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfs tree got a conflict in:

  fs/nfs/nfs4proc.c

between commit:

  21e31401fc45 ("NFS: Disable READ_PLUS by default")

from Linus' tree and commit:

  5c3485bb12c9 ("NFSv4.2/pnfs: Don't use READ_PLUS with pNFS yet")

from the nfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/nfs/nfs4proc.c
index e89468678ae1,61a07dcb963d..000000000000
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@@ -5309,18 -5319,18 +5319,18 @@@ static int nfs4_read_done(struct rpc_ta
  				    nfs4_read_done_cb(task, hdr);
  }
 =20
 -#ifdef CONFIG_NFS_V4_2
 +#if defined CONFIG_NFS_V4_2 && defined CONFIG_NFS_V4_2_READ_PLUS
- static void nfs42_read_plus_support(struct nfs_server *server, struct rpc=
_message *msg)
+ static void nfs42_read_plus_support(struct nfs_pgio_header *hdr,
+ 				    struct rpc_message *msg)
  {
- 	if (server->caps & NFS_CAP_READ_PLUS)
+ 	/* Note: We don't use READ_PLUS with pNFS yet */
+ 	if (nfs_server_capable(hdr->inode, NFS_CAP_READ_PLUS) && !hdr->ds_clp)
  		msg->rpc_proc =3D &nfs4_procedures[NFSPROC4_CLNT_READ_PLUS];
- 	else
- 		msg->rpc_proc =3D &nfs4_procedures[NFSPROC4_CLNT_READ];
  }
  #else
- static void nfs42_read_plus_support(struct nfs_server *server, struct rpc=
_message *msg)
+ static void nfs42_read_plus_support(struct nfs_pgio_header *hdr,
+ 				    struct rpc_message *msg)
  {
- 	msg->rpc_proc =3D &nfs4_procedures[NFSPROC4_CLNT_READ];
  }
  #endif /* CONFIG_NFS_V4_2 */
 =20

--Sig_/66g5Ef/Gg2BOOj05mVBh5PK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YAloACgkQAVBC80lX
0Gxc/Af7Bia8okK4+lt+8FqgXtZV8/u0SvU59XR0dofcsvbaN7dYCjHkn7VdfHCj
O9KOe0qyiYQ3PyZKEQz057E3Tr4277mGCkVVSic6zrklSCXcCn+CCgjHpQn14IPW
mvI7Z6IsIFLDaF6qGtBiA2XNibQKHSLPdX0bQC7BVy8VIJQLL0BbWnVmxI2WWw5+
JIAURHpEtSTk137q5G/zgEOyjPlTFIUV5f4j4eSOQMzGKeYnxqJ3mNWahzjYLD0y
LAkyL2xUW+FZ837o3ZPBIxzkjcjyj/L/QK9QFWBTQdsiMHtm6qGfjO686brbDUCH
I2PxIGFW+Cbpwk975uoYPgzi0K2BPg==
=BGK5
-----END PGP SIGNATURE-----

--Sig_/66g5Ef/Gg2BOOj05mVBh5PK--
