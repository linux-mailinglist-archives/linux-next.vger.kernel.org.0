Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3266295497
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441547AbgJUVzr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 17:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438776AbgJUVzr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 17:55:47 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310F3C0613CE;
        Wed, 21 Oct 2020 14:55:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGknq3Z7Yz9sSC;
        Thu, 22 Oct 2020 08:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603317343;
        bh=iokHMBR52wKpV4HtR6FM+PdIK+k53Vpmsif3xtstGC4=;
        h=Date:From:To:Cc:Subject:From;
        b=JUKWyTlR3vQ5MKP0i8PuWeZ3d7PBSG3Em9yR/xH2XeptTvTB+MgW2wIa1/VTWzwum
         PVF45mGdRlg1YzYRkhT9x7D5oEvkhU9EH9AVZ8hh2NCoqDFg0PlUAFrNBNMTitQL9g
         PRjbTIbpXUWUAj7KB0/2nihjyLbQyU+dKsEq1cpgRhIDhLZcDi7v9zCetPSUIDvMtm
         IqIhPJVA5M/GY8AZ5XcYjTTgzhV85kFroH4j21E3o3G5/CVSlJveQNfUdNMaVilOsD
         VFk2iblHavRnIbihkr+Sn5Bb82Pm6oCBTPQQWcXoj7HVOe7oXQtjPIEqnHm9/Ky1OT
         13XZbAWVyppBg==
Date:   Thu, 22 Oct 2020 08:55:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Fam Zheng <famzheng@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the jc_docs tree
Message-ID: <20201022085542.0abc028d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SGzeLQItu71YJSkUX5=L08D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SGzeLQItu71YJSkUX5=L08D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9467739c239d ("docs: Add two missing entries in vm sysctl index")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/SGzeLQItu71YJSkUX5=L08D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Qrl4ACgkQAVBC80lX
0GwoGAf+Ob0rheQDwlsvFJZPlNWIzkrMS9srsn2CqkMrb1Xl5EZ7zn1qWzFRaOJn
ZeNbnskLcqXhmhMNghIfNaKGeE/aXIPSke7kAckzVU8UJUWRGtGMy2NCFOt5R6St
yCbU2IPVWFjZNwgOejv7CZqNiA6xgMLNkKrOL33ic8bZJD9UnDlYtIxn5AcitN30
fF/HPlvVUP1Um7xGEvov7e7GCr1CiVmOJ9q2xHe+OCP+uNL9pPBUOVJG9dQ8l54t
oK7sCW5pLvTTG5PfQHsr8Mco+ZM5zGEz5FkMig5xfpDiCt+BKLBg4jJ2eF0BWDjS
IcKVTFnRMOdcPvJZwEKcjuhM0NzxQg==
=/a4t
-----END PGP SIGNATURE-----

--Sig_/SGzeLQItu71YJSkUX5=L08D--
