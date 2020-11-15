Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF242B39D4
	for <lists+linux-next@lfdr.de>; Sun, 15 Nov 2020 23:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgKOWS0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 17:18:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbgKOWSZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Nov 2020 17:18:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZ66F4k2Vz9s0b;
        Mon, 16 Nov 2020 09:18:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605478698;
        bh=ObCA8HN2tG6i5xFH74HFyEHh30uOaZaaQ/NKJ3dg0UY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XCdCeOoFUmKbEzPr59upwGw1YOI6dL5jIM5AkUUWkqRBtJg1bpH/Wi44nhHggW6mx
         wxL7PRewdWdwbKoCiewWV3IDZn8p5MCE4zdTA//6E/hROIpG44xx49IzcOCT6nHDg5
         W8akhlSq5SfWx63u9vWk+eeNMC+pnOiwBRqqDRd8dbveWuRVKwQF93yj+cpPR+NSrr
         ZJXda/jBJ9elLLlqv8hiVNxp/rWwJ8BagdFQ8Cq0U89CSYTpaOJEaTgdmCRrRBIR6x
         QWSBRzogdqnE4hf4wUmjax6cNjnSoIYq19E6YfEUYmfnvIH3+arPIY3efYw7x2S8lY
         Kc+Dm/fZ0MtWw==
Date:   Mon, 16 Nov 2020 09:17:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Balbir Singh <sblbir@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201116091751.64131fe0@canb.auug.org.au>
In-Reply-To: <20201028142300.34ed89b1@canb.auug.org.au>
References: <20201028142300.34ed89b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X3Au2nx0pXlbAz83kRNd1XT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X3Au2nx0pXlbAz83kRNd1XT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Oct 2020 14:23:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined la=
bel: documentation/userspace-api/spec_ctrl.rst (if the link has no caption =
the label must precede a section header)
>=20
> Introduced by commit
>=20
>   767d46ab566d ("Documentation: Add L1D flushing Documentation")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/X3Au2nx0pXlbAz83kRNd1XT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+xqQ8ACgkQAVBC80lX
0Gw4Sgf/RtOIyfPxrOAF9JSEK171GzqEJvqCUN3NxPD5NqwMOeHd3f4dbUoi8Oyo
s1Shz2ngo50p117oFPlEW1UiYCBR21RnvtAQJ63oSzw1ceQysGZpLOFinH/0m+UN
R58Y4FZbnPKR7wEjeiyo7kmqUK5R9wfTlnU4g9bKzpqGBeGK9c+G3AelXjkTypkK
Azcza90IxCdWoYg6s1bFOfxy1KMuCaFAyN8Ksz/VtzLzXRxHWvwa5e4KSM+e1499
NekB1s+dPFUE38mlX1pIWxAiSRa5gApnXnAceo95WKKtL4uQFGAyL4Mq3rZzUsQD
7LSSewvE0snE4b7CvZcxTUiYN7+7BA==
=gHxz
-----END PGP SIGNATURE-----

--Sig_/X3Au2nx0pXlbAz83kRNd1XT--
