Return-Path: <linux-next+bounces-7770-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD8B15B23
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 11:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE34179EBB
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 09:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1060126A0E7;
	Wed, 30 Jul 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkw9eYdC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8FD24BBE1;
	Wed, 30 Jul 2025 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866042; cv=none; b=ItgsfR4vC3VhvtYRUOyJD28fuNDyaf5pDrTJkqhJjeipBTenVqADgLdkhjeO6k2qX5nClDMweJVWtEeldMrLepvw/+CO7NKEfmevbm77zenXty80DZw2okUZ9FvQWuus9ssFSpdlycKP4b5ftX0Z7BhepwefklLPYJ+H20C2Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866042; c=relaxed/simple;
	bh=xaVH1i+5eXaFXjFh5G7bnHF/0ZLdXGxYG7dhppjr/kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJfyWHAf1cgvnsMo+HGSbRCmYwTPi/WZoEO14XNjk+e8zS7Mqml13rkGli3KCn6v1q2Tj30o+Cd+Uu4wam6OWk6pS58drWREbFvEesfgdhmS1YGOV+9XXeQ04jsiqxvNBe0cB6bquecHb5R+3dOaSLuapm2uOUsMqbxn5Rb1C0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkw9eYdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EFCC4CEE7;
	Wed, 30 Jul 2025 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753866041;
	bh=xaVH1i+5eXaFXjFh5G7bnHF/0ZLdXGxYG7dhppjr/kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkw9eYdCQv0NLq1W/we3REkzFAcnaKsRX+FLVeCY9EpzFgDubVzrzNVq/VM8pd2sj
	 X3s3TtkaLjZKz2OYZAaJCJXpzWR1pjfFmoKm4jlvyPfotIK5ZvXxu5PtoZwQA1FYTz
	 Ca6B4ZPI2Fg8cqnzm/8qd0ezumChg4FWaqRSMt7aQE0yjk9T2GRojWDL4g3fLTfu8C
	 qi+BohFLUFtAXxu9pAYKz2xdz/D8Dy0YqPdjs+3ODIKmOw1WB0/+XmvHR+gPjJhA9C
	 JMF4iJrNUHa8NzUY1aT5A7BloD3U3kBh1/ZHgFrlNaHx0pqvFvK3tZ1Z9rPdihfHco
	 8sB27QIq/DhXw==
From: Alexey Gladkov <legion@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] kbuild: modpost: Fix the order of includes in .vmlinux.export.c
Date: Wed, 30 Jul 2025 11:00:25 +0200
Message-ID: <20250730090025.2402129-1-legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730161223.63783458@canb.auug.org.au>
References: <20250730161223.63783458@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The linux/module.h cannot be used at the beginning of file because
linux/dynamic_debug.h adds linux/string.h and then string_32.h, where
some functions may be redefined as `__builtin_<name>` under certain
conditions.

This results in the following error (i386 defconfig):

ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
.vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined reference to `__builtin_memcmp'

Link: https://lore.kernel.org/all/20250730161223.63783458@canb.auug.org.au/
Fixes: c4b487ddc51f ("modpost: Create modalias for builtin modules")
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 67f9cd76bdd2..47c8aa2a6939 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2070,12 +2070,12 @@ static void write_vmlinux_export_c_file(struct module *mod)
 	struct module_alias *alias, *next;
 
 	buf_printf(&buf,
-		   "#include <linux/export-internal.h>\n"
-		   "#include <linux/module.h>\n");
+		   "#include <linux/export-internal.h>\n");
 
 	add_exported_symbols(&buf, mod);
 
 	buf_printf(&buf,
+		   "#include <linux/module.h>\n"
 		   "#undef __MODULE_INFO_PREFIX\n"
 		   "#define __MODULE_INFO_PREFIX\n");
 
-- 
2.50.1


