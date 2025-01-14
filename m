Return-Path: <linux-next+bounces-5201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17CA1062F
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 13:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 997D6169B56
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 12:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03323236EA3;
	Tue, 14 Jan 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NyhrkoTM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471F236EA7;
	Tue, 14 Jan 2025 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856383; cv=none; b=EC8Jpdir1/jXX4+miqx4wKlsvR47UIq4vXf162S0vEKdb7cQpzixU4hLcJ7HRRYcb+Gj09nVfdgwjig3zRejuO+UziCIbX1+szkWwD+3qa7NqS/Wx68pmJRPV5+1GdZlOWbNpnp0wsSVrjA3mAMGcEUtGnMG83KAiCCRLdQ++Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856383; c=relaxed/simple;
	bh=wElorjl51idWQA1WITlYRl8byIXNZ4W5GUVJ5cJVqbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KotIMmJM/IJaLxxD8ollJ8ZjlTJvOUiR4gHhrcxFKinjX9P+KcsqIVunqi/STL+GS5XkTwOSGKBNDyqlfh9kmKat9YVuvZ3CRFpiUoEnmg3brK9iroz6MHFgrbpWRYsl1PjSoJGrAdJLLSKxkAhSKNnwVyer/1TmX5zAUJofRkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NyhrkoTM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736856369;
	bh=wElorjl51idWQA1WITlYRl8byIXNZ4W5GUVJ5cJVqbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NyhrkoTMHaxsm2zVbFNhESqhb2zD/YRA3099+1yEQlym6IRYv6jK0PBlT6oCsppej
	 vLG+Ahka99k1ELStPq3PhXVK9cphhQyqXaE156d63SZB6Y+QK2ZZibQzGx46LIaUMo
	 I2QwhiyMliAHjcv47Z2nnwWEwv11XI9egmiMzrJlnYJ2ywqw4ZORp4uTk0inEPPKvJ
	 o+5rBUVhfuUGFvJHONYzbQrSYkJqJcUVlHrBJ0VMU4C16Mvz61p+k32OlA8mBIkuPo
	 WSnecfqrxaTFLrtM8makD8nQnFI434T52qftlKTQF9odXuT92LTCt/sMFseSo7gmvZ
	 ICLFPAfsMju6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXSX05cCzz4x8R;
	Tue, 14 Jan 2025 23:06:08 +1100 (AEDT)
Date: Tue, 14 Jan 2025 23:06:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114230614.4fe2d33c@canb.auug.org.au>
In-Reply-To: <2f74opyehgqxnd7337fc23hwwow2ggod25obqweu72j2zfbo6g@xuvurpzbwbyd>
References: <20250106174645.463927e0@canb.auug.org.au>
	<20250114164324.3a42700e@canb.auug.org.au>
	<2f74opyehgqxnd7337fc23hwwow2ggod25obqweu72j2zfbo6g@xuvurpzbwbyd>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pnjhH/ntVCqC8IWflgU8ukj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pnjhH/ntVCqC8IWflgU8ukj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, 14 Jan 2025 13:40:43 +0200 Dmitry Baryshkov <dmitry.baryshkov@linar=
o.org> wrote:
>
> The patch is pending reviewal:
>=20
> https://lore.kernel.org/dri-devel/20250107-drm-bridge-fix-docs-v1-1-84e53=
9e6f348@linaro.org/

Thanks

--=20
Cheers,
Stephen Rothwell

--Sig_/pnjhH/ntVCqC8IWflgU8ukj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeGUzYACgkQAVBC80lX
0Gx4pAf/Vts9k3Vh7mhqDnq/BRY7Bee0Q9OP4cuZ6VqEF+t+neIqlaCzEcUbLb2R
q+FMUCtEqZREikZ3kwH8DY9zQQCJyQzP9UL8xjvlVSUvrTmDYFGzAEtmceznSaYV
MpefATyu9C4iNbBcsojv1L4fa089hvVuv3aARSLph4xCRG1T9vyANd78GdP1Wkk7
nvD6crjKIf0PSbblUvWp9JoFoi0ZIB55Xv9vWuvRrpqCVbRAs+Z830HGlgHV6Af7
B2yI5e6OHVmpgyj40X+LKAgzzXekxSePAHq5BYCbClgBf5oA34zWNXsv/q6xpknV
ch86taCgO5TqRulAPtoOvAB9hKwpQw==
=MhXZ
-----END PGP SIGNATURE-----

--Sig_/pnjhH/ntVCqC8IWflgU8ukj--

