Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79582F4300
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 05:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbhAMETK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 23:19:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbhAMETJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 23:19:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFvM72kBLz9sVR;
        Wed, 13 Jan 2021 15:18:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610511507;
        bh=IlUxPAYnSr4hw1LXKEuVmx8u+KU3KYGYTEv56jfUBYA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jymkbG1SMauBdMsQ9ipftrEfRBIqkYID5bDlX3mdBeYTvpqmy9y3/TR8EJMn0PJ7A
         xNGJEVhJFLJNpL5RIL8Kg5tNwE/rXUYldoI3PIL+LDoMML6YWgwHlCbFkFEIRi0Ec0
         EMtEu4odxSDP/ynTyMD5NA2e91U00/lYNz+mBQcCpBAghNnRxRJ5EPfbTw7GDL+Uoz
         Mocym4N9tb+kNUyzV7AQV007TRUatIYePBiUH0aDLwwRiWgwPhjhfn9s82CcwoakjW
         SKpJ2BCHyhvAU1F1u/H+8Nm9Lf5DjGD2jzmlUjmP5Zw9vt/Yp6pbjLGWji4LvYjNFo
         tES22e8swRgIQ==
Date:   Wed, 13 Jan 2021 15:18:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210113151825.31669f1a@canb.auug.org.au>
In-Reply-To: <20210113151254.74b9a295@canb.auug.org.au>
References: <20210113151254.74b9a295@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7.dBLHBoEm_ATVUaJ_BJ1Ve";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7.dBLHBoEm_ATVUaJ_BJ1Ve
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Jan 2021 15:12:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/translations/zh_CN/mips/booting.rst:5: WARNING: undefined l=
abel: booting (if the link has no caption the label must precede a section =
header)
>=20
> Introduced by commit
>=20
>   7fd3954b0c52 ("doc/zh_CN: add mips booting.rst translation")

Similarly,

Documentation/translations/zh_CN/mips/features.rst:5: WARNING: undefined la=
bel: features (if the link has no caption the label must precede a section =
header)

from commit

  72bc9d08868d ("doc/zh_CN: add mips features.rst translation")

and

Documentation/translations/zh_CN/mips/ingenic-tcu.rst:5: WARNING: undefined=
 label: ingenic-tcu (if the link has no caption the label must precede a se=
ction header)

from commit

  419b1d4ed1cb ("doc/zh_CN: add mips ingenic-tcu.rst translation")

--=20
Cheers,
Stephen Rothwell

--Sig_/7.dBLHBoEm_ATVUaJ_BJ1Ve
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+dJEACgkQAVBC80lX
0Gw2kAf/Xr22YMpT+xF1yQv4RiLTvS2JVpXF79OlB40oVKDG1LfvvtGdszu4E+fj
K+j479S5l+18zKeHaRQ0BxcXNIHLkCsCRhmo/I7jlY8rt3s4ie5c44FnZSadDnWh
w/bowTn26Lws1lSMLtLE19swUrX1Z2mN48rs24oXJAnhYWPHbcIKSvAQ6YJMCiAm
3/opYJIS5iTQlTzhCiPQA7hLGJEMjTCFtovUSzt+n4S8aeoNgkvWW1PMTYe3Dk8O
GJaWmBUm2dvWvCZBnlWzoR66uJ3QonboXiFfGJT975froo9AHKQwqNP6xOfvVxNj
LrSQ8UlmM0YaiqndzRUTKe11jNZFMQ==
=MbEr
-----END PGP SIGNATURE-----

--Sig_/7.dBLHBoEm_ATVUaJ_BJ1Ve--
