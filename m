Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C185785872
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 05:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfHHDRN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 23:17:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49705 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbfHHDRN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 23:17:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463tpH13dNz9sDB;
        Thu,  8 Aug 2019 13:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565234231;
        bh=wQ8LUczx1bTmAeS71uIbSOraHlg7fDj+0KAn+7hZw24=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mboaUkYSXHvgShxY4XAlVUL0aG75IiWAT4Ac3lNxGM7O4Ej+BrVSzxTiXRLk0AEC4
         yKaDhS9Doy03q9fzGCQgkFxMVInzhjzWlh1WouGNmnLfB5LWPges/W9bSCpFJjyh8w
         X7GKokqvi80kndMDoB5fdk5ySxAXK+gKvdww85ck9gTixO75B4+fn/SwfdeuRCgPEi
         kM0oqWJ6y3HCh+ZoY4k41sTCyfsZ2hvJ4DTSz4MmPBlOp5hquNy07wTFlmmXygLgQM
         w+QFehs/vlTt1L2u38JOUvndvksP6lde33PbxUEBqcdHQWTBuJw5uOFInVjLmMkHvr
         ecmDsLvpTtsVA==
Date:   Thu, 8 Aug 2019 13:17:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20190808131710.7186de0c@canb.auug.org.au>
In-Reply-To: <20190808030156.GA15782@gondor.apana.org.au>
References: <20190805145736.2d39f95b@canb.auug.org.au>
        <20190808115245.0c88c300@canb.auug.org.au>
        <20190808030156.GA15782@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//gKyMvhNuKvScGnmk9J0sWf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//gKyMvhNuKvScGnmk9J0sWf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Thu, 8 Aug 2019 13:01:57 +1000 Herbert Xu <herbert@gondor.apana.org.au> =
wrote:
>
> Sorry, I forgot about your patch as it wasn't cced to the crypto
> mailing list.  It should be out there now.

Excellent, thanks.  Should I add the crypto mailing list as a contact
for problems?  Mostly the emails are just reporting conflicts and only
very occasionally do I actually send a useful patch.  If so, what is
its address?

> I've also added a compile test for this driver so at least it should
> fail for me on x86 too.

Even better! ;-)

--=20
Cheers,
Stephen Rothwell

--Sig_//gKyMvhNuKvScGnmk9J0sWf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LlDYACgkQAVBC80lX
0Gx27gf/VrQxJ4TRADi6SePgt4PtN5sAxgZUppgkQiuOhWIjaZT3aeJ82HwF/dD0
AXhRjwMDImJ+t2TsrKLs2f7lGkh8fP8mqckH71BcSjbveyDdEkqQW/aMJ2zyo0xG
t5+qxUtGhqqCaiWVI2rJuS9AnLs7EA8ML9i32Droq3GzVSAEK9bNr9q8cGmvMBeu
hF0/y06oSVCfSqVgPnS7lCtVCPmNbg8qYIAniTWO3xEYhjvPm6rHUJtf4Y593Zuu
5mq1pcSIQQ2DFclRbeRaQ8uc+54SiRkA+G2TifQjl3gL6vDgZrcwF5hU2b2A0DDy
xo0JuoKj6uJkYIX0dWCxoDMj9UzzYQ==
=/ZbL
-----END PGP SIGNATURE-----

--Sig_//gKyMvhNuKvScGnmk9J0sWf--
