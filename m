Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCDE223510
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 09:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgGQHAH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 03:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgGQHAE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 03:00:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0266BC061755;
        Fri, 17 Jul 2020 00:00:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7MSc5mVgz9sRk;
        Fri, 17 Jul 2020 17:00:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594969200;
        bh=aa+7q6fFRnJhLdYsM+jGqW7dRIQh8zqVIDZr9L6PsGk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zwx7x4pTNuTdi896VfJHICJk2kU51+O1Ez00i5jW0SBMMEOQKCUCTYz11tfRfDYIP
         YxeCwaxs0xzWZAdn9Hx6SXj08ukyKgGLh6YRSO1UnaCQw660ewiV24JtKPjRFtTXnG
         XAuINMfowQOEiSfNDRtK72Qi3EZIOGI/fiCcbYGsYqIKdY30cVgLGkxCkjReIz746Q
         52PwsYGDbM8WZ9jPjhhK0NS+kwqAcUXBpeonAc+6QCE79HujX+gAgQIavDpgmy9QVk
         vajoWoUNdFTa1Ku/3n+yVn16NzVxXwRGUC0S33ZnA72CUQMXdGqAUpiRHgmCcqPat1
         uQbb33QZ2MBMA==
Date:   Fri, 17 Jul 2020 16:59:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20200717165958.41db203d@canb.auug.org.au>
In-Reply-To: <20200717065636.GB3165313@dell>
References: <20200717134154.50326d78@canb.auug.org.au>
        <20200717065636.GB3165313@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pe9qZiNKL0DTedBscdEtsaf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pe9qZiNKL0DTedBscdEtsaf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Fri, 17 Jul 2020 07:56:36 +0100 Lee Jones <lee.jones@linaro.org> wrote:
>
> > +static const char *kempld_devs[] =3D { =20
>=20
> Do you mind if I change this to 'kempld_dev_names' and still keep your
> SoB?

No worries, I just did a quick hack, so if you neaten it up that would
be good.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pe9qZiNKL0DTedBscdEtsaf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RTG4ACgkQAVBC80lX
0GyjeQf8DXznMtSokqP25/rquQh/ZP2J82nLQHSDoXVYqaQqFyKeTFYSX+28Fa7m
Jvtds+P82ZmeU7E1BbyFG3gm5rI9PDHTIW4GcjW81+MQ0pXj8Sq2M+NesMG31LHr
gPwxjPbE8ABvBZM7eE3t2QEUplGQrMnrt4EXbe2Xpz66gGHCLLomxiA94FbUagFh
+iuj0s9zFXKyfp4NcvG9SpIYO+ROw9lNr+/aP7Lo2KEZGiGYNHr6Hox4UFIzNj5V
vokSywAd5bJfDhtQhpaopHWpJ1BvoAYutVc9e1UV/iZWq+EHbee3pBa6Jw+dHj4q
y3g/e2K6dcyn3BPU7Yj6uuSGkLiJTg==
=oFOm
-----END PGP SIGNATURE-----

--Sig_/Pe9qZiNKL0DTedBscdEtsaf--
