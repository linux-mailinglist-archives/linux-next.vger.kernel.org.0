Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F7D27FCA2
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 11:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbgJAJri (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 05:47:38 -0400
Received: from ozlabs.org ([203.11.71.1]:55459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731548AbgJAJri (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 05:47:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C27Zt24QNz9sTs;
        Thu,  1 Oct 2020 19:47:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601545656;
        bh=V0tr4aRqa3cn2uZubzKdVVlKtKcpfmeVwqwH476qMXI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J2PZSNgiHj2B4SSBKhQCpk/BPTj0eYi9e1NRgw8sRBzebnJLV0MrWOnsYObYrgd8I
         XVSnuJysj5p/koC9y/GbXhV9k9dbvPAmdnQQBrdtnVu/Dfa7c2NB63pdnVaDB/tfHG
         0bR5QabUg9X8s9YeskcGJbhq2ZYNsO+XOGrZeYJLUNaqZjahOwHj7CrT+/NS69qaGC
         qXNcryB3/OMs6rfFu40uPfN/CdFPj+1TmQ+RXAg8+7NJpup6IX8mTgK4isxY6sgA81
         f6oRjEncMdCJUTOxsZR0/QIZHQNuIhg1NCc1c4GgOr8rCrzhwo7l3z/YBgEtUGKjBJ
         rPn0x+QMD44fg==
Date:   Thu, 1 Oct 2020 19:47:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Swapnil Jakhade <sjakhade@cadence.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20201001194733.24a50013@canb.auug.org.au>
In-Reply-To: <20200923133601.293b4fe6@canb.auug.org.au>
References: <20200923133601.293b4fe6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e/DH.PyW1L/Y=Dkh5cEnq82";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e/DH.PyW1L/Y=Dkh5cEnq82
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Sep 2020 13:36:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mh=
dp_fw_activate':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conv=
ersion from 'long unsigned int' to 'unsigned int' changes value from '18446=
744073709551613' to '4294967293' [-Woverflow]
>   751 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mh=
dp_attach':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1692:10: warning: con=
version from 'long unsigned int' to 'unsigned int' changes value from '1844=
6744073709551613' to '4294967293' [-Woverflow]
>  1692 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mh=
dp_bridge_hpd_enable':
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2125:10: warning: con=
version from 'long unsigned int' to 'unsigned int' changes value from '1844=
6744073709551613' to '4294967293' [-Woverflow]
>  2125 |   writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
>=20
> Introduced by commit
>=20
>   fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bri=
dge")

I am still getting these warnings ...

--=20
Cheers,
Stephen Rothwell

--Sig_/e/DH.PyW1L/Y=Dkh5cEnq82
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91pbUACgkQAVBC80lX
0Gzt3Af9FyxeIldY73Se7kwc2Jy8AGCv0nzWifbR5VaCpAa8KhW3+Ds5uGaqAX0C
mRemqKIrS+QWHMeR3Jl/Z2bM0n6r5Jvmy76szIjxWih2C3IC+lzAAOm1ry0Og+7y
XYtnzqgKRzv7BolE1s+UTWNQu9ggXCBMUIvXHlSdkQ1QWbaO9eqMTB4VA7aj8TXw
2HM2bX9JuilM4olLitzwSIBXuT57VafoKd8KCwidjKyi7XtfJ74Jz8rpf2znpEkt
dM+x/my7HWOY8xSL2PxOM/ohGaTlplMwevdLYoelLneSBEmYuaQdgzRok7qAPsLr
kXh0k3rBtre44P587LW8WFBtA137pg==
=9RKw
-----END PGP SIGNATURE-----

--Sig_/e/DH.PyW1L/Y=Dkh5cEnq82--
