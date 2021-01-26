Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2B4303C21
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 12:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405424AbhAZLti (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 06:49:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405346AbhAZLlu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 06:41:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQ4Yj3MN0z9sXL;
        Tue, 26 Jan 2021 22:40:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611661257;
        bh=kXOSJMneAtNOFNRD65aRZUm/wZ4oxaUfXKIDxWLpRAY=;
        h=Date:From:To:Cc:Subject:From;
        b=sTDMuSgL2kXxawL2eExGfJUAkyvMl1RnpXa2ZiaFEai7Jeq4zJfzOCaByntIFH9a8
         WF8koByUrI3vtTK2bsTYw7NpZ74JhC/dWLttrlgAjztJNvV1YteRqxD+oLyIzEXoey
         gveHDfM82lQzNbEZAxsGqG9Dcbhmys8Ds23BPhbE1PMrLFLMahN9RrOThXWWZhyCnf
         xyJHSubyLHTuVc4yDYYDsXSTm9VvcGiBuX1MI+zHg7HtzMUv+C2v76nTPIpAjLpsqB
         1GByEGq9ATtF7ZnfZyjKx8gWixNGTKQap5xARvMjPZ91ImQiD1PrirZBXzOWcwtRuv
         qdPiji4yEvaLA==
Date:   Tue, 26 Jan 2021 22:40:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fscache tree
Message-ID: <20210126224049.2841074b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.rKWTC28mapsLIC4ei9nNqJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.rKWTC28mapsLIC4ei9nNqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  daa94e1d8977 ("NFS: Convert readpage to readahead and use netfs_readahead=
 for fscache")
  08a636bcf023 ("NFS: Convert to the netfs API and nfs_readpage to use netf=
s_readpage")
  56ee45bd6a23 ("NFS: Allow internal use of read structs and functions")
  31d24fb6dff4 ("NFS: Add nfs_pageio_complete_read() and remove nfs_readpag=
e_async()")
  9cf28394cb4a ("NFS: Call readpage_async_filler() from nfs_readpage_async(=
)")
  cdb77ce77d41 ("NFS: Refactor nfs_readpage() and nfs_readpage_async() to u=
se nfs_readdesc")
  70d842718007 ("NFS: In nfs_readpage() only increment NFSIOS_READPAGES whe=
n read succeeds")
  150c02f5ba86 ("NFS: Clean up nfs_readpage() and nfs_readpages()")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.rKWTC28mapsLIC4ei9nNqJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAP/8EACgkQAVBC80lX
0GzKFwf/UG9b6YM+YJylqLpMce1kMtjXTOlFc32fkMYOcujEjHOitDaLq9R3hwDb
7zCn6r10ifxjop+00GIGc43LWHBme3v5qJK3+1JmVMF8GgYy9obH5NK5dBohSH8X
CjP4M4mYVnkQUflReoGNltU7MK8cTHegoj1c8cHJ551d7+rPEpCE7S6aB5+xJDRL
YUKnXiIZPdFGcwpcVbbv8egO/zUQ/N4Z93JWaeJ9PxeAc3rypM67Z/DtnnxRpETB
zMdeWoMqf3sPpNsStXwyWEHNGiz6kF80A4gIklYTRSQgXaM+VIGqmdb5fioljpAE
QcpIhnhek5DfKq8qerMtPYW+bwm6TA==
=hCJv
-----END PGP SIGNATURE-----

--Sig_/.rKWTC28mapsLIC4ei9nNqJ--
