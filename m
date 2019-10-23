Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B25E24BA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 22:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732293AbfJWUqM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 16:46:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390945AbfJWUqM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 16:46:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46z2TW4pn4z9sP6;
        Thu, 24 Oct 2019 07:46:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571863569;
        bh=ppsLniUqH5aJsdsTuJibPH+kPJJCDx9EYdMTViDGMEo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KmiZGekw1lboFOeRSaqj7bV74a+qEi74RemN7YNccBgvRYhG0AEl0weHsy+cWCtXh
         BSipDvoJgZIK6MAEAJNoRiEOek1mgEeRgTjYsD8rlPI3+mdZVhGTw3kW9Y3LCKJrW1
         nbAjLxtF4sGQwhPPO4t9xzrIc6t+Iw91Bd/wlYuFDR5jBp+lIG/ZtGF9GGt4Z9sOdK
         R7twUEZ7JzYDZJ2N13jsYe/N/DZbnMeiYXXlLHM5FE38V9rQWszkeEii1TFRwzUYy6
         IxnjbWkiXa+DzjlYLhgDYcbpQhLA3PmjmUo5nbNJ5hNl8UQmrDvlUwzxPICpsZLy8+
         5Ke2Aydz1NV9g==
Date:   Thu, 24 Oct 2019 07:45:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Salyzyn <salyzyn@android.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Oct 23
Message-ID: <20191024074559.4d815e3a@canb.auug.org.au>
In-Reply-To: <d1a0c336-1973-5c6d-90c0-9bb64e5a922c@android.com>
References: <20191023155519.2d6765d4@canb.auug.org.au>
        <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
        <d1a0c336-1973-5c6d-90c0-9bb64e5a922c@android.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I1W4uTIr2kKW6K7lLI0Rd.e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I1W4uTIr2kKW6K7lLI0Rd.e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Oct 2019 08:46:09 -0700 Mark Salyzyn <salyzyn@android.com> wrote:
>
> On 10/22/19 11:05 PM, Shaokun Zhang wrote:
> >
> > It's the commit <79f0cf35dccb> ("treewide: cleanup: replace prefered wi=
th preferred"). =20
> Ack, will split up patch and resubmit, compiler differences make that=20
> part of the cleanup unworkable.

I have removed that patch from the akpm tree for now.
--=20
Cheers,
Stephen Rothwell

--Sig_/I1W4uTIr2kKW6K7lLI0Rd.e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2wvAcACgkQAVBC80lX
0GyUfQgAioCFA9yubb6BF+rp3HPS6RP1EnRNlPhyUrjFRB6v/NHwpxGuIoCPgPPl
jmfjAEF4dx167CgjC1crGiRd2vNKfisaLK6htQckvflLhyYcA+WAac+mpNdkhJxz
ioAuBVI22aAaE2WwM+bdkKBhYrQOUOIkRNkrmxqVSLfJ9+BDt3zlt9ATiwVJI+3j
Eea9mi6kxQS/QpAPOmmi7IE33x7T7gj+SgPVhnf38siIkIAudCH1KoJSAgy2nUpZ
Gqr+2EHaqK4aLKrwfkSie3pR7CMZSPOqTdLn6eqU8HprjHAGRZgO4TK9dCU7V7WH
GBJVwV65nt7VlK6Z+6a/w+kirAVgiQ==
=1rH6
-----END PGP SIGNATURE-----

--Sig_/I1W4uTIr2kKW6K7lLI0Rd.e--
