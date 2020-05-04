Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2FA1C312E
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 03:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgEDBr7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 21:47:59 -0400
Received: from ozlabs.org ([203.11.71.1]:59581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgEDBr7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 May 2020 21:47:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fm2j5L5Xz9sSx;
        Mon,  4 May 2020 11:47:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588556878;
        bh=2ZTBXZDmHXy4KG+AhqQ96xPcUfeTK1aQz5xcNwcaAu0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pNv8Cq6z1mpG6KGhdHl2Qh96IPw/pZS6RMjlpgUAEJmHEmD4/d+XPwT1B3lWEoEE1
         72p6lAtLlJhb1CzQBi8z+NJ1VCxw0i0HURiBvcfY836E6r5vqMcnoIY1NjblsYdTPo
         Rmgbk2f6gWQ6GVis8NjTVCs24Dte+htH0rkd9FjkEVI+G6Xoq/cSfmgs5d9hIVfrkY
         XPqiXj4e/jzfE8ZAxakNGXaz7fBmX7T7zkVKURfr8uQ8sGQnePEj7encs2HgHLaPyb
         25pw4/WofLmBXAJa5qTSrXPZVlU4uXKz16kjKl4Hsb9yHkfe0beSMxCoesc4B+9OoA
         lObrNKgmfuILQ==
Date:   Mon, 4 May 2020 11:47:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200504114756.37a4948a@canb.auug.org.au>
In-Reply-To: <20200504114625.1de2c54d@canb.auug.org.au>
References: <20200504114625.1de2c54d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/imELpKR2Fv_3sAw7QIfcvPa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/imELpKR2Fv_3sAw7QIfcvPa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just adding cc]

On Mon, 4 May 2020 11:46:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the char-misc tree, Friday's linux-next build (arm64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "zynqmp_pm_fpga_get_status" [drivers/fpga/zynqmp-fpga.ko]=
 undefined!
> ERROR: modpost: "zynqmp_pm_fpga_load" [drivers/fpga/zynqmp-fpga.ko] undef=
ined!
>=20
> Presumably caused by commit
>=20
>   4db8180ffe7c ("firmware: xilinx: Remove eemi ops for fpga related APIs")
>=20
> Reported-by: "kernelci.org bot" <bot@kernelci.org>

--=20
Cheers,
Stephen Rothwell

--Sig_/imELpKR2Fv_3sAw7QIfcvPa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6vdE0ACgkQAVBC80lX
0Gz/rQgAluC36gCZ6TxV2TcfXSukD9usSV59t7ToE7WKHGBx/JDMn5N7YV8vkktv
FrrTZsSt2gVx+6jCm+6IIHfK0QAqAPoz94idSF0E5CsVfVc8cdilaHnSOCN+iBbi
xqFCOXOcLgBB4aWeq0eCL8vOjgEKThgDpH/iIxO6SCHuksWJQEW2GKbq+0bstJN/
Z+miv+7fW/oVlb+Olj9j0p3vXy2dBhVtzXoAzTwPNWWn8XHg81l21x4XNaq42Fq4
F5/8ZLv68iGjBUiX/jWE2E17mPqYHNObg0Ja55AshE14K+2gZjV1MSXWcYS6WGob
97lCdc+sygdVVEmrCp/sL+OMoMO8fQ==
=GvEu
-----END PGP SIGNATURE-----

--Sig_/imELpKR2Fv_3sAw7QIfcvPa--
