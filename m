Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E1B1864EE
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbgCPGNb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:13:31 -0400
Received: from ozlabs.org ([203.11.71.1]:55291 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729319AbgCPGNa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 02:13:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gmFh4nSDz9sP7;
        Mon, 16 Mar 2020 17:13:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584339208;
        bh=R+csjcOqNqi7S115Kcf8DsKcsipg4+MKhtDLsAEzD78=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cGUYkrmw995IVpdSjxqX8ef2uo5KKRDfxULYBIe6tsKRlJGVLO7iOiycaAdKPpvU7
         KfMfAoYlVfU56uP0LkLZQou/I14RxodF1d605Ymf8UiOiJl3IU6fUrGz8UZ1XTmt5U
         tRxdsAgayoqp1n5o8tQGiuoDCkB6Hvkbxyq18fgWCQfzbLNGJTUf7MXfcqX4i2sMgh
         EA56Hqp4zu+PLZTTppnd8pXdJ0wy0RDR4ZV2keyQX89cGzHlhu5kD2M7rEjPD20HC1
         6Sat5omINJzwKNF8lnO/gWbnIAAE6sI2UI5sBMypdrRoqw9Aff8OMn0dznMlEeXNGZ
         Va0RaPSt9+A+g==
Date:   Mon, 16 Mar 2020 17:13:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Baoquan He <bhe@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200316171326.7ee3eebd@canb.auug.org.au>
In-Reply-To: <20200316045804.GC3486@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
        <20200316045804.GC3486@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/92b7T1mW=iE4ZvhDpnm80gA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/92b7T1mW=iE4ZvhDpnm80gA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Baoquan,

On Mon, 16 Mar 2020 12:58:04 +0800 Baoquan He <bhe@redhat.com> wrote:
>
> I made a patch to fix these warnings, the reason has been told in the
> log. Or just drop below patch. Both is fine to me.
>=20
> mm-sparsec-move-subsection_map-related-functions-together.patch
>=20
> From 273196eeb7bbc4af93bef18f594af91541e3ce8a Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Sat, 14 Mar 2020 17:01:01 +0800
> Subject: [PATCH] mm/sparse.c: move functions into CONFIG_MEMORY_HOTPLUG
>  ifdeffery scope

I have applied this to linux-next today to see how it goes.

--=20
Cheers,
Stephen Rothwell

--Sig_/92b7T1mW=iE4ZvhDpnm80gA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5vGQYACgkQAVBC80lX
0GyY1QgAnoF4yv+kGFQApYoLlk6Xa5EYqNPdge0oJf2Vbu8SbrnM4u86OSmJo9GC
GHWWrDvyDlwRG0Jizl2Y5ETcT9o/t7Nxh8mZV5mB2arKZHEQvZP37r6iL3wRCbjx
AYQSkKnR6CRVdF6OWW65mfnlAN+yCF9qgO5YtcJ/0Zs7O+lm8UuntxvbOlmX0L92
zLkMfy2t5xrb/jXNL4dqMp+1wH8YQo6FxsaarP9AljwQoQY/ClI4RjdN5vVuEmV2
AOiyguQn8VxjjP666fzCBRE4BIL7wiepemamjBTXvJ/SbEGlueiWec2diFskVLLh
V6L1p12uTzb/Zue7jmKFU84HFWP7pw==
=Zr0I
-----END PGP SIGNATURE-----

--Sig_/92b7T1mW=iE4ZvhDpnm80gA--
