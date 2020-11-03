Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24602A4065
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 10:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgKCJgI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 04:36:08 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37069 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgKCJgI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 04:36:08 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 9F2B647B;
        Tue,  3 Nov 2020 04:36:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 03 Nov 2020 04:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=JxU4guRP0kokkXgNKXrKatN5k3v
        smVhnFnCYvoqD/QA=; b=CTkd6WvjWIpgaP7CXxIemCJLc9bT8akFL3sq1vB4oiT
        QW7ILahxaxyJ2dhPmQ1JF6bJ/I+e56o23kBcKeT1Pl15ylnJB6yvoWCVQZMctDzG
        CLPNFfP+s3bqzk1B4mWDAlgKl27n+uZNqPqEmVKc2IBZwMkshOG9nzbIi2yaf4Wk
        TVfk57WnuO2RfNMD/DVre2yEf7j8Ojhmq3AhhhYBxfJI5KPLXJ3tQU6GmVy/cAwA
        eeVG77Y+1oBhgUltmV+dfMPjgWNhYOlLhJj+D9mvQXhTzAOT93SSVwSjoPrKCWmi
        fe/GmMRZInwrR9/VW5w2LDLKOCMZnhOSs/RdIGJocCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JxU4gu
        RP0kokkXgNKXrKatN5k3vsmVhnFnCYvoqD/QA=; b=ddJQ9Rb9k3rT2qSgeD+nJQ
        nYOEqWxfs5PqONCgtfnGpsYQDbbyV7SHzngtorMVKDstddeVARRXBzyXNAvf56lv
        QEyWdWXhlxUsssUkdhiGmq8tzJfsHBkraqyo4M48DZ6/rClGI3FlouaLSYx6DVBU
        QzCP89u5660+8kEjgSzzyQG1aHZcQl1GaICpEMPxqivePD+WBIeZrVPieONg60vc
        4oWqDxTUTX0VqCxt6gVCP5IsMZxNZvOSslSiRYHZzDqcnO7U2plo9RFKsBg3ba6E
        mE19IrN+G7h4Uk1icEovu4J3UPCmldQxgJn/lg7gl5ui8VW+kfn7N4Ju6xXXQ4LA
        ==
X-ME-Sender: <xms:hSShX-9JqxH3mzEIKNwd5Wi0aNl4YxGJ7qoDfDLmWNuq5KSvlBD0RA>
    <xme:hSShX-tQpRzQzNjsYVZixEJqtz8dTfEWhW2t5ukaCEJ8HwIc06MyLNvpXus269KBr
    lx5lxU8FFtABR8seCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hSShX0DuGhN4hN75UK9w7o6-RYGaQiGZ5xSDKkRGVpcd_WStCDOtPA>
    <xmx:hSShX2ddaLxlo4K16R5o3m5srECuuEeqbFIDFcwSBelLMA1gXQlv0Q>
    <xmx:hSShXzMTkqWqVhuvg-cM72ck0Tj5cgqtP89OdHgz3nKMBshKRYuGMg>
    <xmx:hiShX8r4L9_4OYfjp2n-brspBy4QnC9A0-bIyJLvUoqgnn7iOF7g4w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0F7ED3280065;
        Tue,  3 Nov 2020 04:36:04 -0500 (EST)
Date:   Tue, 3 Nov 2020 10:36:03 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20201103093603.mzmcvbzmna77vh4r@gilmour.lan>
References: <20201103113121.4f1ffe17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gk5a7k24qfabtq46"
Content-Disposition: inline
In-Reply-To: <20201103113121.4f1ffe17@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--gk5a7k24qfabtq46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Nov 03, 2020 at 11:31:21AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/vc4/vc4_drv.c: In function 'vc4_drm_unbind':
> drivers/gpu/drm/vc4/vc4_drv.c:322:18: warning: unused variable 'vc4' [-Wu=
nused-variable]
>   322 |  struct vc4_dev *vc4 =3D to_vc4_dev(drm);
>       |                  ^~~
>=20
> Introduced by commit
>=20
>   dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")

I just pushed a fix for that one, it should be resolved tomorrow

Thanks!
Maxime

--gk5a7k24qfabtq46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EkgwAKCRDj7w1vZxhR
xa7EAP4/4A3YLK6xqMRbgjbgjleRIoIpCAk2DyiaUKp0KsvDhAEApKtHtdCXkKBK
6850n4kdukU0vDfZRT+HksVQqxlitAo=
=5/0a
-----END PGP SIGNATURE-----

--gk5a7k24qfabtq46--
