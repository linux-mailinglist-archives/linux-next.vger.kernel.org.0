Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A975542229C
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 11:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhJEJsF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 05:48:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48975 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbhJEJsF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 05:48:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNt520DMVz4xR9;
        Tue,  5 Oct 2021 20:46:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633427174;
        bh=84eqqgNw6zWux6L32esx+ONxFpgmhKvUPjxStrTVukE=;
        h=Date:From:To:Cc:Subject:From;
        b=ZXB74NmmmVlpcCc6tAz9ixgmFxFztxqj5OXA2Ctt3xuoL+LJm6JOVAB8cjTLta8P2
         yncrtHz/+e4s51YKqwTzyX9QRg81+/Jhr3SMEmpcSt57YqtxQILux3oAW3ugEnGzcH
         BEmEdbGAtdE0jq43W4K9QSxLmW6oytDfHRd75RAF3whhqh5dos8FTe1dPqeO0CXzkc
         KdzOFXxWS3pGVqMKO/k5MUO3mgDdn/dR9s6ct9ax1FY6e+wqSJbd4g8uptn+tScgSs
         qyhed+R2cQZDc+HJOgv0G7PwWYgNZt3mOG6OS39xhQCK+G0bg2fgKbqgGZMMhoTTpa
         q9PQeq23kfe0A==
Date:   Tue, 5 Oct 2021 20:46:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the fscache tree
Message-ID: <20211005204613.53cbdfb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DvtSlDavDl6vsPbGt9QkVn0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DvtSlDavDl6vsPbGt9QkVn0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fscache tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/caching/backend-api.rst:402: WARNING: Inline emph=
asis start-string without end-string.

Introduced by commit

  9c74b32d892e ("fscache: Update the documentation to reflect I/O API chang=
es")

--=20
Cheers,
Stephen Rothwell

--Sig_/DvtSlDavDl6vsPbGt9QkVn0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcHuUACgkQAVBC80lX
0GzToQf/UVrdSovKpXSO4oe71vtU1WMTr4C4e+GzQ7zTfamfFI6VNHwN62b7ptKG
VE64btcLiD96T6AJPzvQ2octZTt+UVBO2mob1zxXQeU4exg45It+5SKmtZpO8Ncs
FA1K1eyGQsPnRD9okjYdQ5YODJLL6fRielH+6yAJCuOjW5UHnKYLsBOCufAQ/tju
1QrZS78O1cgXJKBxnfcRsMWRdhSHvuzsmKeYoJgSVNLSRCbiaN6ZJja3ICCvjAlD
5weHc6W0KfQt8RCbuefG1G8krXRU7oLi0/77zZ8WvBhLjS5aNAtVNw2zV/v3HEI3
8ScL9+XWDtKn7DStj2HwuYlTN97nmQ==
=f6QK
-----END PGP SIGNATURE-----

--Sig_/DvtSlDavDl6vsPbGt9QkVn0--
