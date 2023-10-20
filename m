Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C949D7D066B
	for <lists+linux-next@lfdr.de>; Fri, 20 Oct 2023 04:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346827AbjJTCVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Oct 2023 22:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346758AbjJTCVO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Oct 2023 22:21:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421F5124
        for <linux-next@vger.kernel.org>; Thu, 19 Oct 2023 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1697768470;
        bh=TMqdxq95ToA/9NxZrCrrLwfukUKwEF5tXLfUMw3IxoM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uPek++ZU4kFHjLzouwNmWPtc3+d90k2AVeaPmNuktvoWtjoGpGVcWvTwHcQf6iM2d
         YOSXQqxAOd1ysKXJBjQSc48yYGEuayZ2bYBLkCWfgudeo4QgnIoulK/cRlG15VYqQH
         vM9dJ7Fn2J4YE5dqq7pV0evGNn1q1sQOR6VSAtDVlHhs3D04ZdwqOi6xmOJwmmXRLE
         dToj7SUkW1/hk6Lf3Qv9t3HsgOhDjAHv5ooutRgTS3KRMOa4MoLzXzYPh3d6rvlZRn
         YV16aZW0uroH+SU9frBSHxe+seVoir5GPuaiM+0T+PAP9cRIdRLc4kREvBFPmW/xcu
         hsGNEXToOwIaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBSxf2xPBz4xF7;
        Fri, 20 Oct 2023 13:21:10 +1100 (AEDT)
Date:   Fri, 20 Oct 2023 13:21:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Joerg Roedel <jroedel@suse.de>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Upcoming merge conflict between s390 fixes and iommu trees
Message-ID: <20231020132107.0fbe70d9@canb.auug.org.au>
In-Reply-To: <your-ad-here.call-01697728651-ext-4593@work.hours>
References: <your-ad-here.call-01697728651-ext-4593@work.hours>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LhJU_LrnY6g=fDi1it/4FDa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LhJU_LrnY6g=fDi1it/4FDa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Oct 2023 17:17:31 +0200 Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> I've just picked up commit
> c1ae1c59c8c6 ("s390/pci: fix iommu bitmap allocation")
> into the s390 fixes branch to still make it into v6.6 (and eventually
> get into stable).
>=20
> It will get conflicts in arch/s390/pci/pci_dma.c with commit
> c76c067e488c ("s390/pci: Use dma-iommu layer")
> from iommu tree, which is targeting the v6.7 merge window.
>=20
> The latter commit removes arch/s390/pci/pci_dma.c, so that's
> the way to go for the conflict resolution. Joerg, I believe it's your
> decision whether you would like to mention this trivial merge conflict in
> your pull request to Linus later.

I have removed the file in lixnu-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/LhJU_LrnY6g=fDi1it/4FDa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUx5BMACgkQAVBC80lX
0GyC1Qf/TZavyucnqSSw5G3BaTYZFh3TWkdnaZJrTcuPrgSaJ72RjPayfnJFE/pD
3RAOfbibaacCH+2z7Drz42XuLN0A6v/cLc+SdG5zffPVHbO04nNI8XgipJ840Cqm
G//2gFlLn4DMktuYj5Rozb3C/At+wC//T4+B6jyYjCrktmqAhiS7pCQ6QPmHk7iW
i7LWpZtj+XKbbG0B22zwFWJtiVMCEtcx5BkgDDnmy3WXpXjpHE/G2CBa9wmVQpkj
ldX26lPcO5HW0rbHvKhNCktENPEpqp63ZR7xVvlMgKwTGr7wHOt5yAKuvxNIoDPC
RhLwiLFivhJaXYWVmfwR1lCio570/Q==
=XIOv
-----END PGP SIGNATURE-----

--Sig_/LhJU_LrnY6g=fDi1it/4FDa--
