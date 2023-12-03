Return-Path: <linux-next+bounces-198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D38028F8
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 00:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C69280A04
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 23:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39C41A5BA;
	Sun,  3 Dec 2023 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EPFQ+DvB"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB6AD5;
	Sun,  3 Dec 2023 15:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701645825;
	bh=eZO5vxfD/lUYdJC60TR0T81E9hSH9cHr9B52b7JkpQ8=;
	h=Date:From:To:Cc:Subject:From;
	b=EPFQ+DvB+acgq1ZBpVnZ6RDhHr7RYrxqqtn299/Lmmj2pWgif9fWfsuxlKjihM64b
	 yRTfombERaO+JsT/dcO20d/FXxDGdCikHjE3Lfzx+IAhUYj+21TafDENX9RsoEFl9C
	 ldNkRZ5oW2lOrSv4g5ZTW1XKaDJffRc84a75Q+WliEju777K6RhwLgYwHDFwFFDmrS
	 b0nh9oNo6yQBGB6nSi7XShkdDpHGDrWr/swObxP7PzlCQ54o7mPyXK2D1d+TKG/sg5
	 jhk+2jhqGe1m0CjVQmcoFDwMzVbale95w7hgqfq2CmNIV7zg2ize1TOhthftJDJUF8
	 gLR1PS+YJ2+Vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk2t91BRmz4xKZ;
	Mon,  4 Dec 2023 10:23:45 +1100 (AEDT)
Date: Mon, 4 Dec 2023 10:23:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <20231204102344.3a01ad2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i8.1yTm3c=/H=KjbtasY+2u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i8.1yTm3c=/H=KjbtasY+2u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/soc/qcom/qcom_stats.c: In function 'qcom_ddr_stats_print':
drivers/soc/qcom/qcom_stats.c:167:16: error: implicit declaration of functi=
on 'FIELD_GET' [-Werror=3Dimplicit-function-declaration]
  167 |         type =3D FIELD_GET(DDR_NAME_TYPE, entry->name);
      |                ^~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  4a55812229a7 ("soc: qcom: stats: Add DDR sleep stats")

I have used the qcom tree from next-20231201 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/i8.1yTm3c=/H=KjbtasY+2u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVtDgAACgkQAVBC80lX
0GyLpwf9EP7C8bexCsrw6vmqZZ9EUH1r3Omi5+98tvOUuDLJYW1OmXuowf3yRPPl
OToqRzjlhuaVvJEWtyhmZAMOSJMSTeyfuw8fuQ0bbDh88zLrZHgJ2uI6RvtmbDtl
0oMh2ysEpbaeGO9oeQIfqJXs6CESFVxzYf0QlXGoucPLpHlmfHS/50NsVswsXUh4
ws0zmZWCN13P645bHLb1a1LeyXDQR1Z9vQgx1vNmz93XpkAg/ncEFqs9gcocbroz
DDseWXa1ljYpNkNTIqcBg6EQ2dyJ+d5lzF0y37S2tyLoKOPlCQy7OXjOnQziDtUp
S2HXu7xWkiJJIqtE9rv5TVbHZDXaaA==
=dZdl
-----END PGP SIGNATURE-----

--Sig_/i8.1yTm3c=/H=KjbtasY+2u--

