Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5470333B4E
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 12:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhCJL0E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 06:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhCJLZ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 06:25:59 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA621C06174A;
        Wed, 10 Mar 2021 03:24:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwV961y7dz9sRf;
        Wed, 10 Mar 2021 22:24:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615375482;
        bh=V+V8sLOoFHc4RKm9lLu93GG2y5UNHz1wUBDpBk2W6C4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jiZOpEju8c4EAgfnR2Q83/iE3qMGwG2wC/ZJ4Knvn2r2Cn30G4fO1KftywaYLCjzR
         sc3U99aqVyYaKNscOylAMvXoO3ltC6cmBqeOiYESM95PCWWpasuCX4h55HcKzahf15
         S3wFlpAIM2ceo0WhL8c/I60yYPbHWjEAMvjTmNiS+C90t+YedcOQ+RO7AmyQh2zoWt
         dhbaZvos8elsZAr3PFz64TtuYI1LfsaOhmaSwW0gTJ0hdbjX9HWUs77KUVCS9n0i/P
         BQkmqy0J9gccuG84fZmk5O7+G0nPur2IY94YbjNPfb2ai/5Qwn7MGMdhgXFOUyD4yw
         /IU9MkgkDI7ZQ==
Date:   Wed, 10 Mar 2021 22:24:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the
 char-misc.current tree
Message-ID: <20210310222441.6a8dcb10@canb.auug.org.au>
In-Reply-To: <YEiphZVhmY4rYzbJ@kroah.com>
References: <20210310220404.086c426c@canb.auug.org.au>
        <YEiphZVhmY4rYzbJ@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cz69z98RP9qNCKyzcY1iS=7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Cz69z98RP9qNCKyzcY1iS=7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 10 Mar 2021 12:12:05 +0100 Greg KH <greg@kroah.com> wrote:
>
> Ah, yeah, oh well, I'll just live with this, I don't want to rebase
> again :(

At least the -rc1 booby trap is gone.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cz69z98RP9qNCKyzcY1iS=7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIrHkACgkQAVBC80lX
0GwdHAf9HWPRXFNXDrZBGgv30sIUwXZ0mv6P+2O+46VQHYFZxpEq6KmLdb+xzoKk
HjEWTA+iPC3BU60yAIIhCbjCDgcm1VaFpcw8QFkysfrLH//Fa/gsOvxTbjxUNEke
kFeFAxnz3azwdF6oVKlOgmKp75lh7B4T3SPyFIZCbKcQhV+H4QLXEcwzfan3pMoW
QNbbrXlALUmqUMR/sdGegiJ+We5dbbcKWjXltilO/Ol/Hc/vaflQ4lXGoUdGv6bG
W6LrUpR+oGJMBl0Zu/GNkGYLroGjvaBzJ9lvbW0DKrbe8US1wyMugOFETHKA2gJk
hto+E5HuXfuKkN8rJNLk8H/3Prm0yw==
=56lY
-----END PGP SIGNATURE-----

--Sig_/Cz69z98RP9qNCKyzcY1iS=7--
