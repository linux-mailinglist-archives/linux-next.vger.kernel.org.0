Return-Path: <linux-next+bounces-3199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C864944540
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 09:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B792B1F21B11
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47388287D;
	Thu,  1 Aug 2024 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XFr0wGuQ"
X-Original-To: linux-next@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC7B14AA9;
	Thu,  1 Aug 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722496563; cv=none; b=S9dhTx+qwp0M9qL8ZN19qpScU6+stvapnaYbhgiLxR5//63KPD3R0/ef4KV6Shme7PDMWmZbCg3XsNDSgzy6rgV2O5gzZYvSTbaMa75vQQP8M6i1+PN1RGr+Uny3Q0icYpNSYE3K8azWQJ0j3nukhEspHO4g/ZyzM+/Jr/sd4yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722496563; c=relaxed/simple;
	bh=7S+ZMhf8ENEJm7VeSu0F22c6BMinnGTsV2+APxR/Hn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVk1Jwz+zDxsgCCVxhMaH5NOP2hMO2MuDvznRF/VGqBa7j547Iwb4B7YGvm+z2H+CFwpW70OYn8f+lPlKF3WiyswW43XZNMBfnsy1Q1lJt5MPcMvG7wgmKtcX8qyceb0v2JhWL419sLRw3d4ZANbw/uy6beNmRTWvSAiXAbpySQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XFr0wGuQ; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=GyCJKr+yoZd22HwpvNJ0KVtusWHmOgdsp0SL9dAdSTM=;
	b=XFr0wGuQm8cOZKBFmtwL7USQokwsVbUCQwG29UuEUd4Tx23UkchJjzFvicoad+
	Px7k7jCXLA3c2AOAMS4o+pgFHUXCDR+cyiHLtNdMLzRCs54AtfX90O6203QcszJZ
	CGTxFRas+vpMOERjr+S3mTrsiFtP9NarUiLK9wmkfD8WE=
Received: from localhost (unknown [101.132.132.191])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDn73ENNqtm1XhHAQ--.62761S2;
	Thu, 01 Aug 2024 15:15:25 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: sfr@canb.auug.org.au,
	tj@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	xavier_qy@163.com
Subject: [PATCH v1] Documentation: Fix the compilation errors in union_find.rst
Date: Thu,  1 Aug 2024 15:15:23 +0800
Message-Id: <20240801071523.463439-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801154823.358ff7b4@canb.auug.org.au>
References: <20240801154823.358ff7b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn73ENNqtm1XhHAQ--.62761S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFW3Kr4fZF4DJFWfAw4Dtwb_yoW7GFyDpF
	9xKryxA3WUGryUCry8GrW7Xr13AFyfWa98Ga18Jw10qr17Aw1Yyr4Utws5tFykGryIyFW8
	Xr4aqry8Z3yjyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8R6rUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiYxIuEGV4JxT55QAAs9

Fix the compilation errors and warnings caused by merging
Documentation/core-api/union_find.rst and
Documentation/core-api/union_find.rst.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 Documentation/core-api/index.rst              |  1 +
 Documentation/core-api/union_find.rst         |  4 +++-
 .../translations/zh_CN/core-api/index.rst     |  1 +
 .../zh_CN/core-api/union_find.rst             | 19 +++++++++++--------
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index f147854700..e18a2ffe07 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -49,6 +49,7 @@ Library functionality that is used throughout the kernel.
    wrappers/atomic_t
    wrappers/atomic_bitops
    floating-point
+   union_find
 
 Low level entry and exit
 ========================
diff --git a/Documentation/core-api/union_find.rst b/Documentation/core-api/union_find.rst
index 38d63b16e5..0b3a86a52a 100644
--- a/Documentation/core-api/union_find.rst
+++ b/Documentation/core-api/union_find.rst
@@ -16,9 +16,11 @@ of disjoint sets. The primary operations supported by Union-Find are:
 
 	Initialization: Resetting each element as an individual set, with
 		each set's initial parent node pointing to itself.
+
 	Find: Determine which set a particular element belongs to, usually by
 		returning a “representative element” of that set. This operation
 		is used to check if two elements are in the same set.
+
 	Union: Merge two sets into one.
 
 As a data structure used to maintain sets (groups), Union-Find is commonly
@@ -63,7 +65,7 @@ operation, the tree with the smaller rank is attached under the tree with the
 larger rank to maintain balance.
 
 Initializing Union-Find
---------------------
+-----------------------
 
 When initializing the Union-Find data structure, a single pointer to the
 Union-Find instance needs to be passed. Initialize the parent pointer to point
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 922cabf7b5..453a02cd1f 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -49,6 +49,7 @@
    generic-radix-tree
    packing
    this_cpu_ops
+   union_find
 
 =======
 
diff --git a/Documentation/translations/zh_CN/core-api/union_find.rst b/Documentation/translations/zh_CN/core-api/union_find.rst
index e1b5ae88da..ac7eaa612f 100644
--- a/Documentation/translations/zh_CN/core-api/union_find.rst
+++ b/Documentation/translations/zh_CN/core-api/union_find.rst
@@ -3,21 +3,23 @@
 
 :Original: Documentation/core-api/union_find.rst
 
-===========================
+=============================
 Linux中的并查集（Union-Find）
-===========================
+=============================
 
 
 :日期: 2024年6月21日
 :作者: Xavier <xavier_qy@163.com>
 
 何为并查集，它有什么用？
----------------------
+------------------------
 
 并查集是一种数据结构，用于处理一些不交集的合并及查询问题。并查集支持的主要操作：
-	初始化：将每个元素初始化为单独的集合，每个集合的初始父节点指向自身
+	初始化：将每个元素初始化为单独的集合，每个集合的初始父节点指向自身。
+
 	查询：查询某个元素属于哪个集合，通常是返回集合中的一个“代表元素”。这个操作是为
 		了判断两个元素是否在同一个集合之中。
+
 	合并：将两个集合合并为一个。
 
 并查集作为一种用于维护集合（组）的数据结构，它通常用于解决一些离线查询、动态连通性和
@@ -37,7 +39,7 @@ Linux中的并查集（Union-Find）
     https://en.wikipedia.org/wiki/Disjoint-set_data_structure
 
 并查集的Linux实现
-----------------
+------------------
 
 Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需要
 “#include <linux/union_find.h>”。
@@ -48,11 +50,12 @@ Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需
 		struct uf_node *parent;
 		unsigned int rank;
 	};
+
 其中parent为当前节点的父节点，rank为当前树的高度，在合并时将rank小的节点接到rank大
 的节点下面以增加平衡性。
 
 初始化并查集
----------
+-------------
 
 初始化并查集时需要传入并查集实例的一个指针。初始化时，parent 指针指向自身，rank 设置
 为 0。
@@ -62,7 +65,7 @@ Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需
 	uf_nodes_init(my_node);
 
 查找并查集的根节点
-----------------
+------------------
 
 主要用于判断两个并查集是否属于一个集合，如果根相同，那么他们就是一个集合。在查找过程中
 会对路径进行压缩，提高后续查找效率。
@@ -77,7 +80,7 @@ Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需
 		connected = 0;
 
 合并两个并查集
--------------
+--------------
 
 对于两个相交的并查集进行合并，会首先查找它们各自的根节点，然后根据根节点秩大小，将小的
 节点连接到大的节点下面。
-- 
2.45.2


