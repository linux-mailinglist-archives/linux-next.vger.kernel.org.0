Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C776231B6D3
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBOKAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBOKAt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 05:00:49 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92322C061574;
        Mon, 15 Feb 2021 02:00:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DfKMz5styz9rx8;
        Mon, 15 Feb 2021 20:59:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613383206;
        bh=btw2NBKBX4HfXng6+PoFyWswrMN3iQTVhEM3Q8VlMWQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VXbz0A2AcLTjsSIZdrTANr0+sySRr++2Twb5L5Z/rdpO7Jk74uLfdME54sj5S7Iwl
         sJDttxsQvTeVrgOPTrV8kuitKOWMpopx3ZMZXRUem9uIvn+oTmVIdTyu6MwZP02QAF
         xt8PXIyIX3hh2Y1n0uvZvWVoHUHzT2mJ0rxs8+jSdeYyr/+ZzcIF1NnVJr1mub1pbe
         XmDozJddCrz/yoEnorCK4OZ/UReQJ8dYMYuxzxjnAh2xVlg8L46GQoMgdhp5qcu3I8
         uPCZxj5lzo0BiArv/9/xvJnLnGdSrO093UnEl3yqoR1fjFPnaZ5p50c7kXenHZOuBH
         5EkLM4W3bgk7g==
Date:   Mon, 15 Feb 2021 20:59:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: qemu boot failure after merge of the tip tree
Message-ID: <20210215205958.27c01c3c@canb.auug.org.au>
In-Reply-To: <20210215095651.GC2185387@gmail.com>
References: <20210201200918.386682c5@canb.auug.org.au>
        <jhjv9bcym5d.mognet@arm.com>
        <YBgSzPcVILEtk4Yy@hirez.programming.kicks-ass.net>
        <20210210155339.49415f2e@canb.auug.org.au>
        <20210215095651.GC2185387@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kS7L450n_MavpvU/LEe.0F2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kS7L450n_MavpvU/LEe.0F2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 15 Feb 2021 10:56:51 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > This fix has not reached the tip auto-latest branch yet and so is not i=
n=20
> > linux-next. =20
>=20
> This fix should be there now as:
>=20
>   e972d92d52a1: ("sched/topology: Fix sched_domain_topology_level alloc i=
n sched_init_numa()")

Yeah, thanks.  It appears that my email and the patch turning up
overlapped.  So it is all good now.

--=20
Cheers,
Stephen Rothwell

--Sig_/kS7L450n_MavpvU/LEe.0F2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAqRh4ACgkQAVBC80lX
0Gzy8QgAjG4SqNJj+9VaDt0I+uyZgUtZ52EpPc6fy90NQEFUKVM1bEEQPMVqVCSc
Kzcpi4on+Cy3Rm512ZZGNRWnPXt0a3gT6h2GpP/Efjr7+57HXPhTBobrsxOrPFQf
oNrD83p6KY63oe2ZWMQTstGFwccxuKnGWub37lYHgrTS04Cberf0q5xT93NcCeJ2
qKWKqVttdukhuqURJXvs1sbaSh4fYaNGLQwubHeId/6n7r1SjwU805pDI+aJS/vh
I0N4cWoCcXViRwGjA0/300fhmcPSxDbvURhPhm0eX51DSi6gmsnpkibb83S2J7GG
fh/sB45Hluve9zMT3OyCTT39Xg1mNA==
=b0EH
-----END PGP SIGNATURE-----

--Sig_/kS7L450n_MavpvU/LEe.0F2--
