Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D8321CBB0
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 00:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgGLWB5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 18:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgGLWB5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 18:01:57 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B52C061794;
        Sun, 12 Jul 2020 15:01:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4gjY5QMlz9sDX;
        Mon, 13 Jul 2020 08:01:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594591313;
        bh=hWzJY9Z7pHhzJ8z+4JIz0PjMezlfGeFl8ad/UovVEs8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cDB0lnX+loDOQ8ZKVtcHWac9XZ6akd2+KpuaE/N6EHj4NfIQaBnuw+WxthYHWyEz5
         O6Zwb4RIV239+YC5mjoQSiEuyj9P2j2q1ndq8Be3YV8DQs02449OiJ1UADhbMcYSre
         NpLO655ce2SqosKNj48tm5I2bjcn0BuMsSpMfJtDGOhMQd0+YaQ2gYFXxu9QVJZChN
         7w8yCDemvzuv7ifI/JbDoKYOcK/6QitmknpyH43b+bFrod8FFX0kk7jziz6DBEjRd5
         SIT7WARp9uHruBHfmgGBhLAu0ISMsreg3VCjX++ynrSt/G3pQl4vW43b2knWnDc0Zn
         +9Dnj3tI4mAJg==
Date:   Mon, 13 Jul 2020 08:01:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 10
Message-ID: <20200713080152.63ee1246@canb.auug.org.au>
In-Reply-To: <20200712155604.GA342822@smile.fi.intel.com>
References: <20200710183318.7b808092@canb.auug.org.au>
        <20200712155604.GA342822@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g_dV26oZeeRt0Ln2iidSIx0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g_dV26oZeeRt0Ln2iidSIx0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sun, 12 Jul 2020 18:56:04 +0300 Andy Shevchenko <andriy.shevchenko@intel=
.com> wrote:
>
> On Fri, Jul 10, 2020 at 06:33:18PM +1000, Stephen Rothwell wrote:
> >=20
> > Changes since 20200709:
>=20
> I can't build it on Debian with Sparse enabled
>=20
> CC      init/main.o
> init/main.c:760:20: warning: no previous prototype for =E2=80=98mem_encry=
pt_init=E2=80=99 [-Wmissing-prototypes]
> 760 | void __init __weak mem_encrypt_init(void) { }
> |                    ^~~~~~~~~~~~~~~~
> CHECK   /home/andy/prj/linux-topic-uart/init/main.c
> include/linux/compiler.h:309:16: error: typename in expression
> include/linux/compiler.h:309:16: error: Expected ) in function call
> include/linux/compiler.h:309:16: error: got :
> ...
> (All READ_ONCE() entries fail)
>=20
> Is it known issue?

Not that I am aware of at the moment.  Does next-20200709 work?  Does
Linus' tree work?  The only obvious thing I can think of is commit

6ec4476ac825 ("Raise gcc version requirement to 4.9")

The commmit message says:

    Using _Generic also means that you will need to have a very recent
    version of 'sparse', but thats easy to build yourself, and much less of
    a hassle than some old gcc version can be.

--=20
Cheers,
Stephen Rothwell

--Sig_/g_dV26oZeeRt0Ln2iidSIx0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8LiFAACgkQAVBC80lX
0GwJaQgAmHIf2+jv83DDkD5ZPu75DUUZ4qK5ttk4ukW8QOTdovMeGl3mUHaPtj6C
Bz7Wmw4mLJ+R7EGY5M3y3XHu2CZ9dY4w771F/WO/tnKHWbSKBLiWGpYmM8D0VuZx
RxS12olMkzjvk5spy1TOjw/2/Wi2FLkuikowaOOABWZTTEkCVfJSKCP3yK/91Hey
Wslm1vD0Ka+dw4AjbKebMylHyG8E7DCwrPh6jxnckQo36MYZ31wH6LZUjIujX0pb
HFeFfMvRAL3ZH0AWgKtQx1I5mpTIG+4wge+KBUNMXTDs1xES94vgrqxAn+A1sVmT
YC2inoCwD4eFflZMjjW1fPvr0y07aQ==
=gr4N
-----END PGP SIGNATURE-----

--Sig_/g_dV26oZeeRt0Ln2iidSIx0--
