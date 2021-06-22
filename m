Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5BC3B0FA9
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 23:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFVV66 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 17:58:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46549 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhFVV65 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 17:58:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8gGG5gZ4z9sTD;
        Wed, 23 Jun 2021 07:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624399000;
        bh=sdelsaa0Tm9RJuY2VzVpRHVJ8f04e4vJx4mec+AZ8UY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JffhasMKw9JJ1Q7sd+V0e5YYPcnvB2tozLImegYRDBglkQ44tEhw6HPgFM5WLwO8s
         Iyp1C1eWy+mawuZ2vno30HXizrVOj1LaOKClPyUZq0eArVBfNkw/2JVMeAgX9+G4xW
         NZP4w8c2BDZRD3basvxyegPIP3IQyTbZoEGV0obVoVJ6HjSf25hpPErn5/yILKrvTS
         w0AfoXjLR0FInxAAIcZFRQS7fmwRmEn61ALjv8/2LI+pjeeKQZ1J2A6Vq2CsCROwjf
         AFlwkaNr/jbVOnMeGRWaKHF1xkk8fYcGdQYds9uMtg1PIHOPqxJnlb6vMr8IxYRnje
         CGhMPn5JGxMZA==
Date:   Wed, 23 Jun 2021 07:56:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andreas Gruenbacher <agruenba@redhat.com>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gfs2 tree with the vfs tree
Message-ID: <20210623075638.0b491899@canb.auug.org.au>
In-Reply-To: <CAHc6FU5QKTVNos5x2uWZ8oCaMu6CEkqpan_zS6i1U2XqRpWyKQ@mail.gmail.com>
References: <20210611111231.7750bb60@canb.auug.org.au>
        <20210622113835.58589c3d@canb.auug.org.au>
        <CAHc6FU5QKTVNos5x2uWZ8oCaMu6CEkqpan_zS6i1U2XqRpWyKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X0WNVuJSL1Qya7vi/focG=G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X0WNVuJSL1Qya7vi/focG=G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, 22 Jun 2021 08:48:32 +0200 Andreas Gruenbacher <agruenba@redhat.com=
> wrote:
>
> Done.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/X0WNVuJSL1Qya7vi/focG=G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSXJYACgkQAVBC80lX
0GylhAgAjn2jrq3USbckjDfi8k4i2ImLdNlVElIiVWUW20KxrJrlf3USsvgnNPo7
phEhsUFTG4Pfoy+jIsMfHEfSs6j8aNXnluiwp6MYyb9w5g1w7zPBYiXgkAy9C6Z7
HayrOdb5LwpAB5eE6MEYM+BcBZ2PU39loBrP5+a+xwK0TF9XxJq56n9VDT43A51Z
F8r4D8UhdBg+LCLsSSCIEAUrtgCjOMScxPIwnmtq+s1oP6moRmbKlnrdtO7kagHg
XmXy/cnIErCktVNIzjtI2FC8iuv11luJJL4L4aQYbaqhJBzgmObXSZbKRAKKv9k+
BkT9Nk9hs4PBhxeNdi+uObG9KbeDcQ==
=P4dP
-----END PGP SIGNATURE-----

--Sig_/X0WNVuJSL1Qya7vi/focG=G--
