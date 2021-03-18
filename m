Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B583402CE
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 11:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCRKKQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 06:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCRKJw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 06:09:52 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D9FC06175F;
        Thu, 18 Mar 2021 03:09:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1N71740sz9sWb;
        Thu, 18 Mar 2021 21:09:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616062190;
        bh=MfEXBGI/BRQ9/m2xUW0h7ZFQERIqkbPM0cTl0HbiSNI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=enMN+FxQpiKGEIpUDk1vHFPf4KcPcUDiYukHNbh2RWUDxTD0fbqcR2tm1SqO16MMO
         XSX/pzsn4qsP4bgHluaHpT/B7+4yqTpPbSSv/JQZTgwGryhC/l4RUAxVGkTYqeKMZf
         bwPr7D1p8N8cZvtmkGLa4ZE7pQMli4r6eorLV9c/sSlW8ru9DpK+7YLBgaCCP83HnG
         bcop2BlTpV/5afVTgQq1yxUjrySxMPGi2ZpAQSpTXYzrhLTPplSZjp82bn5iRiOKul
         so5xxg5QJ1XpMQpIdvToypIJZnfEKdRMoWEmS1zhQWpoG1bfcPu1G5Wli0yM1oar6C
         OJnWL1N2gIhtA==
Date:   Thu, 18 Mar 2021 21:09:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18
Message-ID: <20210318210949.621473eb@canb.auug.org.au>
In-Reply-To: <20210318210844.5e9adf1e@canb.auug.org.au>
References: <20210318210844.5e9adf1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p6RXfhW4dOJGOxCqzmJSE_V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p6RXfhW4dOJGOxCqzmJSE_V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Mar 2021 21:08:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> News: there will be no linux-next release on Friday this week.

That is no longer true, there will be a release tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/p6RXfhW4dOJGOxCqzmJSE_V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBTJu0ACgkQAVBC80lX
0GyrNwf5AZe37QNKbngQjoTftZkWiEAKUQiqGOvbJ3ADUAgVOIkFJGGfHABM3QLh
fWmKTTb1aifuxwEjDMF5D+rdGtxnKvDBX/Y+Oz3cvUksfpulbawZqHM7PPceOHV7
NvJcmWfIDeuIgcRKe6l1/VQhS5cJWDIGgDmTqQ86tsh0DzikXN+LkKx0S2NK7cNf
Svg1W/30SVyeZyEgp+QAO28ZavrhrmWmVUAVe0AHQ3ILBbdRVZlu+XzLwlsclVBV
aMdpN1rHq3dm5m9lbjk0kCvKqz1aGNQNIhqlX6qWgzV7O55IgYwS9sN0gphF42Er
gXHAqDsvM5XBCRD4IXLPwFxxSJQS6A==
=/PRD
-----END PGP SIGNATURE-----

--Sig_/p6RXfhW4dOJGOxCqzmJSE_V--
