Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A0113FB6A
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 22:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729963AbgAPV2m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 16:28:42 -0500
Received: from ozlabs.org ([203.11.71.1]:50089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729238AbgAPV2m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 16:28:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47zHPM28Fcz9sRG;
        Fri, 17 Jan 2020 08:28:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579210119;
        bh=dhL2oLt36qVVXXRO8eh4Ows9MshsQHRdLvBIk/5yB0M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dfDtNYV5/j7GksYw3MLyIWid/fuA7f3YAQj50BONrulY9IJy6LzTaTUDAWXut9kZ+
         3XhFE2dp5oHxKjr+zs5VxCaz5+KzfgVQgjXUgxmdM3bn38pk6lhsLaxeTmFz0Ww4Dy
         ICgUXw1GsyQeAodj4/MRRffCpLKsad9bmQtjS7Nl8pH7srkZgbjTyhTs2GlSCdQdso
         7cv1/2H/Ocu3xtPmMEb7oRoy1u4RPXpSnNpPon1iebq9XBrIJ9Twcs3MZs9XmYJt3i
         95Racl9Jq0W5ks8KCfuDL3DYCk5rraKD4Tt+5H01jk0cENeyALI6x3PfKdP4qcaoyA
         IHfMnI2W4XWAw==
Date:   Fri, 17 Jan 2020 08:28:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failures after merge of the keys tree
Message-ID: <20200117082826.38142c79@canb.auug.org.au>
In-Reply-To: <20140.1579207620@warthog.procyon.org.uk>
References: <20200109132240.264728ef@canb.auug.org.au>
        <20191212115901.221d8ba1@canb.auug.org.au>
        <20140.1579207620@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lOiKmKB=FW9oFY1WmVaXxc7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lOiKmKB=FW9oFY1WmVaXxc7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 16 Jan 2020 20:47:00 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Any ETA on when this tree will be updated? =20
>=20
> That should be fixed now.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/lOiKmKB=FW9oFY1WmVaXxc7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4g1XoACgkQAVBC80lX
0Gycmwf/SNhzBBck+HH1+pyi8USIswkz9E/UOdznEkXvqE3nhmw2IgWAMr7IZ4bo
g5I71qiRh0MGjpug7pTuAaym/0ytv9+mzx64nyfNdPyBzLg3gkL0xR1sP6Uvo8N7
m28OsT8D6m8yIFoqQqoUfhz/69w+mTRNl43/g8rRWpvPDtiJH/QI2ssHmZF1+Mcz
eq8luXeAAdRTv1Rf88AmIC2zXihidaAxIXA0LyZOeQyPiVDGPQww5oTxHmP9rJov
3v+9Y4YUkOPIepfNEsD1Ybw6uUknXlsL0Q0/ytZH5cQnM+JJt8ww+8ihbbvKtHO7
XoFgqvKpe6ZKOCXLk8JiqcG5ES53tA==
=Lv1B
-----END PGP SIGNATURE-----

--Sig_/lOiKmKB=FW9oFY1WmVaXxc7--
