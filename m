Return-Path: <linux-next+bounces-8686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE725BFE95A
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 01:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A43643A35CA
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 23:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A20305E19;
	Wed, 22 Oct 2025 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M/JzQISI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D20307AE1;
	Wed, 22 Oct 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175838; cv=none; b=KXR6KSv53MenmNgeSX6LBR1srzy9izVJ0u14xoAUnjE2telhB6J0eU6WAU+GEMQaoxUUavzte2DJhk7aPIsdPB/tbfrwfd7/ck2hl7ojU/Cp7+ttffxbnJLzDXvoQX0jiDvIAI172bOQT7hKHiLGyoqrfaBzz2n+7Nbcunl7wg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175838; c=relaxed/simple;
	bh=Hde4fcdX6Fyj9O/1wekIbmldLfZqWfz5Xy8fCMVdArc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vCMSavIudV9VK3mprmhZLM+rJ+E0bmPJY8iG4jhdko9hKrhDLSA+jAWau3XmARPKJkL6dLtDSeNoTwTZeyQMw9oIiMusV6ZDbcQyun6ga+ZGwqwiGoyAWGfrTZib294gIbO5vVpz0E00aggOWxyVAyCL/gPpVX2cVegshrc4JIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M/JzQISI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761175823;
	bh=O60pWPgOGUhvOYfOoKTxF1PQ//SHYjvxwW3qGmCjajY=;
	h=Date:From:To:Cc:Subject:From;
	b=M/JzQISIrvliA3sHltpQpiCtFt0IY151EGEANz14CSAdVXpoTktzG6nysGOdxtoMS
	 neaFXvet57Y4w6cE+YnYXFKvLdPsnYVZMBbwyTZzBR2nozEUliI/vmFmMueqsiZ8o/
	 w5z5PTKdKCW+NQ3/CR5f5xN9TOUcYiwTnAm1J4dT5ggkcMwRIDp96o2BBKAyfJrET9
	 2CIT5z4eAv+ca+BTB7eHtL3dJDDGA3gTbl65Bol5E36Q1oPMEC1ZoO0izhimyeVObw
	 yoMc/xXz94FfkvB9G8yeJpeV+Lx1IDpJbVi27MMNoqPvl/VKizJpHHoxIhxGudOPEc
	 2WxBXq8qKkY4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4csQPp55mfz4wMF;
	Thu, 23 Oct 2025 10:30:22 +1100 (AEDT)
Date: Thu, 23 Oct 2025 10:30:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pmdomain tree
Message-ID: <20251023103020.20e9c1cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XK0CxmqGDsz_NTNzsubdBH0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XK0CxmqGDsz_NTNzsubdBH0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pmdomain tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pmdomain/mediatek/mtk-pm-domains.c: In function 'scpsys_sec_infra_p=
ower_on':
drivers/pmdomain/mediatek/mtk-pm-domains.c:128:30: error: storage size of '=
res' isn't known
  128 |         struct arm_smccc_res res;
      |                              ^~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:9: error: implicit declarati=
on of function 'arm_smccc_smc' [-Wimplicit-function-declaration]
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |         ^~~~~~~~~~~~~
In file included from drivers/pmdomain/mediatek/mtk-pm-domains.c:18:
include/linux/soc/mediatek/mtk_sip_svc.h:22:9: error: implicit declaration =
of function 'ARM_SMCCC_CALL_VAL' [-Wimplicit-function-declaration]
   22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENT=
ION, \
      |         ^~~~~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:56:41: note: in expansion of mac=
ro 'MTK_SIP_SMC_CMD'
   56 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
      |                                         ^~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:23: note: in expansion of ma=
cro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/soc/mediatek/mtk_sip_svc.h:22:28: error: 'ARM_SMCCC_FAST_CALL=
' undeclared (first use in this function)
   22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENT=
ION, \
      |                            ^~~~~~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:56:41: note: in expansion of mac=
ro 'MTK_SIP_SMC_CMD'
   56 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
      |                                         ^~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:23: note: in expansion of ma=
cro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/soc/mediatek/mtk_sip_svc.h:22:28: note: each undeclared ident=
ifier is reported only once for each function it appears in
   22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENT=
ION, \
      |                            ^~~~~~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:56:41: note: in expansion of mac=
ro 'MTK_SIP_SMC_CMD'
   56 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
      |                                         ^~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:23: note: in expansion of ma=
cro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/soc/mediatek/mtk_sip_svc.h:18:41: error: 'ARM_SMCCC_SMC_32' u=
ndeclared (first use in this function)
   18 | #define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_32
      |                                         ^~~~~~~~~~~~~~~~
include/linux/soc/mediatek/mtk_sip_svc.h:22:49: note: in expansion of macro=
 'MTK_SIP_SMC_CONVENTION'
   22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENT=
ION, \
      |                                                 ^~~~~~~~~~~~~~~~~~~=
~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:56:41: note: in expansion of mac=
ro 'MTK_SIP_SMC_CMD'
   56 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
      |                                         ^~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:23: note: in expansion of ma=
cro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/soc/mediatek/mtk_sip_svc.h:23:28: error: 'ARM_SMCCC_OWNER_SIP=
' undeclared (first use in this function)
   23 |                            ARM_SMCCC_OWNER_SIP, fn_id)
      |                            ^~~~~~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:56:41: note: in expansion of mac=
ro 'MTK_SIP_SMC_CMD'
   56 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
      |                                         ^~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:131:23: note: in expansion of ma=
cro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
  131 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0=
, 0, 0, &res);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:128:30: warning: unused variable=
 'res' [-Wunused-variable]
  128 |         struct arm_smccc_res res;
      |                              ^~~
drivers/pmdomain/mediatek/mtk-pm-domains.c:133:1: error: control reaches en=
d of non-void function [-Werror=3Dreturn-type]
  133 | }
      | ^
cc1: some warnings being treated as errors

Caused by commit

  df4e9ec1ed86 ("pmdomain: mediatek: Add support for secure HWCCF infra pow=
er on")

(and maybe others)

I have used the pmdomain tree from next-20251022 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/XK0CxmqGDsz_NTNzsubdBH0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj5aQwACgkQAVBC80lX
0Gx9PQf/cFq1PjiIiwxSS2K3dVSMWqocjRkquJqTNfMmeLLCXNzjl6PRADr+q9lo
R4Tv7TY+Tq0+WJLRsk9suiSDfSeDjqT1Rn4ZpUbvjliKTGG1Qq5gfFAGbpvpTfid
esIwV+3T7ruKm53Kk6ZipWhKNSj0EzJGFlmEiuX/u482vK/4/Wt6IqfUy+cJ+lds
RLuMUiABm/W/G3WnrYCnTiRI6DQeAQ9z0vjR057DN52za3TgtoSy9r0Fvwg45wgo
gWefGVlIb1ComgJWhVgZLhS97pKPUSxj33qV2eKqcPq4zh060b1humD2iKyvFHP+
vWrn0J68djkOH8Rngm48jhzkWtzTBQ==
=g3mt
-----END PGP SIGNATURE-----

--Sig_/XK0CxmqGDsz_NTNzsubdBH0--

