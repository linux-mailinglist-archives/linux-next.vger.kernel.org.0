Return-Path: <linux-next+bounces-9555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96DCF6A88
	for <lists+linux-next@lfdr.de>; Tue, 06 Jan 2026 05:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4B0030464F8
	for <lists+linux-next@lfdr.de>; Tue,  6 Jan 2026 04:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46527F18F;
	Tue,  6 Jan 2026 04:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y5x8Txd4"
X-Original-To: linux-next@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC42253EF
	for <linux-next@vger.kernel.org>; Tue,  6 Jan 2026 04:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767673421; cv=none; b=Mm5TCZ1Gm8W9IYZjsDqjN31HOFLSbIabUhZeWTcJzMGZlHgJUXJ+XWygU3E1cBVkN/lb8U0zPQdFAemZPuakndIaRfqQMH/tyHYiS3TAUDEZeaY/+jcQmakJADNkMREYZw6R0Y2635X3YcCGvDQ+CvWFs+Pg/8WZfX9ktGUHeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767673421; c=relaxed/simple;
	bh=/cZMnV+2OssrzRXCZZuTx/8QBDzZsmqR4A0zR8RjoHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mcZ5A3ftwGxW9vehzrlzcoxsY2JoJxNJQyDyyFGyNOehrD/hOuEHCE9taNjwGESWA9egveZSfNY4XF3w5F2sqrGMHzYVdaRam3K1QI7kMCOPjr4fJwyrdT3PKXn0MahGb5X2MtXTARzFGsw4Og+Gyv7DbOb7w27IQVlwB1DzeNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y5x8Txd4; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767673405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nvJRKJ5tYN510TjSW9RoQKvIQzFOTq714erwNPB6dZE=;
	b=Y5x8Txd47gYYFyjSOEHgZUQcgiIXuDHiYjBbwIuKKb5WLbfHPzMly5qYaGA6SZpXKesXBb
	raOdBD/7zSRwbgunzLIKOoGyb3TQOqcpE8nDKCGzlFv2qEfttekjllEveVorE549YzBCb8
	Raqqk+6T80SVnwMw6XxsKXNIMPVQxnk=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	bpf <bpf@vger.kernel.org>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: [PATCH bpf-next] mm: drop mem_cgroup_usage() declaration from memcontrol.h
Date: Mon,  5 Jan 2026 20:23:13 -0800
Message-ID: <20260106042313.140256-1-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

mem_cgroup_usage() is not used outside of memcg-v1 code,
the declaration was added by a mistake.

Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 include/linux/memcontrol.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 6a5d65487b70..229ac9835adb 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -950,7 +950,6 @@ static inline void mod_memcg_page_state(struct page *page,
 }
 
 unsigned long memcg_events(struct mem_cgroup *memcg, int event);
-unsigned long mem_cgroup_usage(struct mem_cgroup *memcg, bool swap);
 unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx);
 unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item);
 bool memcg_stat_item_valid(int idx);
-- 
2.52.0


