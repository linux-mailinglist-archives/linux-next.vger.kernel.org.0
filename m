Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D2E189AEB
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 12:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCRLpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 07:45:03 -0400
Received: from ozlabs.org ([203.11.71.1]:47373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgCRLpD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 07:45:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48j7WH62dxz9sQt;
        Wed, 18 Mar 2020 22:44:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584531900;
        bh=+d5WntLb06jO+fuethwWV9R7UMuUlZCRg5zvOmlWkFM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eqUZo3Gkb6Jm8WXNDKzMLYXjznMEYpHcODe5m8HfxeRBCmQBHBPdIJVh8pepxxCuv
         a/W9oflOCOJ4BytpFCJZKH3PIoihO/UEwnoKxoYKDoMbMz6e6yRRYNlvHQLZzjrJPD
         ByLS+VuXtq7+2i3fQFwFBsAbIKo4ZMgFk5dPBk7uY7lmSFc7+aoA+R6AzG8DbS+2gL
         6OuMocK510K789foLBQ//3JxiPKfkPVjS4be8WT8RFhvOusz1+T+e+Oyyu1wWZcmXm
         fzcf3nJLztEYhcQ7n+60NvPfMJTV+kPT1ycef3wLZ76ceLSjT0J8lU6NzDlHS93j/d
         Km50XcIwU+vuQ==
Date:   Wed, 18 Mar 2020 22:44:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Colin Ian King <colin.king@canonical.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Message-ID: <20200318224458.1980e10c@canb.auug.org.au>
In-Reply-To: <20200317185252.3cfeecde@canb.auug.org.au>
References: <20200317185252.3cfeecde@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nHt+klkxhkS51CSBceHQS47";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nHt+klkxhkS51CSBceHQS47
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 17 Mar 2020 18:52:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the pm tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
>=20
> fs/libfs.c: In function 'memory_read_from_io_buffer':
> fs/libfs.c:829:2: error: implicit declaration of function 'memcpy_fromio'=
 [-Werror=3Dimplicit-function-declaration]
>   829 |  memcpy_fromio(to, from + pos, count);
>       |  ^~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   08c07cefb304 ("ACPI: sysfs: copy ACPI data using io memory copying")
>=20
> Missing include of linux/io.h?
>=20
> I have reverted that commit for today.

This was fixed today (by including linux/ioh), but the latest update to
the pm tree has removed that include again.

--=20
Cheers,
Stephen Rothwell

--Sig_/nHt+klkxhkS51CSBceHQS47
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5yCboACgkQAVBC80lX
0GzO3QgAgEKRv0NAr350JOxrYSRBEkrk3KaV8FGPhqjxmbkNBmYtrhLN/jaQnPt0
niXrleY2KvAHzSWe0TOgr6jfub8+9Cf7Us9z9vqxW+IADPQhXmiCcWzJrE2NNL+5
uJXahH77rUQ2elmH1czxCjF4ED2JGEI6J0uBBalf0WCvSwgAKOdtXwox+kla+f39
id9JlYdAAkQTVwvuGPb/+QYVBdUf3Uve8awJTroijx3JeqO58oM7pbRBrlIkoJBt
URBAVdim+CvTlYFiv8/2GH5BNtUTcdD1V2K0UVo9fErGVcdkmEZY6KYNYzOAgP1o
pOzNjapBZTMCdGZl7COcALmCSFGG5w==
=1IiR
-----END PGP SIGNATURE-----

--Sig_/nHt+klkxhkS51CSBceHQS47--
