Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E759F1E79BA
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 11:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgE2JsP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 05:48:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2JsP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 05:48:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YKWJ6b9Rz9sPF;
        Fri, 29 May 2020 19:48:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590745693;
        bh=ktw3nh2gIT33gvukGIjyyOBFVdKQqNlyao6Hb2ZtprI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O56Kja8ja5OE30cR792hm65fQLQjmOym9sI6D2gPqLDvilPPUnCSWlchGk+nDCU4Y
         +BCezWfCUN7nF1+6Itd5UlwL8O/eF5paQi4EQX3eaeeyRwYrC9RuT/Zgsr9x/tF3am
         vqv/zayQCC+A3wkavQ6fM4uM/3hzX9L+mPJWgL5tjgF4o65YZ+lKdCgnJFE2tSGZU0
         iC6zIpeZISjLSrLxEN3fZmYpiq/uXGoOd8LFSMmphCC1FYf9ZQlFRUKW9RSLuqSadG
         DoKVF+Vg/dYAcb4l8GclWoTlZqhMFRDmSC6Ueu+YnE0yyCc8jCfLiqk3cm5mHzczPV
         V6wxvOU2Y02EA==
Date:   Fri, 29 May 2020 19:48:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     <Tudor.Ambarus@microchip.com>
Cc:     <vigneshr@ti.com>, <linux-next@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: Fixes tag needs some work in the spi-nor tree
Message-ID: <20200529194811.45f0f5b4@canb.auug.org.au>
In-Reply-To: <132770930.czcBmXCZeL@192.168.0.120>
References: <20200529070647.5946fe06@canb.auug.org.au>
        <132770930.czcBmXCZeL@192.168.0.120>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2uqSY3LHn4n/YhD2k6PYi6+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2uqSY3LHn4n/YhD2k6PYi6+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 29 May 2020 07:31:47 +0000 <Tudor.Ambarus@microchip.com> wrote:
>
> Right. Maybe it is worth to add this kind of check in checkpatch.pl. One =
can=20
> generate the Fixes tag by adding an alias in .gitconfig:
>=20
> [alias]
>         fixes =3D show --format=3D'Fixes: %h (\"%s\")' -s

I usually suggest

	git log -1 --format=3D'Fixes: %h ("%s")' <SHA>

but pretty much the same.  The trick is to make sure you have a new
enough version of git and make sure that core.abbrev is not set (or set
to "auto").
--=20
Cheers,
Stephen Rothwell

--Sig_/2uqSY3LHn4n/YhD2k6PYi6+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q2lsACgkQAVBC80lX
0Gy6WAf/aX1f0RIPUs36aQ6YHLZEONpxgxIyK/FmSN6HLMBCxCG5ao7tGU7SMSHy
e+IPIg2gn0PfLt3EN9JGreaxdq+mmj+yNeTBWSQcDngc0zLfci20TEQN+uYsp3GZ
KL/MI7WbY4TfKnoJr52yOdNAm1tuS/ly/DCJDKpRqYCGuWZlk+gVdrWc4GdVCYzg
GYOOg2HjY+eLqI5lMWRFCYPKonqN0FfQsW8irQoNs7fXBU4FG+zxKyjYE9yMyQp9
hzNK0kcUhOfrTRXRo4erkHU0w98fe2UiU3OwL72nLyVMRlb7Fs1SE+TtxIwmSf4+
Y8MlzeyOOaGcWTAJ3uf7x7R2DHuHNA==
=zS4O
-----END PGP SIGNATURE-----

--Sig_/2uqSY3LHn4n/YhD2k6PYi6+--
