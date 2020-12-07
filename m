Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF31E2D1A3C
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 21:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgLGUG6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 15:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgLGUG5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 15:06:57 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42972C061749
        for <linux-next@vger.kernel.org>; Mon,  7 Dec 2020 12:06:17 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c1so2046892wrq.6
        for <linux-next@vger.kernel.org>; Mon, 07 Dec 2020 12:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZY6PnXSHmnL1clMEjidFbJWKwSKFrnJjIARjAjV0kbg=;
        b=b+meLkYgvmiATHtHLcWUsdmN0/mHnVCOxiHjWZHNuyFjU3/PY+INCbBCbNkm5IJbCH
         mNSCVoYGRJqnLv+bysls9E7m60/hzpqZH1SarTqhaOIX1DjJdbRpz4nfIQ3vxFejr9IC
         4iIhBMXCvWGi5+sITzyzL44c5z9cfd6D26JzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZY6PnXSHmnL1clMEjidFbJWKwSKFrnJjIARjAjV0kbg=;
        b=hZTO/zqKAV1nyFuYaNn4SoRfFV6ladsD4/jD5DUlpl2Zk9BhZ7x5GI4G6cUQ2ekJIn
         61l8lYc9TKR7ZGa/AWTz74hj5yU8rBzXi75G9TIMULtoGNh577NvdeLhYKgz2hRAQitl
         xsa2spY70JBV0kKFqpP9RsBKImCF7+V9n6wATbg5LsRxhjXPqUH/jz25eJvcrG2F+vsH
         jAcu3HkA+9gL/QiQrrlxEMdDfOzxmCDIRcxWHuU7IJgafKwYmsph7lM5ZLeuK2mrBtJ7
         1xq6d3yUmrajMUtX6/kHommY4aefKw8DCUhGZQnSUMoS6YQWhx2PAFlZRtjJKKvAYfBP
         oK2Q==
X-Gm-Message-State: AOAM530BNwEWcwkBIxLCJEpOXyW+j85k7uCaZRbhWJqUdmt1vIC2PNQ4
        DDWFk7a7i9N+NbW7J05gkRNEsw==
X-Google-Smtp-Source: ABdhPJxOTR7AmaDvUsAyDUxKnDlaqCuaYmt3uGcpEHsJb7fK9T+mjbkJ7bKRTyaGXCDlkqpnzKZyFg==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr21529516wrn.12.1607371576062;
        Mon, 07 Dec 2020 12:06:16 -0800 (PST)
Received: from revest.zrh.corp.google.com ([2a00:79e0:42:204:f693:9fff:fef4:a569])
        by smtp.gmail.com with ESMTPSA id m4sm9863145wrw.16.2020.12.07.12.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:06:15 -0800 (PST)
From:   Florent Revest <revest@chromium.org>
To:     bpf@vger.kernel.org
Cc:     ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        kpsingh@chromium.org, rdunlap@infradead.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Florent Revest <revest@chromium.org>
Subject: [PATCH bpf-next v2] bpf: Only call sock_from_file with CONFIG_NET
Date:   Mon,  7 Dec 2020 21:06:05 +0100
Message-Id: <20201207200605.650192-1-revest@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This avoids
  ld: kernel/trace/bpf_trace.o: in function `bpf_sock_from_file':
  bpf_trace.c:(.text+0xe23): undefined reference to `sock_from_file'
When compiling a kernel with BPF and without NET.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 kernel/trace/bpf_trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 0cf0a6331482..29ec2b3b1cc4 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1272,7 +1272,11 @@ const struct bpf_func_proto bpf_snprintf_btf_proto = {
 
 BPF_CALL_1(bpf_sock_from_file, struct file *, file)
 {
+#ifdef CONFIG_NET
 	return (unsigned long) sock_from_file(file);
+#else
+	return 0;
+#endif
 }
 
 BTF_ID_LIST(bpf_sock_from_file_btf_ids)
-- 
2.29.2.576.ga3fc446d84-goog

