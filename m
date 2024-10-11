Return-Path: <linux-next+bounces-4233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A6C999C98
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED4A1F2443C
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89131F9434;
	Fri, 11 Oct 2024 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fs7vdQUi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534A2581;
	Fri, 11 Oct 2024 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728627891; cv=none; b=r7waowebjFpm4ZIuDDDa2+zTrsIrrBMjxhQyyaPAa/AdftuC5xGZCafEcs0WAAHCCYB1w7qXjspJV3/AbndUwFmlYu5rh3ZZkTCiHrm8jJpsK+T9CTqOO2LcMpd8MGB/o9iGId1n45d3z86TxlPU6gg0aFV/6cBNqswvTmlJrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728627891; c=relaxed/simple;
	bh=ev8dwaK6Ic152Ohf5TxY8xXkf7sJAamaomOS8SBENbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OfBFCzTBTU9wAsqDC/v81dm8vvPmLrqy9xZ6mlJgpmVOvEoAUWdXYuy3o8isatISyn4VdfQXDZ7I8+l3kfaJK0AYAKmLWeP9seU2TJ+qdqZtDasHD1TVye7Sk3B3LmT2qZhJ5PDO6/5O+G4QxTtFXYAq4XkjiAo9bryBFVi1LRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fs7vdQUi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728627885;
	bh=JvtMvTg3t4pAC+5A58iZT4bTryNjeLclrDnU8FPU9Ug=;
	h=Date:From:To:Cc:Subject:From;
	b=fs7vdQUiHAsE1zy40qAOZn7vsvrOFSSUoEHc0AJM6yyhO7kv6DZzjAiMsXE/FAsGO
	 E9dQhnqnJFiByyLXxI9bG5+0DzXifsGlL8WmxeQ2esmgdsoRMqcO0YFE6kr9swpggk
	 yAjlSbe+3L3TNUn54UWqMbqmFu1Ov2LE6vv6B0IBGdYMyxwoJb6bFpe1soBLWRldLk
	 cSaqG3+bZmc1tA88pddAn1KHJWMb9b0dXh02uHj6UeBeFlsNRyd825udSjX38SwlA+
	 vRRVXTYdRjFrRFkn19UItR7Tv8haVhbLDm8x/ad5CUv3/pLWPn41sCuLoeTVQz3Iie
	 7d10P8ktuwB+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPxRt4pqNz4xKS;
	Fri, 11 Oct 2024 17:24:42 +1100 (AEDT)
Date: Fri, 11 Oct 2024 17:24:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning for a long time
Message-ID: <20241011172442.3a9cc81b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0fCSD.8si2tWkvLeATyAbAd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0fCSD.8si2tWkvLeATyAbAd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

=46rom before the git era, an htmldocs build (if we had such a thing back
then) would complain like this:

Documentation/driver-api/usb/usb:164: drivers/usb/core/message.c:968: WARNI=
NG: Duplicate C declaration, also defined at driver-api/usb/gadget:804.
Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int=
 index, char *buf, size_t size)'.

I assume it is confused because we have documented both a function and a
data type called "usb_string".  The former in drivers/usb/core/message.c
and the latter in include/linux/usb/gadget.h.

There are about 46 references to the function and 105 to the struct.
We could rename the function to usb_string_utf8 ...
--=20
Cheers,
Stephen Rothwell

--Sig_/0fCSD.8si2tWkvLeATyAbAd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIxKoACgkQAVBC80lX
0GwgUgf9Hu9QIKP2sl062sQHIjXGMBWmEFOh/u12JiOEyJko71SjS2khapiAYVHb
46W13d0/KYBCze4EO3m4negU78ATjJ8nrk1wTJ9yQZ9UiXaoLeKGM2s14V6pOEyY
gCKYItLWfjqsNbAY4Ox1ZEJ1SmW/Q1eeSJ22P1iZsOfySZY/P4wHzNbSdmwAL7/b
p60OEZ9K3lfqkO2HHXz4FkiHZKoM7a3N2c2agj0dn7r3f6NoF1AD1PYn+6hEmtnu
GAPr5ubA75mIsc45e8bCWfJU3C2VfG+lXstbhbaQc8thfhK9ntZakIehPn6A1e3b
qoVlM1O+BIJAho+yd+Fjwob8QoQHOQ==
=WTVx
-----END PGP SIGNATURE-----

--Sig_/0fCSD.8si2tWkvLeATyAbAd--

