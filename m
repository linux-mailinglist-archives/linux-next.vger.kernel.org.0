Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1800D262542
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 04:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIICit (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 22:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgIICis (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 22:38:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0468C061573;
        Tue,  8 Sep 2020 19:38:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmR6D3gbmz9sTS;
        Wed,  9 Sep 2020 12:38:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599619124;
        bh=2izng1FlEMeGvkzbnaHy65co67h6yPmYVNwVRf6P3i0=;
        h=Date:From:To:Cc:Subject:From;
        b=LYytBpncR++dbiT4D3vcQ3D9GqsDhRottrmhn99d37hKi2lyNL+29pqivWPresaz+
         LoFeRLErapUhbi1yessfmrRKePy+Bz0t97hTbr2jyw8505B6iV+vRae+PjehjWq3Sd
         1YkWF4AHCSwjUhPhCOX4dSDIVCu9fSQOIB7xj/dgDyISjm2fFVqQGTI8cJMXhrMaaX
         RxLP5DKXtXOCzlLY87yYe7Q1pEwacE4aE/uJ3HK0aGMI5uqlrBx49lyKJFI4xie+/a
         cdMo8UH5j4s72N6h74yo8BFySLu0o9IKeUexxkbbMlWzROs/u3yyzHUrI61r8sGiYT
         anO7orXivOI/A==
Date:   Wed, 9 Sep 2020 12:38:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20200909123843.390cbf28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AL7W2=v4vj53okQq37zom2.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AL7W2=v4vj53okQq37zom2.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: modpost: "dw_pcie_link_set_max_speed" [vmlinux] is a static EXPORT=
_SYMBOL_GPL

Introduced by commit

  3af45d34d30c ("PCI: dwc: Centralize link gen setting")

--=20
Cheers,
Stephen Rothwell

--Sig_/AL7W2=v4vj53okQq37zom2.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YQDMACgkQAVBC80lX
0GwsNQf/aTIlF/2NlwaoLrYuHIDhfEa/XkV5yluznkda/vnaS0SRQaX1QiTArH+r
yx2RCs5R82fYRIpxk35NMJcOXTfKXHEMwQEzEfuR8NeCRF3VZGlewwRVfMELrR6P
BnxmABIWy1PrRrHzEtqdbSsCTNSHpLvJUkRI8NmqNs0uZxEgmsgTUKhIW5vH+QcG
9KCmwImotFp6xnTEi06Cuds3EoTTNbJXo5j9nq2fvFFfVCiOgO5ogqJ4nVb9CPiW
y5hF2IYm+fR5Vwyra8rWlUaudE2a92HRLq2PvObEd64pTj9vq+Plo/4q6vks3ykn
mYLXwtQGFcfD0L82CvtaRQEaTJ3FfQ==
=tG+m
-----END PGP SIGNATURE-----

--Sig_/AL7W2=v4vj53okQq37zom2.--
