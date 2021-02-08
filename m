Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327BC3132AE
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 13:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhBHMp2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 07:45:28 -0500
Received: from ozlabs.org ([203.11.71.1]:34091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232599AbhBHMpP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 07:45:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZ5M471Lgz9sS8;
        Mon,  8 Feb 2021 23:44:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612788273;
        bh=wuccNvh4clTwslzNj7DcFPyJwndj//XGY2JKmfFh2lM=;
        h=Date:From:To:Cc:Subject:From;
        b=m9WCofIuWbYmSfCJTYUfb22pwChHr0vl+c5VaWVYXboDPjOzaRRr4IPLUVn40bjZg
         fF7TLq8Lu+VQLZ/ufgHuaAVq8BmiMqs7zA+vhfCYB8tNyOeK8zJdzQvfr8unO+VKoK
         nqi4tVjdUUWHfcmMjx0gTLiJHiN/UwZWdPcn5s4zg+8RW+IEAA3/MqXneWn1x9+rCv
         HHhZ+7dMNWJOfEXquXWN7mIv71rJDVcjsC2nspCzENpgkWPLhhANoKuJj4bwtxdTCo
         wTe8lvyHkJA3x6cV6mmqdcDgMXt4LAgcViXgDr7JAQess0JeviU7IhU5ldi/wTaEvs
         12wx2eV8eR9aw==
Date:   Mon, 8 Feb 2021 23:44:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20210208234431.54e51b57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MSUL0f/DYybToo1iaLTiAjm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MSUL0f/DYybToo1iaLTiAjm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/xfs.rst:531: WARNING: Malformed table.
No bottom table border found or no blank line after table bottom.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Knob           Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Documentation/admin-guide/xfs.rst:534: WARNING: Blank line required after t=
able.
Documentation/admin-guide/xfs.rst:536: WARNING: Definition list ends withou=
t a blank line; unexpected unindent.
Documentation/admin-guide/xfs.rst:538: WARNING: Unexpected indentation.

Introduced by commit

  f83d436aef5d ("xfs: increase the default parallelism levels of pwork clie=
nts")

--=20
Cheers,
Stephen Rothwell

--Sig_/MSUL0f/DYybToo1iaLTiAjm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAhMi8ACgkQAVBC80lX
0Gx4Xwf/WAhwaaci/wegNCsb6SWGikaurVcWQYE4VWOvOu2M5BY/a7GQRGsfbYfA
rZCYiqfc8Ozxyc1Py3M2mpu17FMhQnrQvmmf8PK2PhEBK0IInUqr2ZlEosaLPnGS
VlB1eRFb615WXckSb3hO7U2ugNKb0Cy8k5GUuZy3ix9L/KzWzw9A1e+iqr233ozg
ZoJy8AaucWUN9pXKzr0bc3F8P99fEDYM8LiUVQzqX33xhIReqLkJ+7L7UXMJDZdC
ExQilsCFGG553sRZDtt2pNtD0fsMWCL1dNKNQybyuaC4GJQMCevIkuy7YbZuj+FT
r5gM7iBlX/I2b9RXse7RpUPF6aZlUw==
=MxB1
-----END PGP SIGNATURE-----

--Sig_/MSUL0f/DYybToo1iaLTiAjm--
