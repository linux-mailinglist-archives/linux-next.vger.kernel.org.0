Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BDB139058
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 12:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgAMLqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 06:46:25 -0500
Received: from ozlabs.org ([203.11.71.1]:59025 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgAMLqZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 06:46:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47xBct6Vspz9s29;
        Mon, 13 Jan 2020 22:46:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578915983;
        bh=Sh68xlWSgpVZrv++dSyLP0Le2vIlTkF8lE0AjArMEOA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Y8Mxd7gDqddqPKQNgM9mgu3S8Fp/8KtSQwcmErzilZxDxNe7wUdI0WyFOpsVrhY/p
         oJmlFbdzAAn/MhQmEfOsqOx6MXZPyJvll7FETmJ4P+WUStUxWug5iDUwOaTRSa9Me4
         jc1U4Sb4pCNRj3M2U5H5ZbcKnYutKwwL4c0x10XdNM7wZx84tdMcAJQoB3QygUr6o2
         v2mwkuX57RPr16M8z1U34Qj39b/75/GMEAcvh4ZgYCdXof0LVzsKKJ5OLkA+aDtpYM
         0csj7e8xlfUYrUA6MEwKu4jyAXiqrHtyOYBxNuTLstG12h8jfsse16JOJdYRPOdUJf
         LUBdqddVNyiFQ==
Date:   Mon, 13 Jan 2020 22:46:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Message-ID: <20200113224620.5d33fa63@canb.auug.org.au>
In-Reply-To: <caeb1af8-4aa2-71dc-0a70-127c0b474f93@st.com>
References: <20200113065808.25f28c40@canb.auug.org.au>
        <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
        <20200113113837.130c3936@canb.auug.org.au>
        <caeb1af8-4aa2-71dc-0a70-127c0b474f93@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5U+lfpyJ0sr9Nz20/hiiLBb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5U+lfpyJ0sr9Nz20/hiiLBb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Mon, 13 Jan 2020 09:17:08 +0100 Alexandre Torgue <alexandre.torgue@st.co=
m> wrote:
>
> Sorry for this oversight. DO I have something to do ? (except to not=20
> forget to check my signed-off next time).

That is up to the arm-soc tree maintainers.

--=20
Cheers,
Stephen Rothwell

--Sig_/5U+lfpyJ0sr9Nz20/hiiLBb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4cWIwACgkQAVBC80lX
0GyzLQf/V4IXMNSIMAQSE7qdmrM7ue4ZAsvi3rn9G+gFcSjsnB+S7hpuWQAzKxpq
5z8xVd9L33CLY+8FG8pvFW6qaOoo+vcw5XRnJvJPeC8ptkThTSwVocqlV9BEVIvT
76j27n+cMqMlXAdQtuHgquyVW6T2uK9wT3tzeGVejmw0YBWp2k7g4MnzNIvaF/bn
qE09LuWS5GGyvzhMd5MHEeHOq6eIu6vRTWeDLyYa3CvNiTNpjtNwI+Hg/9/2JsWO
v1h8GLlDlmfB1Xl+xQmlXy6m5hqoNDj4IcCWPNPwNDrBNgxn87UwQiqSRkHJN0GB
2bQBARTGtpXW4LuLgFRvNtr3J302bQ==
=b67J
-----END PGP SIGNATURE-----

--Sig_/5U+lfpyJ0sr9Nz20/hiiLBb--
