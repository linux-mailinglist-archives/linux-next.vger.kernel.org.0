Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B402F09B8
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 21:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbhAJUej (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 15:34:39 -0500
Received: from ozlabs.org ([203.11.71.1]:39883 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbhAJUei (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 15:34:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDT8422ZCz9sVy;
        Mon, 11 Jan 2021 07:33:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610310836;
        bh=GZ4MvaKEK1fYz8dr5DQKQMMpLdz1zv/B/mXwebW6syQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JAdRQL7LTQhNLVf//NOM7sY4wjnc1y2nhwYK0RDGFsyMz3HUXcEplAaUmcPtHV8n+
         r3836yADPSrXmZaLH0f0B7o5GbbKDuJ3tzUT9IYLPpE/n36/kuzuIxusJCOcMzyWSM
         omyRQEgVrAV7zuYxm51MIDEh8IXyTQJpjgsc16+vyzGLXz8Tu/xOloFokOi8i6wMne
         kq7lX70cMGAp6XDcth1nevQFtvHDEh45LgKQamHQWfEia/b7cItzRE3+ZIViGJZ0ar
         02Oghgxiow+CwroanMODnriZwePpzQ9CPc7i8NnNcmbE2h+/izAYc3oxa9+VEabBr6
         yFxeEX0w1s0CA==
Date:   Mon, 11 Jan 2021 07:33:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Message-ID: <20210111073354.6ec0bbb5@canb.auug.org.au>
In-Reply-To: <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
References: <20210107141158.312835d8@canb.auug.org.au>
        <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fLaMUFB3KQfvEW9ViHRqyVC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fLaMUFB3KQfvEW9ViHRqyVC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chao,

On Thu, 7 Jan 2021 19:28:19 +0800 Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2021/1/7 11:11, Stephen Rothwell wrote:
> >=20
> > After merging the f2fs tree, today's linux-next build (htmldocs) produc=
ed
> > this warning:
> >=20
> > Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasis s=
tart-string without end-string. =20
>=20
> IIUC, should I remove "/*" and "*/" for newly added entry in sysfs-fs-f2f=
s?

Sorry, I don't know.  Cc'ing Jon.

>=20
> +What:		/sys/fs/f2fs/<disk>/stat/sb_status
> +Date:		December 2020
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	Show status of f2fs superblock in real time.
> +
> +		value           sb status macro                 description
> +		0x1             SBI_IS_DIRTY,                   /* dirty flag for chec=
kpoint */
> +		0x2             SBI_IS_CLOSE,                   /* specify unmounting =
*/
> +		0x4             SBI_NEED_FSCK,                  /* need fsck.f2fs to f=
ix */
> ...
>=20
> Thanks,
>=20
> >=20
> > Introduced by commit
> >=20
> >    f23307575903 ("f2fs: introduce sb_status sysfs node")
> >  =20

--=20
Cheers,
Stephen Rothwell

--Sig_/fLaMUFB3KQfvEW9ViHRqyVC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7ZLIACgkQAVBC80lX
0GxeNggAlc6+VK8tjBictAXtBxeRZCfGI7wKx9lrwjema49gfZ/rfANpfx1i0aQg
YrV7UbQwCSdW2JK7NNXhCFJ4WjFkEfYu1J9CzQdU1bFmiTpwbYANR9vJtQKifcO4
mxTGvZvb+pb/mrQDl3tQEAAtqHU8Lf8QYpcV9b+0rEqrTBxTYo5RKxSQKCWfCA19
01Elwf620+9ceyROuBxgkn7SrTM9/JGiGwiuTRsUDg95tCcvvlklYgKBIt9tzF86
5UUNLmT9I/alovoWR3OhEVQso/4vYygwQMsFqs40LFKL74OelnDi40MfJ3f/5gYW
AG7dyyNYRdOmyy0DcBaUXg/hE6u9tQ==
=XzYd
-----END PGP SIGNATURE-----

--Sig_/fLaMUFB3KQfvEW9ViHRqyVC--
