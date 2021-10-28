Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B146943E9F8
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 23:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhJ1VIZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 17:08:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46250 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhJ1VIY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 17:08:24 -0400
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: krisman)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 138A01F4554B;
        Thu, 28 Oct 2021 22:05:54 +0100 (BST)
From:   Gabriel Krisman Bertazi <krisman@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ext3 tree
Organization: Collabora
References: <20211028232100.03d394fd@canb.auug.org.au>
Date:   Thu, 28 Oct 2021 18:05:49 -0300
In-Reply-To: <20211028232100.03d394fd@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 28 Oct 2021 23:21:00 +1100")
Message-ID: <87y26camhe.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the ext3 tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/admin-guide/filesystem-monitoring.rst:60: WARNING: Definition list ends without a blank line; unexpected unindent.
>
> Introduced by commit
>
>   c0baf9ac0b05 ("docs: Document the FAN_FS_ERROR event")

Hi Stephen, Jan,

I'd suggest the patch below.

Thank you,

-- >8 --
From: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Thu, 28 Oct 2021 17:17:47 -0300
Subject: [PATCH] docs: Fix formatting of literal sections in fanotify docs

Stephen Rothwell reported the following warning was introduced by commit
c0baf9ac0b05 ("docs: Document the FAN_FS_ERROR event").

Documentation/admin-guide/filesystem-monitoring.rst:60: WARNING:
 Definition list ends without a blank line; unexpected unindent.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 .../admin-guide/filesystem-monitoring.rst     | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/filesystem-monitoring.rst b/Documentation/admin-guide/filesystem-monitoring.rst
index 5a3c84e60095..ab8dba76283c 100644
--- a/Documentation/admin-guide/filesystem-monitoring.rst
+++ b/Documentation/admin-guide/filesystem-monitoring.rst
@@ -35,9 +35,11 @@ notifications is Ext4.
 
 A FAN_FS_ERROR Notification has the following format::
 
-  [ Notification Metadata (Mandatory) ]
-  [ Generic Error Record  (Mandatory) ]
-  [ FID record            (Mandatory) ]
+  ::
+
+     [ Notification Metadata (Mandatory) ]
+     [ Generic Error Record  (Mandatory) ]
+     [ FID record            (Mandatory) ]
 
 The order of records is not guaranteed, and new records might be added
 in the future.  Therefore, applications must not rely on the order and
@@ -53,11 +55,13 @@ providing any additional details about the problem.  This record is
 identified by ``struct fanotify_event_info_header.info_type`` being set
 to FAN_EVENT_INFO_TYPE_ERROR.
 
-  struct fanotify_event_info_error {
-	struct fanotify_event_info_header hdr;
-	__s32 error;
-	__u32 error_count;
-  };
+  ::
+
+     struct fanotify_event_info_error {
+          struct fanotify_event_info_header hdr;
+         __s32 error;
+         __u32 error_count;
+     };
 
 The `error` field identifies the type of error using errno values.
 `error_count` tracks the number of errors that occurred and were
-- 
2.33.0

