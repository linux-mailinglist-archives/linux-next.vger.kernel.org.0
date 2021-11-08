Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55514476CA
	for <lists+linux-next@lfdr.de>; Mon,  8 Nov 2021 01:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236078AbhKHAIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Nov 2021 19:08:50 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56201 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236047AbhKHAIu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Nov 2021 19:08:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HnWbx2gy8z4xdP;
        Mon,  8 Nov 2021 11:06:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636329965;
        bh=gzKL0IDap1WfcoEjMIdQFcnSlnVBEtDzTqOFHm34hZg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RwLi3qi3IVU+YRGS+ysKQ0X28IYrrd4fWhiYMwnSP2mWrnPGTvT11oPDYpZNVSSnM
         x+SMTQZ8qRkC9ugm1ajb0bzriE+fwN8oMornE7yv2Qx8wjx5gLt5y2KHNJYUUDE/6u
         vT0JJSSvVjWT6BUz4cpkHFdv53twYlI7ioLkfQUBXhnh3HzN4gSt78MGwUbbEXV7NU
         KZMUAd/OMeL5BODmpdVDYYHSDu/0oiBxW5ge8PgbgSH+eyFKjap2bWSG0ZoEk6+xan
         uTmson883T45nMCUMBG6Wc72jZVockHHg2nOuf/G9PIJDb4XZpqGLTH3SGZ0md8uLC
         mfa2RHGfs/hGA==
Date:   Mon, 8 Nov 2021 11:06:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        James Bottomley <jejb@linux.ibm.com>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Message-ID: <20211108110333.79f735e0@canb.auug.org.au>
In-Reply-To: <20211019074119.6e180896@canb.auug.org.au>
References: <20211019074119.6e180896@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eX5mCS3g3+=w3Zm8FSH4BTC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eX5mCS3g3+=w3Zm8FSH4BTC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Oct 2021 07:41:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/scsi/scsi_scan.c:129: warning: Function parameter or member 'dev'=
 not described in 'scsi_enable_async_suspend'
>=20
> Introduced by commit
>=20
>   a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async=
 power management")

That commit is now in Linus' tree.

BTW, James, I tried to use your HansenPartnership.com email address, but
the DNS is giving SERVER FAIL errors for it ...

--=20
Cheers,
Stephen Rothwell

--Sig_/eX5mCS3g3+=w3Zm8FSH4BTC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGIaewACgkQAVBC80lX
0GzZkAf+Ir7HzDi5bmtO1gPd3qurMaNFPmzpyo99TauwDhFJa1a1gllYizbsJ/do
d9gq/yfEgAyy017dfwJsTW46wXy5I7kisMM2hkPfah2lfLCu1fBemChyInMfoOx7
lkhIsgDotDOJEWtKRIuwwJtO3FaF/1cwLHE3MJSOFctM6GW6diVln9FdtOz0U2mR
D59N+LHulyFu8PfY5DSLaWFLJ2XEFfYmsi9Si/Mke4rQPxea76MGy4Vono54oNs6
7NSuGx0UAFR5jI24QoaQSpOtbVQKDbMP/alyh88PHngSDWhGjUWzOHBHP5U+5JrZ
QACxVEEc82YWET0k73LXczKprW6/8w==
=oZ88
-----END PGP SIGNATURE-----

--Sig_/eX5mCS3g3+=w3Zm8FSH4BTC--
