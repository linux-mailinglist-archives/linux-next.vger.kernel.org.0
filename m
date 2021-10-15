Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FF342EEB7
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 12:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhJOK0R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 06:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhJOK0R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 06:26:17 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1400C061570;
        Fri, 15 Oct 2021 03:24:10 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4HW2S13FD3z101M;
        Fri, 15 Oct 2021 21:24:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
        s=201702; t=1634293443;
        bh=tepJe4AXXxss/DiAoGZR08QB5qtGDqWnkQk6fLoZ39o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UzXkr8yt/ZzXjeAilE9mwRB87eXjfTUhvt6kRbgUvMg1YWSg8Llkt88gdbMLEOs2U
         y9LLxjqP5hHrBAi24C/ME2pTa9LUEIlEDCt4mL6YY/uluom1/jwPQBrBqgx8L2OurL
         OD7QsJXUXNXVyTt8n5P9jrf+KAWBXesq//YhO8QIZl7m5eA3BBaCQDqXtW3Aq0Gpos
         /i314NHc1lXIQiZdDsAMxso4F9hxeLT5GF9yOV5EaWcM+wIGU9MqHlVeGppPZi42oS
         oIWWxoqnCOjZFJyMRpCWS9QxGgddIInlSYqGXOzgH5CyCLYBCjX6xSflsVgMEPod63
         cD93pKWVrPwhA==
Date:   Fri, 15 Oct 2021 21:23:59 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211015212359.30e2fb01@elm.ozlabs.ibm.com>
In-Reply-To: <87h7divcet.fsf@intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
        <87h7divcet.fsf@intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9bo9n8X6MVEuaY_0YZ+30wy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 15 Oct 2021 12:56:58 +0300 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> The fix looks good, but I'd rename __stack_depot_print too added in the
> same commit. Do you want to respin or shall I take it from here?

If you are happy to take it on, then thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpVr8ACgkQAVBC80lX
0GwUcgf/c+KVcX32awGERmuiAMlIyuV579fRV+2X98LX/oqdTTurqeHrABVDPZii
g+1XP5IQ/l0buN7ELXLWQQqVK2p9VJHBii9/F/Qth1g69JqaTPbo9qBbrzaxWtnc
c+NFNr15G3/t9DGH286JE1W6q0EeQ17j/X47D4UWwpXVRryCrCfjAHgBpykThswA
gAZ0YplO+TsLanJ12oFxEATntf5zaO1ZCzbqYvsbUxcVcfr59OD21HzaOjKlY+Uo
37c9JVzpOWnvHv1A9N96ipw492H8EEjRAr/TLh7vjJDNJN/JkGXBlDQj7RxcHUNW
EnmZ3aoYZJXncCm44D8cgtmxLRnQKQ==
=RJqB
-----END PGP SIGNATURE-----

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy--
