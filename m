Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A943F17B115
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 23:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCEWBi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 17:01:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36656 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgCEWBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 17:01:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id j16so24469wrt.3
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2020 14:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRs769N8QUo0slXGjoV/bE6quT349p8P4cDyvi5+xSs=;
        b=OyN0As3WtsQyPWrtZ0mTiBeTZecUOCo749mffQpTDmTx69lKJuE4osS24tJYR/gpHX
         9VrzXIzE920xZDE0WeBQEVk4jHfPgbL+L8RNeX1VBPd6m95OUXVDG4faYkaORxj/wR5E
         oXvLlM71z+RvpZVtk0IWK8zhjSZ6NIBdrlVwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRs769N8QUo0slXGjoV/bE6quT349p8P4cDyvi5+xSs=;
        b=ToQ0IK8W6Udy1zvY2ECkrPp++BXj4LUpMeGjmrzeDfq/nt9mpFfw7EG+fq4pxfasdv
         Kc9KkvOr9wrcxkMN02eYaazv858X5RIcPJNZApRypbcatTbL8FSq8XSQ4TTgp5NESLqo
         s90lyv05/rSw7e5SGO6SUq87juGjSnh69EB9kPoyEHDsVdc1sdD63oXFc2ZvEoU1Hcqn
         OF9YkrqTk79G2Hs249/TfQdC9HrerUl8TJAusMwEEVrgXn9h00bA9E2B329PJNLeZsyo
         jquc/Oyz/Az78y21buqzhgooC++TtM8sK+pT4woGSBdl8jpO9szz9MTgZjrWhuch5FPE
         HooA==
X-Gm-Message-State: ANhLgQ1XkrPdQADcGBAL2SelEg1WoR5v02eHqiXvBJYNDSgHQeB6/gQP
        v7e2NN2ow8jNjZ9xRUfHjiX8Ww==
X-Google-Smtp-Source: ADFU+vuNWeddf1HH7nZX+stJXAplqB1550B+DJXHvxhEuJ8KddsSUGbg7If5vezjuGur7ZvPeojLkw==
X-Received: by 2002:adf:d4d2:: with SMTP id w18mr66826wrk.180.1583445696430;
        Thu, 05 Mar 2020 14:01:36 -0800 (PST)
Received: from kpsingh-kernel.localdomain (77-56-209-237.dclient.hispeed.ch. [77.56.209.237])
        by smtp.gmail.com with ESMTPSA id x9sm5002641wrx.0.2020.03.05.14.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:01:35 -0800 (PST)
From:   KP Singh <kpsingh@chromium.org>
To:     linux-security-module@vger.kernel.org, linux-next@vger.kernel.org,
        bpf@vger.kernel.org
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florent Revest <revest@chromium.org>,
        Brendan Jackman <jackmanb@chromium.org>
Subject: [PATCH bpf-next] bpf: Fix bpf_prog_test_run_tracing for !CONFIG_NET
Date:   Thu,  5 Mar 2020 23:01:27 +0100
Message-Id: <20200305220127.29109-1-kpsingh@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: KP Singh <kpsingh@google.com>

test_run.o is not built when CONFIG_NET is not set and
bpf_prog_test_run_tracing being referenced in bpf_trace.o causes the
linker error:

ld: kernel/trace/bpf_trace.o:(.rodata+0x38): undefined reference to
 `bpf_prog_test_run_tracing'

Add a __weak function in bpf_trace.c to handle this.

Fixes: da00d2f117a0 ("bpf: Add test ops for BPF_PROG_TYPE_TRACING")
Signed-off-by: KP Singh <kpsingh@google.com>
---
 kernel/trace/bpf_trace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 363e0a2c75cf..6a490d8ce9de 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1252,6 +1252,13 @@ static bool tracing_prog_is_valid_access(int off, int size,
 	return btf_ctx_access(off, size, type, prog, info);
 }
 
+int __weak bpf_prog_test_run_tracing(struct bpf_prog *prog,
+				     const union bpf_attr *kattr,
+				     union bpf_attr __user *uattr)
+{
+	return -ENOTSUPP;
+}
+
 const struct bpf_verifier_ops raw_tracepoint_verifier_ops = {
 	.get_func_proto  = raw_tp_prog_func_proto,
 	.is_valid_access = raw_tp_prog_is_valid_access,
-- 
2.20.1

