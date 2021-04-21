Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4436658B
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhDUGk7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:40:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhDUGk7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 02:40:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9sj2J9wz9t17;
        Wed, 21 Apr 2021 16:40:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618987225;
        bh=XsDHO0Oy5yGJAE5kU0AI5Ee3CCMoeO3Dzo0AXAGdG5w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p79o4cZ731SOoEY3IlZpt6l8ienuP+OmVFEqj/U6QJMNliWTIVgKrBfr94ZrV1/1T
         C3tD8dkJQ0iJWR3tZ445YjAGSfm8zm/GrhvtfUtKYMx+8do6cYl/NloJwWFmta83MF
         Z2BSM9ojG4xjL4+uwzFW8iTXpRwguTHWESnciLT3mDe+A4vptOBPQDLaUghL5b9lvt
         oR7BPC3EblIJtHKomGs2IHiTejORB1vo3x5YNquLkFfc62iWRzlkO+JSKtCHoVqBFc
         X8IzS5eL6ECRjJowHj+y5caHVLUQ5aaPe9+NqkjiUiPdq9lp9kuOoPQRfTRAZv4Mwm
         XiWHZHLG0MhAA==
Date:   Wed, 21 Apr 2021 16:40:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Prike Liang <Prike.Liang@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210421164024.42bc068f@canb.auug.org.au>
In-Reply-To: <20210416124044.53d4beee@canb.auug.org.au>
References: <20210416124044.53d4beee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qlAOkY._IzDXxqlncDoTl+q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qlAOkY._IzDXxqlncDoTl+q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 Apr 2021 12:40:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
> drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-va=
riable]
>   312 |  struct pci_dev *rdev;
>       |                  ^~~~
>=20
> Introduced by commit
>=20
>   9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to simple=
 suspend/resume path")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/qlAOkY._IzDXxqlncDoTl+q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/yNgACgkQAVBC80lX
0GzqqQf/eDjklTlIPHFc2K9mgY05ort42+zD3LPeSUbjOCf98KDaIi5a6il1S+2Y
fRNejS72os+i9zoEiRPhZIDe8PY065ysSv3SO56NcYjyhVCzf9OKzU+a4qM8xY9I
XQ66Zq1Gpg5GNxW0D9FM4Z6RGKnJtskCYCP2Gg+F7vyXQXcg2xUeYIvUgARobX8N
knrqUYHiAJ4BKBFuAx9YbiWvNmYfUHJJEMUVUAHvb6f9RHlcd1fm5Bly4k9hTC5A
r5YJ+yAibYR6j2n7/8WLuN0X4lqbk4JMm/ImRqzUO9OJgTtwMfGn6inRvuQSUjHS
zjcTalgk/SubMOXqsG0tErJQaS7ulg==
=pQ+e
-----END PGP SIGNATURE-----

--Sig_/qlAOkY._IzDXxqlncDoTl+q--
