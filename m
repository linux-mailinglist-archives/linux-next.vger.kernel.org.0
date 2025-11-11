Return-Path: <linux-next+bounces-8922-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F4BC4F2CA
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 18:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB3AB4E118A
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 17:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB62312834;
	Tue, 11 Nov 2025 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="TEQ6EGF2"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCC34DB75;
	Tue, 11 Nov 2025 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762880543; cv=none; b=bYdvPlLkHLN05QYazxt4khJcD8hKwsPvoAyZOZGrxmsErw0PMBv4fv85pnPxZfM7RCflWfaec64bUqdG4OOYGpZxGUvIoSe6LVrpnE0ZU1LG4qpc+avVIyoN1c2XqX7C7m8y+AEqeZiI3Ry0jm8oFzI6Y9zCC0K4Z0xzuxA3HMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762880543; c=relaxed/simple;
	bh=Zbsa3yt2IXp2hd58ih472zjdKtWIVIBppt2vABVvDdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljRntHRhtAJsfxzEkrg43IjjIX+sB/L6VaEWbAsLlD+J0NsOX6eP8aqPhpYMbvsJNe5xQ6o2cZKUH8z27PbjhPPaiLHSpYwjqAoCg4iW1DvepJ9kQIOUVQ0rK3F9kWB3izE1eqY0KzksQOIUKV1eLWptUy1xFtBxFpSNRpn4UNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=TEQ6EGF2; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762880507; x=1763485307; i=spasswolf@web.de;
	bh=tyDFUCNa0CL421EWZ/jdhqFAwpx9jCMEfDMRf6w+XBY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TEQ6EGF2/21Nfqiblib16oRVbjxMYqVfBCQEkbFm9NGJxOB3XNch8Kd5EIppooRv
	 k7SeywmIZNkVeA+qALU65ISuqgJe1TfYUQxiX83fjlHweyofuAG2KgSfIp2g5HZHf
	 /gOKOFReoG2gk/mK/nVTFv0ypkN2YAsF/ZkixPXURevDqCBDN0E68Oq2JC7TXqMED
	 lJGhPhtlQHZ5tCp20k6MOBRgLMUbAhoQwgy7HAgPtnwQlsth0hv4kFLH+ymVDBaU+
	 uVtW7qgRBdLsa5LhASzsyWpoQ+Lr7ROKD4b4bbGnpMAhiCC9v0B6CokgswYvCcLvH
	 WOoHLsZcjNpA988tgg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MuVGA-1w9B7Z3B6w-00tpbx; Tue, 11 Nov 2025 18:01:47 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Tejun Heo <tj@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Calvin Owens <calvin@wbinvd.org>,
	bigeasy@linutronix.de,
	dschatzberg@meta.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH] cgroup: include missing header for struct irq_work
Date: Tue, 11 Nov 2025 18:01:43 +0100
Message-ID: <20251111170145.106356-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: https://lore.kernel.org/r/20251104181114.489391-1-calvin@wbinvd.org
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ikk961uNfaaZqLhdOMC2sLiL3lQIqqX1I4Ub3Skx17/d4XpmLJq
 KZxyge9HWjg+JBPQgkvzSSm9J5OGL4ju2kzDrL9yKuBOdu02XW0FtSTO/xS/8rxr2EbYY/l
 g+dWTYQw5uJgXCYLmYUtDSssXM0/EhXcsH8bRw5hKNuJGlP4NUaIq6//gsjqnue+A1TjdsI
 ItfaetwsxcPeHlcZIxuGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q4TjvPRW6Rs=;DNFyThkkJlneD7NbhuJ0bcptnAd
 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

To compile cgroup.c with PREEMPT_RT=3Dy include header which declares
struct irq_work.

Fixes: 9311e6c29b34 ("cgroup: Fix sleeping from invalid context warning on=
 PREEMPT_RT")

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 kernel/cgroup/cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 0cabc2081e8b..dd114fda37b2 100644
=2D-- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -60,6 +60,7 @@
 #include <linux/sched/deadline.h>
 #include <linux/psi.h>
 #include <linux/nstree.h>
+#include <linux/irq_work.h>
 #include <net/sock.h>
=20
 #define CREATE_TRACE_POINTS
=2D-=20
2.47.3

For me compiling next-20251111 with PREEMPT_RT=3Dy failed with the followi=
ng
build error:

In file included from ./include/asm-generic/percpu.h:9,
                 from ./arch/x86/include/asm/percpu.h:598,
                 from ./arch/x86/include/asm/current.h:11,
                 from ./include/linux/sched.h:12,
                 from ./include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function =E2=80=98cgroup_rt_init=E2=80=99:
./include/linux/percpu-defs.h:221:59: error: invalid use of undefined type=
 =E2=80=98struct irq_work=E2=80=99
  221 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))N=
