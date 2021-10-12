Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591E542A684
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 15:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhJLN6J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 09:58:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53414 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236783AbhJLN6J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 09:58:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 9480A1F439EA
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH] docs: futex: Fix kernel-doc references
Date:   Tue, 12 Oct 2021 10:55:49 -0300
Message-Id: <20211012135549.14451-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Since the futex code was restructured, there's no futex.c file anymore
and the implementation is split in various files. Point kernel-doc
references to the new files.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 Documentation/kernel-hacking/locking.rst           | 14 +++++++++++++-
 .../translations/it_IT/kernel-hacking/locking.rst  | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 90bc3f51eda9..e6cd40663ea5 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1352,7 +1352,19 @@ Mutex API reference
 Futex API reference
 ===================
 
-.. kernel-doc:: kernel/futex.c
+.. kernel-doc:: kernel/futex/core.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/futex.h
+   :internal:
+
+.. kernel-doc:: kernel/futex/pi.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/requeue.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/waitwake.c
    :internal:
 
 Further reading
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 1efb8293bf1f..163f1bd4e857 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1396,7 +1396,19 @@ Riferimento per l'API dei Mutex
 Riferimento per l'API dei Futex
 ===============================
 
-.. kernel-doc:: kernel/futex.c
+.. kernel-doc:: kernel/futex/core.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/futex.h
+   :internal:
+
+.. kernel-doc:: kernel/futex/pi.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/requeue.c
+   :internal:
+
+.. kernel-doc:: kernel/futex/waitwake.c
    :internal:
 
 Approfondimenti
-- 
2.33.0

