Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3024D31C9C0
	for <lists+linux-next@lfdr.de>; Tue, 16 Feb 2021 12:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhBPLfc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 06:35:32 -0500
Received: from ozlabs.org ([203.11.71.1]:33215 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhBPLei (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Feb 2021 06:34:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DfzPY3L0yz9sVr;
        Tue, 16 Feb 2021 22:33:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613475217;
        bh=ridY0eMRba4pufvR09nWyO9lCwHPviWyxj1awfCeJrg=;
        h=Date:From:To:Cc:Subject:From;
        b=iFeLbxYtWSjPKP7AARi09VMfeVHJ6VRtNSPAPl/Bn8Ryg+qLPkAcaO5XOrd8VYdYF
         CxHNc13lLeJYp0/39jN6o+B9Is16+hm2I7z9l9ZuovsSi+jB/JIdwgUBLYixDwZ8av
         NPq6OIMNiANVLr+n2s88v2GhD4hVO3QSlBpETdMs0AA4kLF+WQ+Z3qYyymAN/abFNv
         03Vob9eiEDqXFedC1Z8Q86ZitwOX4y6USbLHfHbpbYSxzDn8yZ63GFcpLKZAJ+7LXa
         v7Iej1Vq8Rmp70g59KDFlLWeIxCzB+qFNni528kNQOobA7DXCZE9q74HDa8ZVvWYtE
         oDFRv+WjpiAqQ==
Date:   Tue, 16 Feb 2021 22:33:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20210216223336.67fc77ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vn_DtRKDb6QCnPHVTsv1n0T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vn_DtRKDb6QCnPHVTsv1n0T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f204a0ab8c4f ("cifs: update internal version number")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/vn_DtRKDb6QCnPHVTsv1n0T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmArrZAACgkQAVBC80lX
0Gygvwf+P2rKO9JojCL4NCYM4J7WkX0c+5G+OrYur0jv4kuIYyHSzimRG28i6tAo
KOGM95N94o0pXty8X2iGSvjIh8J6RVCLP9ROfXn1eS9dSUWwzlTWKl/CmTWOc4Mj
kfQsK/ww+laqVdWRXOO/HZGfWWzHuO9XB7aIZOhbtq2/iOp1egOI9WD3IJhTV6ey
pKwTHKGbWQAdygvia6PdjbEtXuN255HDTXkuYP4VPESSrfqSnbgKSKc994TKFtVK
5OqfySpm5qatwFWNacslgDmaIU9ZAaBfbQxtT4nMU807jCGZWjZefFqCdRjgtFkM
fmqkDrI142yf19Ik87zqAW8DzhCr/Q==
=RLmd
-----END PGP SIGNATURE-----

--Sig_/vn_DtRKDb6QCnPHVTsv1n0T--
