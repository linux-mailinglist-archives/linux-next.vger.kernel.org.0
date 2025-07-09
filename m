Return-Path: <linux-next+bounces-7433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D158BAFE92D
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 14:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20BCD5A5CA3
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 12:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890C32D9EFE;
	Wed,  9 Jul 2025 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="PZPxg6ON"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AD2957CE;
	Wed,  9 Jul 2025 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064950; cv=none; b=bc9oI6mJ4XdpIYChbqpV4cig06ST59QcEcJXq2Xkqgy9hh1U5W92Pe4Nk710fruExPCyL8OghVZPNTPJKEOsj1RFJdm4qiusVsgbAoJRNN7lMEiisBqFDKEy9KflfBBpvwtRqH+bVa6cHLdd5a63EyZaJnPUt4tkJi7JmlTnw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064950; c=relaxed/simple;
	bh=qd0ggFBexalAaG4iZ0qMXP94ZsWLTXPbACajp3+r9Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OX3mGMYDBTb2AurGhP/WYErWr5EgVsZeKkTGsiB1ASBj0csB42hPWIWNHJ49OZi/feNkxv6rjJHQX5p75P0cMPQ3ORPJBK8kTU/ozv0a+RnSqFaMDCn80V1J7h+zYrAXDnSDN398PqvufCB+ZoO6YAvdPICGNYYF56cWLpYD3aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=PZPxg6ON; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752064939; x=1752669739; i=spasswolf@web.de;
	bh=8FJZ0RHvoliCsQXHemkXZQdu3oYiDZDSrwyFb1P7bgI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PZPxg6ONIEjkgqSEJOfaQuduyCSdBmIa7Eh70ZrM9Ec7hkpM1BcuBAzPMYGIouNc
	 Sgc0pFZtPws2gqLud4Nhqd3I6ECPkExqv/mVeMimVILxwqCoi0SEz41ZJK3jdP+Az
	 rud/O3mEf7JAW8mQce/rCzvkxy0aT4e164FLJbYmk4Xyvt6OtdycjMImOsNXEpfNf
	 SnvQVCWz0A+CuJwj11Abbz5PRB2x4MqY6OmqjHJqtpykOqXfqwmGYhaNCl81ZMRdg
	 oyIh9u1XhGLimQ+ADGvKzQI9JwbN5m6Xe0HcVOti0UY+o2otckPRGgVzyiSA+7Ko6
	 10weqia3i077ejSaGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa ([95.223.134.88]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1uNdcC3cB3-008Vk4; Wed, 09
 Jul 2025 14:42:17 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: CONFIG_DEVMEM=y breaks gettimeofday in next-20250708
Date: Wed,  9 Jul 2025 14:42:15 +0200
Message-ID: <20250709124216.3011-1-spasswolf@web.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8qmucu4bjFoZ4V0f+nlVsWIR19cDiUAR8YaKarvtu/FV5MiBD4s
 VCfZ/CCAi6AxWbxnFF91/Ws9e6CrkfuNRuQG4DiLZYeSTzj+OoWNGS33lJLZuLxe1Er1myP
 XVsW/kCq2ldPN537gAh0q6LEjaSf0holR4Vgt9mZuYS5E6pXOpuB7jPlRupPGD+tZF1nSHD
 Q8XBLbTAk7WX2+Vq4Ms4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YhIWsc1aueo=;2/EcGovzV4MX65Ui+NCkC9J92rt
 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
 iHleQBRurDAEIN+iSqA4UIOIuJE8mlnk=

Recently I found that my RAM has an error (memtest86+ reproducibly reports
a failing address) (this error may lead to random crashes every few days).=
=20
To further investigate the issue I tried using memtester which needs acces=
s=20
to /dev/mem and so I recompiled linux next-20250708 with CONFIG_DEMEM=3Dy=
=20
and found a strange and unusual side effect:

a) the time displayed by xfce is stuck at 1.1.1970 01:00 (UTC + 1)
b) most certificates in firefox-esr fail to work due to the date being 1.1=
.1970=20
(this includes www.google.de, www.duckduckgo.com, wikipedia and youtube an=
d many more)
c) some certificates in firefox-esr still work (kernel.org, xkcd.com, www.=
spiegel.de)
d) the shell built-in time (and also /usr/bin/time) fail to work, e.g.
$ time sleep 5
real	0m0,000s
user	0m0,000s
sys	0m0,002s
(even though it actually take 5 seconds for this)
e) date still works correctly, e.g.
$ date
Mi 9. Jul 11:51:20 CEST 2025
f) This example program=20

#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>

int main()
{
	int ret;
	struct timeval tv;
	struct timezone tz;

	ret =3D gettimeofday(&tv, &tz);
	printf("gettimeofday returns ret =3D %d, tv.tv_sec =3D %lu tv.tv_usec =3D=
 %lu\n", ret, tv.tv_sec, tv.tv_usec);

	return 0;
}

gives the following output on affected versions:

$
gettimeofday returns ret =3D 0, tv.tv_sec =3D 0 tv.tv_usec =3D 0


These errors do not occur when using v6.16-rc5 with CONFIG_DEVMEM=3Dy, and=
 are 100%
reproducible so are not related to the RAM error.=20

I bisected the issue in between
v6.16-rc5 and next-20250708 and found commit fcc8e46f768f ("vdso/gettimeof=
day:
Return bool from clock_gettime() helpers") as the first bad commit.

Bert Karwatzki

