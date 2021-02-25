Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06B6325932
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 23:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhBYWC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 17:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbhBYWBy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 17:01:54 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928E9C061574;
        Thu, 25 Feb 2021 14:01:13 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmmvW2PJQz9s1l;
        Fri, 26 Feb 2021 09:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614290471;
        bh=SC60X5dVB4OyDxry5X6pUUyiZ6Pdwzqhi/mulXo8zcE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nG11K0fzxVX51o37RpGtTuwydPP8GG42x2lCJUYvl+9dDJeppZ8vi0j6n2qe3isSV
         0xqn8J4H+KxTXcTRF7ArKtDefQluwMYViuWNXnLZuxk/bEqulLsCfIXIQswycgIvYx
         eO35+/IwvxMykQxdSxKmDXsETp2ckeqjZbYSnH2ai6Pe8ZYVuOMwE/eMvhjxeF1nka
         VWHD+CO48N970Mj9UBk0fGBRh6NtmdQKg640C4z16SqVw0Ls4Fib9VG3vbtuJfP/Ch
         E3X1HRDseALac/p6flkfwpb4Z4UQxa3Bk7iHoKD1Kp8C1Uk/X40HX4MOzHfeJ45LKU
         xaCmrOxANQUhQ==
Date:   Fri, 26 Feb 2021 09:01:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Donnellan <ajd@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
Message-ID: <20210226090109.1c4b645f@canb.auug.org.au>
In-Reply-To: <87a6rrbze2.fsf@meer.lwn.net>
References: <20210226083433.1419e9c9@canb.auug.org.au>
        <87a6rrbze2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/flJeXf+cw8FsuSU=S1ZkqZg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/flJeXf+cw8FsuSU=S1ZkqZg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, 25 Feb 2021 14:39:33 -0700 Jonathan Corbet <corbet@lwn.net> wrote:
>
> I made that tag by hand while "fixing" the changlog on that commit,
> which included the full ID.  Obviously, counting to 12 is a challenging
> task for a slow guy like me...:)

Which is why I have a script called clog:

!/bin/bash

git log -1 --format=3D'  %h ("%s")' "$@"

:-)

--=20
Cheers,
Stephen Rothwell

--Sig_/flJeXf+cw8FsuSU=S1ZkqZg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA4HiUACgkQAVBC80lX
0GwGJQf9HzIFLXL5ydNN763ic+FaA6LIBKoHHgC4E9HM90jUIuBs+Q4QVnbbAAPP
J9si1O9fw7T7RJQLGLG2Lxde08Q6fQuXopSTKDWU6knlpg5wqMD5szMmnQjdwbV+
en7gCzIAGPigI5G7Xak4OVaxp9hzHwUB4SkYYd9gdoeBJqjCtzGxZNPcYKty8dW+
vFGxinjarjdqPHqb46vKNQMIaF6QH0gXefr/0MhiT9GHWGJ7hb0R3qGW2+x8GYnC
1vOwpc8KoQhjqFg02DEeub8IqCE2iODINGtoYENleIyheDYny/Vv1qo9f8G27xZ3
DDbarbtRDumPfZDCGxg5uIYB57XSxA==
=dmep
-----END PGP SIGNATURE-----

--Sig_/flJeXf+cw8FsuSU=S1ZkqZg--