ULL;    \
      |                                                           ^
./include/linux/percpu-defs.h:239:9: note: in expansion of macro =E2=80=98=
__verify_pcpu_ptr=E2=80=99
  239 |         __verify_pcpu_ptr(ptr);                                   =
      \
      |         ^~~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:273:35: note: in expansion of macro =E2=80=
=98per_cpu_ptr=E2=80=99
  273 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
      |                                   ^~~~~~~~~~~
kernel/cgroup/cgroup.c:7059:17: note: in expansion of macro =E2=80=98per_c=
pu=E2=80=99
 7059 |                 per_cpu(cgrp_dead_tasks_iwork, cpu) =3D
      |                 ^~~~~~~
  CC      net/ipv6/sysctl_net_ipv6.o
kernel/cgroup/cgroup.c:7060:25: error: implicit declaration of function =
=E2=80=98IRQ_WORK_INIT_LAZY=E2=80=99 [-Wimplicit-function-declaration]
 7060 |                         IRQ_WORK_INIT_LAZY(cgrp_dead_tasks_iwork_f=
n);
      |                         ^~~~~~~~~~~~~~~~~~
kernel/cgroup/cgroup.c:7059:53: error: invalid use of undefined type =E2=
=80=98struct irq_work=E2=80=99
 7059 |                 per_cpu(cgrp_dead_tasks_iwork, cpu) =3D
      |                                                     ^
  CC      drivers/connector/cn_queue.o
kernel/cgroup/cgroup.c: In function =E2=80=98cgroup_task_dead=E2=80=99:
kernel/cgroup/cgroup.c:7068:9: error: implicit declaration of function =E2=
=80=98irq_work_queue=E2=80=99; did you mean =E2=80=98drain_workqueue=E2=80=
=99? [-Wimplicit-function-declaration]
 7068 |         irq_work_queue(this_cpu_ptr(&cgrp_dead_tasks_iwork));
      |         ^~~~~~~~~~~~~~
      |         drain_workqueue
./include/linux/percpu-defs.h:221:59: error: invalid use of undefined type=
 =E2=80=98struct irq_work=E2=80=99
  221 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))N=
ULL;    \
      |                                                           ^
./include/linux/percpu-defs.h:245:9: note: in expansion of macro =E2=80=98=
__verify_pcpu_ptr=E2=80=99
  245 |         __verify_pcpu_ptr(ptr);                                   =
      \
      |         ^~~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:256:27: note: in expansion of macro =E2=80=
=98raw_cpu_ptr=E2=80=99
  256 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
      |                           ^~~~~~~~~~~
kernel/cgroup/cgroup.c:7068:24: note: in expansion of macro =E2=80=98this_=
cpu_ptr=E2=80=99
 7068 |         irq_work_queue(this_cpu_ptr(&cgrp_dead_tasks_iwork));
      |                        ^~~~~~~~~~~~
kernel/cgroup/cgroup.c: At top level:
  CC [M]  fs/nls/nls_ascii.o
kernel/cgroup/cgroup.c:7039:40: error: storage size of =E2=80=98cgrp_dead_=
tasks_iwork=E2=80=99 isn=E2=80=99t known
 7039 | static DEFINE_PER_CPU(struct irq_work, cgrp_dead_tasks_iwork);
      |                                        ^~~~~~~~~~~~~~~~~~~~~
./include/linux/percpu-defs.h:103:44: note: in definition of macro =E2=80=
=98DEFINE_PER_CPU_SECTION=E2=80=99
  103 |         __PCPU_ATTRS(sec) __typeof__(type) name
      |                                            ^~~~
kernel/cgroup/cgroup.c:7039:8: note: in expansion of macro =E2=80=98DEFINE=
_PER_CPU=E2=80=99
 7039 | static DEFINE_PER_CPU(struct irq_work, cgrp_dead_tasks_iwork);
      |        ^~~~~~~~~~~~~~
  CC      drivers/acpi/acpica/tbdata.o
make[7]: *** [scripts/Makefile.build:287: kernel/cgroup/cgroup.o] Fehler 1

This patch fixes the error, perhaps you can squeeze this into a v3 of
your commit.

Bert Karwatzki

