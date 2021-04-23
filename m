Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F257368C99
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 07:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhDWFX3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 01:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240585AbhDWFXR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 01:23:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E785C061574;
        Thu, 22 Apr 2021 22:22:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRN306Gppz9sV5;
        Fri, 23 Apr 2021 15:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619155358;
        bh=Yrifz6069QnvvligZ6daMbvydpBwdOtQ+8ZEYsskgIk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XUj20bxn/kWYir3ptR9OyYkLict8aqHtca9RjhJmbyiO6Hyp35d4yWmccIj/Fz5Uv
         KL1WhgEVWDylX/u3MJ9a+p8qs/hYYxAWCM2LxY+GoHvDtsInt4WaM0snN4J+8UwREq
         6tYY5/CA4j/fOdYtT/YZRg7yb97pnAy8k9ar2hukPbjCBfzqPggCHr8RutmPr5F59p
         vfqxGXzy0eFo/ApP1Lt04WdmslugHEOySsl9tvN5MmP1Uui8V73R/EJLXQflyRUKWX
         H6AqA3LS2ZDNTJ4xqwWlaVFcDzg3TSsISxqL1XZPtqwf+PcdPbGsiHjSsXLtYNCWQg
         Zs3qCxQO9joXw==
Date:   Fri, 23 Apr 2021 15:22:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tpmdd tree with Linus' tree
Message-ID: <20210423152236.59609c97@canb.auug.org.au>
In-Reply-To: <adc46f08f50e4bdc27776beceeafd6c67cf3843f.camel@HansenPartnership.com>
References: <20210423123921.181bbb3a@canb.auug.org.au>
        <adc46f08f50e4bdc27776beceeafd6c67cf3843f.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zrn519jVXONxS9ZqIkOQnyk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Zrn519jVXONxS9ZqIkOQnyk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

On Thu, 22 Apr 2021 22:16:29 -0700 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Fri, 2021-04-23 at 12:39 +1000, Stephen Rothwell wrote:
> > diff --cc security/keys/trusted-keys/trusted_tpm2.c
> > index c87c4df8703d,d225ad140960..000000000000
> > --- a/security/keys/trusted-keys/trusted_tpm2.c
> > +++ b/security/keys/trusted-keys/trusted_tpm2.c
> > @@@ -79,7 -245,10 +245,10 @@@ int tpm2_seal_trusted(struct tpm_chip *
> >         if (i =3D=3D ARRAY_SIZE(tpm2_hash_map))
> >                 return -EINVAL;
> >  =20
> > +       if (!options->keyhandle)
> > +               return -EINVAL;
> > +=20
> >  -      rc =3D tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
> >  +      rc =3D tpm_try_get_ops(chip);
> >         if (rc)
> >                 return rc; =20
>=20
> Yes, that's the right fix, but it should be the one at the top of my
> tpmdd-for-next branch.

Yeah, I haven't merged that yet.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zrn519jVXONxS9ZqIkOQnyk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCCWZwACgkQAVBC80lX
0Gxwowf/QHNXsoX6lxLH3z69+yeDRhaUfRWv6LphCH7T1psqCPBDvVFNW+QBYzG0
i9b5g78s9i7/ar6eOCsQGFTwy6auPWcRQuw9EkRPPjMqOpfsqCYhYPbR3gST6AJv
syF+IL+TIrPyzEbjvvRHxJJJp6sD1epoPQk1ZqSrNzoLLAr7SLYhwJNeB6qSKCHF
+o2Ku8Lqd/6gWMI+sznY0jzUds+hVH5YOZBqYH1JST87J3HvI0JUFVtY8Mll8kV4
FlLcfOeX/4UeYbZvZvUqeRXWogRfAFkorsrNCZ8lsinsgpXU8zcvFc8sYRLoWn9m
4pQOSHRk1B++2MduWZ22SIZAjVTuIA==
=V8Yf
-----END PGP SIGNATURE-----

--Sig_/Zrn519jVXONxS9ZqIkOQnyk--
