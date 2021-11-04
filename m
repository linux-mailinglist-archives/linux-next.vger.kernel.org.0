Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C16445B32
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 21:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhKDUtI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 16:49:08 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51335 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhKDUtH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 16:49:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlbK00fSsz4xcG;
        Fri,  5 Nov 2021 07:46:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636058788;
        bh=Q6jveyxUcJjAyWI/Fm6rQCVZxrdQeIii8jLdg66GsPw=;
        h=Date:From:To:Cc:Subject:From;
        b=XAVFqtFslKSZP0D2/NypUVjU9U+WZirFgmXsqZHTUOS2WXCJT/knSHcTDwXK6v+Nv
         NmlPNEGgdxsNa2HBGWdt2EMOcfJS1mBMi1mbUfHtCOdPhaXoMgaATTZd6ewBBXmFT5
         zQxFHmq/Xy8zNBKf3BogNYOZmrwEih7cEniiwkMKs8HnqTeQD7XtmU36gWTv+bRwUl
         1pIh86JwAGKyJI4BMEcO+LlKxGPG7qsY1dqRVF0chJJ1cVSn/WfQhj5Wrb5Rykuyzo
         /FligCeMnXDQy497+VcDU/fL1iqPKOnLe6nlocWdhF15lJAXwPx/fZ/733k1rVE+UF
         aMvRKO52VydNQ==
Date:   Fri, 5 Nov 2021 07:46:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ksmbd tree
Message-ID: <20211105074627.76ab1526@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o5VZqTI1tFccuR_2ag8.HR6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o5VZqTI1tFccuR_2ag8.HR6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  99f76ea5661e ("ksmbd: change LeaseKey data type to u8 array")
  f5ab639bc25e ("ksmbd: remove smb2_buf_length in smb2_transform_hdr")
  1b3bd95c0471 ("ksmbd: remove smb2_buf_length in smb2_hdr")
  2361911de730 ("ksmbd: remove md4 leftovers")
  13fe1226bef4 ("ksmbd: set unique value to volume serial field in FS_VOLUM=
E_INFORMATION")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/o5VZqTI1tFccuR_2ag8.HR6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGERqMACgkQAVBC80lX
0Gwnnwf/eU1Jg3DwrH6xyRIPf03+dyhlDex+pi7JBUVnBNqQfSxGgcPha+kqZ7fC
Rtyuvl7vIvreJPO/ZdMf5+elVBe12b6QawzB7CA0adKal72CrcFOBMkSOjOXtMev
FLsLWZG76O3rkfT0Hxa/1LrGoTnxor/an2IbD5J1ACpUOgnwDtDygRQ4UT/OGJmp
AiBiSKvuzQcuFz3elRXkLYdY4tThoaHxxP69qHifH6c1xurRhxILjAm30dUU+zAD
C6khhlvY/fvXahf3r5KsjPCgkAq/3jAe4AYJW0PSLKHKP+YZ5XkpeRaSYgrFi/+C
knuhBRcmIcVklZwQAeRvP9XLRVGwlg==
=eC/l
-----END PGP SIGNATURE-----

--Sig_/o5VZqTI1tFccuR_2ag8.HR6--
