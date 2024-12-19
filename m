Return-Path: <linux-next+bounces-4999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4439F74DF
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 07:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2171F7A5F8E
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 06:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CCB216611;
	Thu, 19 Dec 2024 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qmmccvm0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06144216E18;
	Thu, 19 Dec 2024 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589960; cv=none; b=DRsFibyRkcqbIaZfGRb5UwvVMZk3ZUcCbi3D3mO5r3i8O8264blrDGBUYHdDGXUrOKHWY8TCiRVZ90AM2oeTqhqSxJUlQIJVUtraA3mrvKItsl+lmGCwsCjpCvyj1v2C3Z1uclGqYp56TXnC+t7PzihxSYNiQTaefpLtWEYvVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589960; c=relaxed/simple;
	bh=7de9QxnPnp4yapekLL4S2hMa1rSUh8no8Dc1+V0Ed3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGPd/1s/Z4r77NzfTJ8SjKvYqZw9bzOi6rX9fmMqusOzzupGEuCO4Rg0tkg1OZOg9Kh1ehQdM8nNoit7TLdJWqhibfoNZ/lmoksVdz8e4oL7OxNi3XJDjVZ/9yfEw6vI3l+P29Fc5pD3Q9Q+JAcyOBhyt3NUcTdgDsdCRiw9gng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qmmccvm0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734589951;
	bh=3a4Q/m7qsPfV2cki28BWXsrQIBZ6drcITIsBB0EKhIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qmmccvm09YwDZP7w0qdGRrEHjTzX0dguTHwG4zh9J3SIRq56NqRMrZWCcF0ydpTFo
	 39DyZ7dROW1/VcVYcC1ERNU5jd0l2+xd+DSDktjI52yXNOOB3/dE5PnOhslC4vLe6+
	 YB4KSJPxo13vqmnJ0+RswoUKAXNgN0Zsb80vR6VF5GMzzI41OUEjvPFEsrvYbQlg7O
	 TSetDxfp4tu161fOzDRMk49FYBN33YKwSrUz8JH74FE336cU2APhFhXZsoPAVj1TiP
	 83OAm25H4mlpj1JEtieYu14xt6L/6j/Cwcs71ZT7ErHAOQjLumRqRMQMozGUQZqZgN
	 0FagxnPXvu7/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDLM31yJgz4x3d;
	Thu, 19 Dec 2024 17:32:31 +1100 (AEDT)
Date: Thu, 19 Dec 2024 17:32:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241219173235.6600d08a@canb.auug.org.au>
In-Reply-To: <20241213152724.589b38d8@canb.auug.org.au>
References: <20241213152724.589b38d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AUO1W.L8KSPLJllhucuVnBQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AUO1W.L8KSPLJllhucuVnBQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Dec 2024 15:27:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
>=20
> samples/vfs/test-list-all-mounts.c: In function 'main':
> samples/vfs/test-list-all-mounts.c:175:58: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 3 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   175 |         printf("Listing %u mounts for mount namespace %llu\n",
>       |                                                       ~~~^
>       |                                                          |
>       |                                                          long lon=
g unsigned int
>       |                                                       %lu
>   176 |                info.nr_mounts, info.mnt_ns_id);
>       |                                ~~~~~~~~~~~~~~            =20
>       |                                    |
>       |                                    __u64 {aka long unsigned int}
> samples/vfs/test-list-all-mounts.c:186:83: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 3 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   186 |                         printf("Finished listing %u mounts for mo=
unt namespace %llu\n\n",
>       |                                                                  =
              ~~~^
>       |                                                                  =
                 |
>       |                                                                  =
                 long long unsigned int
>       |                                                                  =
              %lu
>   187 |                                info.nr_mounts, info.mnt_ns_id);
>       |                                                ~~~~~~~~~~~~~~    =
                 =20
