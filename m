Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFA6436BB6
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 22:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhJUUFP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 16:05:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43559 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUUFO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 16:05:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZz1D5LKxz4xbT;
        Fri, 22 Oct 2021 07:02:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634846576;
        bh=8hutoUrhjoImTeuC/RieV6PxFK1CZ/JC0JpDZOJuWfk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IBpykymVNLuF2fmU+iYCTkDfLvzPFGTPAgqrXonzg+PIlhcsDIGy+HaUGNsBX3/6V
         DnqVa6C9P+Elw5AUIqvMxAzF7S6L8vk2lO0Wbk0LdZBOGC6CRWzH/LeRhS7K+YTPBF
         ei6r0PsbkJMLd4i8gXEGQApaRuuNtiSQCB1smXnu9PR+x0By8X5vElip95jJw2BceD
         ZnkHf79Inspa1qgj+sKPTpPC5x0HyjHQrsUO16XnWyBngu7zQerCbvSoa3M85krxBh
         M7YnlEEM8Bz+myFUyhlO4E5pVLfuu+/zk4RWPlc1vRmch5x1mc5CGl0HKArFxQJqSl
         /61ipB+oHKWQQ==
Date:   Fri, 22 Oct 2021 07:02:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
Message-ID: <20211022070254.7ad873a2@canb.auug.org.au>
In-Reply-To: <2b5929e2-eb77-d625-5637-fd8353909fda@redhat.com>
References: <20211021184735.794b22a7@canb.auug.org.au>
        <2b5929e2-eb77-d625-5637-fd8353909fda@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MGALi7gXpMgh00UoJHvgrdZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MGALi7gXpMgh00UoJHvgrdZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, 21 Oct 2021 11:14:29 +0200 Hans de Goede <hdegoede@redhat.com> wrot=
e:
>
> On 10/21/21 09:47, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> > produced these warnings:
> >=20
> > Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Unexpecte=
d indentation.
> > Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block quo=
te ends without a blank line; unexpected unindent.
> >=20
> > Introduced by commit
> >=20
> >   527cd54d49dd ("Documentation/ABI: Add new attributes for mlxreg-io sy=
sfs interfaces") =20
>=20
> Thank you for reporting this.
>=20
> I've a bit of a noob question which tool / make target generates these wa=
rnings?

I just do "make htmldocs".

--=20
Cheers,
Stephen Rothwell

--Sig_/MGALi7gXpMgh00UoJHvgrdZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFxx24ACgkQAVBC80lX
0GxKwwf/dpOhm9AOlGI0luT4z17DQc5R9hczWOAK5qqy2b9rRyqKYozapTVPwsWV
dBKmSXJq5MXZNK7o985hsYtczWXz/U5ozFsobQGB715neDq26yFbo0WqG0HWt0ec
oOCN1w2OvlWaf9OKffxgrUKmEgqiWOUdXGWbVWqqfbmNGKkxntBHkVTqHnzFcKWo
GP+JFaCyA3u6KAVTJ90Q11yhHVHBrNYr2dqXVmZ9mOxR2ndJQGkMvDljerFkjboD
srtldlQW3M92KAfiDG5++L8SyORml4cECkJRlYGO5A567r7gF5uYlz2PIuxy1Dm6
9MIfM8gLBpdzkTjbmxQzMJ4BwGO2Gg==
=HPTv
-----END PGP SIGNATURE-----

--Sig_/MGALi7gXpMgh00UoJHvgrdZ--
