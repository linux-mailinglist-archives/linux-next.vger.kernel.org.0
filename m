Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AE42B80A0
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 16:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgKRPfG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 10:35:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgKRPfG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 10:35:06 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25E1A24779;
        Wed, 18 Nov 2020 15:35:05 +0000 (UTC)
Date:   Wed, 18 Nov 2020 10:35:02 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118103502.24e90f7c@gandalf.local.home>
In-Reply-To: <20201116132929.7f59943e@lwn.net>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

Some C code in the ftrace-users.rst document is missing RST C block
annotation, which has to be added.

Link: https://lore.kernel.org/r/20201116173502.392a769c@canb.auug.org.au

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 Documentation/trace/ftrace-uses.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
index 5981d5691745..f7d98ae5b885 100644
--- a/Documentation/trace/ftrace-uses.rst
+++ b/Documentation/trace/ftrace-uses.rst
@@ -116,6 +116,8 @@ called by a callback may also be traced, and call that same callback,
 recursion protection must be used. There are two helper functions that
 can help in this regard. If you start your code with:
 
+.. code-block:: c
+
 	int bit;
 
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
@@ -124,6 +126,8 @@ can help in this regard. If you start your code with:
 
 and end it with:
 
+.. code-block:: c
+
 	ftrace_test_recursion_unlock(bit);
 
 The code in between will be safe to use, even if it ends up calling a
@@ -145,6 +149,8 @@ protection, it is best to make sure that RCU is "watching", otherwise
 that data or critical section will not be protected as expected. In this
 case add:
 
+.. code-block:: c
+
 	if (!rcu_is_watching())
 		return;
 
-- 
2.25.4

