Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723092D3135
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 18:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbgLHRhS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 12:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgLHRhS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 12:37:18 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DC5C0613D6
        for <linux-next@vger.kernel.org>; Tue,  8 Dec 2020 09:36:31 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id e25so3114283wme.0
        for <linux-next@vger.kernel.org>; Tue, 08 Dec 2020 09:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX3mNNkAYkA8sb0euHmnG4MILEbOBpNTv+pnHusb8uA=;
        b=Q8Noz5MiD0BJW9bcOCv07n6fYNbh0JVxW6ADcS+Y0QIR4ilExCStr8xV6rD3z80Y6S
         Z1CNdPOUU6mCceDa6wSVMEhJMSuR2Cp80nWtjx9GiKOa/l8eO1rVJO3hRpSyjyKjrAjS
         S5oiK/7LZDuvDNBeQyRRqpWtOs0CgLXTft36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX3mNNkAYkA8sb0euHmnG4MILEbOBpNTv+pnHusb8uA=;
        b=XutnFgx3G8TLsVh7fyOKmTJuc5+YVELLt+IGIJp7L9brBwZaNpscczXb4blKIcOpEu
         28yw0yvkVI53zNRN1cQO8JfYz+EtKFdtaKua7usz8N5u3Dsg0vkZtoQ/y6VT7pwop6Zf
         rodUibsUKibxv6/Lb2ZIqfqKxkM3SWyN8fMWImmm7Ku2snc/uAPvPK+vk0n6v4ZVbeht
         48gWw/TuL1MLlMwYvvQVmiQi1bsn9tog9X/U2VDVtkuNtOtlbja8HUvSip4UkbOiKTHB
         VkSAd0APfVVt0wvbous8GmsHei7UjD5k8Hbis6OfCkiwb16HnnPL6wQwztha+Sf6wv0X
         7KIg==
X-Gm-Message-State: AOAM531xpmuPfnaz1gSbOq4vb0bWg0RO1kheBSco0os+1dJg5TEa+soS
        mLUZE/63kcgT37EcBx8hv6+r9g==
X-Google-Smtp-Source: ABdhPJxFTOwKLFw9lobNHbE10tlOSMg/I9bktBdPEQyQPxNAGZmcDghKXl+vBa8me4R+DB08uCTxVg==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr4858668wmf.110.1607448990508;
        Tue, 08 Dec 2020 09:36:30 -0800 (PST)
Received: from revest.zrh.corp.google.com ([2a00:79e0:42:204:f693:9fff:fef4:a569])
        by smtp.gmail.com with ESMTPSA id k7sm8619519wrn.63.2020.12.08.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 09:36:29 -0800 (PST)
From:   Florent Revest <revest@chromium.org>
To:     bpf@vger.kernel.org
Cc:     ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        kpsingh@chromium.org, rdunlap@infradead.org, kafai@fb.com,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Florent Revest <revest@chromium.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH bpf-next v3] bpf: Only provide bpf_sock_from_file with CONFIG_NET
Date:   Tue,  8 Dec 2020 18:36:23 +0100
Message-Id: <20201208173623.1136863-1-revest@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This moves the bpf_sock_from_file definition into net/core/filter.c
which only gets compiled with CONFIG_NET and also moves the helper proto
usage next to other tracing helpers that are conditional on CONFIG_NET.

This avoids
  ld: kernel/trace/bpf_trace.o: in function `bpf_sock_from_file':
  bpf_trace.c:(.text+0xe23): undefined reference to `sock_from_file'
When compiling a kernel with BPF and without NET.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/bpf.h      |  1 +
 kernel/trace/bpf_trace.c | 22 ++--------------------
 net/core/filter.c        | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index d05e75ed8c1b..07cb5d15e743 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1859,6 +1859,7 @@ extern const struct bpf_func_proto bpf_snprintf_btf_proto;
 extern const struct bpf_func_proto bpf_per_cpu_ptr_proto;
 extern const struct bpf_func_proto bpf_this_cpu_ptr_proto;
 extern const struct bpf_func_proto bpf_ktime_get_coarse_ns_proto;
+extern const struct bpf_func_proto bpf_sock_from_file_proto;
 
 const struct bpf_func_proto *bpf_tracing_func_proto(
 	enum bpf_func_id func_id, const struct bpf_prog *prog);
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 0cf0a6331482..52ddd217d6a1 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1270,24 +1270,6 @@ const struct bpf_func_proto bpf_snprintf_btf_proto = {
 	.arg5_type	= ARG_ANYTHING,
 };
 
-BPF_CALL_1(bpf_sock_from_file, struct file *, file)
-{
-	return (unsigned long) sock_from_file(file);
-}
-
-BTF_ID_LIST(bpf_sock_from_file_btf_ids)
-BTF_ID(struct, socket)
-BTF_ID(struct, file)
-
-static const struct bpf_func_proto bpf_sock_from_file_proto = {
-	.func		= bpf_sock_from_file,
-	.gpl_only	= false,
-	.ret_type	= RET_PTR_TO_BTF_ID_OR_NULL,
-	.ret_btf_id	= &bpf_sock_from_file_btf_ids[0],
-	.arg1_type	= ARG_PTR_TO_BTF_ID,
-	.arg1_btf_id	= &bpf_sock_from_file_btf_ids[1],
-};
-
 const struct bpf_func_proto *
 bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 {
@@ -1384,8 +1366,6 @@ bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return &bpf_per_cpu_ptr_proto;
 	case BPF_FUNC_bpf_this_cpu_ptr:
 		return &bpf_this_cpu_ptr_proto;
-	case BPF_FUNC_sock_from_file:
-		return &bpf_sock_from_file_proto;
 	default:
 		return NULL;
 	}
@@ -1778,6 +1758,8 @@ tracing_prog_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return &bpf_sk_storage_get_tracing_proto;
 	case BPF_FUNC_sk_storage_delete:
 		return &bpf_sk_storage_delete_tracing_proto;
+	case BPF_FUNC_sock_from_file:
+		return &bpf_sock_from_file_proto;
 #endif
 	case BPF_FUNC_seq_printf:
 		return prog->expected_attach_type == BPF_TRACE_ITER ?
diff --git a/net/core/filter.c b/net/core/filter.c
index 77001a35768f..255aeee72402 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -10413,6 +10413,24 @@ const struct bpf_func_proto bpf_skc_to_udp6_sock_proto = {
 	.ret_btf_id		= &btf_sock_ids[BTF_SOCK_TYPE_UDP6],
 };
 
+BPF_CALL_1(bpf_sock_from_file, struct file *, file)
+{
+	return (unsigned long)sock_from_file(file);
+}
+
+BTF_ID_LIST(bpf_sock_from_file_btf_ids)
+BTF_ID(struct, socket)
+BTF_ID(struct, file)
+
+const struct bpf_func_proto bpf_sock_from_file_proto = {
+	.func		= bpf_sock_from_file,
+	.gpl_only	= false,
+	.ret_type	= RET_PTR_TO_BTF_ID_OR_NULL,
+	.ret_btf_id	= &bpf_sock_from_file_btf_ids[0],
+	.arg1_type	= ARG_PTR_TO_BTF_ID,
+	.arg1_btf_id	= &bpf_sock_from_file_btf_ids[1],
+};
+
 static const struct bpf_func_proto *
 bpf_sk_base_func_proto(enum bpf_func_id func_id)
 {
-- 
2.29.2.576.ga3fc446d84-goog

