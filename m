Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 463E5FD97B
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 10:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfKOJlw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 04:41:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44904 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJlw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 04:41:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id f2so10205052wrs.11;
        Fri, 15 Nov 2019 01:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=raVzr0tabM83QSHsfKixBwNELZO9Vyk/jj/E9lAiCR0=;
        b=oFnfgMzxXOQxedprb3Mk34PO+0v/RYSoPBLuk85J7t79gw7Gi90N3jwImfyiwFBVZR
         wpukRr0ql+txojQU66IGeSyxhfw60CPuVATdm1AHAVcHP/dQXo7bPGQwKnAbNNJtZ+eV
         5q0grTb7nPGexVLjRRwpC2qyBoqLpskJ2+tYfTPFNPhuZ3QGLrI3yzhbwD1Hee+QK5uW
         UrM/bxsLer/roM2ZXl4gW7SnHNkmFxWwPjw/5NPX1c4nNYdyrpStaohT+2nKIHNDhqW9
         y/nPY2AlDO/mJtkdeKxxyIIpo6YbYay+LUkmmtKuRiomE59P39p3V6L1WHCsy3HobMqA
         WkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=raVzr0tabM83QSHsfKixBwNELZO9Vyk/jj/E9lAiCR0=;
        b=FyfCN9FOj94EnmzNvCxoWWA5I0Uo9b4X+0dglHFPGl/8D/9sri+9rPwZzs4mwQymF3
         EoKyWl2KWMptigRaIC1N3NmIZAd/0o+nQUQeb84HinXrP0F+7qyhnJT8HIsnTH+lZ21a
         hoBjiypConNtceEtIez/bvi/BQOvntDzZYOic8PwpS5vW79+giW6HOBPA9h81UNxFR3e
         B+WxkPS2TEEKu27QKMmgoZXuDwDbxNqcyVSa15tXYXeV3aG83204yBomNKSKGinWVwjw
         kJ7j8/5WfaIedkeCoPTiuLQZoQJgB1HRO5lnlIwrbdwq2J7N2hmgisVqfbuFU6PqWDwM
         OiBQ==
X-Gm-Message-State: APjAAAVZCq+lus6mOJJ/tFEdFNzUOI7hjQLoCQ7KGh6qYRjVVuDqScbl
        7xv+50EZzEUatqi2d81Z6Wk=
X-Google-Smtp-Source: APXvYqx14cOUJJjazUVP2HLAukJO7YcUgUQgkmxMJqpI8QWaa3dfienDYjxLvA3edilyh0uFlMU+WQ==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr13829654wrr.214.1573810910077;
        Fri, 15 Nov 2019 01:41:50 -0800 (PST)
Received: from localhost ([46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w81sm10504669wmg.5.2019.11.15.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 01:41:48 -0800 (PST)
Date:   Fri, 15 Nov 2019 10:41:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: linux-next: manual merge of the pwm tree with the devicetree tree
Message-ID: <20191115094141.GA825257@ulmo>
References: <20191115154456.244c27e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20191115154456.244c27e4@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 03:44:56PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the pwm tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/pwm/pwm-stm32.txt
>=20
> between commit:
>=20
>   56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings to json-=
schema")
>=20
> from the devicetree tree and commit:
>=20
>   4205e356285e ("dt-bindings: pwm-stm32: Document pinctrl sleep state")
>=20
> from the pwm tree.
>=20
> I fixed it up (I just deleted the file - more fixup is probably required)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

It should be trivial to rewrite the sleep state patch on top of the
json-schema conversion and then take that version into the devicetree
tree.

Fabrice, can you resend that patch based on the devicetree tree?

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3OctIACgkQ3SOs138+
s6ERjA/+MZo1LpZ+YQB6Ncd81YjhN80RZ1LbNTpoDJYuCNYW7I/66ZiccYv8gQJo
n34kwYW4tVMMP8Apj0hfB+t3P7Z/YEwkNlK9dvVZtt2fYVjBvbldtw6FloVfbKwH
2ygGCJ/kse/Ginus9RjWWnLKpgDEODA34oyL5Ctf6sE2+RKhMUbPmsBCC2YSM1ZI
4Zgu5rFY4BdYRzmjbk3gCNaSCy15lotIy/lO3GGmsQvesIMiFu+r6/7qufNyLrPS
EjpPg1/ijacFClElyd5dtDUO8LplzO5T6VIIYNji/iG5GUVw1lrlRa467zTSa6Q7
70/F9L1YnQMEZZo/NEt+4a2oN30ZTbkX7ARcnO61xqchwXEa+NO9YU6PGGo/7Loa
k9l24F0+FNgQNraVCnPcXCYjC1D53DFfUAjDZIGMmeVDj6eDQztZShDJ9H1ObbMQ
yNJNDn1LgwT+tC4ONL9qcu3Z5Hhd8exk6s1vhtKNT5hYm7FMxTNDpfeqGmTpZuDB
w61zmQ1PIyywqV/G7YH6zgQKSDuxtxqZnntobsIR0KMsm53w8Ps8QvlFGz2Cjgh8
KOqbnFNoEjSvzMYwHsIEuetfZtxj3bv9zJGX3a45GDMSThoAEkBIIv9FRLFllAYU
Atmwfxg+tkaqg6ePpwa9G6ZkWAYXN0sH5noud56Ravh6uhNH9Bk=
=Ancq
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
