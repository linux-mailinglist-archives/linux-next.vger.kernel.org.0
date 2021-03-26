Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FA234AF45
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 20:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCZTU5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 15:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhCZTUn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Mar 2021 15:20:43 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D6BC0613B1
        for <linux-next@vger.kernel.org>; Fri, 26 Mar 2021 12:20:43 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 230A277D;
        Fri, 26 Mar 2021 19:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 230A277D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616786430; bh=ySavWd7T6baG1vIEe9iwuQtggu6hMLn9YYqag7TxA9o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=OqipJfZ0eirwbLm64uUi4vWSZF7mExSoZWCP+z6LJTsEmKJXfyR61VB9El8aeTIhk
         hVmPwYl1urGiodE2oGthN6jz/5VTEngj7eFMOqSTIn4BlEKcaE3Oo7JxKjH8etTQNC
         2MuKQRu2+W2+UmAmycTHHpF+SOwtVbzwxYjDQSUCis8rFt+73zYurKs618shA5inYq
         B1s5tD9UtFdvcZE9rSzgtkffOgV5qjuO9tdXGtUKQ06+bWCyjYj7e7fbxrnT3tGehj
         KdHzP5Op9P2pU61sK3Du6lxjjhpHJHnJctq+Lnf7fpZAtRZ2QeMvgZXm0wjLPJeBDp
         +xtvK1IbtxqHQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
In-Reply-To: <20210326185440.42ea948a@canb.auug.org.au>
References: <20210326185440.42ea948a@canb.auug.org.au>
Date:   Fri, 26 Mar 2021 13:20:29 -0600
Message-ID: <87pmzlvi0y.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> include/linux/pstore_zone.h:55: warning: Function parameter or member 'write' not described in 'pstore_zone_info'
> include/linux/pstore_blk.h:43: warning: Function parameter or member 'write' not described in 'pstore_device_info'
> include/media/v4l2-mediabus.h:127: warning: Function parameter or member 'type' not described in 'v4l2_mbus_config'
>
> and many more similar. These appear to be false positives :-(
>
> Introduced by commit
>
>   8d295fbad687 ("kernel-doc: better handle '::' sequences")
>
> I have reverted that commit for today.

Argh, that was bad, sorry, I should have caught that.

Just added the following to fix it.

Thanks,

jon

From 212209cff89fe497bc47abcd017aa95e4e8a5196 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Fri, 26 Mar 2021 13:16:35 -0600
Subject: [PATCH] docs: kernel-doc: properly recognize parameter lines with
 colons

The previous attempt to properly handle literal blocks broke parsing of
parameter lines containing colons; fix it by tweaking the regex to
specifically exclude the "::" pattern while accepting lines containing
colons in general.  Add a little documentation to the regex while in the
neighborhood.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 8d295fbad687 ("kernel-doc: better handle '::' sequences")
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/kernel-doc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0ecd71477a16..d6d2b6e0b4eb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -391,8 +391,14 @@ my $doc_com = '\s*\*\s*';
 my $doc_com_body = '\s*\* ?';
 my $doc_decl = $doc_com . '(\w+)';
 # @params and a strictly limited set of supported section names
+# Specifically:
+#   Match @word:
+#	  @...:
+#         @{section-name}:
+# while trying to not match literal block starts like "example::"
+#
 my $doc_sect = $doc_com .
-    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:([^:]*)$';
+    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:([^:].*)?$';
 my $doc_content = $doc_com_body . '(.*)';
 my $doc_block = $doc_com . 'DOC:\s*(.*)?';
 my $doc_inline_start = '^\s*/\*\*\s*$';
-- 
2.30.2

