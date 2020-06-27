Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C7320BECE
	for <lists+linux-next@lfdr.de>; Sat, 27 Jun 2020 07:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgF0FMk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 27 Jun 2020 01:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgF0FMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 27 Jun 2020 01:12:40 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B9AC03E979;
        Fri, 26 Jun 2020 22:12:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49v21y2JxKz9sQt;
        Sat, 27 Jun 2020 15:12:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593234758;
        bh=hcSzOMIAPmFAWY+WVzxKymSCEik0c4vpPaJPDe1y4hM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TfSWUrRXkUznmwqJiiWC0J+1Mgfroe9ybvV49Io89jNp9Oj7j0MtoItoD8LSKXdoC
         x8G48WRAurT3x/MbjuncOJojiW9n0sDttYBiaEZxWYVXvvlEjjqa0JWTgghl7R7Fly
         fdVAyHRXlHRdnGjq0d1u21YF93uIwUDOg1kyCitbIHBcAm2sDq0KDerWdZLry+m1iA
         8CZig6UxI0PJgtF8eKXG6OvcPI8WarB5jfE/uY9D8NLfS6Wtr3mjj9RJKYc8H7ttpO
         46uaz+XVfJMhQhhZQstjrypsCkhxH53yOSKSXmP/esuSOLuuyg5bsbFW9ERWDShyKL
         pIvGpkTbNaMbQ==
Date:   Sat, 27 Jun 2020 15:12:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200627151237.72b68e8b@canb.auug.org.au>
In-Reply-To: <425cdd05-4123-c1ec-ad82-990eceae0b5a@kernel.dk>
References: <20200627090740.683308fd@canb.auug.org.au>
        <6920f023-5909-6ebf-606c-dbf467a31c7c@kernel.dk>
        <20200627015605.goc2btyq6z3wwb5z@chatter.i7.local>
        <425cdd05-4123-c1ec-ad82-990eceae0b5a@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dqhu0tSoUDHNttd/0/2C4=_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dqhu0tSoUDHNttd/0/2C4=_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 26 Jun 2020 20:25:31 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> Right, but that's what git format-patch does when the line is long.

I just tested, and "git format-patch" (for me) does *not* split those lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/dqhu0tSoUDHNttd/0/2C4=_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl721UUACgkQAVBC80lX
0GxI6wf9EazoolfjFxW11dNaNq6xTCKpRGxAaUf6B6tIDPWpPCxhT1dEVS0vAUYM
M0Z5yekWVdP6wlgE8vqruTIN8QCaOWK/K/NgGfBKdmRcFPLjOHeAOftnKo6pXs4P
WYakgeN2feDYCBm/G1XLiUMcVyZxWwrVhFULslkJr43V/lc6h/D/ZeGcZNEY8+Jf
YRrafjBjfwe0kG7//yeobWk+lUyEBDK1LjL6h/mJLNN6qZiX8FRK6kJK/gnd9AFV
BaSqbmMKBl0XIw8Tb5opXX2N8F2ERiTAPdRLTjr5lOUPMF5wkPaQv9JIvDYd728X
IgWLaplpQK0JGPrJ6LShz5yNMRnlOA==
=mGJ7
-----END PGP SIGNATURE-----

--Sig_/dqhu0tSoUDHNttd/0/2C4=_--
