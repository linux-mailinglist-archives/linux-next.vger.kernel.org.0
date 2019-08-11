Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEAC894BB
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 00:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfHKWyw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 18:54:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36057 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfHKWyv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Aug 2019 18:54:51 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so48788544pfl.3;
        Sun, 11 Aug 2019 15:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RzqJtsjim5XcqXXxXq/gXVZgaSxNvJuEZIseA4KcRA=;
        b=tcKoMOCWkiJjEjJSi5xw+1j/LM3XFCASwMnXgC302M7AInd8gg6+wqPu8o5K/XQLov
         bIyQnKLjD3zkMMsuKO3yk2aIpm9N3SQ5yBChXweTndUXgpziON+V23nS0oGki/RElszL
         a1EqQr68iW2fH1EdLUDiFSQ/2fR9YIjMnraGnyrrXV+TED6cFWo/1je98j2PyEzDzWRx
         3mj5mxo6/XXPv1iJhZko58bJFggdgdsX27WjQNaLFQ7j/NHrjmdmJdZVhXD9YJ1/nbRF
         kbk5GrJFuTg1uomwiSTPByYphV98hySHZKkcYDjSD0VsFhDxy7h6NjNYT+hz8g5JFLMP
         Bexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RzqJtsjim5XcqXXxXq/gXVZgaSxNvJuEZIseA4KcRA=;
        b=ombAofQJ4wQ5s8+I66nJ5eMcdWoBtbofPlal7WLfy9djHrKKgt4gROxnhhECIU3szf
         sHNKN+klkv2xJki5NayyqZ+bu3laQ2duVAzJ6X3X4nGP5TKVVqfzyca5CENXXKRKMUio
         KeMG3rRiqqJj7YbVZiWIGeGcjY+acmJlG/7qBYEQMgNM7zX+bsSzLoNifDLB0OaaBYpp
         W80L+fic0iDpzMDdknS2oa1QJQugGQuQpV196DUd+Q08HE18d6c8OyShSybM7dm9r3ak
         EZD5mbPPN3GY8MPR/tnSiXomDIWpbdiGMSxCb7wRG34X//3JkIuZIFlEaQSZ76Sn/5Rt
         CC9w==
X-Gm-Message-State: APjAAAXcUom7FMsy6IFnRZtyx1cEnffBypXbZkiJ4lUGYbTuYRiqIHev
        eXyHNStizOnGvAI0Nl4pS7Y=
X-Google-Smtp-Source: APXvYqzAQfQLfd0FabH4BRr9z1hx1VjX7N3faa5vG3oBeeIbkT18zcOdBENpueRi5D9QpkXBUD81bg==
X-Received: by 2002:a17:90a:2667:: with SMTP id l94mr2674525pje.74.1565564090991;
        Sun, 11 Aug 2019 15:54:50 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id y128sm127850339pgy.41.2019.08.11.15.54.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 15:54:50 -0700 (PDT)
From:   john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Ofir Drang <ofir.drang@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/1] checkpatch: revert broken NOTIFIER_HEAD check
Date:   Sun, 11 Aug 2019 15:54:43 -0700
Message-Id: <20190811225443.31161-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811225443.31161-1-jhubbard@nvidia.com>
References: <20190811225443.31161-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: John Hubbard <jhubbard@nvidia.com>

commit 1a47005dd5aa ("checkpatch: add *_NOTIFIER_HEAD as var
definition") causes the following warning when run on some
patches:

Unescaped left brace in regex is passed through in regex;
marked by < --HERE in m/(?:
...
   [238 lines of appalling perl output, mercifully not included]
...
)/ at ./scripts/checkpatch.pl line 3889.

This is broken, so revert it until a better solution is found.

Fixes: 1a47005dd5aa ("checkpatch: add *_NOTIFIER_HEAD as var
definition")

Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Ofir Drang <ofir.drang@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 scripts/checkpatch.pl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 1cdacb4fd207..9fc206ab3c0c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3891,7 +3891,6 @@ sub process {
 				^.DEFINE_$Ident\(\Q$name\E\)|
 				^.DECLARE_$Ident\(\Q$name\E\)|
 				^.LIST_HEAD\(\Q$name\E\)|
-				^.{$Ident}_NOTIFIER_HEAD\(\Q$name\E\)|
 				^.(?:$Storage\s+)?$Type\s*\(\s*\*\s*\Q$name\E\s*\)\s*\(|
 				\b\Q$name\E(?:\s+$Attribute)*\s*(?:;|=|\[|\()
 			    )/x) {
-- 
2.22.0

