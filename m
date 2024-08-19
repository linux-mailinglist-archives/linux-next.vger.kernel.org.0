Return-Path: <linux-next+bounces-3353-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0A95775F
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 00:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1CB71F25A51
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 22:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFEE1DC468;
	Mon, 19 Aug 2024 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOYVIGA7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E3E1D54CA;
	Mon, 19 Aug 2024 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724106064; cv=none; b=aqokchuXKkd7458sHVPh1lEoZhuEoMTjTyW0LCJSEYeJMN+9PBw484yKNs/8EPi3yumgM8zeGUH3r8ubsmUi8ybphnR1Y0meluRHeJ2aGFMRc8aqk0UzJJSrrzEESw3ZY9Eny+2kbVZqtMDnTAzzTUCocuM5MGRs0Va1ibJHDY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724106064; c=relaxed/simple;
	bh=bSp9NKm+HUL8XmF/JOFgTfXELGtUb3uw0vQ8/kuolG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cllFlzsZQMj5pilPss33kLaznuLUwUiZP7JyBKbX8wwr4wpInDEsGWtw+wjYuNqE8LBt8XMNePrq8aloVo2StpxqdQcRXAqXD9j0wGraX2/Q+Qhk/o81td6YwxWizJUgqj+hTXsWPgYhaVT5g1QPDe3z/zw0QM7JoXg4K3y7Aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOYVIGA7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-201f7fb09f6so32162215ad.2;
        Mon, 19 Aug 2024 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724106063; x=1724710863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9dEO+YV5NlNsZSbHvwF5k1OB1pJ8fwSgqL0VwCOMdA=;
        b=AOYVIGA78DlzWnXpUC1WH6EJ45YLFNhjfR63SzHMAJEjxlqPAc57jbWlM7x52Qc2Nl
         I+qLdAsnqmoy6BAAOVk6gRmCAE+TEwh4otauukMbr8jTIJY3he31yQd5Scqu8sgD5y79
         f/pwdXozgNTI5iUVsgZHcZ22XhLv+s5++udbxuJMPt8g0Vam+4dKJwcl6tKp23n96gbl
         lebJc8+tUWUOWvq8ST5uBTBq+3qOfS5JwWQuEe3GaoIktGuaDJ4Nq+uPJ6vAV0IXYP/i
         bCaM+0RAAdIBrSCT+Y7rtWyXW5abNVb9rf+jQC9iHRUf5FVJtPjcHVH15EfPZiB0os9Y
         Ji2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724106063; x=1724710863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9dEO+YV5NlNsZSbHvwF5k1OB1pJ8fwSgqL0VwCOMdA=;
        b=VHDrWJkwRpi5zaRFJgl2ykq5wwIS9P2ygUV28sUDdQdRU2I9TD9q6idZ9eFJqwYa1r
         ajCnBPVvCCFxEbG2k8/oMq3nzPBdnpo9A9iDx05gEiLfIi6e/h2kHR2I9Cdoqkner1Rd
         SwVpISrK6IPY/IyAMVY7mEIrOBNGNtdcvxfcqx53PcYsSlhGMHyl3idOwwmZ24lzpFkh
         nPYQJ35F9sdq/XU08sBmRkSjM/tZAAPUBzRlffiEF+3a2B5yE5Kre9PgxBslFktXKMCQ
         rrDairqgrz/smaTHDCwIs3TtUikrZPAnhYgzxGLQD6QKdvKMmeh/62nSvAiQ0oKasUBi
         ca1A==
X-Forwarded-Encrypted: i=1; AJvYcCXKO/IK+AnmcbRfcn3zq0EZvrDZSDKXPPu/3gpz3RXn6fE+3V4bpJ0DqLZi4VXw2+joGWOtRAJvgjTwGvRnJtJEK3BykTOlcZkrEAY5lkJA6bPstXzdf7iTLb6CvFFdv5Ljx+81j0HSpw==
X-Gm-Message-State: AOJu0Yz5oc6oEc2jaidQ8hOY2XEDIt2NiLRy7wkFF++jb+XRStztNt0p
	6yaeBtKUZx7x8sUf3Q8zRec9WxSqgXDpMowldiViWf2Vl1MJRP4n
X-Google-Smtp-Source: AGHT+IGKNT4kqY2OgRdVIjVqp7KnY5+UW02cp6Fh9F/RqhU5mo8sGEUSkBqneayR3NejxxaNaUQ00w==
X-Received: by 2002:a17:902:f541:b0:1fc:6a81:c5a1 with SMTP id d9443c01a7336-20203e65e59mr113776215ad.12.1724106062531;
        Mon, 19 Aug 2024 15:21:02 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net. [72.235.129.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038e1e5sm66696005ad.201.2024.08.19.15.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:21:02 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 19 Aug 2024 12:21:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH wq/for-6.12] workqueue: Fix htmldocs build warning
Message-ID: <ZsPFTJv41oO5kHzb@slm.duckdns.org>
References: <20240814141821.6911d655@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814141821.6911d655@canb.auug.org.au>

From 8dffaec34dd55473adcbc924a4c9b04aaa0d4278 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 19 Aug 2024 12:18:23 -1000

Fix htmldocs build warning introduced by ec0a7d44b358 ("workqueue: Add
interface for user-defined workqueue lockdep map").

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 8ccbf510880b..04dff07a9e2b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -534,7 +534,7 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  * @fmt: printf format for the name of the workqueue
  * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
  * @lockdep_map: user-defined lockdep_map
- * @args: args for @fmt
+ * @...: args for @fmt
  *
  * Same as alloc_ordered_workqueue but with the a user-define lockdep_map.
  * Useful for workqueues created with the same purpose and to avoid leaking a
-- 
2.46.0


