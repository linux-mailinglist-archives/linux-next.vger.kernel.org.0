Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9C54553E3
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 05:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243023AbhKREoe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 23:44:34 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52015 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243026AbhKREo1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 23:44:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvnF22YLkz4xbs;
        Thu, 18 Nov 2021 15:41:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637210486;
        bh=5mHJV7I9AE96H9DFLO24CypX6qPfYRzWjk7GCUDEYv4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EkJKI0fALxdlHZoqWVajZtRU/g14VvNOTTD9wLcM+f4AV4OWnvgYP5hoOZiVju5Xq
         SHUzgYt/klYmZqmGk8pJchTtPwLkFyPdk7yp18zghL9/ah0yI0BOzdqjuWIObGDju2
         Ozhb27goEVwRyq+UzN2NhT0moUtmYsaQulFeJdEZxLYbQldqH/omH1fbeOiGsktAfO
         os7FnjpPGt/vgv7acZE3kOaK+XtD30HCoo/CtedLJqtIKEnxr4foejssAc7Ah+UCFk
         8g6oocU+KT15UNYOY0b+gCiUqvrzoI3RALCjtRNxtXeuv2ho4qW5rxQFRy6IIwp/Bd
         5chxBbn2FzBqQ==
Date:   Thu, 18 Nov 2021 15:41:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 18
Message-ID: <20211118154125.2103c098@canb.auug.org.au>
In-Reply-To: <20211118152404.40561423@canb.auug.org.au>
References: <20211118152404.40561423@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J.hq2Ohkh7xO/_6rgcLz4tg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J.hq2Ohkh7xO/_6rgcLz4tg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Nov 2021 15:24:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Changes since 20211117:

Sorry, I forgot to say that there will be no linux-next release
tomorrow or on Monday.

--=20
Cheers,
Stephen Rothwell

--Sig_/J.hq2Ohkh7xO/_6rgcLz4tg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGV2XUACgkQAVBC80lX
0GzVoAf+My5VhcYdO5wmLWbjguU4w/Lh+7vjrtoPxrwfxQeyrl5vBz7SjWZfkAwR
SOIg4zBKFw9TVLoZlIUBa/XUImMB1RWTUkvRiNy6baqycyHAJz5+s1DDhSksQOqu
H32mvT9ulQpC1EkLC7PHcTYypVh0hTsYlpZjXf3zY3HdFfNSBvhUK7ih1ti8A5Hg
LBYa2lfcoK0U68Bq84mMblMv4dqfRf7LPNsmQX3AVVtL26wKC8qCviIYXDp2YQPe
ROgzJKE9TdmW/vruiQxEPHYtSDQAWZFNPjwHWCrHBaDkqEKo2qhv/juvKA+f4F0o
ti90xZPZZxVxiAsisxxVTPHynLykTg==
=qlAL
-----END PGP SIGNATURE-----

--Sig_/J.hq2Ohkh7xO/_6rgcLz4tg--
