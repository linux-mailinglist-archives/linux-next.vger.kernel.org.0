Return-Path: <linux-next+bounces-6753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD3AB5F2E
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 00:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C423A3D02
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 22:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA146426;
	Tue, 13 May 2025 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="QwG4SGSC"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758BE1F92A;
	Tue, 13 May 2025 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174550; cv=none; b=PPc+RpEeyuH77gYDKXCW5ER0jmQyeIk2W2ljQ/ec/CKyw6QCrsP1vuo8YAmmuxax0l4l/WiTZnDP0r9C8k5dcLJdtuE2QKPoYyqm43o97ut2LPi3ZH0AU5VPSwnms4EvcSoLDUS3nhqDi1SmbRyhfgjj2I+3+cb7OS9RHIfaoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174550; c=relaxed/simple;
	bh=/6JGk2DoI6qFvLdA+3NLv30kEQpSMfwvorKLNIMJluk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmjDv2M3G/yUY22n2AVEOuyj891cQT7ZQvfTkEUBhXWR1gIdzpw3uUDiR05UKqoHpwHXy2SPzIFBtMG7RQyF7AUFQBBfP2zizZyIa+ElXH/KjH+ZDmsehrAXydPQPrwTD9KComny5XUttaKcbUdoqP9RMT/NsGJ8M6bXIrEBIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=QwG4SGSC; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747174533; x=1747779333; i=spasswolf@web.de;
	bh=/6JGk2DoI6qFvLdA+3NLv30kEQpSMfwvorKLNIMJluk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QwG4SGSCK5aevOMdIURsAq9kUetkeW4CTIM48WKxYBODQsv4BCM9oirNYOP04Ce6
	 EOnmo97fUDx6lyuvBWAXyZQRpGfejOTvs704rREXhXfXvS9xsqnvnLjBE3+mgcPfP
	 8lEcMGmSP/Fh3P+29/AOQE2nFrvnvsj8Kdk3Dqm7p0bWCgQpd4OVlsPwesYQ29geZ
	 +WeC4O5ctZcuLpDpcAv2Hykrm/zbAWjF3RFUJnDNUzTYhs6k3eIyAciQVQx2aDbru
	 aEiegcRE/NVb7jaIqqMcteeb8nkCy683fHFkdDqJeDRpHnU1W7HtRR8F5mXPEJmcf
	 jla7kZlcEposz524QQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M6HG8-1uLagf1glM-0019ST; Wed, 14 May 2025 00:15:33 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	llvm@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when compiled with clang
Date: Wed, 14 May 2025 00:15:29 +0200
Message-ID: <20250513221530.2966-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: 20250513164807.51780-1-spasswolf@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QbM8WIz0yz2M2XOuky6oi/SH1BqLt0DoQE3r1SGxkHNDE+nYO+o
 Z+MgfqWB1irJ2/wf7NhbprDk6okV6W1dRwvWOhIINzhxUiFykrZ8+9bG25+aBfQeLBxjs5f
 DD6UpOgi4hjeptdj8IcPmKHFxf7yljs/7K2WSgd6HBu2lmsYxBc0fIKpZ7fqnOBGn3r8t7Y
 oVnsqAg9ozs0CcFTnv73Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Lu/Gg/EVVtM=;zZgYsZTJLB6AiZLcYNgqMRQfgif
 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
 bk2q1kAn96Yrc=

commit 97f4b999e0c8 ("genirq: Use scoped_guard() to shut clang up") may me have been
a false lead, I reverted the following commit in next-20250512 and the boot failure
is still there.

73e2e0671c90 (HEAD -> clang_panic) Revert "genirq/manage: Convert to lock guards"
ff2e5dfa1c21 Revert "genirq/manage: Rework irq_update_affinity_desc()"
f2be1d787117 Revert "genirq/manage: Rework __irq_apply_affinity_hint()"
bc2493e2bdef Revert "genirq/manage: Rework irq_set_vcpu_affinity()"
8c1736260f99 Revert "genirq/manage: Rework __disable_irq_nosync()"
dd529a9bc52d Revert "genirq/manage: Rework enable_irq()"
75316d9120cf Revert "genirq/manage: Rework irq_set_irq_wake()"
544ff63947f5 Revert "genirq/manage: Rework can_request_irq()"
198028713b99 Revert "genirq/manage: Rework irq_set_parent()"
70a3f6953491 Revert "genirq/manage: Rework enable_percpu_irq()"
bcb28ca2603d Revert "genirq/manage: Rework irq_percpu_is_enabled()"
5858d87ac7e3 Revert "genirq/manage: Rework disable_percpu_irq()"
1a1f97a3dde0 Revert "genirq/manage: Rework prepare_percpu_nmi()"
e249ccf0dde0 Revert "genirq/manage: Rework teardown_percpu_nmi()"
9be3639bdde9 Revert "genirq: Remove irq_[get|put]_desc*()"
942b93a1ee9c Revert "genirq/manage: Rework irq_get_irqchip_state()"
8f731e7b7475 Revert "genirq/manage: Rework irq_set_irqchip_state()"
5bb621187696 Revert "genirq: Use scoped_guard() to shut clang up"
6539255c6012 Revert "wifi: free SKBTX_WIFI_STATUS skb tx_flags flag"
edef45700477 (tag: next-20250512, origin/master, origin/HEAD, master) Add linux-next specific files for 20250512


Bert Karwatzki


