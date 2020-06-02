Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB571EB3C3
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 05:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgFBDXB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 23:23:01 -0400
Received: from ozlabs.org ([203.11.71.1]:47561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgFBDXB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jun 2020 23:23:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bcmz5bnWz9sSc;
        Tue,  2 Jun 2020 13:22:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591068180;
        bh=QY01y6x3uEJU7NDEPO5IuDK9kTZcxF0DZ16xjV3lXUI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NGBl8yepvOenGNeLSYQ/GxYYHmptYzfAJDPOSg5pG4sSeDrN3Uwv4XfH3VN4V6jSf
         9HFTEYKFkRCmLx7z4cBiYbmAou3h+C9rTTNGaa9nLqgXvSU0n4SiNaDyD37QDN1maU
         S/g1OPa7P1FWjWfbsBtOS7TtWz/jvrvUGvEAsPMDrnBxhRqnaS5tWefd6d5ogwdgzG
         k49VStMtHPNw6xeBznPINleuJlgH+57RR6dA5Qm72sxEJyttNVvI1voO2OESI6v/vl
         HGL/p2kuqMeifVUVTPOA27hqqkGQKgKQnA4jKepAgdb38LKP0ZQ5ea1dDTox+E5V+j
         xkJIDugUGHXgA==
Date:   Tue, 2 Jun 2020 13:22:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ritesh Harjani <riteshh@linux.ibm.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20200602132258.26ab53fe@canb.auug.org.au>
In-Reply-To: <20200602030709.E9DBAA4040@d06av23.portsmouth.uk.ibm.com>
References: <20200529221128.668844ca@canb.auug.org.au>
        <20200602030709.E9DBAA4040@d06av23.portsmouth.uk.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLUqHG75uTefE8PzEewNnk4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gLUqHG75uTefE8PzEewNnk4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ritesh,

On Tue, 2 Jun 2020 08:37:09 +0530 Ritesh Harjani <riteshh@linux.ibm.com> wr=
ote:
>
> On 5/29/20 5:41 PM, Stephen Rothwell wrote:
> >=20
> > Commit
> >=20
> >    560d6b3da024 ("ext4: mballoc: fix possible NULL ptr & remove BUG_ONs=
 from DOUBLE_CHECK")
> >=20
> > is missing a Signed-off-by from its author. =20
>=20
> My bad. I guess it got missed due to the three dotted lines.
>=20
> https://patchwork.ozlabs.org/project/linux-ext4/patch/9a54f8a696ff17c057c=
d571be3d15ac3ec1407f1.1589086800.git.riteshh@linux.ibm.com/

That would do it :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/gLUqHG75uTefE8PzEewNnk4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7VxhMACgkQAVBC80lX
0GzNuwf+McI/nXItGVjttLNmWsQp0YAQplnJq0g89QWsU3R3VNDt4aQd0S8+xJFX
mt3sxrCpupsQt4Y8+5z4xhn5iiNFNGBTbVlFL6rruwYRou0WKx8lU+22Vw2BbBIS
aKzgTImnpDYkNMUTMpbYimFHPpYEgc2muKkav8CgrZPgEyYWkRmShq9rJ20881u0
NH2wXyRg0q/nTe+0eQF2vV0bud8RnJ479oQrTEckNxwfNU5G2ZspzaOgCVT4pCiR
eTsvCcMMisb9vnvZ9cNPfJXwKclsKnrt5GT2VVR044lvbYRIV3po3pU78Lr81ntu
DcQwZAQgOiqs/Md6tP+/8e7BY69eLg==
=Q/WK
-----END PGP SIGNATURE-----

--Sig_/gLUqHG75uTefE8PzEewNnk4--
