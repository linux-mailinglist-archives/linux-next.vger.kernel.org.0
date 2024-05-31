Return-Path: <linux-next+bounces-2426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF178D56AF
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 02:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B12728600C
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 00:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6A8139E;
	Fri, 31 May 2024 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DU+9gQ+w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF631360;
	Fri, 31 May 2024 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113640; cv=none; b=iRPj92c2s0S/JRr3A5wwR/g8xNJ6ZbhhO2z4e7WTgxEPF+TutmMfi1IIGYNVZFjQJuwLPPSckWZm3DSCFWcZ03mBxP5i+dBk8yll0AXY31dzDsA4pkvnRUwrkXyVoSo5stQR295VxSIWNCwqqn0UOu4/SR/W7LJbuyz16MtAR04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113640; c=relaxed/simple;
	bh=MMsNsX65DEE3lXGuFMLnM/kFDnfQuOYkQuelC6hsATI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtKr6RIEm0JcB6OF7BplZMIAL4H836+KGEJ3eqV4gsB3ys/UpLXsool5X74FBiwwn+VSjTJVgOLJZekSEU92kIo3dHQfFCB5Y3z6EwtmhPsF4QQz+MOvK6hxPqOzBtImShQNO5JCghXQGehZaG6vgZ8o3poke2u2nEpxTa55A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DU+9gQ+w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717113633;
	bh=oGftOmbKWszy5NjUlVI8+2RN/TXT8cUR6ltFlseq6u8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DU+9gQ+wALD/WSphdK7l/UDlAN6bA3sgDgxvx4zRWWgVs4W/56OqayoNhJQBbLUSm
	 tHd6hn80TdGveVbqJ3OlM1zxuMcAu7fBZOR2MZy/2oFTnacl5rxpcIOgziEy9JcqYy
	 KG/p7z5Gz0kGwKkE6s6wr000PJEz2dPdVnPgHho9TbfTvPDLpZFef1T7RSJ0tDWBjj
	 Zm+FmRLTAwux1do+70azqFLbPuNPd1hob50Lo8hhjHmWa1Ec096AJrw2EFUNt+1XeA
	 7Itd6cVGjneH+dOgPp9FVVU/e/vFr32Zcj2umiJBZ5CjllPl/Vj2kg+o5LAdvojMUP
	 +6upmCATYA2Dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr3D12p6sz4wyQ;
	Fri, 31 May 2024 10:00:33 +1000 (AEST)
Date: Fri, 31 May 2024 10:00:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Steven Whitehouse <swhiteho@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the gfs2 tree
Message-ID: <20240531100032.4a112093@canb.auug.org.au>
In-Reply-To: <CAHc6FU7MrnksU9vDvdAvc_tv5knukGpnxXEpqidvdfWqDf1p5Q@mail.gmail.com>
References: <20240529142455.1c68e65a@canb.auug.org.au>
	<CAHc6FU7MrnksU9vDvdAvc_tv5knukGpnxXEpqidvdfWqDf1p5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wh/CGnl0irEtkEDzV7ngaJL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Wh/CGnl0irEtkEDzV7ngaJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Wed, 29 May 2024 15:40:13 +0200 Andreas Gruenbacher <agruenba@redhat.com=
> wrote:
>
> Could you please remove Bob Peterson <rpeterso@redhat.com> from the
> recipients of these notifications as that address no longer exists?

Done.  Who should actually be the contacts for this tree, I currently
have only Steven Whitehouse listed.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wh/CGnl0irEtkEDzV7ngaJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZEyAACgkQAVBC80lX
0Gw+Dgf9FflcHQK0FTIE20EyRz3uglM65JysOwdlzAeln0dJOMhlnTrrON0kdfja
JKCv9PHA9gYvPWF3CNnrhEFtAa06TdEm8nNx4dfJ00dR74V4vgrtEDml6/5z28uw
8uEbtRh1noH1AJVEktl0Ni0tK3x0JrRg0Ep9Jw/cRTwZ4syGY19rhBkGLLgKlz7T
rTEWmUC500ODCEFUwcxFz8rS4D2Nnbz4vofj+27A7i8qWM3NoMrMbren8/+okjrO
DHYeTDT+iZWiHnOgUiJEzbHyT7PoZ34zBDn0G5Tcy3pWUUvJQ7I9S4PzfCmMHV5x
ksKEeriEptBvc1rPrF6yVUjYt0OSbQ==
=q7Px
-----END PGP SIGNATURE-----

--Sig_/Wh/CGnl0irEtkEDzV7ngaJL--

