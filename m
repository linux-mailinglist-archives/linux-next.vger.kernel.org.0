Return-Path: <linux-next+bounces-5579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC859A46F79
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 00:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C168F16DA42
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 23:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D8E25FA3B;
	Wed, 26 Feb 2025 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CCyu/PrW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099725FA23;
	Wed, 26 Feb 2025 23:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612746; cv=none; b=JzuNtXjrr0OlTHKq35F8ykx5P8xa28al+qe6T1NjB/zQmDUSGkV4wTn54OZPdNM1T7Tu5qoj2ygwDtNC12E/27HOIxYzhuY+/tepn6Yw/kA/r9HNe79cs/D5QtVmUip68tschOQCpPHr+rKUeBGUT7hdocCl2ca+1o/HyT/sFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612746; c=relaxed/simple;
	bh=Kua10j+9s5qqV3YA7Nq1paaFw2az235kbmUb8iAmuiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WmJvWwZT1zcqCrljMtlicXDBN6sk5yra/vOk2w4ywC77/506+3I+z+ObARd7Tf6A6HBaBwenBbv3rHejHy+FBI+ZClDnS7hGDPPqh4RHRa4ETOxlfUkueiRW75bqRpnC8+srlxCow7XMUfDm9GmcW/uGy7ULSnK0FfojKbMGuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CCyu/PrW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740612737;
	bh=lDZG/aLyVQ4ffMEW1u60XV6WdfLbDHHPSxwBIYPNZjw=;
	h=Date:From:To:Cc:Subject:From;
	b=CCyu/PrWP/Ck5c1m7UGLU9MeOjEdg4PGBSeQDf9R5J1buSNCYP6Fr/anIFYtAd76T
	 JnP0szJGfAnH2faPmtuSZNWC0e24A1bmZcn6CPcT8MD/LkBLVyLvnG6QFtA58RX0R7
	 vaGk1NlooIRMBEoYu5xTQMpJtirFYck8lz/fFgzRVJts3RH+OQ+fmqiD2BdKYjdz61
	 ZWcf+sdW5UG/3XFfGjfvToUFv+LB4ng+5KMeyfHQZCcQjXP6EbQ50kVKiyqxBjw2wk
	 uy1e+Z+IKFlos1uHHNJhAF3a6I2G+Nsmuzv7Dvb9+C6N1BaHG0KYC/D3h4b0rerZxM
	 XPs8h2P5aFJ1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z39jr6VJdz4wcD;
	Thu, 27 Feb 2025 10:32:16 +1100 (AEDT)
Date: Thu, 27 Feb 2025 10:32:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Goldwyn Rodrigues <rgoldwyn@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20250227103214.2cf95e8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HLb.Y+A27vi/Ve_qop5eNa=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HLb.Y+A27vi/Ve_qop5eNa=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/extent_io.c: In function 'btrfs_set_folio_subpage':
fs/btrfs/extent_io.c:874:45: error: passing argument 2 of 'btrfs_is_subpage=
' from incompatible pointer type [-Wincompatible-pointer-types]
  874 |         if (!btrfs_is_subpage(fs_info, folio->mapping))
      |                                        ~~~~~^~~~~~~~~
      |                                             |
      |                                             struct address_space *
In file included from fs/btrfs/extent_io.c:26:
fs/btrfs/subpage.h:95:51: note: expected 'struct folio *' but argument is o=
f type 'struct address_space *'
   95 |                                     struct folio *folio)
      |                                     ~~~~~~~~~~~~~~^~~~~

Caused by commit

  40524fd05deb ("btrfs: kill EXTENT_FOLIO_PRIVATE")

I have used the btffs tree from next-20250226 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/HLb.Y+A27vi/Ve_qop5eNa=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme/pH4ACgkQAVBC80lX
0Gy1Zgf/UrU55KYEjwjvB+FcDeG5NMQeKCPeczP1huJp7eYPN5ZOvABk8Wa8TRCI
nA5LEq/5SpKtU63/fMvt/VkS1Y4oSoruluswobO/0n4cyTdACcfraQL8Fzis8F2v
jBAlOxV98B5+GXCZnUwZKAQVMT09R9HxbCuba4wZerywXGS5QsXkBqdUmJOu6lR9
a2/kYn6EJ/D027txP/ReY4oZI3zXqV9IbEFTkoAfLyRQssptB0hsm5BXfM/u0vmB
wdU1tX4H0AyN9Qexl4dCdDZYBxqgs+UnnllupoHvGG4PfhxgftC5G1MzVY8oNs1G
fT/JFLafOAJC0M1JR8NVC7s467OXfA==
=oSKn
-----END PGP SIGNATURE-----

--Sig_/HLb.Y+A27vi/Ve_qop5eNa=--

