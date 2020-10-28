Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C41829D661
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgJ1WNy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731141AbgJ1WNu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 18:13:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC820C0613CF;
        Wed, 28 Oct 2020 15:13:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLYnk4qtVz9sVZ;
        Wed, 28 Oct 2020 14:23:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603855434;
        bh=oJhuytnB292Ilh+yRwjz/kSE+ZRELSDD89xS25RdtzA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bOsixbOWOpmsOMNQlUbHGNiQHW5lPRaOlrV0r2qtV37gmGgaz75R5PAnCc1Fkxn19
         OxgSO5PxsdOfghGNZE0hbBt58OzoTNAXTiqIq8NvDNACxxocM+6Ze66SadtYs1hvgM
         dOjTkdeXSMXQtzR8xFetCMXqpvPePr+gVtRNrMnyYKPjc6P8o6QPfCetjvVEFd3fLe
         Q3fhCRMsFMRbO50MxcNOYLsg69SqrxETBNja8fGj1nGHXYdy+qDV4n+ibfZ9IDWjyT
         mJVm9Ff/C8T/VCoSwL7JUclV8PcgC/PAdPntbV+gZkZqEBN+7F3FqX30vqMUHOm+Cx
         VNl5LIKmqDrng==
Date:   Wed, 28 Oct 2020 14:23:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the counters tree
Message-ID: <20201028142354.11d42e47@canb.auug.org.au>
In-Reply-To: <20201028142039.6c7eb38a@canb.auug.org.au>
References: <20201028142039.6c7eb38a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tR5wFMhIVnqkvtzkrEgxdnZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tR5wFMhIVnqkvtzkrEgxdnZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Oct 2020 14:20:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the counters tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
>=20
> Documentation/core-api/counters.rst:45: WARNING: undefined label: test co=
unters module (if the link has no caption the label must precede a section =
header)
> Documentation/core-api/counters.rst:48: WARNING: undefined label: selftes=
t for counters (if the link has no caption the label must precede a section=
 header)
> Documentation/core-api/counters.rst:61: WARNING: undefined label: atomic_=
ops (if the link has no caption the label must precede a section header)
>=20
> Introduced by commit
>=20
>   37a0dbf631f6 ("counters: Introduce counter_atomic* counters")

Also:

Documentation/core-api/counters.rst: WARNING: document isn't included in an=
y toctree

--=20
Cheers,
Stephen Rothwell

--Sig_/tR5wFMhIVnqkvtzkrEgxdnZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Y5EoACgkQAVBC80lX
0GzvAAgAoKmOxrb2OBqecpH5hSq6vGq+8aH2DYiEwNN3l8yMweHtPtZIy1KP8/fn
vD2otOhmai1EE017z4E/UW7MBc8FjLSJQx7EwwtBRdKLN99tSHPvsom7IHAatzxm
EKenwXEzBWfpBxPiIXlN9nuASKmvIvov9anNYnwJK0RECk8KpICBkVmy85RDfzaf
gl6xaaRKyaaEBQFPKwlLYhdId9iBe2ytHqqp//0wH4g1wEf6F0kTZZrTgBvs31ZQ
uUXdkxy812l1tbWzTrSywXuMi+CX6JQnqqSokjUnS6OoQQ0iFzsMSXZhheRVsf3C
bFrbV4ZWHSbTqhtKujOlXZrxrj7lkA==
=Sj3U
-----END PGP SIGNATURE-----

--Sig_/tR5wFMhIVnqkvtzkrEgxdnZ--
