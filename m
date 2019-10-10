Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1DED32C0
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 22:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfJJUrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 16:47:06 -0400
Received: from ozlabs.org ([203.11.71.1]:53717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbfJJUrG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 16:47:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q36b2fDPz9s7T;
        Fri, 11 Oct 2019 07:47:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570740424;
        bh=Q8wZCsEowLDXToR/8OyHPafnAgqCXjOxH+ya9gSX498=;
        h=Date:From:To:Cc:Subject:From;
        b=aC6iapOVaCoEHfFDcOoZRP03VRIcH3qQPc/MrjVTsa6eRz1VxHJrV0bOhYhNIWbcv
         jyhrnwnO1PoYweIDg2o/MWvAYgVP6bejs4jMvkfGYFwNlzJV4inhVHQvCdcadgslNX
         dtsM0ZZeYqoh9XqWXOzW/lP5wT3XTUaif8N3jy9qHMYGNrzDLbcmq+RTCl7BcjrDtu
         F9IgMy1DZy5DDMxe4Vk1Wdnee71ypMsI9EKxkua3JfTIJW04BBJnnvy38P01SoqCK9
         l2EmlN7d9rthEx2CPiOszeaRN4SvE8W4Kj7XQtrFqtRxyJX9iSkiq/O16NCGPG8bRm
         y/DsAFzsZVqVQ==
Date:   Fri, 11 Oct 2019 07:47:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20191011074702.1ebb98a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3va/phKy7R2mcEmzu9Ea1pT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3va/phKy7R2mcEmzu9Ea1pT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e20b248051ca ("media: ti-vpe: vpe: Make sure YUYV is set as default forma=
t")

Fixes tag

  Fixes: 40cc823f7005 ("media: ti-vpe: Add support for NV21 format")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: b2bb3d822f2c ("media: ti-vpe: Add support for NV21 format")

--=20
Cheers,
Stephen Rothwell

--Sig_/3va/phKy7R2mcEmzu9Ea1pT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fmMYACgkQAVBC80lX
0GzUgAgAh+d2+kD/LY2JUxWc5mPeo6eMjxUxdAXD//GeF9+q2+IQqbTFEMJs/zKD
ymZ1MPiGflAXRTpj3KpEZ9b5gqSoFwJIvCx6AUrlMxcVkEy/Qcc2sMjR4Fjtq3eB
EFHSv/aDJT3JgpGrI+2STdfAEPDPMGOCez5bGs8J8g7ZnWpTot4tmZsca/5oMVAX
z02C3gonu/qnEMUTDWQ5U0HYe8d2aHwnr5RrQ8TU3SZIyfT9tVE2wJhywwe9bnmG
j5m2jBhqAkIqaWo6f7KZiFzZmKZmWCC29HwkYu9rmYTF671ajyXKsM34BNRAzwEY
MGREfjjmKkF63m55yDA1OKkuPZNu2A==
=23iX
-----END PGP SIGNATURE-----

--Sig_/3va/phKy7R2mcEmzu9Ea1pT--
