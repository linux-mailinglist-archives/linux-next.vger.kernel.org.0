Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A72820DFB7
	for <lists+linux-next@lfdr.de>; Mon, 29 Jun 2020 23:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389560AbgF2UjM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 16:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731719AbgF2TOO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 15:14:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182D1C0A54DA;
        Mon, 29 Jun 2020 00:22:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wJqD1vfGz9s6w;
        Mon, 29 Jun 2020 17:22:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593415372;
        bh=Y8lWOEK/53C9I4Sfg1srm4rd+6FuXVd7suMPKS3K/AE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u2ONsXPwzuhbHLEdon8zpWLoAEe+drArcpjk8AR4yg1ziHp6a5etLr4VjPHOX3x+b
         vemvXPX4kTVELNrx6AKxgTNFZySr5nUyMsi/i5T8ozdakZnV84G2CnkqrSQCt6r12C
         7Cbk3Qf6ymjb5xSVoJOhDztl/4LWQ4pM2b3BVU1K32DFnwqL7IVxHsU3g5GtiTMoFZ
         dNkME/W4WIWcY6kAN7bv0s25Q/S2yhjxR7n/q99W4x/gGVmXlrSgHQoQjM2AO2apOE
         8Z2fiHszm1zp0GZyzXlRNb+1nsAzEY7REVzD6jmjaGOU7wer5YJ4cFcc/qqJ8CUqcH
         KrNFWZDmQXjFw==
Date:   Mon, 29 Jun 2020 17:22:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>, cai@lca.pw,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>, osalvador@suse.de,
        Tony Luck <tony.luck@intel.com>, david@redhat.com,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        zeil@yandex-team.ru, naoya.horiguchi@nec.com,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v3 13/15] mm,hwpoison: Refactor soft_offline_huge_page
 and __soft_offline_page
Message-ID: <20200629172240.0d01e161@canb.auug.org.au>
In-Reply-To: <20200628065409.GA546944@u2004>
References: <20200624150137.7052-1-nao.horiguchi@gmail.com>
        <20200624150137.7052-14-nao.horiguchi@gmail.com>
        <CA+G9fYvopXWr+Y34xz2NVv17yeFs7fuKnJO_iUMnfCwaDNRXYg@mail.gmail.com>
        <20200628065409.GA546944@u2004>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BfS5bgw7heJ6LcYTXdfMhhS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BfS5bgw7heJ6LcYTXdfMhhS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naoya,

On Sun, 28 Jun 2020 15:54:09 +0900 Naoya Horiguchi <nao.horiguchi@gmail.com=
> wrote:
>
> Andrew, could you append this diff on top of this series on mmotm?

I have added that patch to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BfS5bgw7heJ6LcYTXdfMhhS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl75lsAACgkQAVBC80lX
0GwqeggApOE4cVjf13CqeP/+MOp6uv0Ady+E4kdUraJ3c9PRp/PpwaZIztKVFB+1
vFBhuZgj7isRK2jdVPjSACm4bNhkxYMTk9pDcdbyMLdsHP2saXrgllXhqUlQPIut
Ee89TYrL7zLfrEoRgw435hplAq2qzpLoGGgO9Xfpbuu4oFqz7sLunwfoTtVlS58c
nrVO6cr50tNkZRhcWpMiAlNlLZyNSY595NxMFayksucylS9eBAdPmGPHEsdlOYmx
fsA7jwDB32shM7cngHnVr3xGp2p2kBN1rrxyE9QV4ykupil0I/zi3Fo5UKgSUqcV
Z9f+NW5y3GIQg2WrcaI2y4UU7nhyqA==
=TmpX
-----END PGP SIGNATURE-----

--Sig_/BfS5bgw7heJ6LcYTXdfMhhS--
