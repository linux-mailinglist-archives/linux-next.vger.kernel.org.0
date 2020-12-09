Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BB92D4C51
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 21:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbgLIU5j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 15:57:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33181 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387759AbgLIU5a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 15:57:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crq9B6JRYz9sWC;
        Thu, 10 Dec 2020 07:56:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607547407;
        bh=9MIT3Mrz0MFy2FIDZIdXtlPxRD3KD5unqUU6/WfP09o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dBzV381r/+XcHlidcUI0Hr6Wh691MZQzSyzzU4Fx4K2J3Mva7QIbmghA6beXhm4XE
         XO81tdrOcTFgZpXTpkW7xuPmUggvyp8TmhkVeqmKZlk4WD1YdW24an+TeE2tV7ld1W
         HsK19uCHRb/Qhsumft9AKa4yW2mKm0nVOeQ3HwvwflKTRGYv0InIk6UkLE+F/e+dEB
         5PJfbFpfu5teLX4tZ177juLspNuftxLtcSgdK2UrBp7nWXQTLaUT+XPyQueqONJNvt
         oG9LOVBj3PCXiScP3bL4hduwt8KpOk+DaDxInFtRMwI38I5CHHL7TjqvY9UsZMZK8a
         5Vbl+d+/R8wBg==
Date:   Thu, 10 Dec 2020 07:56:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201210075645.234a735d@canb.auug.org.au>
In-Reply-To: <20201209130130.GA15469@nautica>
References: <20201209203029.7f2a8db2@canb.auug.org.au>
        <20201209130130.GA15469@nautica>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A2irkfzbcHRq4y/y=/zDUup";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A2irkfzbcHRq4y/y=/zDUup
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dominique,

On Wed, 9 Dec 2020 14:01:30 +0100 Dominique Martinet <asmadeus@codewreck.or=
g> wrote:
>
> I guess it's possible to make kbuild check both sbin and PATH, would
> that be acceptable?

I guess so.  But, have you actually found any setup where depmod is not
/sbin/depmod?  i.e. what problem are you trying to solve.  As far as I
can see all this change does is (ever so slightly) slow down the build
for no gain.

--=20
Cheers,
Stephen Rothwell

--Sig_/A2irkfzbcHRq4y/y=/zDUup
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ROg0ACgkQAVBC80lX
0GxExQf/YrVur6DxSRinoU8w7M5QTzXrQWZR1sIQ1SSD6Mf7UrRVqBDf/QSFDegS
eHr7vG6V48sRkXf9ZCHtG7lqAFMe2bQY6jNVzzJg2LwgkJ5RB3D/b/CA50PDLvQy
Iel7S8mB7tsbcztCwqr0SgY2Dtn33YucpCpieRf/sTrqMEPWT7s+v9GIVOTqJ12W
wjuGWcGY1FBTukpy6tDGplKaqXnJDcbgvwDpLfpIjX5PlyIdu6FCa4zWPXLuCuOp
Uy6lsPMagIGA2ifdm0vhdfY52D84/lK7XdasIEpCEWsqQmryN8JSYI1Z6UY7qyXr
LQJbn6xiuiuZdZ9n2rwKIg3egAe75Q==
=foDb
-----END PGP SIGNATURE-----

--Sig_/A2irkfzbcHRq4y/y=/zDUup--
