Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC9F233B73
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 00:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgG3Wjf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 18:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgG3Wjf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 18:39:35 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3E1C061574;
        Thu, 30 Jul 2020 15:39:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHlhd5RX7z9s1x;
        Fri, 31 Jul 2020 08:39:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596148771;
        bh=gdN6/RiIeAEmqzsDtkQE792bclCZDlFCE+lgbehyMWs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J1OtPUmE8FsW4yKUQfeLr+QYLXD4YtnNUk9ORnhmyREdNkTsC8+hAeVKFB9SdDVrW
         IiWpQzThgcl+FHyxiQ2UMLswbDpcuyHtEFxYcojWWJ6bd5MTO2QLyn1r08iW87hfoV
         lY4oiZK8BBG0S3Tw1nbej9Z07bU1nbN7UBV87BcrYnU01rkGiZIBLBf3lWVL9qmP5R
         My+C0b6zFDbmV/7ouWfy8LPD8KDJvTFtuIdvzaFg3mwlJhiRnXlVCmD8BIkU08COTC
         x0HfC6HwGyoinbvMu8LsV5A6y6OeEnz/Lp5Rj9o1Gev+GoCk704CwTpTRoomRvsuOH
         YY2c8fwwiC66Q==
Date:   Fri, 31 Jul 2020 08:39:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build warning after merge of the mips tree
Message-ID: <20200731083928.47bc96f0@canb.auug.org.au>
In-Reply-To: <e8757bd7-e6e6-5181-ef52-7dca0a114360@flygoat.com>
References: <20200729203142.18248463@canb.auug.org.au>
        <f2a9f50d-5299-04f8-146b-e09df8943367@flygoat.com>
        <20200730114023.60317d30@canb.auug.org.au>
        <e8757bd7-e6e6-5181-ef52-7dca0a114360@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9mg_JBgOLSFITTzhywmBXn=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9mg_JBgOLSFITTzhywmBXn=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Jul 2020 09:56:59 +0800 Jiaxun Yang <jiaxun.yang@flygoat.com> wr=
ote:
>
> =E5=9C=A8 2020/7/30 =E4=B8=8A=E5=8D=889:40, Stephen Rothwell =E5=86=99=E9=
=81=93:
> >
> > On Thu, 30 Jul 2020 09:04:40 +0800 Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote: =20
> >> Btw: Neither James nor Ralf is still active at Linux-MIPS. =20
> > Interesting.  I have just them listed as my contacts for MIPS.  Should
> > I change to just Thomes (Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de>)? =20
>=20
> Yes, Thomas is now the sole maintainer of Linux-MIPS.

OK, done.

--=20
Cheers,
Stephen Rothwell

--Sig_/9mg_JBgOLSFITTzhywmBXn=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jTCAACgkQAVBC80lX
0GxDwgf/QvgHksnzySB0BK/amC8jm+MhAsS2E0D/7HExoGDdoxt4sLDimbODdrFY
KYYCdB7nZS4bKiiwDSErUBCyg3qkC5V9hWIFmjRRfhcXlSHSoAXmbkThDBhuFxqD
MEw55qE3PKcaFEowW+p4IRQlGMqEi1cchZgaDbsxGyu7dHVSVwsbX9oRmfDktWBD
okPmME5YPNrIvKa0HD4lxI8sjbo7nuk8SVo7FVwl+Wx0II/DuOOS9WqtlV7+lkBh
d+HevsQ+JcUSAmP+PyZ0ZOIZU8Ep/wq1jTFZiidii85kFZvCeQHKIadEOB8F/5HN
Abl10wKlsP4rN8Go0+4ej6PGt3rhrQ==
=UtbL
-----END PGP SIGNATURE-----

--Sig_/9mg_JBgOLSFITTzhywmBXn=--
