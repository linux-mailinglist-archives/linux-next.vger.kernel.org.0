Return-Path: <linux-next+bounces-7428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F5AFE594
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 12:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EAC3A6E06
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECAB285C81;
	Wed,  9 Jul 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gRFwu1W7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6028B7DE;
	Wed,  9 Jul 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056476; cv=none; b=oHx8VlbQtrrMnallnFguSXHoAKEbF+6bg4BgzbXMA+3dfV30STp9WNBuviDZZ41+xKUdrgr5fYHQYpihddJWx0ab2aTGWBpL7G27+cHC/ff/px3GP6S5PE7SFiCBtsRTo8u7KU6XrMZbGj4wgFNqmFfEKVDjmP2Lt8aIQ5PkRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056476; c=relaxed/simple;
	bh=l0l92xGa61BoUGWrM5RAVmmyIO8aJ73/rz1T86Gw08c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u3vJPmZpRFMQwBPlyAbK2+3nC3MXMNcicTN4LgDZre3BxaPBd3DVutTAOX0+PmOhQ3cEieFCVH6tanGLwFpqkam0Cn2zj8WQJEG5y1kPmuR4K5Hi5FujL6PvxElW/KHZvq03NuRS1VaLIEueQKAljo3YjOcSGgpndQgrd5v7AkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gRFwu1W7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752056402;
	bh=1cCqapi5HDozYAjCte1eBQ7rrI7m6ZeWdaM6Yp1XmTA=;
	h=Date:From:To:Cc:Subject:From;
	b=gRFwu1W7z4Gh65ObJf/VdMY3x1Uth95EkcEkBUBKU1WYXZpYCm/vb6hJ6arIeTdB2
	 IwzEwSQUph2l3o04HpXilBxrJof063RZbi8nNYyXlS3fNfQbpzKOkH30hQz2N6Q9xC
	 Fz7FzgcQHWNM7gJ8+Re+puufwPO4GzZe80Q7Yfsgb4VtG0G4glR4Lr0ltvSrpkj1X1
	 yCMUKdBpaVH8GkXIMyaB4mTDM8ziT2v3/RrpdRa1KgroKqOqwr6mMxVNpJo7cQziYA
	 NDwn3aV+rGkDY+DD4K2R8q/kaoiAg1tPMshmZIA9yMYM9qI1Q/hjkAv5MMcqUEe+uN
	 ynTm9snVo5YWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcYrL5sWsz4wbb;
	Wed,  9 Jul 2025 20:20:02 +1000 (AEST)
Date: Wed, 9 Jul 2025 20:21:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the efi tree
Message-ID: <20250709202107.6d570574@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YHpjmmA=yu4w/nfl=+bRnf4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YHpjmmA=yu4w/nfl=+bRnf4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the efi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "efi_kobj" [drivers/firmware/efi/ovmf-debug-log.ko] undefin=
ed!

Caused by commit

  42c68c6e354f ("efi: add ovmf debug log driver")

I have used the efi tree from next-20250708 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YHpjmmA=yu4w/nfl=+bRnf4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhuQpMACgkQAVBC80lX
0GwBHAf7Bfk6A7knSF6hkhO66iizhI+5L8NqIMMWccX5cka35W7OlPJD0cswMHIu
EJKcqDqx2qF98uYGICD4e7sU23O8q9YxisvSV6zJ6tipqts150Q6biAsNCAU/I1B
JUARbKD1kMf+toF0WAqXNDlcK4bB+m4CiLnCUiE/OcvQeNKd3nTbvvBCivtctMP/
Xy6/ng5k6VX12QOdAr075a54hYRU/fW6JlwroLDTBGnjPL7BhWt4V7OboMgDCih3
/I8hfyPQ+7nQXW4e9UHbvajyv6wmE6a+2laeEvzroGTLqp1jkVqzl6J4+e4/sV6y
Px+VGNgI1IBhVV22p0jeudvFLgWndA==
=uffz
-----END PGP SIGNATURE-----

--Sig_/YHpjmmA=yu4w/nfl=+bRnf4--

