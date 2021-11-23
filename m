Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E0345ABEC
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 19:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235108AbhKWTCn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 14:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235668AbhKWTCl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 14:02:41 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C63CC061714
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 10:59:33 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id a16-20020a17090aa51000b001a78699acceso1848268pjq.8
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JSd2S9z2V3MZjP2a2Ef2IdvJPVtfBfJfS0XI2IAbi4A=;
        b=FjclG0+HzvCmiD2eVJpLfFPtnbsLgJ2A1tbhbo6VMhcJT1Db0ik4d+qcI0MII+e9kH
         K+VKh0PgNOYEHWw0keCDaoCs9ZSemNtDHJ6v99jV80Y2xHCT6oPAgfZP9edGJXqBfnQb
         5ioKIidURpWO5rXOHwIn9qwWELMb9++b4V7F1FGqbJemNUplfRa7Fb6DA80jcivTT5wn
         AvNGOv0U60d3xd7oXdfhgzzVmWQD0NtS+MnmDGcdUXX0xMAhVT7fPSXmKSJJUog6UXe9
         vAXiINVyfxGOkZYIZqHIVE2uktjHGES/Po8oQTY4K8rGtOHiNaOsHQNca5al7l8Ph3Rk
         cKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JSd2S9z2V3MZjP2a2Ef2IdvJPVtfBfJfS0XI2IAbi4A=;
        b=qNmc312H3CGPtscXTDf8yFGunrNrI8q8M7m1Py+3FRkW5bYRzaR3FM7UJDMCzWZjRf
         WnNS1wnhzhic7kGJw8GY7r7b6PHoIHlku06KQE3hl+SOxyxy5j3Azy5mvEn8P11EqY5g
         rPzA3vl+B+TKjDnCFFct2k7LUUemfZPMLMOwiroj2eXc+PELAd4nh7Vgqow0UTFgWUy4
         1RaVr2I6ZjEeBPVXiHP/B9ZUCWvZbEVXEpEQZOzZss/zPENtz0mFoILARFjTarsFbS8e
         6YI8w3yyPLZSlaGjgl1vQlqr5pxQTyo4ffbNzcBB8bYeqr7F6YY0Z2MIOSqUJRYw6a9Y
         C4pw==
X-Gm-Message-State: AOAM531r0fz3EluAvGOsSqpneNgFKMlTKb2gZnbcFmmeq7tWcBJFG8NP
        zNXjuqrJUHdS5xEK5jYc1H2r1BT8FyI=
X-Google-Smtp-Source: ABdhPJxaXPciCv0gtMpPz7r1EVWuNa6W36lbxsIpYB99okkUEjZg0ksv/WQGojXYSME6YVmAjOnbhyvyeiE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1a94:1f02:8575:f669])
 (user=surenb job=sendgmr) by 2002:aa7:8887:0:b0:4a4:f002:66ec with SMTP id
 z7-20020aa78887000000b004a4f00266ecmr7625370pfe.73.1637693972808; Tue, 23 Nov
 2021 10:59:32 -0800 (PST)
Date:   Tue, 23 Nov 2021 10:59:28 -0800
Message-Id: <20211123185928.2513763-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH 1/1] docs: proc.rst: /proc/PID/maps: fix malformed table
From:   Suren Baghdasaryan <surenb@google.com>
To:     sfr@canb.auug.org.au
Cc:     akpm@linux-foundation.org, ccross@google.com, surenb@google.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix malformed table describing "pathname" values for mappings not
associated with a file.

Fixes: 2df148be9486 ("mm: add a field to store names for private anonymous memory")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 Documentation/filesystems/proc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 46c1f5243028..061744c436d9 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -426,14 +426,14 @@ with the memory region, as the case would be with BSS (uninitialized data).
 The "pathname" shows the name associated file for this mapping.  If the mapping
 is not associated with a file:
 
- =======                    ====================================
+ =============              ====================================
  [heap]                     the heap of the program
  [stack]                    the stack of the main process
  [vdso]                     the "virtual dynamic shared object",
                             the kernel system call handler
-[anon:<name>]               an anonymous mapping that has been
+ [anon:<name>]              an anonymous mapping that has been
                             named by userspace
- =======                    ====================================
+ =============              ====================================
 
  or if empty, the mapping is anonymous.
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

