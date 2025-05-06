Return-Path: <linux-next+bounces-6533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66051AAB950
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 08:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487013B9E9D
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 06:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B29627F751;
	Tue,  6 May 2025 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FkEPTSGK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54522DDD0F;
	Tue,  6 May 2025 01:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746495849; cv=none; b=Lk7Gp4/UkrnvVP2V8Qn3G/vSBS+ASA4YXST4sLE3YcalSrJ/AXW7U41t8SbrRORRuFSjaczuTXDGXn6ZlUDn+91dKeGEt1ooOPgtu1VWny9QibrJUTbjgSq1ma7u9cI0dipWqPTZHaeyLFuEvJKlp2F+23/jaS8QzpLRms0OXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746495849; c=relaxed/simple;
	bh=19mZVmvZgZMCUKu150c5NZpMhyd/9wxKXQgCFRWNu6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RxFHIBdYYtr+LuCtCewkDrVKvDVA9Sl9VrNF/5akHrE/kl+vb1q0D8j0W7Dmb21xFWdnkGKiMWs7Rl0TskN2i5rg2l7jDdGExex2ThVSwl0p0yXtSAnIvHzMOwsnrHx22p69Q+q7HD2RzLM9Ida5ptKWhbF8jaXFEh6brFYz2N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FkEPTSGK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746495843;
	bh=CDn02VoIaa3g7/37mOMgvjVmAv8sbq9dp57lDEXRR+w=;
	h=Date:From:To:Cc:Subject:From;
	b=FkEPTSGKKujzbsGctR5pmGDIPh8IFI+/Oqh/P/fKkqacFT5boeMor+b8PcErdosaa
	 p5m4Aqjn7qJgivsYNU8DdegmNdQfkkHxGvuQYBKSVgb3WT/ywFofIyjMko4UTUOp5T
	 uq1tgwogG2qzjiCCcBDjAg3od76xSjZ6QNr3ofsfjIhYnh8MV2xz6dMyXiu4Suks/F
	 sfFhBOXaK8QvHQ1OCyPr0tGNLF4KYkkBjTc+QuZt0BhZ0Sd6OmyjfoNkMH5bJOiNJr
	 gR1EcJL4vS8q06//BjEF3uDFX93sxn3Of3llHxlfqdz+1Z8JSAR/gq/9yzzF8t7WHv
	 k2gaVQ8S4fVgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs1QV6LfBz4wbY;
	Tue,  6 May 2025 11:44:02 +1000 (AEST)
Date: Tue, 6 May 2025 11:44:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with Linus' tree
Message-ID: <20250506114402.2f440664@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CpVNzigQ+dlP6JgH3+Y6GNi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CpVNzigQ+dlP6JgH3+Y6GNi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got conflicts in:

  drivers/net/wireless/intel/iwlwifi/cfg/sc.c
  drivers/net/wireless/intel/iwlwifi/iwl-config.h
  drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
  drivers/net/wireless/intel/iwlwifi/iwl-trans.c
  drivers/net/wireless/intel/iwlwifi/iwl-trans.h
  drivers/net/wireless/intel/iwlwifi/pcie/drv.c
  drivers/net/wireless/intel/iwlwifi/tests/devinfo.c

between various commits from Linus' tree and various commits from the
iwlwifi-next tree.

At least one of the commits in Linus' tree is duplicated in the
iwlwifi-next tree.

I couldn't figure out how to fix it up, so I dropped the iwlwifi tree
for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CpVNzigQ+dlP6JgH3+Y6GNi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZaWIACgkQAVBC80lX
0GzTDwgAi/B1fZO3XzlOPl5bX9Hge71EbuNjjoDQCcFQFxUGCXTzB85I0MBWhTZU
SoYML9ecb9ocgmfCxqqQWolV/NbzoyfUdyvBwjF6cq9AhX0NK/Qev6Grv+s+eymj
CINTdM9JNhpx+PLD/D2Gr2b33d7Q5lj6pN40j4g5GSUDrdc96cOET7Qg0pYOA7C7
D7I54LruVFQtnKoSJoD8oOQ/5tWgOdU/+b+Y0veC+N/LhT2yyDJ9NifJXFOw7ALV
d4oh7s+W6v2ApH1GzReDITzt0WBYslBAUyWNNyp+YntFtgUt5hu0R8fsIQhxRNdr
ClD8TNhKKgBRIBFkIKF5eHwzrMHd6g==
=8N2k
-----END PGP SIGNATURE-----

--Sig_/CpVNzigQ+dlP6JgH3+Y6GNi--

