Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C9D40A6A6
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 08:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbhINGXq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 02:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239908AbhINGXq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 02:23:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3991AC061762;
        Mon, 13 Sep 2021 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631600545;
        bh=HJQTu66x3zmVdC/LjA4YQ3aUCZkRIjGXh97d4BVWhVI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r6MOddvS19+midSVt9Oralw4oock8sHMxeJLeBlhhacxTrpSX5Exg/LP1+7+XLACx
         0B1ohfEd2jCa+s/KbfqHuRmA56BWOfyXSnBiY1hTK+Jyi2EnosanhrmkgRF3wgE4Ga
         yD/vq0CBbg7/8+9im5Tq6V4B2m+ezVb092GRQSj6X4FbIEuvL2TnPYBPGeEvKC2gkc
         SvxUa40kyTakmkb2+A18sO9pcuXWgc+Rfs2J/hM/XQ42baGXcXKpd9ad0N2kjEAWIN
         3snz/leYj1chwtkR3MHhZaLlug9ll0H9LVZ+2svj5s2ONt5og0pT/k/Fae2ssBwhEE
         IdcVye6cN9B/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7tYY2fprz9sW4;
        Tue, 14 Sep 2021 16:22:25 +1000 (AEST)
Date:   Tue, 14 Sep 2021 16:22:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        sachinp <sachinp@linux.vnet.ibm.com>, ndesaulniers@google.com,
        ojeda@kernel.org
Subject: Re: [5.15-rc1][PPC][bisected 6d2ef226] mainline build breaks at
 ./include/linux/compiler_attributes.h:62:5: warning: "__has_attribute"
Message-ID: <20210914162223.363dd7c2@canb.auug.org.au>
In-Reply-To: <50a91600-173f-ae8f-e194-4649a9f8176b@linux.vnet.ibm.com>
References: <50a91600-173f-ae8f-e194-4649a9f8176b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/njCH=GR_BjQ3APSXs8M14yw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/njCH=GR_BjQ3APSXs8M14yw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Abdul,

On Tue, 14 Sep 2021 11:39:44 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.co=
m> wrote:
>
> Today's mainline kernel fails to compile on my powerpc box with below err=
ors
>=20
> ././include/linux/compiler_attributes.h:62:5: warning: "__has_attribute" =
is not defined, evaluates to 0 [-Wundef]
>  =C2=A0#if __has_attribute(__assume_aligned__)
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> ././include/linux/compiler_attributes.h:62:20: error: missing binary oper=
ator before token "("
>  =C2=A0#if __has_attribute(__assume_aligned__)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> ././include/linux/compiler_attributes.h:88:5: warning: "__has_attribute" =
is not defined, evaluates to 0 [-Wundef]
>  =C2=A0#if __has_attribute(__copy__)
>  =C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> ././include/linux/compiler_attributes.h:88:20: error: missing binary oper=
ator before token "("
>  =C2=A0#if __has_attribute(__copy__)
>=20
> Kernel builds fine when below patch is reverted
>=20
> commit 6d2ef22 : compiler_attributes.h: drop __has_attribute() support fo=
r gcc4

Thanks for your report.

This is known and being addressed.

--=20
Cheers,
Stephen Rothwell

--Sig_/njCH=GR_BjQ3APSXs8M14yw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFAP58ACgkQAVBC80lX
0GyZ2wgAgkrc4BAXW9NL7ylTlrxNLIb6E4DF0hD9xQOuwWXfeIFQozZyrMtcDH/Z
ZZXuJbJ2omSOyzAiFoQuo1aHAlAvPtbvoQCx7uqCHJHpuUhOn8N09XV1/uvRDvgF
LAmdhMd7TUxIgRC8WBvKapmMGvLbtYRaqCnCrYb986V/nUcTEB3arai2fRPZF33h
nBNvXewGtj6BasWIEQ3QTpxKdB6VLnPsDxjjRMJDdiYdZw3lCwwYfCBNrD0C78t5
zOVIgGU7stX2NXWiptCsGs8TFeHoPanKlTbmWg8HNNB4JM2KfRa4Wf5XxQAxDIg5
TwhN94ul8Q2jpPsfhK9sdcbSE+XZsA==
=4u4P
-----END PGP SIGNATURE-----

--Sig_/njCH=GR_BjQ3APSXs8M14yw--
