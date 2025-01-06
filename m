Return-Path: <linux-next+bounces-5033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3403A01D19
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 02:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33B613A3B54
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 01:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10640DDBB;
	Mon,  6 Jan 2025 01:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hak5Vkv5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92437184F;
	Mon,  6 Jan 2025 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736128122; cv=none; b=U9ADnNZ4uqtb1g/0t3cOA1G/BRMq+TQ6Iot3l05aN0dRw860tbNcn7B3Wf7PpmdEK08wb+SHC12FS7noIU7aOyxrufFCRd+SBGiM0k8LPhez60xZ7zRVLWiSx2BVoQidindbO0ROG64IREBhTJMYZuPkEMGbse5Wf1Hn75QNzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736128122; c=relaxed/simple;
	bh=ZoiV0Pvc+Sgo7RVe7XDNG1Qqi4sNyFXIbRistouXdNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TLzSz+u/y2Ix03fm9Px2K1B/ugW1Heu5ZFJv22E9km5CkaEMxyFvmpsgqLrCZBgRGk8rn9RiMSV4a7ra/NEfrv6KsvMgXpNByZmcdovvTHr45rRVSTnlEra6z+K9FeZO1ddK0wNaeiwFp3C6W1rmk/7EO5G1zx97gOEWxjImlYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hak5Vkv5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736128108;
	bh=CBXyB3/RPrQw4e/NtOZ2YqTa0EFxIUqmACmBmx5Lmzg=;
	h=Date:From:To:Cc:Subject:From;
	b=hak5Vkv5tQerYLM6yYaXNQ39UnrrkiyQCsHbeOktoENEQe1c8vRoPj4zRk9zefRnT
	 RNu1uVgz/beYZ0nei2gfNZAkGUI/+xE0fdaYNrMRsV6lJDLZ/jBTu8qt6nRvug/VOA
	 E7ZZLRoroOJr1XsarR8tbTTx3MPFdknGF7Gr3fOWI0t93shrMN0SudhVtV7R8ii7m8
	 lij2XqaBnsKz4sgp3cjWe4cts7LaxZrdFUC2CChe1Xi4o3cc/cJGDCbK5McHbXldNv
	 EtqCwF3Hami+GBSOGIc1MkRwSoo2kkHubI3oPi2IFtUTI+D+6w1u4xjd2LaJ4hou7q
	 +Y53YrcmCzX6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRHC03JXGz4wvd;
	Mon,  6 Jan 2025 12:48:28 +1100 (AEDT)
Date: Mon, 6 Jan 2025 12:48:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20250106124834.5a82a6da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/36bE1q_Hgbw/KnJDpyojwgG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/36bE1q_Hgbw/KnJDpyojwgG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build
(x86_64_allmodconfig) failed like this:

In file included from include/linux/string.h:389,
                 from include/linux/bitmap.h:13,
                 from include/linux/cpumask.h:12,
                 from include/linux/smp.h:13,
                 from include/linux/lockdep.h:14,
                 from include/linux/mutex.h:17,
                 from include/linux/notifier.h:14,
                 from include/linux/clk.h:14,
                 from drivers/mtd/nand/qpic_common.c:6:
In function 'fortify_memset_chk',
    inlined from 'qcom_clear_bam_transaction' at drivers/mtd/nand/qpic_comm=
on.c:88:2:
include/linux/fortify-string.h:480:25: error: call to '__write_overflow_fie=
ld' declared with attribute warning: detected write beyond size of field (1=
st parameter); maybe use struct_group()? [-Werror=3Dattribute-warning]
  480 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")

I have used the nand tree from next-20241220 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/36bE1q_Hgbw/KnJDpyojwgG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7NnIACgkQAVBC80lX
0GzXPQgAmw7RsiXyfsVUJKudWFJyaJU9A6kXzF7wlmebKCgfJQFmnyfvESTCc3UL
thTjZLm/6nnxTyJoqnEMf5P3qszoin1vPILKRj3uAuFzLSKsT/1YBhOMFS3DbCdr
Ypk4lQg06Jlcn/OcCmjo4C1fBNMyJWU0ciAQJ6pc75MH8tSe88j4p/NGTYlzTBAU
AVL91E0zAbSIqeJIpl/7cSo2OamZqcn7oEDr9m4ZorJcg49E2r24EQ1M+FJzx8wC
/pIvk/KXSw9m2SZZatT8X1duLBJjBdpF2jukkYR1QBZq6StDpfxAEXo/EogxOcPB
5BV0VSQlhOA4r9UQtwv14x89gkpKpw==
=t5bD
-----END PGP SIGNATURE-----

--Sig_/36bE1q_Hgbw/KnJDpyojwgG--

