Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E9621F2B8
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 15:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgGNNes (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 09:34:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7307 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726624AbgGNNer (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 09:34:47 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id EEBE7B5AE868C3BC6A28;
        Tue, 14 Jul 2020 21:34:42 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 21:34:34 +0800
Subject: [PATCH v2] mm/percpu: fix 'defined but not used' warning
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>, Roman Gushchin <guro@fb.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
 <20200714225311.7aeffffd@canb.auug.org.au>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <7c871406-4f27-64c0-edca-8f5cee1ea605@huawei.com>
Date:   Tue, 14 Jul 2020 21:34:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200714225311.7aeffffd@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Gcc report the following warning without CONFIG_MEMCG_KMEM:

mm/percpu-internal.h:145:29: warning: â€˜pcpu_chunk_typeâ€™ defined
but not used [-Wunused-function]
 static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
                             ^~~~~~~~~~~~~~~

Add 'inline' to pcpu_chunk_type(),pcpu_is_memcg_chunk() and
pcpu_chunk_list() to clear warning.

Fixes: 26c99879ef01 ("mm: memcg/percpu: account percpu memory to memory cgroups")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 mm/percpu-internal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index 7983455842ff..18b768ac7dca 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -129,31 +129,31 @@ static inline int pcpu_chunk_map_bits(struct pcpu_chunk *chunk)
 }

 #ifdef CONFIG_MEMCG_KMEM
-static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
+static inline enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
 {
 	if (chunk->obj_cgroups)
 		return PCPU_CHUNK_MEMCG;
 	return PCPU_CHUNK_ROOT;
 }

-static bool pcpu_is_memcg_chunk(enum pcpu_chunk_type chunk_type)
+static inline bool pcpu_is_memcg_chunk(enum pcpu_chunk_type chunk_type)
 {
 	return chunk_type == PCPU_CHUNK_MEMCG;
 }

 #else
-static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
+static inline enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
 {
 	return PCPU_CHUNK_ROOT;
 }

-static bool pcpu_is_memcg_chunk(enum pcpu_chunk_type chunk_type)
+static inline bool pcpu_is_memcg_chunk(enum pcpu_chunk_type chunk_type)
 {
 	return false;
 }
 #endif

-static struct list_head *pcpu_chunk_list(enum pcpu_chunk_type chunk_type)
+static inline struct list_head *pcpu_chunk_list(enum pcpu_chunk_type chunk_type)
 {
 	return &pcpu_chunk_lists[pcpu_nr_slots *
 				 pcpu_is_memcg_chunk(chunk_type)];
-- 
2.17.1


.



