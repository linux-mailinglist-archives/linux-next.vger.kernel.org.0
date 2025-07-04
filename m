Return-Path: <linux-next+bounces-7360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109EAF8D1F
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 11:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A65F46E311E
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 08:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1B028A71E;
	Fri,  4 Jul 2025 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="htj2+znE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4E286893;
	Fri,  4 Jul 2025 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619268; cv=none; b=Rvn970V9ZpVGHKQaHIZozz0xIN/4VGqpVLe/7ooSK/ViYnljl4lHRpBrs1LLQ4UkLjvO4CalF+/MD/AwwSTXKPzKNjJNiCCNH96zvvXHiU0rIgH2PaCnjRzMJYVbNDnq9HT0qoFc6GVFC+B7seJ4sSw7yxe0dkRI0LlajBlHVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619268; c=relaxed/simple;
	bh=uz/zicClKa77WCJ3YsL+10TMEVpskxKUqb8kUyLUeUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=chVLzR8REk13iQkfe7KVxc6LmFZf4LRpGOiuya6P8siXmix1ghh2+OFYcjB+DUxHEpQDrZlHrCFHM6CxSjdcajX1X+QcH6lTiCLTsDk1vVJmdjy5SMNhUMsNJyL+ve61ZwSR63p8Tx85EvdGuMBFD5AmAUVpG6vupanq5nG0ijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=htj2+znE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751619231;
	bh=ZCHo5NqU7SbFbU/bIDHFUIZHzFSRaHBIyId8HLH6J94=;
	h=Date:From:To:Cc:Subject:From;
	b=htj2+znE2moaKwfLr3/jSMjySprOWUM5D5+4etRUaCDntPL3sDpIdSPukXC3HUfZt
	 mb8lQnb9d5R1k7/VJdtd5UVkVPhzyoD45pk7g3xpeCfuW0goEJcNL+ruOnGRrTCttE
	 L+lZGNeazzJADta2Pxd5xM6+Hu0kB8SHbfRSHOKTv2VQXjOJdOMRgdKtlWp+Z/lEOJ
	 tYZeX+NduwLW4t/RahpRJimceXxVL9sj5C44sGH+T5r5tW5CMa1JfWdaQ0s//Tx9Nm
	 wCWEBbx3P5Q8PDVhgRE1iWOPpbqpvOHJ2FfFcP5rYd5TxlT/mAAqMUyCxyhK9i7YDU
	 ZGR7ZkrP8edaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYS996v79z4wxh;
	Fri,  4 Jul 2025 18:53:49 +1000 (AEST)
Date: Fri, 4 Jul 2025 18:54:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the devicetree
 tree
Message-ID: <20250704185418.3e7599c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LB=LD9kpseukT9DZ2hcfXt5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LB=LD9kpseukT9DZ2hcfXt5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  Documentation/devicetree/bindings/trivial-devices.yaml

between commit:

  4fb2210866f7 ("dt-bindings: trivial-devices: Add Analog Devices ADT7411")

from the devicetree tree and commit:

  e65e2b0d0f7e ("dt-bindings: mfd: adp5585: document adp5589 I/O expander")

from the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/trivial-devices.yaml
index db0295bf9fde,43b21fed7ec0..000000000000
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@@ -39,10 -39,6 +39,8 @@@ properties
            - ad,adm9240
              # AD5110 - Nonvolatile Digital Potentiometer
            - adi,ad5110
-             # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
-           - adi,adp5589
 +            # Analog Devices ADT7411 Temperature Sensor and 8-channel ADC
 +          - adi,adt7411
              # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-=
Down Silent Switcher
            - adi,lt7182s
              # AMS iAQ-Core VOC Sensor

--Sig_/LB=LD9kpseukT9DZ2hcfXt5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnlroACgkQAVBC80lX
0Gz56Af/W6fbp+iVlLmX/wcIe9hzQzgqeU1YTuOMpZdTYgzN7Ej+mVc7s4fPEZum
u38S0m6g/K62HEZoHprlMNJ01bvysrE9hNZ7vC2J09QhrVW5APsfw3NsSHekrlke
i70B0BUhUFJe4q7EO4SG6kh4KpF/0+/oOoOXtkuaT7p/r63TejeHD/M+/hNEK2KM
57IgxrF8QedPEuI3Q8K7smnMbAmOELpQe1rGy/K2USfVo8Q5St535ayx4Prt4/a9
gZUCNF7MxqzpGSBChBgZPXncf2xjJ5m64PnUs8JXDyEfLzNrcQwPJzIlRPkqwT1D
jgGWTxk+mMwZD4bFuubUPoKAv1twqA==
=n/Cj
-----END PGP SIGNATURE-----

--Sig_/LB=LD9kpseukT9DZ2hcfXt5--

