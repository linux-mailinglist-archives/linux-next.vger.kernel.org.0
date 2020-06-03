Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456E21EC74D
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 04:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgFCC1y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 22:27:54 -0400
Received: from ozlabs.org ([203.11.71.1]:40661 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgFCC1x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 22:27:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cCVv317kz9sTD;
        Wed,  3 Jun 2020 12:27:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591151271;
        bh=LLwKcC/PGzT4qu21KqMhNXqhAHbGudTK5MS/jr7G3sw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CZzKLn8TxsqdPtFu3mOZvTCsfaR6pP1rCWXPKKnA48bRujilwCU8kNiKNtvih8ihy
         5XwNhoc/r/IoEdb9vWetMNMaxtQEcZO9U9w3E1cPtFSrQxkXt0Ys97f1K9slshp12c
         obOlGhscmz38yzhSdveqizFB2XGnqqYKvxzwrpgu8uZ4WeC+rtOWXL9yowtLnrxLL1
         0pgFJTLfeA9r9ZttJaKtQYMUpkxc0y2r/RTwGmUpOPnO+g5JldVYkhQ4e4PxwxRZJW
         s1rrwsjZi0nlbL2GmCdj3+QXmmlzCGZ5ON5FwZxHWWsdfJz6NQbYfL3R097x0n+Uez
         OM/lfW61LcFfw==
Date:   Wed, 3 Jun 2020 12:27:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the jc_docs tree with the ext4 tree
Message-ID: <20200603122750.70bf9c55@canb.auug.org.au>
In-Reply-To: <20200522130616.5fd7054c@canb.auug.org.au>
References: <20200522130616.5fd7054c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n.K/_u=W2U4MCWLxSXA8GNJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n.K/_u=W2U4MCWLxSXA8GNJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 May 2020 13:06:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
>=20
>   Documentation/filesystems/fiemap.rst
>=20
> between commit:
>=20
>   469581d9e5c9 ("fs: move fiemap range validation into the file systems i=
nstances")
>=20
> from the ext4 tree and commit:
>=20
>   e6f7df74ec1a ("docs: filesystems: convert fiemap.txt to ReST")
>=20
> from the jc_docs tree.
>=20
> diff --cc Documentation/filesystems/fiemap.rst
> index 35c8571eccb6,2a572e7edc08..000000000000
> --- a/Documentation/filesystems/fiemap.rst
> +++ b/Documentation/filesystems/fiemap.rst
> @@@ -203,10 -206,9 +206,10 @@@ EINTR once fatal signal received
>  =20
>  =20
>   Flag checking should be done at the beginning of the ->fiemap callback =
via the
> - fiemap_prep() helper:
>  -fiemap_check_flags() helper::
> ++fiemap_prep() helper::
>  =20
> - int fiemap_prep(struct inode *inode, struct fiemap_extent_info *fieinfo,
> - 		u64 start, u64 *len, u32 supported_flags);
>  -  int fiemap_check_flags(struct fiemap_extent_info *fieinfo, u32 fs_fla=
gs);
> ++  int fiemap_prep(struct inode *inode, struct fiemap_extent_info *fiein=
fo,
> ++		  u64 start, u64 *len, u32 supported_flags);
>  =20
>   The struct fieinfo should be passed in as received from ioctl_fiemap().=
 The
>   set of fiemap flags which the fs understands should be passed via fs_fl=
ags. If

This is now a conflict between the ext4 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/n.K/_u=W2U4MCWLxSXA8GNJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XCqYACgkQAVBC80lX
0GwopggApOjo/iECIglrNssnqA1mIVjx1LNI4M8S5tRBjgjypT0ft79nttI6uhdM
1oQ7CJL6awyv+pXxRnER4QLK2I8M0vChwAEQeEBgIC6osLCklhivV0wtPmT8lZCX
OFpjCBMjd9BXa6RDmXv5pVCoO3ZHqkeREX7kHEG90dxABSTbVhFe+mscjrrI68Ck
CpTUNbL9Ywn8U42v7K5vJEsEWNY4XuBqpp5yS54VXamZKlg8r0j729KQOGZLOLe8
lrl6l8asW/G0hBvxtDCLCiat6T9lAKEETzBmSQNSDLfpC7SQrUX43bH92b+cfNR1
Wi3DChife2lgm1xUl+qaR5znEwQqFA==
=+bFZ
-----END PGP SIGNATURE-----

--Sig_/n.K/_u=W2U4MCWLxSXA8GNJ--
