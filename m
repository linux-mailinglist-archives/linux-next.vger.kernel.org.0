Return-Path: <linux-next+bounces-6734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D5AB5311
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 12:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B45359A51E3
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 10:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C524E268FE0;
	Tue, 13 May 2025 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="HwvO7nEc"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E90268FF4;
	Tue, 13 May 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131565; cv=none; b=kiQTFAI6C3gzyX9a1esbt75L+GtbeJhSXd2C0KKIrZzAfeYd5FMRrNX0SoluN74LGOdeLj+D9RHntU2jGneMoIM6UT0VbHruNfLqnbiPNBzptD0VKAjUQAdMA53vrwy9z9Z33F6pa1w7c3SYL3F5VPR/rDaakQPw7sV+bytPrFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131565; c=relaxed/simple;
	bh=nJdbrT4xKz+cSZcwNhDDjXpWsG3uI7hhkCgL6kD6agI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feCsMXZQ2FnTNplAHU9Nkv0Sj3V1BqKpS9E2bJ8uUfFF2/eVKwcxk5WF2ZOVfs3JAN6q/YZBrradysAuxIy9ttCAVucfHOZ9XIRhTTZdVJBrP7f4R56UyvY22TOozcSQm5I+Sh7CJ6RWoRyzCjL43Hh9AsNC6GxmBPIsUPlzt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=HwvO7nEc; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747131555; x=1747736355; i=spasswolf@web.de;
	bh=H4dStYX2XMpoXB0CyFxZvL5ua/iNIjr4mUdvimlwRfc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HwvO7nEcE5vBSO1aquzI14AV2N2o/ptw/XAyTaqHFMvxTlrkWpAUG9+8DVy0sCpd
	 3j7eHZEOyzKov2KkXqCjvwYCklCLKc4KIBS8/vJJSDz11bY48PnsOj/McZpAdY44k
	 s8Ho8jEMHHRg/PCRICoW9hdEKNEYTQdyxV1CURDKTesyJdX5PmZwgaOBsBsxS2c9D
	 qWQ12oXRCGHJZA3oNVBPcuZvHhSoMEJoWjgcKiHVS1u6wsGnv9qJG6wTxpEo3tMol
	 BvHe3yGcfaWUO8Q2mf/a8M7wFJScnzu2kmhB3gGumbj6Xj7vZNQtdeHIDX6g4ryPh
	 FYBaU155mUTXWdBI0A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N0Icn-1vARan3jc7-00tdaM; Tue, 13 May 2025 12:19:15 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when compiled with clang
Date: Tue, 13 May 2025 12:19:11 +0200
Message-ID: <20250513101912.58056-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: 20250513080011.77840-1-spasswolf@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BAm3RPjvolwERI4akZfgjdnPJdGKzQm3Z/h1AXnYDswEqhPOrt3
 GKtthXYwTtmiXLT/VbL+SfL0j8+ZEStr79LaeQJmrCVtCzYHcBq9EZb9Gf9yiG7WgZkgm7a
 hLv6itg4jW9qfT7PnYW+AmdlmtBmcsSWbi73Rtd7TomjFrrUz36PveYTAqVe6I78fm8Nriu
 NwSIJ5oD137kEpV983G8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ez5qQ5x6uW4=;FVroQC5FKU7t+rNeAFredGG+1SP
 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
 tvc5JY6/bOl9hS5F0m68ujRFkv+8LLR6/5

>=20
> I'll now start a bisection where I revert 76a853f86c97 where possible in
> order to find the remaining bugs.
>

This bisect is under way
git bisect start
# Status: warte auf guten und schlechten Commit
# bad: [edef457004774e598fc4c1b7d1d4f0bcd9d0bb30] Add linux-next specific =
files for 20250512
git bisect bad edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
# Status: warte auf gute(n) Commit(s), schlechter Commit bekannt
# good: [82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3] Linux 6.15-rc6
git bisect good 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
# good: [359e9e09fd7696427625f6c0d8b7f64f408fe8c5] Merge branch 'spi-nor/n=
ext' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good 359e9e09fd7696427625f6c0d8b7f64f408fe8c5
# good: [fbbd1ba0e9a92ba0d28414c752689a1fe7c45572] Merge branch 'for-next'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git
git bisect good fbbd1ba0e9a92ba0d28414c752689a1fe7c45572
# bad: [88ab40966878885e1fa546dbdcf4953874def09f] Merge branch 'usb-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git bisect bad 88ab40966878885e1fa546dbdcf4953874def09f
# bad: [1d31dc07d285413b70b8dddb479a99f7dd9022c0] Merge branch 'master' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect bad 1d31dc07d285413b70b8dddb479a99f7dd9022c0
# bad: [6e716555ccbf8a4b5e0fd3441fd7f13415248ed2] Merge branch into tip/ma=
ster: 'irq/core'
git bisect bad 6e716555ccbf8a4b5e0fd3441fd7f13415248ed2
# good: [37084fbae2154f3d7674c98d33553e8997b19fda] Merge branch 'x86/boot'=
 into x86/merge, to ease integration testing
git bisect good 37084fbae2154f3d7674c98d33553e8997b19fda
# good: [11d6189057fa754ac7d2132ca0d24b87595b36e4] Merge branch into tip/m=
aster: 'core/entry'
git bisect good 11d6189057fa754ac7d2132ca0d24b87595b36e4

but I get a compile error at commit=20
aefc11550ebd ("genirq: Remove unused remove_percpu_irq()")

kernel/irq/manage.c:2565:3: error: cannot jump from this goto statement to=
 its label
 2565 |                 goto err_irq_setup;
      |                 ^
kernel/irq/manage.c:2567:2: note: jump bypasses initialization of variable=
 with __attribute__((cleanup))
 2567 |         guard(raw_spinlock_irqsave)(&desc->lock);
      |         ^
./include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
  319 |         CLASS(_name, __UNIQUE_ID(guard))
      |                      ^
./include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
  166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix),=
 __COUNTER__)
      |                             ^
././include/linux/compiler_types.h:84:22: note: expanded from macro '__PAS=
TE'
   84 | #define __PASTE(a,b) ___PASTE(a,b)
      |                      ^
././include/linux/compiler_types.h:83:23: note: expanded from macro '___PA=
STE'
   83 | #define ___PASTE(a,b) a##b
      |                       ^
<scratch space>:35:1: note: expanded from here
   35 | __UNIQUE_ID_guard578
      | ^
kernel/irq/manage.c:2561:3: error: cannot jump from this goto statement to=
 its label
 2561 |                 goto err_out;
      |                 ^
kernel/irq/manage.c:2567:2: note: jump bypasses initialization of variable=
 with __attribute__((cleanup))
 2567 |         guard(raw_spinlock_irqsave)(&desc->lock);
      |         ^
./include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
  319 |         CLASS(_name, __UNIQUE_ID(guard))
      |                      ^
./include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
  166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix),=
 __COUNTER__)
      |                             ^
././include/linux/compiler_types.h:84:22:  CC      kernel/seccomp.o
 note: expanded from macro '__PASTE'
   84 | #define __PASTE(a,b) ___PASTE(a,b)
      |                      ^
././include/linux/compiler_types.h:83:23: note: expanded from macro '___PA=
STE'
   83 | #define ___PASTE(a,b) a##b
      |                       ^
<scratch space>:35:1: note: expanded from here
   35 | __UNIQUE_ID_guard578
      | ^
2 errors generated.
make[7]: *** [scripts/Makefile.build:203: kernel/irq/manage.o] Fehler 1
make[6]: *** [scripts/Makefile.build:461: kernel/irq] Fehler 2


Bert Karwatzki

