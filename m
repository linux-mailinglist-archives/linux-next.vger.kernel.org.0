Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE8431B2A2
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhBNVIC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBNVIB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 16:08:01 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736C9C061574;
        Sun, 14 Feb 2021 13:07:21 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df0DP6TwFz9s1l;
        Mon, 15 Feb 2021 08:07:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336839;
        bh=re4kOa8QoLqeKKPGnTrtVc0yRyPkTM9lTK07Z+wjd0M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jQuavyzr6GsDBwNdIRVeHe+QjnY0mAwHjG1guOayRYbZkRke78XpqMP2cPrDimLVT
         x+AWVbSuyMbCmiiWevQHgoagRfwKRLlXP1IZTcJoW8NfVj8TPrBmymBZzsXoGmkjZf
         JEJbLm1ReyHcroUazRAHEolddJTm1WKK9cbFE04J3jwxSPKTMFy+aHbxHQwhJAj0Mp
         NcA1gkQNjSDISPr14SDxRnuT5MIUVffoFjTzNKbEAntszDtBzOWN6BoDP5MB5aqs1I
         vXmO5AwlkvbiAaMlkBT4IfxpKjjYD27hTktr/ZtNi2RMrzn7GA7YcYb6WUvZq1MG9Z
         qt9xUWjIABbmg==
Date:   Mon, 15 Feb 2021 08:07:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: Re: linux-next: manual merge of the pidfd tree with the integrity
 tree
Message-ID: <20210215080717.24bc532e@canb.auug.org.au>
In-Reply-To: <20210125171818.286f08b9@canb.auug.org.au>
References: <20210125171818.286f08b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rp4c_T2gKU2GV6y8xmYfnyV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rp4c_T2gKU2GV6y8xmYfnyV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 17:18:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   security/integrity/ima/ima_api.c
>=20
> between commit:
>=20
>   2b4a2474a202 ("IMA: generalize keyring specific measurement constructs")
>=20
> from the integrity tree and commit:
>=20
>   a2d2329e30e2 ("ima: handle idmapped mounts")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc security/integrity/ima/ima_api.c
> index 1dd70dc68ffd,ed410efb3597..000000000000
> --- a/security/integrity/ima/ima_api.c
> +++ b/security/integrity/ima/ima_api.c
> @@@ -183,17 -184,18 +184,18 @@@ err_out
>    * Returns IMA_MEASURE, IMA_APPRAISE mask.
>    *
>    */
> - int ima_get_action(struct inode *inode, const struct cred *cred, u32 se=
cid,
> - 		   int mask, enum ima_hooks func, int *pcr,
> + int ima_get_action(struct user_namespace *mnt_userns, struct inode *ino=
de,
> + 		   const struct cred *cred, u32 secid, int mask,
> + 		   enum ima_hooks func, int *pcr,
>   		   struct ima_template_desc **template_desc,
>  -		   const char *keyring)
>  +		   const char *func_data)
>   {
>   	int flags =3D IMA_MEASURE | IMA_AUDIT | IMA_APPRAISE | IMA_HASH;
>  =20
>   	flags &=3D ima_policy_flag;
>  =20
> - 	return ima_match_policy(inode, cred, secid, func, mask, flags, pcr,
> - 				template_desc, func_data);
> + 	return ima_match_policy(mnt_userns, inode, cred, secid, func, mask,
>  -				flags, pcr, template_desc, keyring);
> ++				flags, pcr, template_desc, func_data);
>   }
>  =20
>   /*

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/Rp4c_T2gKU2GV6y8xmYfnyV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApkQUACgkQAVBC80lX
0Gxn/wf/S9PpFaOlBdW7fZhGh55OjdZV8NKos2yr0PuABaPYmc9Eso/5EkHwO9IL
kdCGiMNDk8xMChHZLx0lsWzVIpx/oP1BkhadZbHHlTCjme0zMgljRgV2BPjAY658
7xn2lVemIEQ/ofSPmaB21xa1KB/SzWO2Z587hXxf5j0jGHyyezxjLxk28wxSG/86
ylxnee0sNTij5CoxOTCojgqyjW9BqyVRkY4OGMKxCBXAkEqTDRlqYnjihSUZBP0v
bqpGpirIsJU1M6lVePpg82kTAqR0TnLEwbRwzNi/+i9VVrXP01TdIaHJmi4kkqsI
fRMoiEG6g6tawaGN9BZ1sxIEtb0nfw==
=xXgX
-----END PGP SIGNATURE-----

--Sig_/Rp4c_T2gKU2GV6y8xmYfnyV--
