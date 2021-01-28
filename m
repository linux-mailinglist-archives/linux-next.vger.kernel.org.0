Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D9F306D22
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 06:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhA1F47 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 00:56:59 -0500
Received: from ozlabs.org ([203.11.71.1]:38207 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229513AbhA1F47 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Jan 2021 00:56:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DR8q242xkz9sSs;
        Thu, 28 Jan 2021 16:56:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611813376;
        bh=sDRmnTnGwvb0rkxd7GwQFbS3/7p67CHmGPY/wJFiJ5E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AC4j8CWBZMPBrUSs+fKZhNlrf2eTp/HFPrNt1BLZj6jQfojVSF9QzOTE6zUieF7f3
         by3eDwtkJYLVCDDRqvnt3g22J214eZHyt5fivY5zoLihcjM7GltuPZXzWs3zJoAFfH
         svb2o3P5eRTwDqV1Ro+WgSO4WzrAX4UnDgxF2okzbgFiE3XM6UVQc5XQRd5ZXSAD6J
         J2iHRtL8ROtDOKTdxGFkr/U/rvITx2gN2OFyt0y1yCgPMgTApayxulrU0+6A/yJvDV
         FICeNvjv/SPC1ImCtlNXgGBI+rRaiaUomw+zhgmIapf/PfmrsIZjZ1DdeXikzo6dZt
         lSt1bhx6ClfqA==
Date:   Thu, 28 Jan 2021 16:56:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the kbuild
 tree
Message-ID: <20210128165611.24fcb9cb@canb.auug.org.au>
In-Reply-To: <20210125150213.2b09c92e@canb.auug.org.au>
References: <20210125150213.2b09c92e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I7Rk36tOK8oCtgihWkxeGOZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I7Rk36tOK8oCtgihWkxeGOZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 15:02:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   drivers/scsi/gdth.c
>=20
> between commit:
>=20
>   537896fabed1 ("kbuild: give the SUBLEVEL more room in KERNEL_VERSION")
>=20
> from the kbuild tree and commit:
>=20
>   0653c358d2dc ("scsi: Drop gdth driver")
>=20
> from the scsi-mkp tree.
>=20
> I fixed it up (I deleted the file) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the scsi tree and the kbuild tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/I7Rk36tOK8oCtgihWkxeGOZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmASUfsACgkQAVBC80lX
0GxG7QgAoq1Tt+i8/DTzShp9XP6fuwl3IBYIODHpDHeGpy0dbOw/CJ1DQ6w0TgFS
yJ9Ct0TYNgOiK7Yq4OALdCTgmmeNRZLferkCDI0E+CvvSGit4ahlW27QvCTeTSZ4
sx4dGX+mlC08e5Q3wL8qjImDWD5x+ZCgwi177noe6oWnWmjzNq7JyRvt2VyJSNnf
Em5cS20ZzRHqSqnQ5sU2WN/e8k8ULxumu7xzyPya0Nusy9pru8/RKOfh8W1bq8Q5
PEbnvgeH4HX8SHB8240rntkETUnu+K3Q9kOG3EVBytshaEaFjWgF58+wrkdbN4AN
MH1FfaNIKrYk4JjJGqrWfkRJwG+OmA==
=DzXZ
-----END PGP SIGNATURE-----

--Sig_/I7Rk36tOK8oCtgihWkxeGOZ--
