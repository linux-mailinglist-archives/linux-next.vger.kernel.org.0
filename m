Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4E129D5EC
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgJ1WJv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:09:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33425 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729546AbgJ1WIu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:08:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLYk16RCKz9sV1;
        Wed, 28 Oct 2020 14:20:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603855242;
        bh=CRfZH8sS4m3q576hoo52jubFUX5+xu6CWRWXT6PSSVw=;
        h=Date:From:To:Cc:Subject:From;
        b=dGZQankLeXTTTsZ46S91gmCcLk/8u/zRgH8k5/iu2oby4cteirC2Q5sPtIVtCXhv4
         SeOnR7rZMfQVjOmPGVc3tCT7Fxb24o7l7Cu1c8MXfLQoQL1KEqUGsN3YNDd5+xBQZZ
         D5fSSE6HscaMDu/QSzhH0ljCa+JtjJ8SdNTNHxlDKTXL1/gPns34YNyALdenuWUCS5
         GUA8OtmuubB8qyBPbOHulqTRlS+ABaPbhxv6TX88Udpkuw/Pwucy0raEjrfdk5AmR6
         DsF4ZYx5pCNljPC0W/O12G0leKa3bvt08A86vMevBqvUMnByBA0AhKlcyeTVvdAQ4+
         NHXOgRtglR+7Q==
Date:   Wed, 28 Oct 2020 14:20:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the counters tree
Message-ID: <20201028142039.6c7eb38a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jsRZyDiU4L6e+kJ8x299/dG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jsRZyDiU4L6e+kJ8x299/dG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the counters tree, today's linux-next build (htmldocs)
produced these warnings:


Documentation/core-api/counters.rst:45: WARNING: undefined label: test coun=
ters module (if the link has no caption the label must precede a section he=
ader)
Documentation/core-api/counters.rst:48: WARNING: undefined label: selftest =
for counters (if the link has no caption the label must precede a section h=
eader)
Documentation/core-api/counters.rst:61: WARNING: undefined label: atomic_op=
s (if the link has no caption the label must precede a section header)

Introduced by commit

  37a0dbf631f6 ("counters: Introduce counter_atomic* counters")

--=20
Cheers,
Stephen Rothwell

--Sig_/jsRZyDiU4L6e+kJ8x299/dG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Y44cACgkQAVBC80lX
0GwnGwf+IzF0UHULm0hUAWeaZaoB1Lo/nfQtKyBYzHvqH2R2KZf/SXNAURc5+CFJ
e3V47DznraFmxeODoNIeiih26tnfWSPz5T83bv4iXPqsJD8znOsvl30AK6tK7ZqN
gAOImK+J4RQMOz7mh8UVEXKyXK5VKdwEECOhd8w046fq/iBGSBnSq8M6rSjBDKou
1VWlvH64ahDANtSJtzUDEQHPMLZssyU9Mtc+8PQOLOaBxGGkt1FBuDc9L8jc9K1e
uT5seh8xXSH7LjVTcQCAz6v82V5PsWTD7adHnyGbM1Na72abUyUfpRhP1rQ9ZfzZ
G8paVDN3le55uhGd/APEKltFWzFA4g==
=ksOc
-----END PGP SIGNATURE-----

--Sig_/jsRZyDiU4L6e+kJ8x299/dG--
