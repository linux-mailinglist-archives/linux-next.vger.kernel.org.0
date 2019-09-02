Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5508DA4F43
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 08:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfIBGjz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 02:39:55 -0400
Received: from ozlabs.org ([203.11.71.1]:59367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfIBGjz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 02:39:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46ML6c49q2z9s7T;
        Mon,  2 Sep 2019 16:39:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567406392;
        bh=9/AxkFW6IePlir+tSIMvxXKRtvcA0eYBJu9xVFk5fwg=;
        h=Date:From:To:Cc:Subject:From;
        b=YH/fkxbXyuq5J/irSitmrg6uSgQJor1jKAeEbP77P5KxkNbCgAU6k/zHMbla6NdVY
         6ZMYJqmskS+gHRfGsTiOtd+hNxTx2CKCWtuu2XaYUZhRuazfXibxDscWW4J7JGH0fp
         jURzNMjn/cGOUTSR1CeAc39c03UTTC4CyTCnigsmWdT8rt6q92l9WO89EhqQAxmNmt
         zFxJ5mMfVpbmwx8NQ+/60U4tdXsnW8RLaOQo6eVYcv1eZRgCZKquOqtSYWTCghvz4v
         enLk2+AqLNnmKsLQo0iBVH0F5FAfZCjE7T8L0yaNFEqoS1EpFjzS7klXClemoCAkLD
         1TWzr90iQWlQg==
Date:   Mon, 2 Sep 2019 16:39:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the iommu tree
Message-ID: <20190902163951.6280e030@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4nCL=0Dvyf=cbwcgrMz6l/M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4nCL=0Dvyf=cbwcgrMz6l/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/iommu/iommu.c: In function 'iommu_subsys_init':
drivers/iommu/iommu.c:123:38: error: implicit declaration of function 'sme_=
active'; did you mean 'cpu_active'? [-Werror=3Dimplicit-function-declaratio=
n]
  123 |   if (iommu_default_passthrough() && sme_active()) {
      |                                      ^~~~~~~~~~
      |                                      cpu_active

Caused by commit

  2cc13bb4f59f ("iommu: Disable passthrough mode when SME is active")

sme_active() seems to be only relevant to X86.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4nCL=0Dvyf=cbwcgrMz6l/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1suTcACgkQAVBC80lX
0GyiAQf+OckwedNntYxYbX7qXQ+91aiPY37T9h5UTrsvdr4xRZ/5uwgeRou0wqIT
pGkmUVBMryRj6GxGbUHp+DFyjn6mAIQ4gjS3IjhQ1arz+Y2Bu7GEp76E0WVtOTt9
z/V+f9JMtzIOMkGok9VdlR3na/TCiwHlBhlC52HULfh9JZd0ktkOVBjPubNLU9FS
hmf2d++OBx+6ZPnapeCffUj6t3furfyLmrshF4LdPFYhQsVj3NMbeolnyRqmYpO2
CFzNqr+u9BaZMWn+ZIHzrDWnGf+F7IMZ6Y3D1GvL2uPCHwKjkRI1WmkC3Yx9SX+L
yWsvaiSz5y5ZAVCk0EJSvHHQs2BI8A==
=Q5fe
-----END PGP SIGNATURE-----

--Sig_/4nCL=0Dvyf=cbwcgrMz6l/M--
