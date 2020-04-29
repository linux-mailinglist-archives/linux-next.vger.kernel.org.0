Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F171BEC0F
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 00:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgD2W1T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 18:27:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52591 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2W1T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 18:27:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CCn157Kcz9sSK;
        Thu, 30 Apr 2020 08:27:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588199237;
        bh=c+BZmlJsN5z0f9H0qEiDkkDZINCQuyy7n3K5ygicWtQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QD6lPaDGm3IxW/m8zCGXnesrjdEWKJEY7qfNMFjdzIQ8h1di5uxldH/wHXYVNOq+n
         vH7vZvU1ZteIaVZHlY1whHIo6VacGuv5Z66/NAgTC69jZ4gHtnMMWcAmHUPf2adrp1
         rg65cx4K3NuldPZyT3Up3bJJOH4d79aSpLuLfBFVTPAbDZoRqYECeoiAwX7VOIBX9V
         CbwLZXnzp36z0sCg9RZZHyPG3CcAyfIZY+3TVSeUlq5+iuYdGvVYZYbJRs7u71xST1
         M6oRxZZT0nFmXCOhskN6DEYj6BzCmKeXGk5JHyKSx8p03feWyCR8iaMyAa/tM9hB6e
         JJWZ+XVxxL4Fg==
Date:   Thu, 30 Apr 2020 08:27:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Please remove Smack tree from linux-next
Message-ID: <20200430082715.11751b13@canb.auug.org.au>
In-Reply-To: <68401d6d-190c-75ec-b311-b47b0b8a57a5@schaufler-ca.com>
References: <68401d6d-190c-75ec-b311-b47b0b8a57a5.ref@schaufler-ca.com>
        <68401d6d-190c-75ec-b311-b47b0b8a57a5@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ceC/ZX8/mBz4V1A+8HIo1jt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ceC/ZX8/mBz4V1A+8HIo1jt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Casey,

On Wed, 29 Apr 2020 10:23:10 -0700 Casey Schaufler <casey@schaufler-ca.com>=
 wrote:
>
> I need to replace the Smack branch used for linux-next due to maintainer =
error.
> Could you remove https://github.com/cschaufler/smack-next#for-next from t=
he
> net tree? I should have a better maintained and behaved next branch for S=
mack
> shortly.

Done.
--=20
Cheers,
Stephen Rothwell

--Sig_/ceC/ZX8/mBz4V1A+8HIo1jt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6p/0QACgkQAVBC80lX
0GxrWgf/ZEg1NMkmgTsZUE4cXjac+OmjsJ3bVPMuGj/+io+yzRZc1Edn3043qVhq
xrc75gMNt3cqp5aCQkE/4LdzAzdLwCd8VxliY1xM4WuuuemqN0PUw25cGLJCkwmK
pVnWOBkFFNVWQ19tYaXQAZKSinmmF5xuXhVO1qqUkljTulwgLGMo78aaFizUmdSP
N71boDvEAC2BzHTJzxBzl/L1Ovp8jdUdtexnS17KHrVe+YDWFiRTH78ISHZfH2q3
x21YRAI0aMAieMPxs0kqKVbrlzwmPBd938CQkGVBN3DL53822Ps1MvnNTH3Llb62
tJ6xnkLgTgS8kwDb42MDfB8eTHk6qg==
=uplI
-----END PGP SIGNATURE-----

--Sig_/ceC/ZX8/mBz4V1A+8HIo1jt--
