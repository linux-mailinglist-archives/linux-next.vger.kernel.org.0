Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A709BCF0FE
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 05:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbfJHDCr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 23:02:47 -0400
Received: from ozlabs.org ([203.11.71.1]:45321 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbfJHDCr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 23:02:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nMbR51x7z9sN1;
        Tue,  8 Oct 2019 14:02:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570503764;
        bh=TA89V1ZUcbGvVPM1w5JTpCCSu8Dptq+X5tkuTji7MAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M3OfKuqP+/nzk0/gdXCeKTVGEWZoAr07dNOZuOMoF0hO9DW2xbQ3lmMS2kdwy5N0Y
         v+7PzKUJhcq9JhLgFQ5ench+8A4rAID4FSsQW4hooREa3/rQuLPQ9XmJb2VTnWbOAp
         HJfCA4n+dPjXsoUsJNqFVU5ElZml1p8m1i5SHn8T8l4f5lbgF6jfto/9erL4IuG1pN
         HI//0E4YMym8KuaDwnpajcC5FVKxxRq2CbPuXb0bu8fcSV/ankDQalP+sFf+06Mj1w
         KO5yWQzX8z+BP4EzGUeYB0WLdd5s+H/trBl4evu9Dw+ylHMOlhl4JaBj2lYzkx6khq
         m3slzklUMFAbA==
Date:   Tue, 8 Oct 2019 14:02:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191008140241.312425ad@canb.auug.org.au>
In-Reply-To: <20191008103045.2d4711e2@canb.auug.org.au>
References: <20191008103045.2d4711e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E2upIq_7of1YSLf/gTkj6Q0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E2upIq_7of1YSLf/gTkj6Q0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Oct 2019 10:30:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20

Sorry, forgot to include the error messages. But they shuld be clear
from the fix ...

--=20
Cheers,
Stephen Rothwell

--Sig_/E2upIq_7of1YSLf/gTkj6Q0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2b/FEACgkQAVBC80lX
0Gw8qAf/ar15ubl55UdoUlIsjZG5t7s3FDqAmbxo9Ii+KKMLdUgotqeUQWCFJpVU
kB0o2+foGRYWSa+sMlrcPhEkGNzfQLnPUkSqDASU4tsW8hmLtfs6YKJWFDUQ6ra3
X9NHPT6c57vge7PuXzFsC7TyL2Dtd6bDtO/S3LKzK0wZ1SrfZpMddS9dSzda3Tl1
PNUiY7S6BEJY7pMt7rz2/vi8b/0DS1RrekOCY+6wvmltZnqLFs/sLFdV6MZMkBYu
WD0J1rvXd3NDC3OsEYO7k0HY7puueYK4u9n7KD88DcMQ2VOPsnM5bep2cEm6vadf
ck1R/EKHyOvaYQOijS4b+A0g3x2YgA==
=NlHb
-----END PGP SIGNATURE-----

--Sig_/E2upIq_7of1YSLf/gTkj6Q0--
