Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB41416D17
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 09:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbhIXHud (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 03:50:33 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53761 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235134AbhIXHud (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Sep 2021 03:50:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 2F7AD5C0216;
        Fri, 24 Sep 2021 03:49:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 24 Sep 2021 03:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=CYsnlI2TOREautDzdX9IkAlKDp8
        cuF8mUK8S35XXosc=; b=D7E6W87CcIHZP9zPUeh5uN4lwWH/PLuEHqa+qSrmiNf
        g1Yp9m23CsaBQR3ZiFbvTb0VonyW1YTo3ASQFQ3E+H/mJV0ozCex0RebpCsdOxup
        pRV26VdNXiJghkfG+wYd0lk3w2NqxK91Gx6BYXbC34gj+oxev+o8nFJSo7d8yxGe
        d0Bv1F7ISGqCQzJVmVzArgO6oWxRELV2T6QROrGVWZrYB7CqSAp1hR+q9vOKSi2o
        KZnnlUO5WQwZg1h3AJQTQnPFZ3zJ4CGTnDgwp3JND/1iiU/sXVVDX6KCjwhNRA4C
        eK1hdwV1KIpxXke054HXEDm3dHkfDvKk+UwfG//7ojA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CYsnlI
        2TOREautDzdX9IkAlKDp8cuF8mUK8S35XXosc=; b=lZ1d52RM5TM2JXkCsd5JNO
        7vuSywEA13d7LGwcQKqSuidVA7+r450jjS9ALH6m4eXFyshPH+yFUJ28Is42CbUJ
        SZ/9B0Q88uVrQP+WBnQOUR8l1Os7OPBBwNzT0A3M2Bb+HpmJ4GqpM38lyfqMAHD3
        y9RY+kjG62CykO/F9gR7/KiDdykSh+5tz29AsnJLT8AE859zSwsFbNQPc2sGZjNp
        K8oSv/JS/J/d+XD1rs5pd+NqPYzPF9Vx0V2sA/1evq3ZhEbqpiE5DY3Iqua/cTD8
        rDWo8GzQXB8t3dDbN0dWQsjpdKQfW/DOmLmbv3CRdfNWfcgbGl0MbNlcgBu/kwqQ
        ==
X-ME-Sender: <xms:64JNYRyihrMq5riaS6s-5EMQIdK2I-mT_NT10Qc-jXu7vNfqW8NfPQ>
    <xme:64JNYRRKvmeuu8cylz6GgHtq-HFFPwqIHxwXKvzr7lOT2tUl4VNWYD1dJS7Bo5hUf
    fNt-6_kMzPni67Cpmc>
X-ME-Received: <xmr:64JNYbXaY7y3MkY9QR7-W9FiJX46NnIUPNRu2JA569bnjYKEU-fo3wPp17KCZqMLLlQ407WIAFYXk-Yz73E9huM8SzZ88nqtShjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:64JNYTgpwsZmo9wFR-cE6miLSdENnIy7Lf7G61LOTm3IS0yRmzkcPQ>
    <xmx:64JNYTChl92mlQVJDvsggDknSolbJyV8V9awcSJy7ORRhzJmtFqV_Q>
    <xmx:64JNYcJdh02UN7_8FAy5DJR8KEb1UV1tjSCvZ8qHM6G3Q9UCkuhskQ>
    <xmx:7IJNYaP5YAK9cwLe1BT9P9gU5_lCH3kxQhJADX2xR4fjZwO2F2ikKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:48:59 -0400 (EDT)
Date:   Fri, 24 Sep 2021 09:48:57 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Sep 24 (m68k allmodconfig & drm/vc4/)
Message-ID: <20210924074857.qbwdammzfujk4ozi@gilmour>
References: <20210924145436.5ff73179@canb.auug.org.au>
 <dfd54a2f-d1db-8897-ae49-5c681a99b281@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3l4qd4pk6eblsdeu"
Content-Disposition: inline
In-Reply-To: <dfd54a2f-d1db-8897-ae49-5c681a99b281@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--3l4qd4pk6eblsdeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 23, 2021 at 10:54:49PM -0700, Randy Dunlap wrote:
> On 9/23/21 9:54 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20210923:
> >=20
>=20
> from commit 36e9bcb8edfc in linux-next:
>=20
>=20
> m68k allmodconfig:
>=20
> WARNING: unmet direct dependencies detected for PM
>   Depends on [n]: !MMU [=3Dy]
>   Selected by [m]:
>   - DRM_VC4 [=3Dm] && HAS_IOMEM [=3Dy] && (ARCH_BCM || ARCH_BCM2835 || CO=
MPILE_TEST [=3Dy]) && DRM [=3Dm] && SND [=3Dm] && SND_SOC [=3Dm] && COMMON_=
CLK [=3Dy]

I don't really know how to fix this one, should we move that select to
the ARCH_* symbol, or something else?

Maxime

--3l4qd4pk6eblsdeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYU2C6QAKCRDj7w1vZxhR
xbhOAP9wqjprtosO+DXBEgOWKMaOSeej4y9X7sgF4o+X0vsbaQD/XwUgtlKemnhY
btddpc2tWAWIE2P9naqIRXEXY3artQs=
=ED4l
-----END PGP SIGNATURE-----

--3l4qd4pk6eblsdeu--
