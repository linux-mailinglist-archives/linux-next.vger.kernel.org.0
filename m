Return-Path: <linux-next+bounces-5068-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE03A034A3
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 02:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922D218856C7
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 01:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B120EEB3;
	Tue,  7 Jan 2025 01:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FHSprVta"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A75376F1;
	Tue,  7 Jan 2025 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214413; cv=none; b=FbDqkQA28OAgEOE83omjZB71q0tmlGNC8hLKIM6btivgLJxmPXV+3TR5LckBibwCtQOvudmT4b+566TjrK5+k3cT2KHHoPrXAQjjOm5s+saM8Nv+sadXiw+f19e7N8zuD4E96AmPW5KfzLaWECQ6lm6Axcra4h8OFAc6WS1pRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214413; c=relaxed/simple;
	bh=XEB+uAnXQVxw+JlgzdWrTb0jd5iL9D9juwx0R0pVL48=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3NOOp30ii0kT8cFWbvfdGnDd5bHRS3n0TLIRmlOLBVk3hqHeVvRgPzUnEyyhRfjzBW37j1giv+LZCsQjVeH1+dwmNvE8PjNB9NXAdA6r7hj8K94rq4YNV1ROwNdAg7v4PWGyUCP3oUZVSp0MuwQfAmgw4J2BQzzaujm/Bn09Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FHSprVta; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736214395;
	bh=IRjyUWNsZ8uGH6YA1FPT9Va3TDoRBtpKl8i49IOX0zc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FHSprVtaQJ2HIJphuj3BLlypnVojmd1rXPepBvrAeB0iOQu0AGwqBgs3bXmEXOB8g
	 47+lfv6MqXz+Yu3aV6TYZHw0XKJ+IFcZXJNYlLCQ3LEJOzF4B/qKcsoyU6vFSC+1tu
	 gWyczUXjQp4IQ8BbGA90LlUoB9zWf7E3ZDJIyVA8K01F0OIqdxF+Rofj4ClL7drB6B
	 vU4E9DYYqG039EM8QSQCttwtQaWePFtlPeYIuedzmdsUxWot6CVlxR9iA9+b36Iepf
	 faKY6J6oY0TS4cU8zPMwjDz/wn+QsOkrOkPsPvZec6HEZLGp+iWUEJBpduWstuQ+o+
	 3uU/a0EgIH4pg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRv6M0hpwz4wbR;
	Tue,  7 Jan 2025 12:46:34 +1100 (AEDT)
Date: Tue, 7 Jan 2025 12:46:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20250107124640.2442512f@canb.auug.org.au>
In-Reply-To: <409116b0-ebb2-025f-ba8c-0eff3e7e11dc@quicinc.com>
References: <20250106124834.5a82a6da@canb.auug.org.au>
	<20250106125104.16305a1e@canb.auug.org.au>
	<409116b0-ebb2-025f-ba8c-0eff3e7e11dc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V.kDo278ivahTgqjA+x/ScU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V.kDo278ivahTgqjA+x/ScU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 18:53:01 +0530 Md Sadre Alam <quic_mdalam@quicinc.com> w=
rote:
>
> On 1/6/2025 7:21 AM, Stephen Rothwell wrote:
> >=20
> > On Mon, 6 Jan 2025 12:48:34 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> >>
> >> After merging the nand tree, today's linux-next build
> >> (x86_64_allmodconfig) failed like this:
> >>
> >> In file included from include/linux/string.h:389,
> >>                   from include/linux/bitmap.h:13,
> >>                   from include/linux/cpumask.h:12,
> >>                   from include/linux/smp.h:13,
> >>                   from include/linux/lockdep.h:14,
> >>                   from include/linux/mutex.h:17,
> >>                   from include/linux/notifier.h:14,
> >>                   from include/linux/clk.h:14,
> >>                   from drivers/mtd/nand/qpic_common.c:6:
> >> In function 'fortify_memset_chk',
> >>      inlined from 'qcom_clear_bam_transaction' at drivers/mtd/nand/qpi=
c_common.c:88:2:
> >> include/linux/fortify-string.h:480:25: error: call to '__write_overflo=
w_field' declared with attribute warning: detected write beyond size of fie=
ld (1st parameter); maybe use struct_group()? [-Werror=3Dattribute-warning]
> >>    480 |                         __write_overflow_field(p_size_field, =
size);
> >>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> >> cc1: all warnings being treated as errors
> >>
> >> Caused by commit
> >>
> >>    fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file") =20
> >=20
> > Actually caused by commit
> >=20
> >    8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver") =20
> I have posted the fix. Please check the patch at [1]
> [1] https://lore.kernel.org/lkml/20250106131558.2219136-1-quic_mdalam@qui=
cinc.com/T/#u

I have applied that patch today instead of reverting the tree.  I will
remove this patch when I see it (or some other fix) applied to the nand
tree.

When applying it, you could add

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build testing

--=20
Cheers,
Stephen Rothwell

--Sig_/V.kDo278ivahTgqjA+x/ScU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8h4AACgkQAVBC80lX
0GyLsQgApKEH7Ib0wCatNsJBwptdRQTkilkUk3vMK/gqxl7W7yfJlH5T3pPl/rrX
JEHvNmA+rVqXYa4Z6URSdS2G1+mrQ8ROZ7L9AUXBRL8tSF/xlKAaqJvGf/5wKXfH
PoyWsGTPAHFYs1Hap+f35BtMJ9UcmdQ25HOm2lX+TYEy3IkhXiSRwt8Jk9RM431z
pDNsV1GZTDsKV+JKND9EDHUuTafySmKgX+IhAjgzwx4LAKFK+5sg5/axioRv51TB
A9vjdxfUGDZ9xw/nbqf81xaXKTw9QFtT5sDLL/WD6vJ6ZQ9Op5db1BD7pw9tU2Yl
xZcakIcnfPlIvXB5fTzjgO0ZumGWLg==
=bza/
-----END PGP SIGNATURE-----

--Sig_/V.kDo278ivahTgqjA+x/ScU--

