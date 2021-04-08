Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF31357BA0
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 06:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhDHE6J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 00:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhDHE6G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 00:58:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A92CC061760;
        Wed,  7 Apr 2021 21:57:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FG8CJ3xPdz9sV5;
        Thu,  8 Apr 2021 14:57:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617857869;
        bh=1mwdPy0riEqigaxUtYaZ41Qx/2YCuxBzqsLf+zbkIp4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eKyQISAfgMalEy6ok1zIGiYZEsf8ggIGN45COflTKKv4P+bAE9L2db+4LtjjDu2Fr
         uiL6vxqbp9CAfrMRSNP8rhoJ8PiA5qdGJLXiPtmKpU8k31CjikddkhKLBzsccl9T3d
         YklLkk0TN49mZJqhFUWp+mSUIlX+xAelJNu4H/HlvPQ2eVw4gS5a9lWuHV/EC6vWW9
         5z/z2eM/KwfEHJUeAXs619Et4ikzdP5TxaUnABqm0N0Okw4ORzoJ7s6VHRP+vaOAYU
         ELYxxgoqz1K6OZeyEIeFSc+DYgIU2U2/JlDXmBZmzjBNx0EwK7hRj1OtusLnOMWPvk
         Ffe5qg0dcmtVA==
Date:   Thu, 8 Apr 2021 14:57:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Von Dentz, Luiz" <luiz.von.dentz@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20210408145747.1ed7c57e@canb.auug.org.au>
In-Reply-To: <PH0PR11MB5126EFEDB65650EFC3368981D3749@PH0PR11MB5126.namprd11.prod.outlook.com>
References: <PH0PR11MB5126EFEDB65650EFC3368981D3749@PH0PR11MB5126.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4V.hV7W0JZuRwmTJ.gTX.4X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4V.hV7W0JZuRwmTJ.gTX.4X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

On Thu, 8 Apr 2021 04:47:04 +0000 "Von Dentz, Luiz" <luiz.von.dentz@intel.c=
om> wrote:
>
> I'd leave this for Marcel to comments, but there are quite many
> instances of // comment like that, so I wonder what is going on, or
> perhaps that is not allowed in include/uapi?

We only do these standalone compile checks on the uapi header files.

--=20
Cheers,
Stephen Rothwell

--Sig_/4V.hV7W0JZuRwmTJ.gTX.4X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBujUsACgkQAVBC80lX
0GxjsAf/X2jRYLLEz+/16GpEYB1+EMCvq9ktvUJTS6zTuwkSWx/EkXSviF86tx0P
HbF2c1+HF6CfazTqIW4HJlubM5LptJg1OUSOjExDcn6rqSTqP7vlWoHYQ08rBbDG
xO6/ruCEowiXSgJKrCzGEIzDeXuHWpZuzvD5tNj3yNjmJgbv+XwV7jroNtKYCOPD
D6b6Ats4CTsfoYzUzQCTp+ypvIwIYQqEAM2s9I2W67ohbG9nZb6cHYk2D9k0JnwD
foelyXZvSxmlcPFW2qi6iNwFgXCrBEmMTfgy7NOJ/MkiL7wuJqwzlrmhQwwGkjij
UrcCB/MHBNeO9qU86QIOyRqSnF91ow==
=e3Bx
-----END PGP SIGNATURE-----

--Sig_/4V.hV7W0JZuRwmTJ.gTX.4X--
