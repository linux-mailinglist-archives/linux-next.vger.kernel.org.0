Return-Path: <linux-next+bounces-9623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A1D16C92
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EAAB303C236
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CBF32862D;
	Tue, 13 Jan 2026 06:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vc++aZfL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543530C62F;
	Tue, 13 Jan 2026 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285002; cv=none; b=uCS821wYAp7W7QpxbJkpOsGkgp/2QCXljazjqC+ZpIlKdRjx+/QtcpwWJ6psZwuagdx6AsAP2AokR5D4x7Av3XS3Og8yhxEXDj2U1zfl0vYV6TPUlcpiZWpSTqwIAttgOtPmA2PO25RWLFanAEgOUu6i8zskC6YVaVuhZoF5fCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285002; c=relaxed/simple;
	bh=gwYog2yWkILne/uAzUmg5SLLW7BGAalPbgUvpHrN5uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GIoD8yREXKQZ3TFayi/glBcnkyGLU0iRmSSobUPROCobD9S2aGURvlLu7xIYXd5dSHIENVk19MqJDlp8ySIFvTqEl8KI6aVCqaMzKoN2muQHc3a/WoPpl87ULraHCXPZCrRjJsao8EadUMAWoz8Jd5AxP9MGxECs6AqAcA5AVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vc++aZfL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768284995;
	bh=cSbee1z1O436wXLvlU5AQ4uXuwyWU7NpC5/DBlBWO0w=;
	h=Date:From:To:Cc:Subject:From;
	b=Vc++aZfLFDDRwp/flwWLjrZbzKMiJP0R/FJzq3prQiUkvu6LdOzWtGpWY7se2GieK
	 g48luRTj/i4zgAoah7nH85qp2/lzUPMn0JVU+LIf7njz7TAa9fHdwTQco9K/kyseio
	 OrfA42zuBcvfM1E2LZHgc05NWYFajJOgqFoQR1zzov7DhukxhcmsG0N83oW6khib8C
	 nPItFnoX9Ib1C8jPX9DYfX/qA+023Bc2b+fOhHCGRTE6n/Eb8PVPn3JZ1b9St5mewv
	 i4gRXPzfJKU5FQ2qMGGFYVB6Ri75xUd9aBjp15I3uQq2M2LGLOAjulj0jeimvZQSYL
	 guQNL8N4X8dpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqzXg0g21z4w0Q;
	Tue, 13 Jan 2026 17:16:34 +1100 (AEDT)
Date: Tue, 13 Jan 2026 17:16:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Michael Chan
 <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the net-next tree
Message-ID: <20260113171633.1536cc74@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ibQmQTlDxduYNNkZ=PQk3_l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ibQmQTlDxduYNNkZ=PQk3_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c: In function 'bnxt_ptp_init':
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:13: error: implicit decl=
aration of function 'boot_cpu_has'; did you mean 'boot_cpu_init'? [-Wimplic=
it-function-declaration]
 1141 |             boot_cpu_has(X86_FEATURE_ART))
      |             ^~~~~~~~~~~~
      |             boot_cpu_init
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:26: error: 'X86_FEATURE_=
ART' undeclared (first use in this function); did you mean 'X86_FEATURE_ANY=
'?
 1141 |             boot_cpu_has(X86_FEATURE_ART))
      |                          ^~~~~~~~~~~~~~~
      |                          X86_FEATURE_ANY
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:26: note: each undeclare=
d identifier is reported only once for each function it appears in

Caused by commit

  c470195b989f ("bnxt_en: Add PTP .getcrosststamp() interface to get device=
/host times")

boot_cpu_has() only exists for X86 ...

I have applied the folloring hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jan 2026 16:51:58 +1100
Subject: [PATCH] fix up for "bnxt_en: Add PTP .getcrosststamp() interface to
 get device/host times"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c b/drivers/net/et=
hernet/broadcom/bnxt/bnxt_ptp.c
index 75ad385f5f79..20f5a9f38fee 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c
@@ -882,6 +882,7 @@ void bnxt_tx_ts_cmp(struct bnxt *bp, struct bnxt_napi *=
bnapi,
 	}
 }
=20
+#ifdef X86_FEATURE_ART
 static int bnxt_phc_get_syncdevicetime(ktime_t *device,
 				       struct system_counterval_t *system,
 				       void *ctx)
@@ -924,6 +925,7 @@ static int bnxt_ptp_getcrosststamp(struct ptp_clock_inf=
o *ptp_info,
 	return get_device_system_crosststamp(bnxt_phc_get_syncdevicetime,
 					     ptp, NULL, xtstamp);
 }
+#endif
=20
 static const struct ptp_clock_info bnxt_ptp_caps =3D {
 	.owner		=3D THIS_MODULE,
@@ -1137,9 +1139,11 @@ int bnxt_ptp_init(struct bnxt *bp)
 		if (bnxt_ptp_pps_init(bp))
 			netdev_err(bp->dev, "1pps not initialized, continuing without 1pps supp=
ort\n");
 	}
+#ifdef X86_FEATURE_ART
 	if ((bp->fw_cap & BNXT_FW_CAP_PTP_PTM) && pcie_ptm_enabled(bp->pdev) &&
 	    boot_cpu_has(X86_FEATURE_ART))
 		ptp->ptp_info.getcrosststamp =3D bnxt_ptp_getcrosststamp;
+#endif
=20
 	ptp->ptp_clock =3D ptp_clock_register(&ptp->ptp_info, &bp->pdev->dev);
 	if (IS_ERR(ptp->ptp_clock)) {
--=20
2.52.0



--=20
Cheers,
Stephen Rothwell

--Sig_/ibQmQTlDxduYNNkZ=PQk3_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmll40EACgkQAVBC80lX
0GzUwQf/RWC50gqZ0/DmGrLkCT1s2mKBTAr2KsOAAlmNAayfym7gktMKFIABEwQl
wHJK6T+v2Zslf/Ad4jztMbFuRSyDljQiz4I+KuvnPXv+AKTc/ZYhQZ2zR5UWHmrP
+68T+BSGfSzfBIM7G542AoGlYj21dxRUEEVlcl1pApuvzFhnHZ3IkkbzMgiyG85L
DbLpuQbMPFffyCs9YqSR8bL8Lsg3YX7WD2BFqiSc5LK+1WWBUz9evo2VQRjM3JQP
PoApT/lD6zUz8Spe8aUT9eAdK3QWXJRzpI1ohTTIwn0StmgVCrcnViyZgetI1K01
AQp0XgdBJ/4VhuNGoE58OM1qRpveNw==
=TLLL
-----END PGP SIGNATURE-----

--Sig_/ibQmQTlDxduYNNkZ=PQk3_l--

