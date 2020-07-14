Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7264621F1B6
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 14:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgGNMmo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 08:42:44 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58406 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726352AbgGNMmo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 08:42:44 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9ECCBDDF89920A824B6C;
        Tue, 14 Jul 2020 20:42:41 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 20:42:33 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <akpm@linux-foundation.org>
CC:     <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <linux-next@vger.kernel.org>, <cuibixuan@huawei.com>,
        <john.wanghui@huawei.com>
Subject: [PATCH] mm/percpu: mark pcpu_chunk_type() as __maybe_unused
Date:   Tue, 14 Jul 2020 13:41:01 +0000
Message-ID: <20200714134101.80534-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Gcc report the following warning without CONFIG_MEMCG_KMEM:

mm/percpu-internal.h:145:29: warning: ‘pcpu_chunk_type’ defined
but not used [-Wunused-function]
 static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
                             ^~~~~~~~~~~~~~~

Mark pcpu_chunk_type() as __maybe_unused to make it clear.

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 mm/percpu-internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index 7983455842ff..8a8a230bd957 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -129,7 +129,7 @@ static inline int pcpu_chunk_map_bits(struct pcpu_chunk *chunk)
 }

 #ifdef CONFIG_MEMCG_KMEM
-static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
+static enum pcpu_chunk_type __maybe_unused pcpu_chunk_type(struct pcpu_chunk *chunk)
 {
 	if (chunk->obj_cgroups)
 		return PCPU_CHUNK_MEMCG;
@@ -142,7 +142,7 @@ static bool pcpu_is_memcg_chunk(enum pcpu_chunk_type chunk_type)
 }

 #else
-static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
+static enum pcpu_chunk_type __maybe_unused pcpu_chunk_type(struct pcpu_chunk *chunk)
 {
 	return PCPU_CHUNK_ROOT;
 }
--
2.17.1

