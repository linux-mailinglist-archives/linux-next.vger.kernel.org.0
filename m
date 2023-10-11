Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7B37C4884
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 05:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjJKDmm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 23:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjJKDmm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 23:42:42 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4006492
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1696995758;
        bh=TU6iVJIk78GaJd8B7uRHZ5SxiYKCEfH22tXJsuMM6fU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ksL+4pRSzgV+bAYqt6HQrgdh4r9IzZJ3ozTKEwbXzEvu2BaOY4G1fAPOqGSetDFqY
         RyTCS70kyUhxjWY9bZIhhdZTDCMEpCQ5Cfz0Zk5O64bFDhvPO2LRju6r2Gh104xwKY
         Higwwf6M2j4bx7BMtQu/mzUG+6Q5xXERiXj8SU6adpU6Rq2sYvT7kkr10WcqfshQm/
         x8ApAMV6Kf3CxP029eYjTJg/8PzgouMl+3pYX6sOwGRrvtoaBhuSLztsY5y5rQU3g8
         n/2a5ORDHUj3iQlsmXxrPzbESb2aWnTtTWdpYKtQGuqvvqHvqIWTzakN18Mbvd1E3c
         2rdEi7vhJOudw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4z9p6b7Tz4xWv;
        Wed, 11 Oct 2023 14:42:38 +1100 (AEDT)
Date:   Wed, 11 Oct 2023 14:42:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        linux-next@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Upcoming merge conflict docs/powerpc
Message-ID: <20231011144237.0224c928@canb.auug.org.au>
In-Reply-To: <20231011073907.7567ab89@canb.auug.org.au>
References: <87o7h65l13.fsf@meer.lwn.net>
        <20231011073907.7567ab89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E7BjyirszukVyKfJTsYOEtC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E7BjyirszukVyKfJTsYOEtC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Oct 2023 07:39:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 10 Oct 2023 13:34:32 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > Just a note to say that the move of the powerpc docs under
> > Documentation/arch showing up in in docs-next shortly adds a conflict
> > with the powerpc tree, which adds a new file (kvm-nested.rst) to the old
> > directory.  The fix is just to add it in the new location. =20
>=20
> Thanks, will do.

So git is quite clever.  It recognized a file created in a directory
that was moved and just moved it there.  All I had to do was "git add
-A ." and commit it.  (now to see if I can automate that :-))

--=20
Cheers,
Stephen Rothwell

--Sig_/E7BjyirszukVyKfJTsYOEtC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUmGa0ACgkQAVBC80lX
0GzwOgf7BYeQG73r76jPFUa9GtUtRAUnphp01+cXQAET9EtV/2q2C4NZAcw2XSv3
n/nUXlNJO+7YukiaduVkqzO6UqmqnYJfvvX+SnhCu4NERNcKWnzYBPD5IvUHJxAs
Q7IC2PLevJR9YWjmhddG4C0PTTM3P85KKvLGV8ibY2yAeh/RQRogpb14TWj9sRcI
OA1RgEsPv4tdiRNow6N52BvxiqQxQ5M6EMzL15bhi4rCIXFDdjaoRPPLlOgxR9WQ
xAI8le2ww5/fh7iUibIzgOsm/c34qGnkKWc1ogKtUg7+Gbv0GGPPfV4HQUHw1ay0
Zk7RseL/ELDesikn1tJcdgjT9RJPRQ==
=O9PN
-----END PGP SIGNATURE-----

--Sig_/E7BjyirszukVyKfJTsYOEtC--
