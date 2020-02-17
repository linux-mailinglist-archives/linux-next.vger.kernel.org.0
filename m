Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604D916094D
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 04:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgBQDxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 22:53:18 -0500
Received: from ozlabs.org ([203.11.71.1]:34255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbgBQDxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Feb 2020 22:53:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LVSq3DZkz9sPk;
        Mon, 17 Feb 2020 14:53:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581911596;
        bh=5VCPa5NUSKYweRlJklpG5EFZGukFdUuJk3mNUBPYQ68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QvuPAkhNwsK1S9MHoYyH4ZaxStf7/F1fclVHFEKcrghFeYjav8xZsF/Cv5tpaZ1AM
         XqSZL0uZY8bxrpkPh489SBI9VOwBLBGkokVWMPC5g9C0IHExdJlbYW7TJlFU8ZgGX1
         z7SzR3AzbpkwfBLVSqNR3euiILM9hJOkfOKTj6z3vUUPsx64b3jIyzEPpqRbRCC1oY
         2Z9tFYhFBmMVKBDscEQds60kn3qR2b1sDcr+hLaiChPVQvkGKRFdRKGjA4z+iOnszt
         eENuqlTgG1ZcLSJLtb4EYrqGVoCOsuunX9uFUHYuOWOPAhUurpIlH2krDVus/Btrdz
         2rVdcI7GSMPjQ==
Date:   Mon, 17 Feb 2020 14:53:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Mina Almasry <almasrymina@google.com>, linux-mm@kvack.org,
        linux-next@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Greg Thelen <gthelen@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] hugetlb: fix CONFIG_CGROUP_HUGETLB ifdefs
Message-ID: <20200217145313.74ded08a@canb.auug.org.au>
In-Reply-To: <f0fd4a6b-1d4a-8e7d-65c0-a454fbf550a2@infradead.org>
References: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
        <20200214204544.231482-1-almasrymina@google.com>
        <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
        <5237b9bc-2614-0a3a-afa5-5015f30d28bc@infradead.org>
        <f0fd4a6b-1d4a-8e7d-65c0-a454fbf550a2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jzURkaov_SBnAHtSB5RJrSw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jzURkaov_SBnAHtSB5RJrSw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 14 Feb 2020 17:56:57 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 2/14/20 5:17 PM, Randy Dunlap wrote:
> > On 2/14/20 1:00 PM, Mina Almasry wrote: =20
> >> On Fri, Feb 14, 2020 at 12:46 PM Mina Almasry <almasrymina@google.com>=
 wrote: =20
> >>>
> >>> Fixes an #ifdef bug in the patch referred to below that was
> >>> causing a build error when CONFIG_DEBUG_VM &&
> >>> !CONFIG_CCGROUP_HUGETLB. =20
> >=20
> > Hi Mina,
> >=20
> > I don't know if this was supposed to fix the 2 build reports that I mad=
e,
> > but this does not apply cleanly to mmotm (and it's a reply email so it's
> > more difficult to apply anyway):
> >=20
> > Applying patch mm-hugetlb-fix-CONFIG_CGROUP_HUGETLB.patch
> > patching file mm/hugetlb.c
> > Hunk #1 succeeded at 289 with fuzz 1.
> > Hunk #2 succeeded at 325 with fuzz 2.
> > Hunk #3 FAILED at 435.
> > 1 out of 3 hunks FAILED -- rejects in file mm/hugetlb.c
> >  =20
>=20
> OK, I applied this patch manually and it does fix most of the reported bu=
ild problems.

I have also applied that patch by had to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jzURkaov_SBnAHtSB5RJrSw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5KDikACgkQAVBC80lX
0GwF4Qf7BoduopqFiXC3494akasAS4zs+vDcOMcp20jHC46eD5nEHC/PeeygJRZv
ThMHmY/3i+t0cYxelRsxJofHPuAhSEHe7HO3ElrfruXz/FnFunTrVT7TH+jLLczY
hqXIvXHN2U14D3JomA/0/i04i4t7CI7EJZMWhAjw16byKLgT8R0C3Rvjp2gGC5jv
BNX1NkOgWDCd6xuJV85w8No6I5wbRH15Wb15jVJSIe3rbo/0Krfu7pb291TB7dTd
cPc86NPnRN7K1InnIMBeCERT9lBz0m5+wDrib3SmfwmPsZ14rGD9nx3K4iiWudGd
u6dPfWDbztQbBGTZbrYnw0pm4w8mpA==
=IiZh
-----END PGP SIGNATURE-----

--Sig_/jzURkaov_SBnAHtSB5RJrSw--
