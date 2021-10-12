Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002B6429B78
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 04:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhJLC1b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 22:27:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45149 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhJLC1b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 22:27:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSzzD5BjWz4xbX;
        Tue, 12 Oct 2021 13:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634005529;
        bh=vddGlHYjaDL79x4gwUeZCao6d9EjDoSt7eNrGFjNSDA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DKZTOV9ZP8MP82gJvom7TTHGfKDnYVAlJcXZE0SoiiQcnapIUvR6APo99W+rMA1re
         UwnaR1t+zUnbWpE+rtt14sE3e0rPjxAAH1EKyBU6wrwFu1zWWqaKl+3xI1QTCVJBdH
         EO3SBflHVUhSpZO6DGc7SVUdKj0g/yj1ef9Yu/zl4AIoYO6JU/hLB7bsUcZxPGdOMA
         g5Z/+6nixDCIZlATu/C+wTM0GDcYWkx/85sXgVMsK8Tr+QIl8WaV2Y81TLykbwRFvI
         I7zvxbDAGdY3ZaQ5gh3D6adFyEZwx9XoukApGOr1nsZnOW0S70Kluq8nb0hlnagJGy
         F/AZBbftEuLug==
Date:   Tue, 12 Oct 2021 13:25:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211012132526.237d8f6e@canb.auug.org.au>
In-Reply-To: <20211008113116.4bdd7b6c@canb.auug.org.au>
References: <20211008113116.4bdd7b6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vg1tVp.+yqGP=hiiZCu_N_1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vg1tVp.+yqGP=hiiZCu_N_1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 8 Oct 2021 11:31:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "get_mm_exe_file" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] =
undefined!
>=20
> Caused by commit
>=20
>   f4f80155e6e8 ("amd/display: only require overlay plane to cover whole C=
RTC on ChromeOS")
>=20
> I have used the amdgpu tree from next-20211007 for today.

This failure has returned today ...
--=20
Cheers,
Stephen Rothwell

--Sig_/Vg1tVp.+yqGP=hiiZCu_N_1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFk8hYACgkQAVBC80lX
0Gz4sQf9FVfINcnivq0DM3nsj9CewzD1JLUNXVCM7ti/bld4UXdQjEFABAt8CTKR
Ovmpqir7iohkgNDMMQ6r4huW7Y0QxTuRg7spqs/KNFXrVXPDL5nlfzrm3Wi8xHIK
lSfmI9C8YV6/TwLonC7VvDgGZN27FNw6Wlg1Gf/XRK6rT0wyZ2d9uOEsI04xjpNo
ZmfKFXE1FVOhzNbHUZgS9GVOxg7ZPjlAyhnY/0HCa7SMl0rf/1Gfo8bylZ/67Abm
OP/HacdTl26fvXESWQ2r98YjkDEzqtUxdqi3QcuJnlTXNMT8eGFytt0TbksFVnln
tfe+y+7GcvFz4Q4GGj3mIECWRyduPA==
=gEVI
-----END PGP SIGNATURE-----

--Sig_/Vg1tVp.+yqGP=hiiZCu_N_1--
