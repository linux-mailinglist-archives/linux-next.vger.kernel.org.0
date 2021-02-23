Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829CC3222E8
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 01:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhBWABW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 19:01:22 -0500
Received: from ozlabs.org ([203.11.71.1]:41991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhBWABV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 19:01:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dkzhh5GJbz9sCD;
        Tue, 23 Feb 2021 11:00:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614038438;
        bh=1ikac/fuTaR8vulwWvUG3F5HVVlmbUMrBrNHfXaFPb4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=j9oRyOExlUMfXTNiNkAKsKITCW2eQ/vY+JU/p1ss7G0EgS3kwRukukaf6/kLa/Jdk
         4qWeDU345Pn43l9pDIo8i0nwT7nOVarPVW0krrX9+s7ZtQs+ykCKJ0xoPldS3/Pgzq
         Zde2WGoasHdHaNuJihwV7tPoW2l6M9qtcJSmUazyuTzCep4bP2ti8XgHfgha/j6NBe
         j4hfQ5uuTHG6gJLhj8Pz+eI5jOjuDifB1BNpMdTCdth2C+5HIiV4sFBG3CpGFn6I+b
         iasfjd0D3rcJ21dp4MUYUbHkkRPD+c+dnj7RB0LJ9rTbQ3GQ5thussbLUEBvYNyYNV
         DsHMIN5BrJBSw==
Date:   Tue, 23 Feb 2021 11:00:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: Re: linux-next: manual merge of the pidfd tree with the integrity
 tree
Message-ID: <20210223110035.54ca2a0c@canb.auug.org.au>
In-Reply-To: <20210215080717.24bc532e@canb.auug.org.au>
References: <20210125171818.286f08b9@canb.auug.org.au>
        <20210215080717.24bc532e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/utbKQ7iYHnw5A.UC3+vfRQg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/utbKQ7iYHnw5A.UC3+vfRQg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:07:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 25 Jan 2021 17:18:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >=20
> >   security/integrity/ima/ima_api.c
> >=20
> > between commit:
> >=20
> >   2b4a2474a202 ("IMA: generalize keyring specific measurement construct=
s")
> >=20
> > from the integrity tree and commit:
> >=20
> >   a2d2329e30e2 ("ima: handle idmapped mounts")
> >=20
> > from the pidfd tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc security/integrity/ima/ima_api.c
> > index 1dd70dc68ffd,ed410efb3597..000000000000
> > --- a/security/integrity/ima/ima_api.c
> > +++ b/security/integrity/ima/ima_api.c
> > @@@ -183,17 -184,18 +184,18 @@@ err_out
> >    * Returns IMA_MEASURE, IMA_APPRAISE mask.
> >    *
> >    */
> > - int ima_get_action(struct inode *inode, const struct cred *cred, u32 =
secid,
> > - 		   int mask, enum ima_hooks func, int *pcr,
> > + int ima_get_action(struct user_namespace *mnt_userns, struct inode *i=
node,
> > + 		   const struct cred *cred, u32 secid, int mask,
> > + 		   enum ima_hooks func, int *pcr,
> >   		   struct ima_template_desc **template_desc,
> >  -		   const char *keyring)
> >  +		   const char *func_data)
> >   {
> >   	int flags =3D IMA_MEASURE | IMA_AUDIT | IMA_APPRAISE | IMA_HASH;
> >  =20
> >   	flags &=3D ima_policy_flag;
> >  =20
> > - 	return ima_match_policy(inode, cred, secid, func, mask, flags, pcr,
> > - 				template_desc, func_data);
> > + 	return ima_match_policy(mnt_userns, inode, cred, secid, func, mask,
> >  -				flags, pcr, template_desc, keyring);
> > ++				flags, pcr, template_desc, func_data);
> >   }
> >  =20
> >   /* =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the pidfd tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/utbKQ7iYHnw5A.UC3+vfRQg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0RaMACgkQAVBC80lX
0GxjAgf/emEN4gdvNYEye7ltF1Vvy6LlcaeXg0VlDOyA87OhQADQL/H2mMWyhszk
HBqZr3KIs0VzRmpFOngwRg9/zka0Wd9P3LTg8RPfM0kfU8IeFQWwhf1MF+FMnIB7
AA9n3MsqF/qr67lZG3egucWLGdDtAo5BeFGO6Qg1YiC0vnK62xVrbwYaU5Gg/Ju1
aI1oBa46edsWQIeCgdJxgF0j/NMVBETwyEqbXYz7aAS3WPuAFtDipAQteJAwC/j0
/hHtgha2LKWeQyroC+4gFB31qIzIpxHj6dahd6n1jD15yFx56tsRbxz1VWOZ6/8l
2M3aWCc5TGZQHKmPdSbBN7buKTdlAA==
=KvRU
-----END PGP SIGNATURE-----

--Sig_/utbKQ7iYHnw5A.UC3+vfRQg--
