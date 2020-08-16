Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67848245A02
	for <lists+linux-next@lfdr.de>; Mon, 17 Aug 2020 01:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgHPXF3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Aug 2020 19:05:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45517 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgHPXF1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Aug 2020 19:05:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVCSj3WnDz9sTK;
        Mon, 17 Aug 2020 09:05:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597619125;
        bh=8VK/Gfi49HUJQUZQ/EMPeD7C1SgstZFRnxdw7fYPZaI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fXJlHEZG63zpRXq+2A0uFsUPCQvmrNX7TG4R1PHYsPD7NkCRabFKXnYmbeSakNse7
         WVQHMtdgFXl1NVVVEXzYt9ZVTu+HUe5jevWTC4nu/AOxX7QtLkU0lLIsNRLET20cUE
         4ZsAIml/J/n0rJX6gKt/zzW2zsEqLAz1BID+qXX+R0Al64OVtsStFo0iztYhwkg+jv
         IWwg58EPCIaXAPPM+JPf6jOCPpf0P9nJ/2ppdtY5Cf9QTJq/9k+7qABgN3n6OfevGs
         DgO8wVr86t3SmV8tX6gVK4X2UBQEE3qDj5RMT8dQT1fOK+TAxsCzjsa3QmAGwvbPV1
         XWhKrbpWFYy5w==
Date:   Mon, 17 Aug 2020 09:05:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fsinfo tree with the kbuid tree
Message-ID: <20200817090523.68692855@canb.auug.org.au>
In-Reply-To: <20200805163246.4df09c31@canb.auug.org.au>
References: <20200805163246.4df09c31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0vABfxgRZ8Fz_PinV3fhZi2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0vABfxgRZ8Fz_PinV3fhZi2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 Aug 2020 16:32:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the fsinfo tree got a conflict in:
>=20
>   samples/vfs/Makefile
>=20
> between commit:
>=20
>   2f95ada7fe22 ("kbuild: introduce hostprogs-always-y and userprogs-alway=
s-y")
>=20
> from the kbuid tree and commits:
>=20
>   7e786dee0b78 ("fsinfo: Add fsinfo() syscall to query filesystem informa=
tion")
>   96f310048fba ("fsinfo: sample: Mount listing program")
>=20
> from the fsinfo tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc samples/vfs/Makefile
> index 6377a678134a,7bcdd7a2829e..000000000000
> --- a/samples/vfs/Makefile
> +++ b/samples/vfs/Makefile
> @@@ -1,4 -1,9 +1,4 @@@
>   # SPDX-License-Identifier: GPL-2.0-only
> - userprogs-always-y +=3D test-fsmount test-statx
>  -userprogs :=3D \
>  -	test-fsinfo \
>  -	test-fsmount \
>  -	test-mntinfo \
>  -	test-statx
>  -always-y :=3D $(userprogs)
> ++userprogs-always-y +=3D test-fsinfo test-fsmount test-mntinfo test-statx
>  =20
>   userccflags +=3D -I usr/include

This is now a conflict between the fsinfo tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0vABfxgRZ8Fz_PinV3fhZi2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl85u7MACgkQAVBC80lX
0GzmEQf/epWix+23H/UBX+eSYAFawV/ONDulX4R6L8uckvEFL+US1xsfodmcDBBs
UUzReHo2UQOpbC4Cn00/q23hdetaDAmhungYEapX6ZkpCn1LVA8eMQ1qM7w4n+fy
wuL4opjliYSmghlrzmtDOjovi9eXbcD7ydSmsi60x7/D/LsZ8+F+Uag9f5HQ6Y0/
m/iLx3pyaZ0jK7ws/qAny7f7luJakvdLeSL+seSY3xCOK8vDJUHCgF8+mHNSJN27
GAC3/HISz8IClR7mxB2NlsIjfeqDXNFEd2TPLLVaxK+lmJq2luq74Kpqu/y2sifN
kt0C9XOnt8euUuKVZqZY3Bvqdg2W3A==
=VJMo
-----END PGP SIGNATURE-----

--Sig_/0vABfxgRZ8Fz_PinV3fhZi2--
