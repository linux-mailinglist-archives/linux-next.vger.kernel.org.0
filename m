Return-Path: <linux-next+bounces-3210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D89456B3
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 05:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454B91F24901
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 03:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB28C1843;
	Fri,  2 Aug 2024 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="R3TzB12N"
X-Original-To: linux-next@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C830879E5;
	Fri,  2 Aug 2024 03:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722569664; cv=none; b=Y7hUQ0XpyNR9F0ue9p0Phb6kcOAyPcFXvJLYoeKkTxoRAThlNjMI3HILhRHx5x8NS3SM7pqQidMG9bQPiEpJsm2A78FDR9ne0i/FYJUOkZ76S6TqPfDbFmGlqeirsMlF8oIGz8wDlAsJnfGfgKZ+Ez0xLxioFqR6uRHvEhrJZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722569664; c=relaxed/simple;
	bh=c9LYv447jkClIZCyRVU4/SSilccjDZbekcdNBeAWqyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOFI2ey9q5cBWldt7zsjbX4yaZIg8NHYlmXjcvoHqDBr/UTMoK2+cR1H8uqz6eypLgq3DJh7ajxgUqTVVkB36TkmOfAd8QAoy1/hGtRfBSWz3dlV/O8CLm2v1RhHiKOr+aY0nmSCOhjQc7XeHPNbuv++qf7UPxOpAbI95fJkAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=R3TzB12N; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=2wVTAZKp38/iqKf5L1xSuiHjYrzf6ECDxicbmQEacio=;
	b=R3TzB12NRVjh/AAbjXow1r3tpEEpJshMZtfgKj7aYQh6uJqu1Ctaj9WXTzvUju
	eZwnfC6be0FhL4Lhba9sjRPakvIYucdSvc19qe407f2X+kz4HNKOt5zgRBonBXAz
	0hqyDzJZgHt02cwx0n8C/LDHcCYhXVMg1Y+mVEryiMzpw=
Received: from localhost (unknown [101.132.132.191])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDnr3mbU6xmOBGuAQ--.16994S2;
	Fri, 02 Aug 2024 11:33:48 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: tj@kernel.org,
	sfr@canb.auug.org.au
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	xavier_qy@163.com
Subject: [PATCH v2] Documentation: Fix the compilation errors in union_find.rst
Date: Fri,  2 Aug 2024 11:33:46 +0800
Message-Id: <20240802033346.468893-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZqvAeam7_iN44C88@slm.duckdns.org>
References: <ZqvAeam7_iN44C88@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr3mbU6xmOBGuAQ--.16994S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1xAFW8trWkZw4UJrWfuFg_yoW7Xw43pF
	9xKryfA3WUGryUCr18GrW7Xr13AFyfWayDGa18Jw18tr17Ar1Yyr4Utwn5tr95GryIyFy8
	Xr43try8Z34jyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8R6rUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiYx8vEGV4JykXUgAAsV

Fix the compilation errors and warnings caused by merging
Documentation/core-api/union_find.rst and
Documentation/translations/zh_CN/core-api/union_find.rst.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 Documentation/core-api/index.rst              |  1 +
 Documentation/core-api/union_find.rst         |  6 +++++-
 .../translations/zh_CN/core-api/index.rst     |  1 +
 .../zh_CN/core-api/union_find.rst             | 21 ++++++++++++-------
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index f147854700e..e18a2ffe078 100644
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
index 2bf0290c918..6df8b94fdb5 100644
--- a/Documentation/core-api/union_find.rst
+++ b/Documentation/core-api/union_find.rst
@@ -16,9 +16,11 @@ of disjoint sets. The primary operations supported by union-find are:
 
 	Initialization: Resetting each element as an individual set, with
 		each set's initial parent node pointing to itself.
+
 	Find: Determine which set a particular element belongs to, usually by
 		returning a “representative element” of that set. This operation
 		is used to check if two elements are in the same set.
+
 	Union: Merge two sets into one.
 
 As a data structure used to maintain sets (groups), union-find is commonly
@@ -63,7 +65,7 @@ operation, the tree with the smaller rank is attached under the tree with the
 larger rank to maintain balance.
 
 Initializing union-find
---------------------
+-----------------------
 
 You can complete the initialization using either static or initialization
 interface. Initialize the parent pointer to point to itself and set the rank
@@ -71,7 +73,9 @@ to 0.
 Example::
 
 	struct uf_node my_node = UF_INIT_NODE(my_node);
+
 or
+
 	uf_node_init(&my_node);
 
 Find the Root Node of union-find
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 922cabf7b5d..453a02cd1f4 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -49,6 +49,7 @@
    generic-radix-tree
    packing
    this_cpu_ops
+   union_find
 
 =======
 
diff --git a/Documentation/translations/zh_CN/core-api/union_find.rst b/Documentation/translations/zh_CN/core-api/union_find.rst
index a56de57147e..bb93fa8c653 100644
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
@@ -48,22 +50,25 @@ Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需
 		struct uf_node *parent;
 		unsigned int rank;
 	};
+
 其中parent为当前节点的父节点，rank为当前树的高度，在合并时将rank小的节点接到rank大
 的节点下面以增加平衡性。
 
 初始化并查集
----------
+-------------
 
 可以采用静态或初始化接口完成初始化操作。初始化时，parent 指针指向自身，rank 设置
 为 0。
 示例::
 
 	struct uf_node my_node = UF_INIT_NODE(my_node);
+
 或
+
 	uf_node_init(&my_node);
 
 查找并查集的根节点
-----------------
+------------------
 
 主要用于判断两个并查集是否属于一个集合，如果根相同，那么他们就是一个集合。在查找过程中
 会对路径进行压缩，提高后续查找效率。
@@ -78,7 +83,7 @@ Linux的并查集实现在文件“lib/union_find.c”中。要使用它，需
 		connected = 0;
 
 合并两个并查集
--------------
+--------------
 
 对于两个相交的并查集进行合并，会首先查找它们各自的根节点，然后根据根节点秩大小，将小的
 节点连接到大的节点下面。
-- 
2.45.2


