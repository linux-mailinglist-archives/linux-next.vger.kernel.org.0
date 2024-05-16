Return-Path: <linux-next+bounces-2335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE378C70F9
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 06:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F8D7B22E1C
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 04:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361C310962;
	Thu, 16 May 2024 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U7LS7LQI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7820FBF3;
	Thu, 16 May 2024 04:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715834412; cv=none; b=K5N+vxY83ZhzJj+3JCH7eKNaG7ern7w6z+ekhZyLRdw6eH5OXR7hKq0zcRRbkH+50yhUuRcRzJZd7CemWvRk6o1j9LPxHKcjOuF7bcd7fTSYiu0P4Y6q6tcuA/T48FVseR61hbErZGT5mi2S9aGhqc0PBD++ZjUIo3+TAbVrXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715834412; c=relaxed/simple;
	bh=L54fO4D0FCChnqQLA0pJ16mx/7DtJOfTrBflRIH5OcU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EhRRQjXSFwuTI/T3ItDjD00NK0vvVjxL9cNP/7SR/tczO2KN3BPsyQVm0CISC/hkdeWeAHRWI5MIAt7kCymOgZ1MUaZgeEcw+/4AXk+eZ8k9Eij7n1o51mQ/Myv0qrVY1FHB9UHZJTyrXhPFmk+TqTEj3KttJx8+lLcnWRlFg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U7LS7LQI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715834405;
	bh=KwkWYAxPYWT4jyt7Nt2O/X7NlRLqDeRalY4XQ+cUo50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U7LS7LQIAJQ9sJbAsmWLlNoGKR3vuGVLnrBUF0htv/rrWApI2d5bin9OP3X9B9228
	 TeEGGkoOcM/cYhV+H472ZrYEL94Vzf1vfwP24vb2VVcK5NKeI+G4jup+JQy1JUxJn/
	 ukV95Eon7vBaQAwkZwsyOSPd9BCqglagvAYwU31aO7ttFxMG3OIRtsLIyP7e6MyjeK
	 T0h8Iv2P/QCHh0EfRwLQaeMaBVZqkfmJIqVY9ARAVuN+uxbqMde3HCecbiiGJVr35F
	 cIU4Ep3qVmV+LmkcBxoXfC+jGE0yRzYzNr99Z8+6aJxe0+J+ZlW+1V02luaBGHDe7Y
	 YHKFTUUsbvUTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vfy7S2Pncz4wby;
	Thu, 16 May 2024 14:40:04 +1000 (AEST)
Date: Thu, 16 May 2024 14:40:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20240516144001.091ab957@canb.auug.org.au>
In-Reply-To: <tencent_15C2F112172FA62C64BB318B8F4330461B05@qq.com>
References: <20240516093641.15695f18@canb.auug.org.au>
	<tencent_15C2F112172FA62C64BB318B8F4330461B05@qq.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OrY0=XKI6gro7W/9yHoZroH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OrY0=XKI6gro7W/9yHoZroH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yangyu,

On Thu, 16 May 2024 10:17:14 +0800 Yangyu Chen <cyy@cyyself.name> wrote:
>
> Oh, No.
>=20
> Here should be CONFIG_SOC_CANAAN_K210 not CONFIG_ARCH_CANAAN_K210 .

Yeah, sorry about that, I realised after I sent it.  I will add a small
fix patch to linux-next today and it will be correct tomorrow (if it is
still needed).

Just make sure Linus is told the correct thing.
--=20
Cheers,
Stephen Rothwell

--Sig_/OrY0=XKI6gro7W/9yHoZroH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFjiEACgkQAVBC80lX
0Gye9Qf9HPluOLJTj3vATBddSi5tC1/fYifvXVs8shGZhxzNHVqz3N57Bz9B46u3
hN1BOWMC53SYEn4e7DZ/TYspVwur6dJmOZ6139N/t5ElQL7gIKHogC9RiYqdJFcf
/95J+ulf16OeMbyfXM12ghG14D6g+i7c+NdAsWdn7KGgqfypGxzrX6JT4O8GgVvU
PoukaXdezmrLMF26N//PMo2YQfduX+NZohjFKkAyz4j49BbndMlT/X5o+BfQ0NH1
hI6N6ZvXH/o5HHGsQA9vrACwSPQvY4XcnSq4Yo7bqQ5ONHJojifZ0to5INTpYSgn
FhEmVcqgdIXk/6xhIm8BbnBeoiNLSg==
=g8f3
-----END PGP SIGNATURE-----

--Sig_/OrY0=XKI6gro7W/9yHoZroH--

