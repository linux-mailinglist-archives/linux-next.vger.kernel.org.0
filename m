Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BC42B5279
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 21:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732514AbgKPUZz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 15:25:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:54222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732478AbgKPUZz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 15:25:55 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB15020781;
        Mon, 16 Nov 2020 20:25:53 +0000 (UTC)
Date:   Mon, 16 Nov 2020 15:25:52 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116152552.11572354@gandalf.local.home>
In-Reply-To: <20201116122432.796af13b@lwn.net>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Nov 2020 12:24:32 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> The problem is those literal blocks.  The easiest fix will be to just use
> the double-colon notation to indicate a literal block, so the paragraph
> above would end with "...start your code with::".  Note that there's a few
> of them to fix.

Would something like the below work? I think I fixed the other places with
issues and for consistency, replaced the ".. code-block:: c" with just "::"
usage throughout the file.

-- Steve

diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
index 5981d5691745..f21464538fa0 100644
--- a/Documentation/trace/ftrace-uses.rst
+++ b/Documentation/trace/ftrace-uses.rst
@@ -43,9 +43,7 @@ as well as what protections the callback will perform and not require
 ftrace to handle.
 
 There is only one field that is needed to be set when registering
-an ftrace_ops with ftrace:
-
-.. code-block:: c
+an ftrace_ops with ftrace::
 
  struct ftrace_ops ops = {
        .func			= my_callback_func,
@@ -82,9 +80,7 @@ may take some time to finish.
 The callback function
 =====================
 
-The prototype of the callback function is as follows (as of v4.14):
-
-.. code-block:: c
+The prototype of the callback function is as follows (as of v4.14)::
 
    void callback_func(unsigned long ip, unsigned long parent_ip,
                       struct ftrace_ops *op, struct pt_regs *regs);
@@ -114,7 +110,7 @@ Protect your callback
 As functions can be called from anywhere, and it is possible that a function
 called by a callback may also be traced, and call that same callback,
 recursion protection must be used. There are two helper functions that
-can help in this regard. If you start your code with:
+can help in this regard. If you start your code with::
 
 	int bit;
 
@@ -122,7 +118,7 @@ can help in this regard. If you start your code with:
 	if (bit < 0)
 		return;
 
-and end it with:
+and end it with::
 
 	ftrace_test_recursion_unlock(bit);
 
@@ -143,7 +139,7 @@ function call.
 If your callback accesses any data or critical section that requires RCU
 protection, it is best to make sure that RCU is "watching", otherwise
 that data or critical section will not be protected as expected. In this
-case add:
+case add::
 
 	if (!rcu_is_watching())
 		return;
@@ -249,9 +245,7 @@ match a specific pattern.
 
 See Filter Commands in :file:`Documentation/trace/ftrace.rst`.
 
-To just trace the schedule function:
-
-.. code-block:: c
+To just trace the schedule function::
 
    ret = ftrace_set_filter(&ops, "schedule", strlen("schedule"), 0);
 
@@ -259,17 +253,13 @@ To add more functions, call the ftrace_set_filter() more than once with the
 @reset parameter set to zero. To remove the current filter set and replace it
 with new functions defined by @buf, have @reset be non-zero.
 
-To remove all the filtered functions and trace all functions:
-
-.. code-block:: c
+To remove all the filtered functions and trace all functions::
 
    ret = ftrace_set_filter(&ops, NULL, 0, 1);
 
 
 Sometimes more than one function has the same name. To trace just a specific
-function in this case, ftrace_set_filter_ip() can be used.
-
-.. code-block:: c
+function in this case, ftrace_set_filter_ip() can be used::
 
    ret = ftrace_set_filter_ip(&ops, ip, 0, 0);
 
@@ -284,9 +274,7 @@ two lists are non-empty and contain the same functions, the callback will not
 be called by any function.
 
 An empty "notrace" list means to allow all functions defined by the filter
-to be traced.
-
-.. code-block:: c
+to be traced::
 
    int ftrace_set_notrace(struct ftrace_ops *ops, unsigned char *buf,
                           int len, int reset);
@@ -298,9 +286,7 @@ filter list, and this function does not modify the filter list.
 A non-zero @reset will clear the "notrace" list before adding functions
 that match @buf to it.
 
-Clearing the "notrace" list is the same as clearing the filter list
-
-.. code-block:: c
+Clearing the "notrace" list is the same as clearing the filter list::
 
   ret = ftrace_set_notrace(&ops, NULL, 0, 1);
 
@@ -311,9 +297,7 @@ has been registered.
 
 If a filter is in place, and the @reset is non-zero, and @buf contains a
 matching glob to functions, the switch will happen during the time of
-the ftrace_set_filter() call. At no time will all functions call the callback.
-
-.. code-block:: c
+the ftrace_set_filter() call. At no time will all functions call the callback::
 
    ftrace_set_filter(&ops, "schedule", strlen("schedule"), 1);
 
@@ -323,9 +307,7 @@ the ftrace_set_filter() call. At no time will all functions call the callback.
 
    ftrace_set_filter(&ops, "try_to_wake_up", strlen("try_to_wake_up"), 1);
 
-is not the same as:
-
-.. code-block:: c
+is not the same as::
 
    ftrace_set_filter(&ops, "schedule", strlen("schedule"), 1);
 
