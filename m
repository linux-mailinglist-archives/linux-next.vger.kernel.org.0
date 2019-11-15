Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889F8FD98E
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 10:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfKOJnu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 04:43:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35064 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbfKOJnu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 04:43:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id 8so9640984wmo.0;
        Fri, 15 Nov 2019 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wg7FNix1Jqxyd3+V87DQuRBKrAOq/JYYbkWOtaNuI44=;
        b=qk71OzDyJKtSIFpughMpiWzoqWg79C5iZUEu8+2UgcBySK/DuDD2Kg/+/jjuqy0fdv
         sxMpzhFtpOftP+jUOwfmqM6K2tkhJsDfBmmL2dMqwe4ZaN2QPj2/6N56f9wcFVrwn5Tg
         5Nl2HkoVDAhf00UvFoPvnQaayBoXklmlbP1wlvY5R6ML+ixEvnNT1P5vDJl1nsODNkKs
         d8rWlqb4+l80xZ/6uqOdGtyxQ5lmCUSTm8M4+l7sdx/KxD+IyjavKj7PQWsz4Sk+WIk4
         PazD3Ekkz3sWUusC/FmIrifA2X5HO3JADrkEdQtsdkyuYdWnBUh55EKAp3S2LLYAbwSw
         N7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wg7FNix1Jqxyd3+V87DQuRBKrAOq/JYYbkWOtaNuI44=;
        b=X4uG97LFA1UEmc8LRo/c6xq6sGIz2oJFR7Ngd3k2GT2uLKDvpAo+0+J+adQParA9lE
         vOTeVcp+z0N1UMlX2mnDkTc3+xA8wCAS2x1k7K82nIs8JZeyqG/jia79uQqa6kc7MwvW
         s0OjsHO7XEsqWvIfa9VptaiXl3PZGlYcnXvDkkhr36m3a1LUjx2YJfJIbHBYkP+NBk2v
         itUQV2itqKfPb27h0qkWdnjkYquTld/08aWLeausG1NN86BLaIqc1Orhm4xiW/zRVxST
         pFWIJLCO2mWvLehSvLQcIUWyq0kRSEquiUgK79TlMZQfSopO8UV+jdfCZev6asiFAzd6
         4Tsw==
X-Gm-Message-State: APjAAAXteZFxz4YycizyIDp/zbT+r0vFEqQdnW3Ad/hBW3rXHG4wZRjK
        QABBfzfbaMSl/Ag4B67Kg3A=
X-Google-Smtp-Source: APXvYqzze598Otbd7SSxMRO29UJcONoMxnqGrlWshCDotRgcF2WDEJEBLbpwZ77+8+a+qMwvZhHDqA==
X-Received: by 2002:a1c:10a:: with SMTP id 10mr13539245wmb.17.1573811028238;
        Fri, 15 Nov 2019 01:43:48 -0800 (PST)
Received: from localhost ([46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w18sm10881620wrp.31.2019.11.15.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 01:43:46 -0800 (PST)
Date:   Fri, 15 Nov 2019 10:43:40 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the clk tree with the tegra tree
Message-ID: <20191115094340.GB825257@ulmo>
References: <20191115092606.79a65342@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20191115092606.79a65342@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 09:26:06AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the clk tree got conflicts in:
>=20
>   include/linux/clk-provider.h
>   drivers/clk/tegra/clk-super.c
>   drivers/clk/tegra/clk-sdmmc-mux.c
>   drivers/clk/tegra/clk-periph.c
>   drivers/clk/clk.c
>=20
> between commits:
>=20
>   929490c73870 ("clk: tegra: periph: Add restore_context support")
>   02ee6fe5e67a ("clk: tegra: clk-super: Fix to enable PLLP branches to CP=
U")
>   175ea1f93c33 ("clk: tegra: clk-super: Add restore-context support")
>   837d3fa941cd ("clk: Add API to get index of the clock parent")
>=20
> from the tegra tree and commits:
>=20
>   68a14a5634da ("clk: tegra: clk-super: Fix to enable PLLP branches to CP=
U")
>   f8fd97521d63 ("clk: tegra: clk-super: Add restore-context support")
>   2b8cfd6b52cb ("clk: tegra: periph: Add restore_context support")
>   d9b86cc48283 ("clk: Add API to get index of the clock parent")
>=20
> from the clk tree.
>=20
> These are different version of the same patches (presumably).
>=20
> I fixed it up (I just used the versions from the clk tree (since even
> though the commits have the smae author dates, the clk tree versions were
> committed later) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

The versions from the clk tree are the correct ones. I forgot to rebuild
the tegra/for-next branch based on the updated clk branches that Stephen
merged.

I've done that now, so the conflicts should be gone now.

Thierry

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Oc0wACgkQ3SOs138+
s6F29g/+LMl2R3wiW/EyxGpgRsLMKFYrIBZ0bvqMohEANh7azORBUTeM+u155t+c
WyL+e76+Zhgz9wL1mZdcqSswwrieJRUcliqluKM8laEcWO5AKGNVRq1sCzaViUlh
WdHlRTueKWb3ggD55HkuBBC9JEGQVV4WMskzQlR4ILT1dI37vR15SLnZg8iNS76P
yl+qjqyMOiiAcJDLLq0bkqSk7hnfdYSSF7X8V+CaXcotNzSRUn9fpbEblEPqQ8X6
/Bu0hx+f/pUgZY5EMRDZ5Whm1660qhdmIOUmTEgGFLNEq4gChInrpNUsFCv9YFu+
6e1swUH1xwYivSMhIsk/KceQSxa8zY1hyksTsvxqYdO659KLRZze+uO5ZNVeRn5J
3EgQPywFSMHPgUK+OhC8St6UUaSnZpUSE8DKWrlppUnDNWsSWGSWPVR538J3gBDq
GW7VHKLmS/5tshbjcc3KS1gPWXcsMvtpTFR3+aMNCOtryt6KLTRRPJTycj1dWCXr
DpCLXsrcwNZs/7xsSR43lWgL+i8Hvu/O+v2yrPU+NknsgxdTIZGa/1pdVQZXoqdY
/9/RyKqaYlcCjeWpndS1Thmgq9BeJrB4kQXsQyWdyd2e8UgFAP+Ra3xxfqniT51j
c+ltdLMWIXSQoJqHrjeoG3OavWO1cy2j6LMLdZsH0PEw4FYP4lU=
=ONGP
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
