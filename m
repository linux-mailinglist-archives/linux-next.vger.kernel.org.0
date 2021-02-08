Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D80031289C
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 01:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhBHAcy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Feb 2021 19:32:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36603 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhBHAcx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Feb 2021 19:32:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DYn610kqnz9sBy;
        Mon,  8 Feb 2021 11:32:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612744330;
        bh=zp+80v20+xyq7hRawi0rekEejt/9xqn27YDwWsh2i1U=;
        h=Date:From:To:Cc:Subject:From;
        b=QjP9jcpKQL0pFzhZHotW0fvTwb5oysOecxmVCWur0NpmcV9TG8oKycygDqz1TJLCL
         gMC+QlYUmnvvpQrp7JBtvV4Jk4Jb4WJ2aRYfX2p6eswYSVkMXKw1OGXBz0TlX6ZdNF
         8xrDxoyyOXzMMezeMihgCavUKVX/b2N+lTTOo/dbDd18RpwMcGM+IiTZyLAxYSQQoH
         CcGS/W0/HaOv5FQOnFBl1l+N+8efXBkxb3LZC9dyXDaxWTR1zCJZ23fHXe3h+NXCC1
         /0QAtEdxzFYxtMRnn2tA5VyHZehdLGkHhTZK3yirEO+69YsqbVbpENEVIAMYDTg0p6
         JVE+REIhQGCPw==
Date:   Mon, 8 Feb 2021 11:32:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208113208.35449879@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9bZukoStg62sThA.N95h=Jq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9bZukoStg62sThA.N95h=Jq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_ser=
ial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configu=
re_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_hig=
h_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm=
20-camera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configu=
re_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpi=
os' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera=
_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_g=
pios' exported twice. Previous export was in drivers/media/i2c/rdacm20-came=
ra_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_=
gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-cam=
era_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_=
id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera=
_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_add=
ress' exported twice. Previous export was in drivers/media/i2c/rdacm20-came=
ra_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_des=
erializer_address' exported twice. Previous export was in drivers/media/i2c=
/rdacm20-camera_module.ko
WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_tra=
nslation' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko

Introduced by commit

  a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")

--=20
Cheers,
Stephen Rothwell

--Sig_/9bZukoStg62sThA.N95h=Jq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAghogACgkQAVBC80lX
0GyT2QgAg7vhLokBC9GK6m4RdyoXquMEq6kryqzoqAZlmYZMKuYT8tJTG2zysdQ7
sQmNJgf5qsFUuUSi186a7THuvU0ZdV+0qKGdY6mhv+0/yprSdojRuofgnbv41o6V
mux/MyP592yhltpaPOVN0LwtNlseEhmS1pVindGHeGuy2AUrkTNxRgstJ+grWX2x
TWjQparpcS9urQnxROkwHApbcYaQdD8fg1bT+Oeqm+8i3YEEIwzjUAFzgiGVmvpS
MehkDvKL2Y4Ey8Spn304rYBU6p5vG4RIAFBIXmVT6Ayf02wpf9TJKNgsDoasUibA
Fp9ELrg28bqhHvF312q/Pep89AiAxw==
=mOXi
-----END PGP SIGNATURE-----

--Sig_/9bZukoStg62sThA.N95h=Jq--
