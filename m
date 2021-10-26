Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473FA43BCD9
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 00:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbhJZWHM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 18:07:12 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60077 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239740AbhJZWFu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 18:05:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf5Rx4g7sz4xbP;
        Wed, 27 Oct 2021 09:03:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635285805;
        bh=2yKEt2bc6U3UyqI9j7lbu4DXc9hA6a3sqCn3+MN1STk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZUUqRhSFJQMSLV/wqR70hZMfLf8bPnSOlLOOzTMasFkJqsN7JKclJwTCvaFxUIcvX
         PpkonYLKqXxYeef8UwDF+9QdWDDxEGgnXYUr5JfyxyT//gVCBmiMSZMgLM9Tczx9EQ
         x1g1cfdpZumdS7mbdVBWcCZfqTDEkCYrAV+rCAb+niYErI9GXvdCH0gexkscPkdfDU
         PJ3RcFopnC7+YhcNmU9vEiMKn7fNhsfbcvr+OY+SO5dYkXrUukPf6mtXDluYYwDzpO
         bVQEn5uGR6lsFYiA4T+DRoPKTLmmCYfqiYUlHlKuL0xIQYsJsGRea1x51vlTjK9+ny
         GsTPD3/CaRl4Q==
Date:   Wed, 27 Oct 2021 09:03:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Alexander Gordeev <agordeev@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between akpm-current/current and s390
 trees
Message-ID: <20211027090324.5391ab99@canb.auug.org.au>
In-Reply-To: <your-ad-here.call-01635257155-ext-6484@work.hours>
References: <your-ad-here.call-01635257155-ext-6484@work.hours>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oz/LMd9lJ1qjdsGR4y7GOL=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Oz/LMd9lJ1qjdsGR4y7GOL=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vasily,

On Tue, 26 Oct 2021 16:05:55 +0200 Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> updating s390 tree for linux-next today I hit a merge conflict with
> akpm-current/current. Please find conflict resolution below.

Thanks for the heads up and merge resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/Oz/LMd9lJ1qjdsGR4y7GOL=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4eywACgkQAVBC80lX
0GyjfAf/VuXVNYJXg6w2Xp+Rac/Hw0n8lK2l7W10tAbSzExDbjt872Ae8LYr5EsQ
cuR+EEjjXIMvNk3uih6M/fVpQdvguD185Ntk06ksW49pZYxVkhJGlN4dFAMVzxX0
wNXSb46ySD28hga58P3CUfN4kKLvo84Fq3c11wcnoH7OmWxDv8sT00mxxVFamARa
PkfGp2aHG0jdD3wfvQ83rqTcDVNSEVTqJTdJWk3OvBPC/AVhAWTazfM9YCom3f7K
VsBUxT/Lvlws8I/Kf7PERn7/jH+7d5EFCnlEX6e+3Ql1dalbV9VZSBl2ZwzSZjY9
VN77ALmU0ToH3OZKrnvDMoUlTPKHTA==
=3O+g
-----END PGP SIGNATURE-----

--Sig_/Oz/LMd9lJ1qjdsGR4y7GOL=--
