Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A864F1A0543
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 05:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgDGDZ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Apr 2020 23:25:26 -0400
Received: from ozlabs.org ([203.11.71.1]:47977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgDGDZZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Apr 2020 23:25:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48xCTb4D8pz9sP7;
        Tue,  7 Apr 2020 13:25:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586229924;
        bh=ogC/NRDkcWa/7KTckeoNf18YOt6A6FLY38S8Q3wB5ME=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EYX7aOA6pYuuGIxwHP3mKxzV9ql44uxi94eeB1D/oh3G1fMUdt3QdV0NQXuLk+Kdk
         wtPENZPW4VQiASLKXhfjdh9imZ/eqscycWPik+LNF+xXwOxNRZZ3YdlvBmeXswtxSN
         iPXnpACAEDStsrHrMLnJjZSTrnJ0BGwH/jw5gcXAE4LWt+fwjW9QjxxFbjFzLL1BrG
         Gq0l13PQ17MljSrZg65a60/j/ZLYLrzucdt2s+mAPl/vqQe/FRoXZmjE7ou1F2pVy0
         3ML5ibp9oU5y0nWjXJ5IEPD3AqQyz3mjgFsmch7/aLabOerewPeyiSDXI5lk/g/1Ig
         ClMRWqisram2A==
Date:   Tue, 7 Apr 2020 13:25:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 vhost tree
Message-ID: <20200407132521.656db6fa@canb.auug.org.au>
In-Reply-To: <20200330193137.44fd70c9@canb.auug.org.au>
References: <20200330193137.44fd70c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ha9CF+nuht8SxRgPo5BqeMm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ha9CF+nuht8SxRgPo5BqeMm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Mar 2020 19:31:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   drivers/virtio/virtio_balloon.c
>=20
> between commit:
>=20
>   5a6b4cc5b7a1 ("virtio-balloon: Switch back to OOM handler for VIRTIO_BA=
LLOON_F_DEFLATE_ON_OOM")
>=20
> from the vhost tree and commits:
>=20
>   5193acb63eef ("virtio-balloon: pull page poisoning config out of free p=
age hinting")o
>   226d0484a676 ("virtio-balloon: add support for providing free page repo=
rts to host")
>   49006aae9e94 ("virtio-balloon: switch back to OOM handler for VIRTIO_BA=
LLOON_F_DEFLATE_ON_OOM")
>=20
> from the akpm-current tree.
>=20
> OK, this is such a mess that all I could do was to revert commit
> 5a6b4cc5b7a1 from the vhost tree and keep all the akpm-current tree
> patches. Please sort this out before Linus gets to see it.

I am still reverting that commit ...

--=20
Cheers,
Stephen Rothwell

--Sig_/ha9CF+nuht8SxRgPo5BqeMm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6L8qEACgkQAVBC80lX
0GxOdQf4qm/H7arlMHt3rCEMgQtUm06eukNtKeIvZNGk7rlT2VHL9a30D0lroW8h
/1S2diFqECocXVSrF0p1VONP5HkQduBGqrlyZEEYRpnNkQsmpLKSLQUmY+f4t+hH
d5IGQIVgCUBBSa03nuw/8ymhfdV2v0l1ULrJ6eSmSsp1u7Yv0iJWUOFvSQJhRa3w
M8Wc7NDKy8HbDD6NTxxJzh+c5H/eRZWveLc+E+LGv0Pnr3PyoC51aZbIPgYkPPxh
VcczV4zry4CztNk2VXgjwVyNqexvT9s/LO1G1EXZRa9QeSMq3sDsUj50QopS66vz
PxWxw7x4CJT86yNnDYpdsV8++MbA
=iEHN
-----END PGP SIGNATURE-----

--Sig_/ha9CF+nuht8SxRgPo5BqeMm--
