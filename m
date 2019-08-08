Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6440D857A2
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 03:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbfHHBbf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 21:31:35 -0400
Received: from ozlabs.org ([203.11.71.1]:50273 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730382AbfHHBbf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 21:31:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463rSM2nrcz9sN4;
        Thu,  8 Aug 2019 11:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565227891;
        bh=VskflzzaHB3YqEhRaWaqpmXfLtKuW7+a50wQ5+qwMzA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AxY1O5I9qBH6ATA9yYG+iwxjXgQd6T44GfBT3kn9e5nQ3Lccakt9z1jIOUapSTl8a
         ZDsBr8EmPZDgdIbBxyTJ6hHqKzlax4iuuufbrMpvpHJOGzRqCBUMgGC57dWC9vEHK8
         FmM+AOWCdyX2sddSaOdsWiuZYeSRDje6Sq4coEnGqoPiR2jKcK8pHIGtSPHb6vo75W
         92Xe7N2txysoLxQYPSw8wRbNlGbJ5deDKnYRE58ZwhRb4AlBzmS3gKSy/mTR+PHL8p
         iZMFa92SHIYkLBizRhuzg+YQkHkTZJJlXf0nwfdH0c7BRDdvJmHi6KE7WAehW2o+8K
         yP63ZpyGsZS1g==
Date:   Thu, 8 Aug 2019 11:31:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Song Liu <songliubraving@fb.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Message-ID: <20190808113130.4cc2902f@canb.auug.org.au>
In-Reply-To: <F53407FB-96CC-42E8-9862-105C92CC2B98@fb.com>
References: <20190807183606.372ca1a4@canb.auug.org.au>
        <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
        <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
        <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
        <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
        <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
        <abb5daa5-322e-55e8-a08d-4e938375451f@infradead.org>
        <F53407FB-96CC-42E8-9862-105C92CC2B98@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yhc0x6v6fDgfN4ZWUXD5eHT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yhc0x6v6fDgfN4ZWUXD5eHT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Song,

On Wed, 7 Aug 2019 22:11:28 +0000 Song Liu <songliubraving@fb.com> wrote:
>
> From: Song Liu <songliubraving@fb.com>
> Date: Wed, 7 Aug 2019 14:57:38 -0700
> Subject: [PATCH] khugepaged: fix build without CONFIG_SHMEM
>=20
> khugepaged_scan_file() should be fully bypassed without CONFIG_SHMEM.
>=20
> Fixes: f57286140d96 ("mm,thp: add read-only THP support for (non-shmem) F=
S")
> Signed-off-by: Song Liu <songliubraving@fb.com>
> ---
>  mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 272fed3ed0f0..40c25ddf29e4 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1778,7 +1778,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigne=
d int pages,
>                         VM_BUG_ON(khugepaged_scan.address < hstart ||
>                                   khugepaged_scan.address + HPAGE_PMD_SIZ=
E >
>                                   hend);
> -                       if (vma->vm_file) {
> +                       if (IS_ENABLED(CONFIG_SHMEM) && vma->vm_file) {
>                                 struct file *file;
>                                 pgoff_t pgoff =3D linear_page_index(vma,
>                                                 khugepaged_scan.address);

I have applied this to linux-next today (it needed a little adjusting
after removing the other patches).

--=20
Cheers,
Stephen Rothwell

--Sig_/yhc0x6v6fDgfN4ZWUXD5eHT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Le3IACgkQAVBC80lX
0GymPwf/Yptoay9yV8VDu8pDytNxBrsnHMGbQJ5LRMb9crEICeyHb4JVvUS4W6I7
KAcTGuB5yrUGdhYIQFU/mgiqxxAerpKch6t1Lw2PjzB+iCkQAST/OTcTmni38ln9
L+KsyAJR3AyAU6bY7u+CoWnbUeFmWV+itElbvhtJeGw8eAjbjs2OGWup03J4bJXJ
cnaY61rM0ViOVXS2tbzMJZt5j736Olu3UHRmEA4FxekLP8NHlfNm9WSmqFUOIhA5
M/zYa1NueNlchfMt3S/b+6TKxwRd3xCiFwUe0fIq04oQIhIxtqXpYv/lkvmIbja7
F13gAR8XbAdTeSucyWzRJ+16APO80A==
=5rKS
-----END PGP SIGNATURE-----

--Sig_/yhc0x6v6fDgfN4ZWUXD5eHT--
