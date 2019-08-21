Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E6D97027
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 05:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfHUDSG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 23:18:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfHUDSG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 23:18:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CtCJ18Kzz9s4Y;
        Wed, 21 Aug 2019 13:18:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566357484;
        bh=LfTl3U3DXyFlaSZOQY3hHH00E096mRNPpjLKp1ypn74=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XrnDrmLnSkcA8P3yQB9A54gBWRNesjQ7BGBNa11mCA0npzYyqDNAVroeGMWHqCGeo
         0WCrzi/Uh1pHaBUsp9sWROEeurgXW7O9BvtEVUAf06Pg06K3oNIKu2s1W1DCXUahKr
         cov6rOP4JhrpiDwTi+0CfQ8o0wC/F3LIG+KptWu2nqNjBGQg3p8aN5hnxWTfLqu3Rd
         WJYdnGvPIOLH20J918/7JBHOtCpRi2bM1O+lDGKfvsJdmTMz0sJDD2Xxb5I/mDiYgy
         H7BTGwYgmtDMsDNWfB3Ur7d8re5akA2auarys0biMINhp2EYxOMrxUfG3T/wbEq/2A
         Zlof1Sl5Q8nQQ==
Date:   Wed, 21 Aug 2019 13:18:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Bohac <jbohac@suse.cz>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>
Subject: Re: linux-next: manual merge of the security tree with Linus' tree
Message-ID: <20190821131803.1fc4f887@canb.auug.org.au>
In-Reply-To: <20190821130106.0c794ddc@canb.auug.org.au>
References: <20190821130106.0c794ddc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rPzYgtJ2zsml.U4.5TSJuRo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rPzYgtJ2zsml.U4.5TSJuRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just adding a couple of more Cc's

On Wed, 21 Aug 2019 13:01:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the security tree got conflicts in:
>=20
>   arch/s390/configs/debug_defconfig
>   arch/s390/configs/defconfig
>=20
> between commit:
>=20
>   3361f3193c74 ("s390: update configs")
>=20
> from Linus' tree and commit:
>=20
>   99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KE=
XEC_SIG_FORCE")
>=20
> from the security tree.
>=20
> I fixed it up (the former removed the CONFIG option updated by the latter)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rPzYgtJ2zsml.U4.5TSJuRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ct+sACgkQAVBC80lX
0Gx0iwf+JujmS7sDznWXEMvaSR+Y6gCItmJ/uhIjUW8McxCEbESFF7z4XtEmVl32
3P60DXYi+YlbCfW8CLZ0W9NdCvNes+s00ktSbhmYejdx1rwN08g9e73yyd7faD9Q
xxaNXS7dqJkfb7cSWq9pP53Rzz4FmLqij5dzsDnXbpECz5vpx/tTOrFmKdh2CyWl
3OSNf/sQhOzOzeVsiH4c0F2RoEYg41wWMCALJAYZ4/SeBztoSchZWY1WWLmlnNXr
WJowEjF0wRDWhBv3AMGkhWL6B3kZDYcB9ho9B5/wT1gzEvMqwHqBCFbLLMNZeToa
SuspYCILrTc7vRardM0a9VuOlVwTUA==
=lu/H
-----END PGP SIGNATURE-----

--Sig_/rPzYgtJ2zsml.U4.5TSJuRo--
