Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F974015C2
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 06:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhIFEr3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 00:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhIFEr3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 00:47:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0808CC061575;
        Sun,  5 Sep 2021 21:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630903581;
        bh=RzSzDTHci4V2ziXtE5vIRYIpw+paSUotIA2LSQZH0eU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gR90qONM52pLQX1CCJwe85SwvDngfw01gEJHvlLgaE3M50MZ93PD5vyq3uRulxpFC
         C1Tm8qbBmC9lSGob68DvXg5lof9ruKriAigEnAtpEtHO5G2wPMt0YwMWFILyuZmbKi
         eFdDV0RKLh2Qt9fDXK4nLzc7khh8WIRI1t/aNHSzPoO1w+CCvAtQOLutttgUVFrOYo
         KMGejFeAD3rzWawFHeeXeD5bHHNFYCUzO2GoZy497Z1NTV1uRIrlb56Jh5z7/H1oT2
         wyglEk6aCpv4N6Unhpq2N5ugk3wZpav9uTLHvrsg9UgDe/3y4F5+KMg0xYXu3pE4I2
         mPyJrcaNfnh7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2wpM0d9Sz9sRN;
        Mon,  6 Sep 2021 14:46:19 +1000 (AEST)
Date:   Mon, 6 Sep 2021 14:46:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Vasily Averin <vvs@virtuozzo.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm
 tree
Message-ID: <20210906144617.20cd87c0@canb.auug.org.au>
In-Reply-To: <20210824191039.10d869cb@canb.auug.org.au>
References: <20210824191039.10d869cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LjgvNLQcUWHp5jFvpFl8cxN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LjgvNLQcUWHp5jFvpFl8cxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 24 Aug 2021 19:10:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   ipc/sem.c
>=20
> between commit:
>=20
>   bdec0145286f ("ARM: 9114/1: oabi-compat: rework sys_semtimedop emulatio=
n")
>=20
> from the arm tree and commit:
>=20
>   7a4207f02a96 ("memcg: enable accounting of ipc resources")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (I think, see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> diff --cc ipc/sem.c
> index ae8d9104b0a0,1a8b9f0ac047..000000000000
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@@ -2216,40 -2229,9 +2216,40 @@@ long __do_semtimedop(int semid, struct=
=20
>  =20
>   	unlink_queue(sma, &queue);
>  =20
>  -out_unlock_free:
>  +out_unlock:
>   	sem_unlock(sma, locknum);
>   	rcu_read_unlock();
>  +out:
>  +	return error;
>  +}
>  +
>  +static long do_semtimedop(int semid, struct sembuf __user *tsops,
>  +		unsigned nsops, const struct timespec64 *timeout)
>  +{
>  +	struct sembuf fast_sops[SEMOPM_FAST];
>  +	struct sembuf *sops =3D fast_sops;
>  +	struct ipc_namespace *ns;
>  +	int ret;
>  +
>  +	ns =3D current->nsproxy->ipc_ns;
>  +	if (nsops > ns->sc_semopm)
>  +		return -E2BIG;
>  +	if (nsops < 1)
>  +		return -EINVAL;
>  +
>  +	if (nsops > SEMOPM_FAST) {
> - 		sops =3D kvmalloc_array(nsops, sizeof(*sops), GFP_KERNEL);
> ++		sops =3D kvmalloc_array(nsops, sizeof(*sops), GFP_KERNEL_ACCOUNT);
>  +		if (sops =3D=3D NULL)
>  +			return -ENOMEM;
>  +	}
>  +
>  +	if (copy_from_user(sops, tsops, nsops * sizeof(*tsops))) {
>  +		ret =3D  -EFAULT;
>  +		goto out_free;
>  +	}
>  +
>  +	ret =3D __do_semtimedop(semid, sops, nsops, timeout, ns);
>  +
>   out_free:
>   	if (sops !=3D fast_sops)
>   		kvfree(sops);

This is now a conflict between the arm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LjgvNLQcUWHp5jFvpFl8cxN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1nRkACgkQAVBC80lX
0GznSwgAlnp26CA+nBp+V9WYBM4Rd8DHC/l4yzvpQxNgRSmTr7pzD4sVrs/NtlUe
G2QST6sYQPahSUB9j6IKdb2krCKtzT3gwsOTV2dCtr2hUBB8iuXMrr1CG3xMBuaD
4Wtno+brYdKzviiewzLHHhQRS4BnrgrFj5fYWSrKNrdhovO/xYz77iSkHuV9PpCp
kVCYSzNw9Ec0io8QW6gX2QU3m4WsBRS0kjybE0FJjiJPhNppxo987tpzN+wkO7fk
inL1+7fUVNB7maQUfxt6d6Binyvc2I3pSUcK1mgOdd/eZ4UtqkJHJKhhHIicOgGr
yQmNZlbQl9tddYpt/oJwSbVFZoFEwg==
=cctH
-----END PGP SIGNATURE-----

--Sig_/LjgvNLQcUWHp5jFvpFl8cxN--
