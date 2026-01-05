Return-Path: <linux-next+bounces-9546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6955CF5FDA
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 00:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2D913063898
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 23:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2728253340;
	Mon,  5 Jan 2026 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E2lGeBsG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383863A1E7F;
	Mon,  5 Jan 2026 23:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767655893; cv=none; b=EY+TOeRFbjXXPd28boue8Y/thwKHT/ov+jr8RxWwZLzvlh9mOUuheaXJ+wAq9f/UBfA1qL1o8A5xceIbDHtuMsmayif/GpBH+qNg2EOFXzeoya+njjN4CRe5y5swjs5u9dA787e38fq36W/Hiw0cL02YdIo/8XPrELRZBNKUG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767655893; c=relaxed/simple;
	bh=56J5vIsVRQ4isHLBY2RHfeI6Op3XvMXYJ6FcBGhYKbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XGFyxgfwWy0MYgMTFOzmOxFPrJc6s/JbQ4C8lCeGaKuxOH3u6JriMFzl42kVtHj1pLinCmFRhzw1JlJSQo3gXRlQh7TtLXuklPYyD06KQCmOZh5k7iQckx6Ow0hUASYXjexjfvb2B+EhEpHLu51BYITqsuNqlG6pTmscOKAYdWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E2lGeBsG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767655884;
	bh=H8hL9YxVJ7vgDMg6xlT+hCg83akUvwd0wO6/U+iqYDc=;
	h=Date:From:To:Cc:Subject:From;
	b=E2lGeBsGMhT/ptc6yMJCXbaUVSwE53M5lCJFYOGxIMSKs4HCEaKck0F9aofyV1KCt
	 ajy+IleFXRPFhkrBd/JxFRUthWal9HtKf05akCsfh1X3xSM6oxGGCE5iKIogrdw8tx
	 mofMuWGOymp11ILkkdok6QGFMB5iia+WEJI2JsXTm0Zm63ZUi0tzHjN86iIiIkd4qz
	 ZT37KHEsowOF/scAl/v27Dw8R8LqpmtwD1J3vNrplllOX0rkTCIbrjAJxYvN+bX2PI
	 4nZkoH+ln8uiRV00qo88+8FnKsMPacC17w93nrn0V9hznNYTF8SA2yFIe76pc4L5wO
	 OMWS2+IXzgSqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dlVtN1JYKz4wH2;
	Tue, 06 Jan 2026 10:31:24 +1100 (AEDT)
Date: Tue, 6 Jan 2026 10:31:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>, Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Jagadeesh Kona
 <jagadeesh.kona@oss.qualcomm.com>, Jingyi Wang
 <jingyi.wang@oss.qualcomm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mailbox tree with the qcom tree
Message-ID: <20260106103123.2324639a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/09hbr9GHtup32KBF_MkKnDK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/09hbr9GHtup32KBF_MkKnDK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got a conflict in:

  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml

between commit:

  65ce09d2f164 ("dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox =
controller")

from the qcom tree and commit:

  945dc11a38a0 ("dt-bindings: mailbox: qcom: Add CPUCP mailbox controller b=
indings for Kaanapali")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 9d99af46e531,9e91247c521a..000000000000
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@@ -19,7 -19,7 +19,8 @@@ properties
        - items:
            - enum:
                - qcom,glymur-cpucp-mbox
+               - qcom,kaanapali-cpucp-mbox
 +              - qcom,sm8750-cpucp-mbox
            - const: qcom,x1e80100-cpucp-mbox
        - enum:
            - qcom,x1e80100-cpucp-mbox

--Sig_/09hbr9GHtup32KBF_MkKnDK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlcScsACgkQAVBC80lX
0GzGOAf+PDJGQUKFk5vyG9Zzl21pY/9RYCf1SNvghrdPMWCOgAMEfSO2q4ofepA0
1IAXwJyxSLaLxiMBL3kk8PGwSImpgUXzuOEZt1wEDfZ42+W7hG4RBQ39URECb3tY
8+15gUQPno7ieP5IdZTFGrvUGbPnn7ZFeXJxu3rGNWrZcLLnUHhafQ3bRImyIvjY
NfegS2AuuVrQ062UKH+0UgfKCZ5qRjTUB2BGqSOJwRQy03rds9CPwf17CEQn0W2w
vT7n7BeL4TeawsFo/ud7lKKggv6fzUFMGrjp1JfLdWNZjAQKTAG0ONfkOb+SnGz3
0hB83GQb4MEfkCbL9CoVt4crYKid7A==
=B1d4
-----END PGP SIGNATURE-----

--Sig_/09hbr9GHtup32KBF_MkKnDK--

