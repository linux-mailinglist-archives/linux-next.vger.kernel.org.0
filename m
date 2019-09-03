Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EABCA608A
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 07:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfICF2y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 01:28:54 -0400
Received: from ozlabs.org ([203.11.71.1]:53019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfICF2y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 01:28:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MwVB3DbTz9s7T;
        Tue,  3 Sep 2019 15:28:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567488531;
        bh=rlB4msvYvPZrbjAElsyKaihIxhFBAWAORihfrpVeSfw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TwIoioOSknFD8Wlbd8xNit0YlfvjqwBTk5ysEuAh0+XSM4tvLce2oZcZ02/wV2018
         P5YUalVvRupXbaVLmqeiZFMADVjYwgrE8sYhc3UAtcn92KVP5DucXMN1gq23/a45Wg
         PdxQJkE8KK9stbLrd3RoFRcXzNzGxCnKomgfB7WLVcrHrhZuo7gxAXy86iZ5w+N18B
         f94v1q3HalaZiaf7eLpnScvqpfUgCza1J8H14/HJJ3o+n4edVKCUjE9NoumKM5WCGY
         gZtgHgr3cd0yjqXTe1bOX9N1Es12Mmxe+QyP3kSYQMWTPvusLNiYWDAOcbhSHj3B7U
         9Kme8/hxodugQ==
Date:   Tue, 3 Sep 2019 15:28:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20190903152849.770ae819@canb.auug.org.au>
In-Reply-To: <d2493e6b-08fa-9ea8-a0a4-076def54e91b@amd.com>
References: <20190902163951.6280e030@canb.auug.org.au>
        <20190902140347.GA23482@8bytes.org>
        <d2493e6b-08fa-9ea8-a0a4-076def54e91b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QC/nbyo+M/koxzSVz3tcjkr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QC/nbyo+M/koxzSVz3tcjkr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2019 14:26:40 +0000 "Lendacky, Thomas" <Thomas.Lendacky@amd.c=
om> wrote:
>
> On 9/2/19 9:03 AM, Joerg Roedel wrote:
> >=20
> > tl;dr: And IOMMU commit introduces a new user for sme_active() in
> >         generic code, and commit
> >=20
> >         	284e21fab2cf x86, s390/mm: Move sme_active() and sme_me_mask t=
o x86-specific header
> >=20
> >         breaks the build of drivers/iommu/ for all architectures not
> >         implementing sme_active().
> >=20
> > On Mon, Sep 02, 2019 at 04:39:51PM +1000, Stephen Rothwell wrote: =20
> >> drivers/iommu/iommu.c: In function 'iommu_subsys_init':
> >> drivers/iommu/iommu.c:123:38: error: implicit declaration of function =
'sme_active'; did you mean 'cpu_active'? [-Werror=3Dimplicit-function-decla=
ration]
> >>    123 |   if (iommu_default_passthrough() && sme_active()) { =20
>=20
> Maybe we should make this mem_encrypt_active(), since this will probably
> be needed if/when an IOMMU device is eventually added to a guest, and the
> referenced commit below doesn't remove that call.

I have done that for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Sep 2019 15:19:34 +1000
Subject: [PATCH] iommu: use mem_encrypt_active() instead of sme_active()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 66cfacaa483d..b870044ecd49 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -120,7 +120,7 @@ static int __init iommu_subsys_init(void)
 		else
 			iommu_set_default_translated(false);
=20
-		if (iommu_default_passthrough() && sme_active()) {
+		if (iommu_default_passthrough() && mem_encrypt_active()) {
 			pr_info("SME detected - Disabling default IOMMU Passthrough\n");
 			iommu_set_default_translated(false);
 		}
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/QC/nbyo+M/koxzSVz3tcjkr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1t+hEACgkQAVBC80lX
0GwcpAf+JfutCmod1dRdGPit/CwvcXnxjPi230q7rPjbytPpnAJMfx8GcpgR+ZNk
y4JkL4WqKVDr1+txFZMWzwYj9/wiZjCllo0MXX0gGzaC+LZO1ZnLbMhxPNk54b6e
g++atpHeOcUnGWFwcTpHeLo/E6q7z0zz9M8eE5NU2MIxc61ahRjqj0q2SMLI9omo
4EnqlnYzXu9jQ5pXcO2vrng2Ri2jLBlt9LkIVCUOPhfEmW2q1/TbGVu9YvAQQvPY
YTS++V2q12CKBlLBPPsH7fFGDmBJgSDOVL/SvPgnny8hpenO9XCT7SRFe0elA3Cs
boCD8NbN/p7CYFj+mfMd7KboUC+gIw==
=5WxQ
-----END PGP SIGNATURE-----

--Sig_/QC/nbyo+M/koxzSVz3tcjkr--
