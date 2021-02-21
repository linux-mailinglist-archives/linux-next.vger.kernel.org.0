Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4501B3207D5
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 01:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhBUA3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Feb 2021 19:29:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBUA3o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Feb 2021 19:29:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DjmQD67rZz9sRf;
        Sun, 21 Feb 2021 11:28:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613867341;
        bh=vvPVqxIeRBrdK7QCoG+ZE+fB25g/ZXZrgC8+3gmKmVU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CxtB/WwfDqLzBpWk7F+hM1mcDROSx8Pf3TCM1OQWP1gcmmmHSHLzENSlXH2AmBaDx
         a7UvkzxQQ4Aq87vmbr74Jkl/UzZEGVe8meJkLKg1oaypKep5k8C+IYGUUUjPw99PxS
         ybXxzL18Mx6CWLlf/suxV1ewcvr2M3JyKyu19ZxWiFP6iFU+hauv1Ihw5TMIz6k6gT
         jgvAX7hInPTtwrt94N5ny4IsMwoVW3yVsPWhJr6k5Q93guU4H0Dr3M0tt9FDrAhyDB
         xAoPM0BYiDtpjSDSqe1XRd4TpXQ4M7eQIgMcWufNY6pFHshHZVjis+x4eqeL/Pqa3o
         bwXH+vywTscOA==
Date:   Sun, 21 Feb 2021 11:28:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alain Volmat <avolmat@me.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Message-ID: <20210221112850.475f6bfb@canb.auug.org.au>
In-Reply-To: <20210220194524.GA4200@gnbcxl0029.gnb.st.com>
References: <20210202090135.04b9890e@canb.auug.org.au>
        <20210215091444.3300fb43@canb.auug.org.au>
        <20210220194524.GA4200@gnbcxl0029.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ef7lLH7RV230qLfJxTM4xik";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ef7lLH7RV230qLfJxTM4xik
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alain,

On Sat, 20 Feb 2021 20:45:25 +0100 Alain Volmat <avolmat@me.com> wrote:
>
> sorry for the delay, is there anything I should do concerning this issue
> ?

No, it should be taken care of my the maintainers when they get Linus
to merge their trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/ef7lLH7RV230qLfJxTM4xik
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAxqUMACgkQAVBC80lX
0GyYUAf/Vw/GkpidQTpEH8ONnilx2Z91ISJkogJAnlqqzEGipZiBmsj3B8XIJMeD
SHLqQtsFXTb/EoV4piT14k8OpgfGq5jhkavnV8VzDu0MVuipR6RORpAoLLDgZmbp
ehT/1TAbKzFGFqFGyt05SHvAAPuRx7bdSHdCF6pXaiIeGNTYOLrsr2HO27TtO7rw
Kx4y0DNUcRSuXmKIwF4tYkRhK8kByBULyQoGRoqONIEkiC2lXNhSBKSbFVBsJXoV
TYQ49RLM6FozoW7pQvvDTbyD8sgzYAfM2zaORvWP7iKEKNKw+sC+pU1IPnkET3W2
0IyJnHyRTfABGo84JTN3yWorHdNiRQ==
=iueg
-----END PGP SIGNATURE-----

--Sig_/ef7lLH7RV230qLfJxTM4xik--
