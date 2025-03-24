Return-Path: <linux-next+bounces-5970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 318DFA6E0E9
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0385C3A8D4E
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA06264A7E;
	Mon, 24 Mar 2025 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkNomO58"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC03264A7B;
	Mon, 24 Mar 2025 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837577; cv=none; b=MR/zg9bFRGHI4kkkdJyffND6vuo+fW668VXRgFvx/kyi29AWE60igm1eb26/uTLMy78cNUauizM+MvgLn5JHkMMGllm7wNLwiqzMrRow/baiLGqF0gUGng/xeHljhX5UA98BiYmFrxcPvtTIWGTuGkuDL9eklteotvkW+9HdBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837577; c=relaxed/simple;
	bh=eTTiCtmz60p7z8f27x+J9d7RMqWRVQuPBVMLMwzQSE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/7SiRWAOjMk0yjr++WYL4nLOz0k77MGZRs+FjIqjMjUgLIdGgEVjxyQBRjaewvDCDrOeaZeDwi7fWHU2dhZRlFXUpRFANY63vd59K8d8cnXDbSHdb3A7wiIWjDx+PrNQLvLxbMVgGJ97vx4ag3eG4Mq5oJTlKmlbxD7MzZA9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkNomO58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C7C4CEF7;
	Mon, 24 Mar 2025 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837576;
	bh=eTTiCtmz60p7z8f27x+J9d7RMqWRVQuPBVMLMwzQSE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VkNomO58J/pnmG41YMSL+ONNvswanTfc5ti3vm/WH5Xi/Lw27hRCRQZ9HxFsMbgQU
	 EAshZV2S8HZa7+xZvmaxZsYNTYyH6UC+gY+9AGutoToj7ULXxRvU+h5YS/74P8vVWZ
	 /9gEUbreqYHie7f4rr+EdXftr96hEckP6WXo4V7dy9uRAiInvrrQkyUz7U/lfbIbYu
	 vNIDATNUMSG+yLAnEIuVl8qGnOnn/Miwgbx7QkXSq19Od6vDha4xSRFSVUSgiYc5Gk
	 kV1SZKX9PFfaUMT6uyKPGoWGC+XAF8bnuEqhiEYEeBdIZOSdfDJD5lWzTjWpsgqvI+
	 XOPV9p0VNZxuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] ASN.1: add module description
Date: Mon, 24 Mar 2025 18:32:27 +0100
Message-Id: <20250324173242.1501003-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324173242.1501003-1-arnd@kernel.org>
References: <20250324173242.1501003-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This is needed to avoid a build warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/asn1_decoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/asn1_decoder.c b/lib/asn1_decoder.c
index 13da529e2e72..5738ae286b41 100644
--- a/lib/asn1_decoder.c
+++ b/lib/asn1_decoder.c
@@ -518,4 +518,5 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
 }
 EXPORT_SYMBOL_GPL(asn1_ber_decoder);
 
+MODULE_DESCRIPTION("Decoder for ASN.1 BER/DER/CER encoded bytestream");
 MODULE_LICENSE("GPL");
-- 
2.39.5


