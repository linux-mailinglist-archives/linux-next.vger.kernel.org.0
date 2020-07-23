Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA6A22A718
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 07:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgGWFzD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 01:55:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57731 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgGWFzD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jul 2020 01:55:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BC1kr02xhz9sRR;
        Thu, 23 Jul 2020 15:54:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595483701;
        bh=/IB0vpapVOUYRDz1z+4C3rGvjCp6zj3WxW3V6jqUXHs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eyCP1Cl8fn2LeBCl3gin+7L/L5fKA33I6UZXWkTbZI4WcyUB+enp07hBEqe0fnT6F
         yCs75LJhIvWAywXU2kDLcnQZ5iv0VfduN8PUQ/s8Di8/XQD6Eczs2E4mpB380epdt3
         eKmLg5fo8hKgBEtVcyYpWnqgsGHpwpW8MFxlrBkqEXv8mwqpXGZNoBGqxPbhDrE/ac
         DXW0Q07uHHsIEFTgUzN4/6aEsp1V6uut9jCBxkZ4MkmtL0sO7hj9DNBodjggz9vpCk
         Q6V9+YZLDGNlHV7yPbrsToSQaxSXe/DTwEKjE8l2nrMjBp2UL5QSRDdcnkM9rXfYBu
         wTvk6XBBjjDLA==
Date:   Thu, 23 Jul 2020 15:54:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20200723155452.6dccd510@canb.auug.org.au>
In-Reply-To: <20200721163045.50c205a5@canb.auug.org.au>
References: <20200721163045.50c205a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a7I6O8Wp6phy6UFTMCqEdjk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a7I6O8Wp6phy6UFTMCqEdjk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Jul 2020 16:30:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "exynos_ufs_dump_info" [drivers/scsi/ufs/ufs-exynos.ko] u=
ndefined!
> ERROR: modpost: "exynos_ufs_init_dbg" [drivers/scsi/ufs/ufs-exynos.ko] un=
defined!
> ERROR: modpost: "exynos_ufs_cmd_log_start" [drivers/scsi/ufs/ufs-exynos.k=
o] undefined!
>=20
> Caused by commits
>=20
>   c3b5e96ef515 ("scsi: ufs: exynos: Introduce command history")
>   957ee40d413b ("scsi: ufs: exynos: Implement dbg_register_dump")
>=20
> I applied the following patch for now.
>=20
> From 6535b25fb253c7f25bf924655edb2b22fdaeb545 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Jul 2020 16:26:05 +1000
> Subject: [PATCH] scsi: ufs: exynos: mark debugging as broken
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/scsi/ufs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
> index 2c31b33f0adc..925f8de62f6d 100644
> --- a/drivers/scsi/ufs/Kconfig
> +++ b/drivers/scsi/ufs/Kconfig
> @@ -178,6 +178,7 @@ config SCSI_UFS_EXYNOS_DBG
>  	bool "EXYNOS specific debug functions"
>  	default n
>  	depends on SCSI_UFS_EXYNOS
> +	depends on BROKEN
>  	help
>  	  This selects EXYNOS specific functions to get and even print
>  	  debug information to see what's happening at both command
> --=20
> 2.27.0

This build failure now applies to the scsi tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/a7I6O8Wp6phy6UFTMCqEdjk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ZJiwACgkQAVBC80lX
0Gx+vAf/TCAqCRaVWdH5doygJYRr3aY8Ll7xw1RsYLAKe4wzUyz6TY6Yx/wRpDMV
uLe/5EvRGe7sIFMj0xebQI8W2ajCylUT1CvEXfb5lLd0KVaV7w3Y/9GTFJmxfCUD
hyBRYXXYYCsCwydUnn7il1XbMM7p0AiaCldz2w+vLbHwrqnxjhXtAT/cM0hsOsBZ
Qf3SfYQhoXs3Gj4KNjb+0J7EJgua3TFl+NtfKuXXZ9MCr7VY43F/kB44vH8Dhaqs
gSzzJLQfbBu2gD+B5c78arryMbK5pzHsMTTu5g35VV5JyIcLzbwpnpUyKSubSy/Q
9UzZyqu80lvCAwNED8CmTQ72YuKtvg==
=G46E
-----END PGP SIGNATURE-----

--Sig_/a7I6O8Wp6phy6UFTMCqEdjk--