>       |                                                    |
>       |                                                    __u64 {aka lon=
g unsigned int}
> samples/vfs/test-list-all-mounts.c:199:74: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 3 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   199 |                         printf("Listing %u mounts for mount names=
pace %llu\n",
>       |                                                                  =
     ~~~^
>       |                                                                  =
        |
>       |                                                                  =
        long long unsigned int
>       |                                                                  =
     %lu
>   200 |                                info.nr_mounts, info.mnt_ns_id);
>       |                                                ~~~~~~~~~~~~~~    =
        =20
>       |                                                    |
>       |                                                    __u64 {aka lon=
g unsigned int}
> samples/vfs/test-list-all-mounts.c:218:64: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 2 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   218 |                                 printf("Failed to statmount(%llu)=
 in mount namespace(%llu)\n",
>       |                                                             ~~~^
>       |                                                                |
>       |                                                                lo=
ng long unsigned int
>       |                                                             %lu
>   219 |                                        last_mnt_id, info.mnt_ns_i=
d);
>       |                                        ~~~~~~~~~~~             =20
>       |                                        |
>       |                                        __u64 {aka long unsigned i=
nt}
> samples/vfs/test-list-all-mounts.c:218:89: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 3 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   218 |                                 printf("Failed to statmount(%llu)=
 in mount namespace(%llu)\n",
>       |                                                                  =
                    ~~~^
>       |                                                                  =
                       |
>       |                                                                  =
                       long long unsigned int
>       |                                                                  =
                    %lu
>   219 |                                        last_mnt_id, info.mnt_ns_i=
d);
>       |                                                     ~~~~~~~~~~~~~=
~                      =20
>       |                                                         |
>       |                                                         __u64 {ak=
a long unsigned int}
> samples/vfs/test-list-all-mounts.c:223:47: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 2 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t=
%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
>       |                                            ~~~^
>       |                                               |
>       |                                               long long unsigned =
int
>       |                                            %lu
>   224 |                                stmnt->mnt_id,
>       |                                ~~~~~~~~~~~~~  =20
>       |                                     |
>       |                                     __u64 {aka long unsigned int}
> samples/vfs/test-list-all-mounts.c:223:69: warning: format '%llu' expects=
 argument of type 'long long unsigned int', but argument 3 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]
>   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t=
%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
>       |                                                                  =
~~~^
>       |                                                                  =
   |
>       |                                                                  =
   long long unsigned int
>       |                                                                  =
%lu
>   224 |                                stmnt->mnt_id,
>   225 |                                stmnt->mnt_parent_id,
>       |                                ~~~~~~~~~~~~~~~~~~~~              =
   =20
>       |                                     |
>       |                                     __u64 {aka long unsigned int}
>=20
> Introduced by commit
>=20
>   7b1da09dc088 ("samples: add test-list-all-mounts")

I am still seeing these warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/AUO1W.L8KSPLJllhucuVnBQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjvgMACgkQAVBC80lX
0GzJlgf/cXqg9nCOMrur/0hJ6I2O0AtbbMsnP345+eSgIObKW+ghHsoy6dv8RHMU
cNYVZ09LY6u/5edxjVdNjqTqraFdELx5P689ECJZwVze3VWtXJwedN1EKTjNsxNf
lNLLObvdFiX7wgKErDLSjoivVGQod/OihTV7ZI/mHOqaDx8AL+zSuwp/X7qiBPPY
HyzRG1lx8gi3HyK2hBkxAPgHaeQTcfn8sIaaRdvtsLj3m5pPK73a6QQZ6RPXA3Yj
KSzcoEQwSqvFti8G4H6d5gVbWZvyIe/aP6ROEsriHHj8HvOhWjOc2cRoAIAn1roU
Mdf67yUms8mvIP5fpOeT1N8upH6PfQ==
=hCVZ
-----END PGP SIGNATURE-----

--Sig_/AUO1W.L8KSPLJllhucuVnBQ--

