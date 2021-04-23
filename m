Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E559C368C6F
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 07:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhDWFRV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 01:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWFRV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 01:17:21 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0298BC061574;
        Thu, 22 Apr 2021 22:16:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 00E7D128052B;
        Thu, 22 Apr 2021 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1619155005;
        bh=VsyRCU5CFMRhUzvFP5OPQ7p1xjFngO2v4nOSPw4NsdE=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=DHdHtyjCtd+COmXr4667o+ewwKyi8JcgiHMUEAlG7JP/v/zjetcrpVdQQaT5KLbM6
         RfwrSXdv6z4oe2JvRsaWu37YQUPA5sA2ndMGoXEQVE1zdG8j9ntsL6CTe9cOVmXzA0
         EMKLIDrpcIgSdOjdwtRAqfzBd6NYSqW9JnMCGzls=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9KPyGY0gGzFG; Thu, 22 Apr 2021 22:16:44 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 914921280526;
        Thu, 22 Apr 2021 22:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1619155004;
        bh=VsyRCU5CFMRhUzvFP5OPQ7p1xjFngO2v4nOSPw4NsdE=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=tiDenWh8AnxZUYuo0AZGMa6vSF/rFSABdbzB4fecd4GLLZrwfPjgShwmUcC5JV651
         fGKYjCYknZHENCnlKsvJ/WNdaygHBpHl+20Z8HuGSAssvKq69ANe9aVhzdHCkZZmY7
         JZr4YimaSOCgn3vGqjogoLPjUSdJcErRA7bG75Iw=
Message-ID: <adc46f08f50e4bdc27776beceeafd6c67cf3843f.camel@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the tpmdd tree with Linus' tree
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 22 Apr 2021 22:16:29 -0700
In-Reply-To: <20210423123921.181bbb3a@canb.auug.org.au>
References: <20210423123921.181bbb3a@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-yt427yNM8skr60d6Si3l"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-yt427yNM8skr60d6Si3l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-04-23 at 12:39 +1000, Stephen Rothwell wrote:
> diff --cc security/keys/trusted-keys/trusted_tpm2.c
> index c87c4df8703d,d225ad140960..000000000000
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@@ -79,7 -245,10 +245,10 @@@ int tpm2_seal_trusted(struct tpm_chip *
>         if (i =3D=3D ARRAY_SIZE(tpm2_hash_map))
>                 return -EINVAL;
>  =20
> +       if (!options->keyhandle)
> +               return -EINVAL;
> +=20
>  -      rc =3D tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
>  +      rc =3D tpm_try_get_ops(chip);
>         if (rc)
>                 return rc;

Yes, that's the right fix, but it should be the one at the top of my
tpmdd-for-next branch.

Thanks,

James


--=-yt427yNM8skr60d6Si3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYIJYLgAKCRDnQslM7pis
hbBOAP4+5HNcZqyqS6cGmXeLznEyvm2bDkblLkKbEvMGxSUBeAD7Bgy6SmGUUYkH
JllLWKv7odHn3gwN0+s5xtSNMdV3Sr0=
=iZ16
-----END PGP SIGNATURE-----

--=-yt427yNM8skr60d6Si3l--

